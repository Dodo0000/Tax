package org.tax.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.QueryWrapperFilter;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.tax.model.TaxQuestion;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**有一个基本假设是，这里的question都是合法的实体 id不为空s*/
public class LuceneUtil {
	// 存放索引库的位置
	private static String INDEX_LIB_PATH = "D:\\temp\\tax\\lucene\\index";
	// 索引库关联的源数据的位置
	private static String SEARCH_SRC_PATH = "D:\\temp\\tax\\lucene\\searchsource";

	public static void initIndexLib() {
		// 初始化索引库
	}

	public static void creatIndex(TaxQuestion question) {
		// title content type字段建立索引
		try {
			Directory idxDir = FSDirectory.open(new File(INDEX_LIB_PATH));
			Analyzer analyzer = new IKAnalyzer();
			IndexWriterConfig iwConfig = new IndexWriterConfig(Version.LATEST,
					analyzer);
			IndexWriter idxWriter = new IndexWriter(idxDir, iwConfig);
			Document document = new Document();
			// 问题id
			String questionId = question.getId();
			Field questionIdField = new TextField("questionId", questionId,
					Store.YES);
			// 问题标题
			String questionTitle = question.getTitle();
			Field questionTitleField = new TextField("questionTitle",
					questionTitle, Store.YES);
			// 问题内容
			String questionContent = question.getContent();
			Field questionContentField = new TextField("questionContent",
					questionContent, Store.YES);
			// 问题分类
			String questionType = question.getType();
			Field questionTypeField = new TextField("questionType",
					questionType, Store.YES);
			// 构建document
			document.add(questionIdField);
			document.add(questionTitleField);
			document.add(questionContentField);
			document.add(questionTypeField);
			// document加入的索引库
			idxWriter.addDocument(document);
			if(idxWriter!=null)
				idxWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void deleteIndex(TaxQuestion question) {
		// 删除该question的doc
		try {
			Directory idxDir = FSDirectory.open(new File(INDEX_LIB_PATH));
			Analyzer analyzer = new IKAnalyzer();
			IndexWriterConfig iwConfig = new IndexWriterConfig(Version.LATEST,
					analyzer);
			IndexWriter idxWriter = new IndexWriter(idxDir, iwConfig);
			//由于questionId唯一，只要根据id删除对应的doc即可
			idxWriter.deleteDocuments(new Term("questionId", question.getId()));
			if(idxWriter!=null)
				idxWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void updateIndex(TaxQuestion question) {
		// 更新该question的doc
		try {
			Directory idxDir = FSDirectory.open(new File(INDEX_LIB_PATH));
			Analyzer analyzer = new IKAnalyzer();
			IndexWriterConfig iwConfig = new IndexWriterConfig(Version.LATEST,
					analyzer);
			IndexWriter idxWriter = new IndexWriter(idxDir, iwConfig);
			Document document = new Document();
            document.add(new TextField("questionId", question.getId(), Store.YES));
            document.add(new TextField("questionTitle", question.getTitle(), Store.YES));
            document.add(new TextField("questionContent", question.getContent(), Store.YES));
            document.add(new TextField("questionType", question.getType(), Store.YES));
            Term deleteTerm=new Term("questionId", question.getId());
//            //先根据id删除对应的question的doc
//            Term deleteTerm=new Term("questionId", question.getId());
//            idxWriter.deleteDocuments(deleteTerm);
//            //加入新的doc
//            idxWriter.addDocument(document);
            //其实这个updateDocument其实也是封装了先删后加而已
            idxWriter.updateDocument(deleteTerm, document);
            if(idxWriter!=null)
            	idxWriter.commit();
            if(idxWriter!=null)
				idxWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static List<TaxQuestion> search(String keyword, String type,
			int returnNum) throws Exception {
		// 根据关键词与种类搜索
		// 注意调用时默认传入的type是形式为只有数字(数字应该保持唯一，且递增书写)与';'分割的形式 如: "1;2;4;5"
		// 或者type.equals("")或者type==null
		// 若这里keyword为null不应该使用这个方法查
		if(keyword==null || keyword.equals("") || keyword.split("\\s+").length==0)
			return new ArrayList<TaxQuestion>();
		if (type == null)// 为了使后面处理的type肯定不是null
			type = "";
		try {
			Directory idxDir = FSDirectory.open(new File(INDEX_LIB_PATH));
			IndexReader idxReader = DirectoryReader.open(idxDir);
			IndexSearcher idxSearcher = new IndexSearcher(idxReader);
			// 对问题的title content中含有keyword先查询出来
			String[] queries = { keyword, keyword };
			String[] fields = { "questionTitle", "questionContent" };
			BooleanClause.Occur[] clauses = { BooleanClause.Occur.SHOULD,
					BooleanClause.Occur.SHOULD };
			Query query = MultiFieldQueryParser.parse(queries, fields, clauses,
					new IKAnalyzer());
			TopDocs topDocs = null;
			if (type.equals("")) {
				topDocs = idxSearcher.search(query, returnNum);
			} else {
				String negativeWord = type;//比如筛选负面或者正面词的新闻就是这么用
				QueryParser qp = new QueryParser("questionType",
						new IKAnalyzer());
				try {
					Query kwQuery = qp.parse(negativeWord);
					QueryWrapperFilter qwFilter = new QueryWrapperFilter(
							kwQuery);
					topDocs = idxSearcher.search(query, qwFilter, returnNum);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			// 根据搜索结果包装好返回的问题列表
			List<TaxQuestion> questionList = new ArrayList<TaxQuestion>();
			ScoreDoc[] scoreDocs = topDocs.scoreDocs;
			for (ScoreDoc scoreDoc : scoreDocs) {
				int doc = scoreDoc.doc;
				Document document = idxSearcher.doc(doc);
				TaxQuestion question = new TaxQuestion();
				// 设置问题id
				String questionId = document.get("questionId");
				question.setId(questionId);
				// 设置问题标题
				String questionTitle = document.get("questionTitle");
				question.setTitle(questionTitle);
				// 设置问题内容
				String questionContent = document.get("questionContent");
				question.setContent(questionContent);
				// 设置问题分类
				String questionType = document.get("questionType");
				question.setType(questionType);
				// 添加到队列
				questionList.add(question);
			}
			if(idxReader!=null)
				idxReader.close();
			return questionList;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//不返回null是因为防止空指针异常
		return new ArrayList<TaxQuestion>();
	}

}
