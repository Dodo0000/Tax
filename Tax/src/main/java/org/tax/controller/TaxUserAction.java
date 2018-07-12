package org.tax.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;
import org.tax.VO.PasswordModification;
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
@RequestMapping("/api/v1/user")
public class TaxUserAction {

	final String JSON = MediaType.JSON;
	
	@Autowired
	TaxUserService taxUserService;
	
	@RequestMapping(value="/update",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String updateInfo(TaxUser user, HttpServletRequest request) {
		return taxUserService.updateInfo(user, request);
	}
	
	@RequestMapping(value="/password",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String modifyPassword(PasswordModification info, HttpServletRequest request) {
		return taxUserService.modifyPassword(info, request);
	}
	
	@RequestMapping(value="/question",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String publishQuestion(TaxQuestion question, HttpServletRequest request) {
		return taxUserService.publishQuestion(question, request);
	}
	
//	@RequestMapping(value="/answer",method=RequestMethod.POST,produces=JSON)
//	@ResponseBody
//	public String publishAnswer(TaxAnswer answer, HttpServletRequest request) {
//		return taxUserService.publishAnswer(answer, request);
//	}
	/**这里修正了一下 确保问题的确认是真正登陆且问题发布者才能更改*/
	@RequestMapping(value="/question/{questionId}/answer",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String publishAnswer(@PathVariable("questionId") int questionId, TaxAnswer answer, HttpServletRequest request) {
		return taxUserService.publishAnswer(questionId, answer, request);
	}
	
	@RequestMapping(value="/confirm/{questionId}",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String confirmSolution(@PathVariable("questionId") int questionId, HttpServletRequest request) {
		return taxUserService.confirmSolution(questionId, request);
	}
	
	@RequestMapping(value="/collect/{questionId}",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String collect(@PathVariable("questionId") int questionId, HttpServletRequest request) {
		return taxUserService.collect(questionId, request);
	}
	
	@RequestMapping(value="/avatar/{userId}",method=RequestMethod.POST,produces=JSON)
	@ResponseBody
	public String modifyAvatar(@PathVariable("userId") String userId, MultipartRequest multipartRequest) {
		return taxUserService.modifyAvatar(userId, multipartRequest);
	}
}
