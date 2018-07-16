package org.tax.VO;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionBrief {
	private Integer id;
	private String title;
	private Integer click;//浏览
	private Integer favourite;//收藏
	private Long totalAnswerNum;//总回答数
	private String type;//种类字符串
	private String publishDateStr;
	private Integer prize=0;
}
