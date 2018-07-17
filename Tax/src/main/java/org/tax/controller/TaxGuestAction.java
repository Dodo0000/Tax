package org.tax.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tax.VO.LoginInfo;
import org.tax.constant.MediaType;
import org.tax.model.TaxUser;
import org.tax.service.TaxGuestService;
import org.tax.service.impl.TaxGuestServiceImpl;
import org.tax.session.SessionControl;

/**
 * @author wyhong
 * @date 2018-7-12
 */
@Component
@Controller
@RequestMapping("/api/v1/guest")
public class TaxGuestAction {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(TaxGuestAction.class);
	final String JSON = MediaType.JSON;

	@Autowired
	TaxGuestService taxGuestService;

	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = JSON)
	@ResponseBody
	public String register(TaxUser user) {
		return taxGuestService.register(user);
	}

	/** 游客登陆注册的时候的ajax看 用户名 是否存在 */
	@RequestMapping(value = "/register/checkUsername", method = RequestMethod.POST, produces = JSON)
	@ResponseBody
	public String checkUsername(TaxUser user) {
		return taxGuestService.checkUsername(user);
	}

	/** 游客注册的时候请求产生随机的验证码 */
	@RequestMapping(value = "/generateValidationCode", method = RequestMethod.GET)
	@ResponseBody
	public void generateValidationCode(HttpServletRequest request,
			HttpServletResponse response) {
		taxGuestService.generateValidationCode(request, response);
	}

	/** 游客注册提交表单时候检验提交过来的验证码 */
	@RequestMapping(value = "/checkValidationCode", method = RequestMethod.POST, produces = JSON)
	@ResponseBody
	public String checkValidationCode(String inputValidationCode,
			HttpServletRequest request, HttpServletResponse response) {
		return taxGuestService.checkValidationCode(inputValidationCode,
				request, response);
	}
	
	/**游客登陆*/
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = JSON)
	@ResponseBody
	public String login(LoginInfo loginInfo, HttpServletRequest request,
			HttpServletResponse response) {
		return taxGuestService.login(loginInfo, request, response);
	}

	@RequestMapping(value = "/search/{keyword}/{proId}/{page}", method = {
			RequestMethod.GET, RequestMethod.POST }, produces = JSON)
	@ResponseBody
	public String search(@PathVariable("keyword") String keyword,
			@PathVariable("proId") String proId, @PathVariable("page") int page) {
		return taxGuestService.search(keyword, proId, page);
	}

	@RequestMapping(value = "/question/{type}/{page}", method = RequestMethod.GET, produces = JSON)
	@ResponseBody
	public String getByCondition(@PathVariable("type") String type,
			@PathVariable("page") int page) {
		return taxGuestService.getByCondition(type, page);
	}

	@RequestMapping(value = "/question/{page}", method = RequestMethod.GET, produces = JSON)
	@ResponseBody
	public String getQuestions(@PathVariable("page") int page) {
		return taxGuestService.getQuestions(page);
	}

	@RequestMapping(value = "/share/{page}", method = RequestMethod.GET, produces = JSON)
	@ResponseBody
	public String getShares(@PathVariable("page") int page) {
		return taxGuestService.getShares(page);
	}

	@RequestMapping(value = "/expert/{page}", method = RequestMethod.GET, produces = JSON)
	@ResponseBody
	public String method(@PathVariable("page") int page) {
		return taxGuestService.getArticlesOfExperts(page);
	}
}
