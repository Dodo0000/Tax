package org.tax.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.tax.VO.LoginInfo;
import org.tax.VO.PasswordModification;
import org.tax.VO.PublishQuestionInfo;
import org.tax.model.TaxAnswer;
import org.tax.model.TaxQuestion;
import org.tax.model.TaxUser;


/**
 * @author wyhong
 * @date 2018-7-7
 */
/**还需要加上 
 * 发私信
 * 邀请回答
 * 退出
 * */
public interface TaxUserService {
	/**从cookie中获取uid username password查询并返回信息给前端*/
	String getUser(HttpServletRequest request, HttpServletResponse response);
	
	/**返回用户头像，若用户没有登陆采用default头像*/
	void generateUserAvatar(HttpServletRequest request, HttpServletResponse response);
	
	/**根据用户输入的type形式为 1;2;3;5 返回score最高的3个最多*/
	String getRelaventUsers(String questionTypes, HttpServletRequest request);
	
	String logout(HttpServletRequest request, HttpServletResponse response);
	
	String updateInfo(TaxUser user, HttpServletRequest request);
	
	//加了个参数HttpServletRequest request 获取当前用户 以后用鸿哥SessionFactory获取即可
	String modifyPassword(PasswordModification info, HttpServletRequest request);
	
	//加了个参数HttpServletRequest request 获取当前用户 以后用鸿哥SessionFactory获取即可
	String publishQuestion(TaxQuestion question, String[] invitedUserIdArr, HttpServletRequest request);
	
	//加了个参数HttpServletRequest request 获取当前用户 以后用鸿哥SessionFactory获取即可
	String publishAnswer(TaxAnswer answer, HttpServletRequest request);
	
	//这里要防止还要检验该问题id是否是正确的用户确认
	String confirmSolution(int questionId, HttpServletRequest request);
	
	String collectQuestion(int questionId, HttpServletRequest request);
	
	String modifyAvatar(String userId, MultipartFile multipartFile);
	
	/**用户专区查询*/
	String getUserQuestions(HttpServletRequest request);
	
	String getUserAnswers(HttpServletRequest request);
	
	String getUserData(HttpServletRequest request);
	
}
