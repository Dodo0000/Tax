package org.tax.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.tax.VO.PasswordModification;
import org.tax.VO.PublishQuestionInfo;
import org.tax.constant.MediaType;
import org.tax.model.TaxAnswer;
import org.tax.model.TaxQuestion;
import org.tax.model.TaxUser;
import org.tax.service.TaxUserService;

/**
 * @author wyhong
 * @date 2018-7-12
 */
@Component
@Controller
//@RequestMapping("/api/v1/user")
@RequestMapping("/user")
public class TaxUserAction {

	final String JSON = MediaType.JSON;
	
	@Autowired
	TaxUserService taxUserService;
	
	/**从cookie中获取uid username password查询并返回信息给前端*/
	@RequestMapping(value = "/getUser", method = RequestMethod.POST, produces = JSON)
	@ResponseBody
	public String getUser(HttpServletRequest request, HttpServletResponse response){
		return taxUserService.getUser(request, response);
	}
	
	/**返回用户头像，若用户没有登陆采用default头像*/
	@RequestMapping(value = "/generateUserAvatar", method = RequestMethod.GET)
	@ResponseBody
	public void generateUserAvatar(HttpServletRequest request, HttpServletResponse response) {
		taxUserService.generateUserAvatar(request, response);
	}
	
	/**根据用户输入的type形式为 1;2;3;5 返回score最高的3个最多*/
	@RequestMapping(value = "/getRelaventUsers", method = RequestMethod.POST, produces = JSON)
	@ResponseBody
	public String getRelaventUsers(String questionTypes, HttpServletRequest request){
		return taxUserService.getRelaventUsers(questionTypes, request);
	}
	
	/**用户退出 logout应该用post*/
	@RequestMapping(value = "/logout", method = RequestMethod.POST, produces = JSON)
	@ResponseBody
	public String logout(HttpServletRequest request,
			HttpServletResponse response) {
		return taxUserService.logout(request, response);
	}
	
	@RequestMapping(value="/updateUserInfo",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String updateInfo(TaxUser user, HttpServletRequest request) {
		return taxUserService.updateInfo(user, request);
	}
	
	@RequestMapping(value="/password",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String modifyPassword(PasswordModification info, HttpServletRequest request) {
		return taxUserService.modifyPassword(info, request);
	}
	
	@RequestMapping(value="/publishQuestion",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	/**告诉springmvc 看console全名*/
	public String publishQuestion(TaxQuestion question, @RequestParam("invitedUserIdArr[]") String[] invitedUserIdArr, HttpServletRequest request) {
		return taxUserService.publishQuestion(question, invitedUserIdArr, request);
	}
	
//	@RequestMapping(value="/answer",method=RequestMethod.POST,produces=JSON)
//	@ResponseBody
//	public String publishAnswer(TaxAnswer answer, HttpServletRequest request) {
//		return taxUserService.publishAnswer(answer, request);
//	}
	/**这里修正了一下 确保问题的确认是真正登陆且问题发布者才能更改*/
	@RequestMapping(value="/publishAnswer",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String publishAnswer(TaxAnswer answer, HttpServletRequest request) {
		return taxUserService.publishAnswer(answer, request);
	}
	
	@RequestMapping(value="/confirm/{questionId}",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String confirmSolution(@PathVariable("questionId") int questionId, HttpServletRequest request) {
		return taxUserService.confirmSolution(questionId, request);
	}
	
	@RequestMapping(value="/collectQuestion",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String collect(int questionId, HttpServletRequest request) {
		return taxUserService.collectQuestion(questionId, request);
	}
	
	/**修改头像*/
	@RequestMapping(value="/avatar/{userId}",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String modifyAvatar(@PathVariable("userId") String userId, @RequestParam("avatar") MultipartFile multipartFile) {
		return taxUserService.modifyAvatar(userId, multipartFile);
	}
	
	/**用户专区功能*/
	@RequestMapping(value="/getUserQuestions",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String getUserQuestions(HttpServletRequest request){
		return taxUserService.getUserQuestions(request);
	}
	
	@RequestMapping(value="/getUserAnswers",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String getUserAnswers(HttpServletRequest request){
		return taxUserService.getUserAnswers(request);
	}
	
	@RequestMapping(value="/getUserData",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String getUserData(HttpServletRequest request){
		return taxUserService.getUserData(request);
	}
}
