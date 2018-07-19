package org.tax.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tax.VO.LoginInfo;
import org.tax.model.TaxUser;

/**
 * @author wyhong
 * @date 2018-7-7
 */
/**
 * 少了接口getQuestionDetail(String questionId)进入question详情页面的 还有应该加上page分页信息
 * 少了接口search(String keyword, String type, int page)
 * 
 * */
public interface TaxGuestService {
	
	/**decode utf-8*/
	String decode(String str);
	
	String register(TaxUser user);

	/** 游客登陆注册的时候的ajax看 用户名 是否存在 */
	String checkUsername(TaxUser user);

	/** 游客注册的时候请求产生随机的验证码 */
	void generateValidationCode(HttpServletRequest request,
			HttpServletResponse response);

	/** 游客注册的时候验证输入的验证码 */
	String checkValidationCode(String inputValidationCode,
			HttpServletRequest request, HttpServletResponse response);
	
	/**游客登陆*/
	String login(LoginInfo loginInfo, HttpServletRequest request,
			HttpServletResponse response);
	
	String search(String keyword, String proId, int page);

	String getByCondition(String type, int page);// type=latest|hot|reward

	/** 动态专区 */
	String getQuestions(int page);

	String getShares(int page);

	String getArticlesOfExperts(int page);
	
	/**根据qid获取问题详情*/
	String getQuestionDetail(int questionId);
	
	/**根据qid和page获取相应的answer分页信息*/
	String getQuestionAnswers(int questionId, int page);
}
