package org.tax.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.oval.ConstraintViolation;
import net.sf.oval.Validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.tax.VO.LoginInfo;
import org.tax.VO.PageInfo;
import org.tax.VO.QuestionBrief;
import org.tax.VO.QuestionLive;
import org.tax.VO.ShareExpertDetail;
import org.tax.constant.CookieConst;
import org.tax.constant.Message;
import org.tax.constant.PageConst;
import org.tax.constant.SeperatorConst;
import org.tax.constant.SessionConst;
import org.tax.constant.StatusCode;
import org.tax.constant.ValidationConst;
import org.tax.factory.MapperFactory;
import org.tax.model.TaxAnswer;
import org.tax.model.TaxAnswerExample;
import org.tax.model.TaxExpert;
import org.tax.model.TaxExpertExample;
import org.tax.model.TaxPro;
import org.tax.model.TaxProKey;
import org.tax.model.TaxQuestion;
import org.tax.model.TaxQuestionExample;
import org.tax.model.TaxQuestionKey;
import org.tax.model.TaxShare;
import org.tax.model.TaxShareExample;
import org.tax.model.TaxUser;
import org.tax.model.TaxUserExample;
import org.tax.model.TaxUserKey;
import org.tax.result.Result;
import org.tax.service.TaxGuestService;
import org.tax.session.MySession;
import org.tax.session.SessionControl;
import org.tax.util.LuceneUtil;
import org.tax.util.UUIDUtil;
import org.tax.util.ValidationCodeUtil;

import com.alibaba.fastjson.JSON;

/**
 * @author wyhong
 * @date 2018-7-7
 */
public class TaxGuestServiceImpl extends BaseServiceImpl<TaxUser> implements
		TaxGuestService {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(TaxGuestServiceImpl.class);

	@Autowired
	private MapperFactory mapperFactory;

	@Override
	public String decode(String str) {
		LOGGER.debug("********debug in decode section:");
		LOGGER.debug("********origin str: " + str);
		LOGGER.debug("********decoded str: " + URLDecoder.decode(str));
		Result result = new Result();
		result.setResult(URLDecoder.decode(str));
		return JSON.toJSONString(result);
	}

	/** 根据qid获取question */
	@Override
	public String getQuestionDetail(int questionId) {
		Result result = new Result();
		TaxQuestionKey questionKey = new TaxQuestionKey();
		questionKey.setId(questionId);
		TaxQuestion question = mapperFactory.getTaxQuestionMapper()
				.selectByPrimaryKey(questionKey);
		if (question == null) {
			result.setMessage(Message.Empty_Query_Result);
			result.setStatus(StatusCode.Empty_Query_Result);
		}
		result.setResult(question);
		return JSON.toJSONString(result);
	}

	/** 根据qid和page获取相应的answer分页信息 */
	@Override
	public String getQuestionAnswers(int questionId, int page) {
		LOGGER.debug("*****debug in getQuestionAnswers section: ");
		LOGGER.debug("*****debug in getQuestionAnswers questionId: "+questionId);
		LOGGER.debug("*****debug in getQuestionAnswers page: "+page);
		Result result = new Result();
		TaxAnswerExample exampleOfAnswer = new TaxAnswerExample();
		// 封装PageBean
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurrentPage((long) page);
		pageInfo.setCurrentCount(PageConst.NUM_PER_PAGE);
		/**先查出qid有多少个答案*/
		exampleOfAnswer.createCriteria().andQuestionIdEqualTo(questionId);
		// 要计算一下
		/**要先查符合条件的总数值*/
		long totalCount = mapperFactory.getTaxAnswerMapper().countByExample(exampleOfAnswer);
		long totalPage = totalCount / PageConst.NUM_PER_PAGE
				+ ((totalCount % PageConst.NUM_PER_PAGE == 0) ? 0 : 1);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setTotalCount(totalCount);
		/** 若totalCount==0 结果返回 */
		if (totalCount == 0) {
			LOGGER.debug("*****debug in getQuestionAnswers empty result: ");
			result.setMessage(Message.Empty_Query_Result);
			result.setStatus(StatusCode.Empty_Query_Result);
			return JSON.toJSONString(result);	
		}
		// 若请求的页面不合法，抛出异常
		if (page < 1 || page > totalPage) {
			LOGGER.debug("*****debug in getQuestionAnswers invalid page: ");
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		} else if ((page == totalPage)
				&& (totalCount % PageConst.NUM_PER_PAGE != 0)) {
			//最后一页的时候可能要更新一下当前页的数据条数
			pageInfo.setCurrentCount((long) totalCount % PageConst.NUM_PER_PAGE);
		}
		// 设置查询sql的limitClause
		Long offset = (pageInfo.getCurrentPage() - 1) * PageConst.NUM_PER_PAGE;
		Long limit = pageInfo.getCurrentCount();
		StringBuilder limitClauseSB = new StringBuilder();
		limitClauseSB.append(offset).append(",").append(limit);
		/**设置orderClause limitClause*/
		exampleOfAnswer.setLimitClause(limitClauseSB.toString());
		// 问题的显示由  首先likes降序 再favourite降序 再publishDate降序
		exampleOfAnswer.setOrderByClause("likes DESC, favourite DESC, publish_date DESC");
		// 先获取请求页面对应的问题列表
		List<TaxAnswer> answerList = mapperFactory.getTaxAnswerMapper().selectByExample(exampleOfAnswer);
		for(TaxAnswer answer:answerList){
			LOGGER.debug("*****debug in getQuestionAnswers answerId: "+answer.getId());
		}
		// 设置pageInfo
		pageInfo.setList(answerList);
		// 设置result
		result.setResult(pageInfo);
		return JSON.toJSONString(result);
	}

	/** 注册没有包装上表单上的数据user */
	@Override
	public String register(TaxUser user) {
		LOGGER.debug("********register section:");
		LOGGER.debug("********input userName:" + user.getUsername());
		Result result = new Result();
		/**
		 * 未加验证码 未加验证:用户邮箱格式
		 * */
		// validation part
		Validator validator = new Validator();
		List<ConstraintViolation> list = validator.validate(user);
		if (list.size() > 0) {
			result.setStatus(StatusCode.INVALID_PARAMS);
			result.setMessage(Message.INVALID_PARAMS);
			List<String> errors = new ArrayList<String>();
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				ConstraintViolation constraintViolation = (ConstraintViolation) iterator
						.next();
				errors.add(constraintViolation.getMessage());
			}
			result.setResult(errors);
			return JSON.toJSONString(result);
		}
		// if (user.getUsername() == null) {
		// // 用户名为空s
		// result.setMessage(Message.INVALID_USERNAME_OR_PASSWORD);
		// result.setStatus(StatusCode.INVALID_USERNAME_OR_PASSWORD);
		// return JSON.toJSONString(result);
		// }
		// make sure the username hasn't been used yet
		TaxUserExample exampleOfUser = new TaxUserExample();
		exampleOfUser.createCriteria().andUsernameEqualTo(user.getUsername());
		if (mapperFactory.getTaxUserMapper().selectByExample(exampleOfUser)
				.size() > 0) {
			// 用户名已存在
			result.setMessage(Message.DUPLICATE_USERNAME);
			result.setStatus(StatusCode.DUPLICATE_USERNAME);
			return JSON.toJSONString(result);
		}
		// else if(!FormatUtil.rexCheckPassword(user.getPassword())){
		// //密码不符合格式
		// result.setMessage(Message.PASSWORD_INVALID_FORMAT);
		// result.setStatus(StatusCode.PASSWORD_INVALID_FORMAT);
		// return JSON.toJSONString(result);
		// }
		try {
			// 添加注册时间字段(不知道是否需要)
			user.setId(UUIDUtil.genUUID());
			user.setLastVisit(new Date());
			mapperFactory.getTaxUserMapper().insert(user);
		} catch (Exception e) {
			e.printStackTrace();
			// invaild params 有歧义
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
		}
		return JSON.toJSONString(result);
	}

	@Override
	public String checkUsername(TaxUser user) {
		Result result = new Result();
		TaxUserExample exampleOfUser = new TaxUserExample();
		exampleOfUser.createCriteria().andUsernameEqualTo(user.getUsername());
		List<TaxUser> users = mapperFactory.getTaxUserMapper().selectByExample(
				exampleOfUser);
		if (users != null && users.size() > 0) {
			result.setMessage(Message.DUPLICATE_USERNAME);
			result.setStatus(StatusCode.DUPLICATE_USERNAME);
		}
		return JSON.toJSONString(result);
	}

	/** 每一次调用都以覆盖的形式更新客户端和服务端的token */
	@Override
	public void generateValidationCode(HttpServletRequest request,
			HttpServletResponse response) {
		// 用于获取产生的验证码的图片的流
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		String validationCodeStr = ValidationCodeUtil.drawImg(output);
		/** 以后验证码可以不考虑存session可以考虑 现在用自己维护的session存在没有处理过期 以后可以采用redis */
		LOGGER.debug("*****************debug in generateValidationCode section: ");
		/* 1.先看客户端中是否cookie中是否有token, 若有则要去掉session以及cookie中的令牌，由服务端重新整理 */
		Cookie[] cookies = request.getCookies();
		Cookie cookieOfValidationCodeToken = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(CookieConst.VALIDATION_CODE_TOKEN)) {
				cookieOfValidationCodeToken = cookie;
				break;
			}
		}
		if (cookieOfValidationCodeToken != null) {
			LOGGER.debug("*****************old token in cookie: "
					+ cookieOfValidationCodeToken.getValue());
			// 使得服务端旧的token失效
			String oldToken = cookieOfValidationCodeToken.getValue();
			MySession oldSession = SessionControl.getInstance().getSession(
					oldToken);
			if (oldSession != null) {
				SessionControl.getInstance().rmSession(oldToken);
				LOGGER.debug("*****************old token in session to be deleted: "
						+ cookieOfValidationCodeToken.getValue());
			}
			// 使得客户端旧的cookie失效
			cookieOfValidationCodeToken.setMaxAge(0);
		}
		/* 2.服务端先产生好token很存放好对应的validationStr */
		// 客户端与服务端确认code的令牌
		MySession session = new MySession(UUIDUtil.genUUID());
		String token = UUIDUtil.genUUID();
		String validationKey = ValidationConst.SESSION_PREFIX + "_" + token;
		LOGGER.debug("***************** token in new session to be generated: "
				+ validationKey);
		SessionControl.getInstance().addSession(validationKey, session);
		session.setAttribute(SessionConst.VALIDATION_CODE, validationCodeStr);
		/* 3.服务端把token传回给客户端，存入客户端cookie */
		Cookie newCookie = new Cookie(CookieConst.VALIDATION_CODE_TOKEN,
				URLEncoder.encode(validationKey));// 这里存validationKey加上前缀不仅仅是token那个uuid
		newCookie.setPath(CookieConst.PATH);
		// 默认cookie 30min后失效
		int maxAge = 60 * 30;
		newCookie.setMaxAge(maxAge);
		newCookie.setPath(CookieConst.PATH);
		LOGGER.debug("***************** token in new cookie to be setted: "
				+ newCookie.getValue());
		response.addCookie(newCookie);
		LOGGER.debug("***************** validationcode in new session to be generated: "
				+ validationCodeStr);
		/* 4.把图片的流输出到response的流当中使其生成图片 */
		try {
			// 输出到response的流当中使其生成图片
			ServletOutputStream out = response.getOutputStream();
			output.writeTo(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	/** 游客注册的时候验证输入的验证码 */
	public String checkValidationCode(String inputValidationCode,
			HttpServletRequest request, HttpServletResponse response) {
		LOGGER.debug("*****************debug in checkValidationCode section: ");
		Result result = new Result();
		Cookie[] cookies = request.getCookies();
		Cookie tokenCookie = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(CookieConst.VALIDATION_CODE_TOKEN)) {
				tokenCookie = cookie;
				break;
			}
		}
		if (tokenCookie == null) {
			LOGGER.debug("*****************cookie token error: ");
			result.setMessage(Message.VALIDATION_CODE_TOKEN_ERROR);
			result.setStatus(StatusCode.VALIDATION_CODE_TOKEN_ERROR);
			return JSON.toJSONString(result);
		}
		/* 1.从客户cookie取出对应要验证码的token */
		String token = tokenCookie.getValue();
		/* 2.根据token从服务端session中取出validationCode */
		MySession sessionOfValidationCode = SessionControl.getInstance()
				.getSession(token);
		if (sessionOfValidationCode == null) {
			LOGGER.debug("*****************session token error: ");
			result.setMessage(Message.VALIDATION_CODE_TOKEN_ERROR);
			result.setStatus(StatusCode.VALIDATION_CODE_TOKEN_ERROR);
			return JSON.toJSONString(result);
		}
		String validationCode = sessionOfValidationCode.getAttribute(
				SessionConst.VALIDATION_CODE).toString();
		if (!validationCode.equalsIgnoreCase(inputValidationCode)) {
			LOGGER.debug("*****************invalid inputValidationCode: ");
			result.setMessage(Message.INVALID_VALIDATION_CODE);
			result.setStatus(StatusCode.INVALID_VALIDATION_CODE);
			return JSON.toJSONString(result);
		}
		/* 输入的inputValidationCode是对的删除原来的cookie */
		tokenCookie.setMaxAge(0);
		SessionControl.getInstance().rmSession(token);
		return JSON.toJSONString(result);
	}

	/** 用户登陆 */
	@Override
	public String login(LoginInfo loginInfo, HttpServletRequest request,
			HttpServletResponse response) {
		Result result = new Result();
		/**
		 * 未添加功能： 验证码
		 * */
		if (loginInfo == null || loginInfo.getUsername() == null
				|| loginInfo.getPassword() == null) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		}
		/**
		 * 判断用户名和密码是否正确(用户名是唯一的)
		 * */
		TaxUserExample example = new TaxUserExample();
		example.createCriteria().andUsernameEqualTo(loginInfo.getUsername())
				.andPasswordEqualTo(loginInfo.getPassword());
		List<TaxUser> list = mapperFactory.getTaxUserMapper().selectByExample(
				example);
		if (list == null || list.size() == 0) {
			// 用户名或密码不对
			result.setMessage(Message.INVALID_USERNAME_OR_PASSWORD);
			result.setStatus(StatusCode.INVALID_USERNAME_OR_PASSWORD);
			return JSON.toJSONString(result);
		} else {
			TaxUser user = list.get(0);
			// 更新最新登陆时间
			user.setLastVisit(new Date());
			/** 标志是否记住密码 */
			boolean flag = false;
			// 2018/7/12 wyhong
			// id;username;password
			Cookie newCookie = new Cookie(CookieConst.USER,
					URLEncoder.encode(user.getId() + ";"
							+ loginInfo.getUsername() + ";"
							+ loginInfo.getPassword()));
			newCookie.setPath(CookieConst.PATH);
			// 默认cookie 30min后失效
			int maxAge = 60 * 30;
			if (flag) {
				// 设置cookie 一个月后失效
				maxAge = 30 * 24 * 60 * 60;
			}
			newCookie.setMaxAge(maxAge);
			newCookie.setPath(CookieConst.PATH);
			response.addCookie(newCookie);
			// get 跨域session
			// 2018/7/12 wyhong
			MySession session = new MySession(UUIDUtil.genUUID());
			SessionControl.getInstance().addSession(user.getId(), session);
			session.setAttribute(SessionConst.USER, user);
			LOGGER.debug("*****************sessionId in login section:"
					+ session.getId() + ";userId:" + user.getId());
			// test getting a session
			LOGGER.debug("session num:"
					+ SessionControl.getInstance().getNumOnline());
			LOGGER.debug("get session:"
					+ SessionControl.getInstance().getSession(user.getId())
							.getId());
			return JSON.toJSONString(result);
		}
	}

	/**
	 * 这里假定索引库与数据库是能保持一致的 这里若page<=0 或者 page>totalPage LuceneUtil会抛出异常
	 * 捕获后返回invalid params异常 注意： 这里传入的keyword可能有中文
	 * */
	@Override
	public String search(String keyword, String type, int page) {
		LOGGER.debug("**********debug in search section: ");
		// 每个页的搜索栏，根据关键字搜索问题
		Result result = new Result();
		if (keyword != null || type != null) {
			try {
				// keyword转成utf-8 type转成utf-8
				LOGGER.debug("**********debug in search origin keyword: " + keyword);
				LOGGER.debug("**********debug in search origin type: " + type);
				keyword = URLDecoder.decode(keyword, "UTF-8");
				//keyword = new String(keyword.getBytes("ISO-8859-1"), "UTF-8");
				//type = new String(type.getBytes("ISO-8859-1"), "UTF-8");
				/**
				 * 测试强行把keyword置为null 因为这里我的action中要有keyword和page才有 进到这里
				 * 
				 * */
				// keyword=null;//这里只是一个简陋偷懒测试
				LOGGER.debug("**********debug in search keyword: " + keyword);
				LOGGER.debug("**********debug in search type: " + type);
				List<TaxQuestion> questionLuceneList = LuceneUtil.search(
						keyword, type, page, PageConst.NUM_PER_PAGE);
				List<TaxQuestion> questionList = new ArrayList<TaxQuestion>();
				for (TaxQuestion questionLucene : questionLuceneList) {
					TaxQuestionKey questionKey = new TaxQuestionKey();
					// 这里忘记设置了
					questionKey.setId(questionLucene.getId());
					TaxQuestion question = mapperFactory.getTaxQuestionMapper()
							.selectByPrimaryKey(questionKey);
					questionList.add(question);
					LOGGER.debug("**********debug in search question: "
							+ question);
				}
				List<QuestionBrief> questionBriefList = getQuestionBriefList(questionList);
				// 设置PageInfo
				PageInfo pageInfo = new PageInfo();
				pageInfo.setCurrentPage(page);
				pageInfo.setCurrentCount(questionBriefList.size());
				// 要计算一下
				// 这里应该是设置为从索引库查找出来的size
				/**应该返回符合条件的总结果总数，但是这里返回的是分页那一页的总条数*/
				long totalCount = LuceneUtil.search(
						keyword, type, 1, Integer.MAX_VALUE).size();
				long totalPage = totalCount / PageConst.NUM_PER_PAGE
						+ ((totalCount % PageConst.NUM_PER_PAGE == 0) ? 0 : 1);
				pageInfo.setTotalCount(totalCount);
				pageInfo.setTotalPage(totalPage);
				/** 若totalCount==0 结果返回 */
				if (totalCount == 0) {
					result.setMessage(Message.Empty_Query_Result);
					result.setStatus(StatusCode.Empty_Query_Result);
					return JSON.toJSONString(result);
				}
				// 设置pageInfo
				pageInfo.setList(questionBriefList);
				// 设置result
				result.setResult(pageInfo);
				return JSON.toJSONString(result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		result.setMessage(Message.INVALID_PARAMS);
		result.setStatus(StatusCode.INVALID_PARAMS);
		return JSON.toJSONString(result);
	}

	/**
	 * 这里默认页码传入是从下标为1开始处理的 并且页码都是合法的 返回的是QuestionBrief的
	 * */
	@Override
	public String getByCondition(String type, int page) {
		Result result = new Result();
		if (type == null || page <= 0) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		}
		// 最新、热门、悬赏然后排序（降序）显示即可
		// type=latest|hot|reward
		TaxQuestionExample exampleOfQuestion = new TaxQuestionExample();
		// 根据传入的type设置查询的orderByClause
		if (type.equalsIgnoreCase("latest")) {
			exampleOfQuestion.setOrderByClause("publish_date DESC");
		} else if (type.equalsIgnoreCase("hot")) {
			exampleOfQuestion.setOrderByClause("click DESC");
		} else if (type.equalsIgnoreCase("reward")) {
			/** 若是悬赏只筛选出prize>0的问题 */
			exampleOfQuestion.createCriteria().andPrizeGreaterThan(0);
			exampleOfQuestion.setOrderByClause("prize DESC");
		} else {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		}
		// 封装PageBean
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurrentPage((long) page);
		pageInfo.setCurrentCount(PageConst.NUM_PER_PAGE);
		// 要计算一下
		long totalCount = mapperFactory.getTaxQuestionMapper().countByExample(
				exampleOfQuestion);
		long totalPage = totalCount / PageConst.NUM_PER_PAGE
				+ ((totalCount % PageConst.NUM_PER_PAGE == 0) ? 0 : 1);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setTotalCount(totalCount);
		/** 若totalCount==0 结果返回 */
		if (totalCount == 0) {
			result.setMessage(Message.Empty_Query_Result);
			result.setStatus(StatusCode.Empty_Query_Result);
			return JSON.toJSONString(result);
		}
		// 若请求的页面不合法，抛出异常
		if (page < 1 || page > totalPage) {
			try {
				throw new Exception("UNKNOWN ERROR: invalid query page");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		} else if ((page == totalPage)
				&& (totalCount % PageConst.NUM_PER_PAGE != 0)) {
			pageInfo.setCurrentCount((long) totalCount % PageConst.NUM_PER_PAGE);
		}
		// 设置查询sql的limitClause
		Long offset = (pageInfo.getCurrentPage() - 1) * PageConst.NUM_PER_PAGE;
		Long limit = pageInfo.getCurrentCount();
		StringBuilder limitClauseSB = new StringBuilder();
		limitClauseSB.append(offset).append(",").append(limit);
		exampleOfQuestion.setLimitClause(limitClauseSB.toString());
		// 先获取请求页面对应的问题列表
		List<TaxQuestion> questionList = mapperFactory.getTaxQuestionMapper()
				.selectByExample(exampleOfQuestion);
		// 根据请求页面的问题列表，包装成问题简介列表，然后放到pageBean中
		List<QuestionBrief> questionBriefList = getQuestionBriefList(questionList);
		// 设置pageInfo
		pageInfo.setList(questionBriefList);
		// 设置result
		result.setResult(pageInfo);
		return JSON.toJSONString(result);
	}

	/** 答题专区 用户动态 类似调用getByCondition("latest")即可完成 封装成QuestionLive返回即可 */
	@Override
	public String getQuestions(int page) {
		// 答题专区用户动态
		Result result = new Result();
		TaxQuestionExample exampleOfQuestion = new TaxQuestionExample();
		// 由新到旧排序 再按点击排序 再按照收藏排序
		exampleOfQuestion
				.setOrderByClause("publish_date DESC, click DESC, favourite DESC");
		// 封装PageBean
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurrentPage((long) page);
		pageInfo.setCurrentCount(PageConst.NUM_PER_PAGE);
		// 要计算一下
		long totalCount = mapperFactory.getTaxQuestionMapper().countByExample(
				exampleOfQuestion);
		long totalPage = totalCount / PageConst.NUM_PER_PAGE
				+ ((totalCount % PageConst.NUM_PER_PAGE == 0) ? 0 : 1);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setTotalCount(totalCount);
		/** 若totalCount==0 结果返回 */
		if (totalCount == 0) {
			result.setMessage(Message.Empty_Query_Result);
			result.setStatus(StatusCode.Empty_Query_Result);
			return JSON.toJSONString(result);
		}
		// 若请求的页面不合法，抛出异常
		if (page < 1 || page > totalPage) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		} else if ((page == totalPage)
				&& (totalCount % PageConst.NUM_PER_PAGE != 0)) {
			pageInfo.setCurrentCount((long) totalCount % PageConst.NUM_PER_PAGE);
		}
		// 设置查询sql的limitClause
		Long offset = (pageInfo.getCurrentPage() - 1) * PageConst.NUM_PER_PAGE;
		Long limit = pageInfo.getCurrentCount();
		StringBuilder limitClauseSB = new StringBuilder();
		limitClauseSB.append(offset).append(",").append(limit);
		exampleOfQuestion.setLimitClause(limitClauseSB.toString());
		// 先获取请求页面对应的问题列表
		List<TaxQuestion> questionList = mapperFactory.getTaxQuestionMapper()
				.selectByExample(exampleOfQuestion);
		List<QuestionLive> questionLiveList = getQuestionLiveList(questionList);
		// 设置pageInfo
		pageInfo.setList(questionLiveList);
		// 设置result
		result.setResult(pageInfo);
		return JSON.toJSONString(result);
	}

	/** 经验分享 */
	@Override
	public String getShares(int page) {
		Result result = new Result();
		TaxShareExample exampleOfShare = new TaxShareExample();
		// 封装PageBean
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurrentPage((long) page);
		pageInfo.setCurrentCount(PageConst.NUM_PER_PAGE);
		// 要计算一下
		long totalCount = mapperFactory.getTaxShareMapper().countByExample(
				exampleOfShare);
		long totalPage = totalCount / PageConst.NUM_PER_PAGE
				+ ((totalCount % PageConst.NUM_PER_PAGE == 0) ? 0 : 1);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setTotalCount(totalCount);
		/** 若totalCount==0 结果返回 */
		if (totalCount == 0) {
			result.setMessage(Message.Empty_Query_Result);
			result.setStatus(StatusCode.Empty_Query_Result);
			return JSON.toJSONString(result);
		}
		// 若请求的页面不合法，抛出异常
		if (page < 1 || page > totalPage) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		} else if ((page == totalPage)
				&& (totalCount % PageConst.NUM_PER_PAGE != 0)) {
			pageInfo.setCurrentCount((long) totalCount % PageConst.NUM_PER_PAGE);
		}
		// 根据分页信息获取经验分享列表(默认 先按照点击降序 再按照收藏降序 再按照时间)
		List<TaxShare> shareList = null;
		exampleOfShare
				.setOrderByClause("click DESC, favourite DESC, publish_date DESC");
		// 设置查询sql的limitClause
		Long offset = (pageInfo.getCurrentPage() - 1) * PageConst.NUM_PER_PAGE;
		Long limit = pageInfo.getCurrentCount();
		StringBuilder limitClauseSB = new StringBuilder();
		limitClauseSB.append(offset).append(",").append(limit);
		exampleOfShare.setLimitClause(limitClauseSB.toString());
		shareList = mapperFactory.getTaxShareMapper().selectByExample(
				exampleOfShare);
		// 构造ShareExpertDetail List
		List<ShareExpertDetail> shareExpertDetailList = new ArrayList<ShareExpertDetail>();
		for (TaxShare share : shareList) {
			ShareExpertDetail shareExpertDetail = new ShareExpertDetail();
			// 根据share中的authorId去TaxUser表找出authorName对象
			TaxUserKey userKey = new TaxUserKey();
			userKey.setId(share.getAuthorId());
			TaxUser author = mapperFactory.getTaxUserMapper()
					.selectByPrimaryKey(userKey);
			shareExpertDetail.setShareExpertId(share.getId());
			shareExpertDetail.setAuthorName(author.getUsername());
			// 根据share中的authorId找出question对象
			shareExpertDetail.setTitle(share.getTitle());
			shareExpertDetail.setClick(share.getClick());
			shareExpertDetail.setFavourite(share.getFavourite());
			// 格式化日期
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd");
			String publishDateStr = formatter.format(share.getPublishDate());
			shareExpertDetail.setPublishDateStr(publishDateStr);
			// 加入队列
			shareExpertDetailList.add(shareExpertDetail);
		}
		// 设置pageInfo
		pageInfo.setList(shareExpertDetailList);
		// 设置result
		result.setResult(pageInfo);
		return JSON.toJSONString(result);
	}

	/** 专业精读 */
	@Override
	public String getArticlesOfExperts(int page) {
		Result result = new Result();
		TaxExpertExample exampleOfExpert = new TaxExpertExample();
		// 封装PageBean
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurrentPage((long) page);
		pageInfo.setCurrentCount(PageConst.NUM_PER_PAGE);
		// 要计算一下
		long totalCount = mapperFactory.getTaxExpertMapper().countByExample(
				exampleOfExpert);
		long totalPage = totalCount / PageConst.NUM_PER_PAGE
				+ ((totalCount % PageConst.NUM_PER_PAGE == 0) ? 0 : 1);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setTotalCount(totalCount);
		/** 若totalCount==0 结果返回 */
		if (totalCount == 0) {
			result.setMessage(Message.Empty_Query_Result);
			result.setStatus(StatusCode.Empty_Query_Result);
			return JSON.toJSONString(result);
		}
		// 若请求的页面不合法，抛出异常
		if (page < 1 || page > totalPage) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		} else if ((page == totalPage)
				&& (totalCount % PageConst.NUM_PER_PAGE != 0)) {
			pageInfo.setCurrentCount((long) totalCount % PageConst.NUM_PER_PAGE);
		}
		// 根据分页信息获取专家经验分享列表(默认 先按照点击降序 再按照收藏降序)
		List<TaxExpert> expertList = null;
		exampleOfExpert
				.setOrderByClause("click DESC, favourite DESC, publish_date DESC");
		// 设置查询sql的limitClause
		Long offset = (pageInfo.getCurrentPage() - 1) * PageConst.NUM_PER_PAGE;
		Long limit = pageInfo.getCurrentCount();
		StringBuilder limitClauseSB = new StringBuilder();
		limitClauseSB.append(offset).append(",").append(limit);
		exampleOfExpert.setLimitClause(limitClauseSB.toString());
		expertList = mapperFactory.getTaxExpertMapper().selectByExample(
				exampleOfExpert);
		// 构造ShareExpertDetail List
		List<ShareExpertDetail> shareExpertDetailList = new ArrayList<ShareExpertDetail>();
		for (TaxExpert expert : expertList) {
			ShareExpertDetail shareExpertDetail = new ShareExpertDetail();
			// 根据share中的authorId去TaxUser表找出authorName对象
			TaxUserKey userKey = new TaxUserKey();
			userKey.setId(expert.getAuthorId());
			TaxUser author = mapperFactory.getTaxUserMapper()
					.selectByPrimaryKey(userKey);
			shareExpertDetail.setShareExpertId(expert.getId());
			shareExpertDetail.setAuthorName(author.getUsername());
			// 根据share中的authorId找出question对象
			shareExpertDetail.setTitle(expert.getTitle());
			shareExpertDetail.setClick(expert.getClick());
			shareExpertDetail.setFavourite(expert.getFavourite());
			// 格式化日期
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd");
			String publishDateStr = formatter.format(expert.getPublishDate());
			shareExpertDetail.setPublishDateStr(publishDateStr);
			// 加入队列
			shareExpertDetailList.add(shareExpertDetail);
		}
		// 设置pageInfo
		pageInfo.setList(shareExpertDetailList);
		// 设置result
		result.setResult(pageInfo);
		return JSON.toJSONString(result);
	}

	private List<QuestionBrief> getQuestionBriefList(
			List<TaxQuestion> questionList) {
		List<QuestionBrief> questionBriefList = new ArrayList<QuestionBrief>();
		for (TaxQuestion question : questionList) {
			QuestionBrief qb = new QuestionBrief();
			qb.setId(question.getId());// id
			qb.setTitle(question.getTitle());// 标题
			qb.setClick(question.getClick());// 浏览
			qb.setFavourite(question.getFavourite());// 收藏
			qb.setPrize(question.getPrize());// 悬赏分数
			// 分类名称
			String[] questionTypeNameList = getQuestionTypeNameList(question
					.getType());
			StringBuilder questionBriefTypeSB = new StringBuilder();
			for (int i = 0; i < questionTypeNameList.length; i++) {
				if (i == questionTypeNameList.length - 1)
					questionBriefTypeSB.append(questionTypeNameList[i]);
				else
					questionBriefTypeSB.append(questionTypeNameList[i]).append(
							SeperatorConst.QUESTION_BRIEF_TYPE_SEPERATOR);
			}
			qb.setType(questionBriefTypeSB.toString());// 种类
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd");
			String publishDateStr = formatter.format(question.getPublishDate());
			qb.setPublishDateStr(publishDateStr);// 发布日期
			/** 从answer表中查询时该qid的总数 */
			TaxAnswerExample exampleOfAnswer = new TaxAnswerExample();
			exampleOfAnswer.createCriteria().andQuestionIdEqualTo(
					question.getId());
			Long totalAnswerNumOfQuestion = mapperFactory.getTaxAnswerMapper()
					.countByExample(exampleOfAnswer);
			qb.setTotalAnswerNum(totalAnswerNumOfQuestion);// 设置总回答数
			// 加入队列
			questionBriefList.add(qb);
		}
		return questionBriefList;
	}

	private String[] getQuestionTypeNameList(String questionTypeStr) {
		/** 这里直接返回种类列表的"1;2;3;5"->"名称1;名称2;名称3;名称5" */
		String[] questionTypeIdStrList = questionTypeStr
				.split(SeperatorConst.QUESTION_TYPE_SEPERATOR);
		String[] questionTypeNameList = new String[questionTypeIdStrList.length];
		for (int i = 0; i < questionTypeIdStrList.length; i++) {
			try {
				Integer typeId = Integer.parseInt(questionTypeIdStrList[i]);
				TaxProKey proKey = new TaxProKey();
				proKey.setId(typeId);
				TaxPro pro = mapperFactory.getTaxProMapper()
						.selectByPrimaryKey(proKey);
				// id唯一
				questionTypeNameList[i] = pro.getName();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return questionTypeNameList;
	}

	private List<QuestionLive> getQuestionLiveList(
			List<TaxQuestion> questionList) {
		List<QuestionLive> questionLiveList = new ArrayList<QuestionLive>();
		for (TaxQuestion question : questionList) {
			QuestionLive questionLive = new QuestionLive();
			questionLive.setId(question.getId());
			questionLive.setTitle(question.getTitle());
			questionLive.setPublishDate(question.getPublishDate());
			questionLive.setAuthorId(question.getAuthorId());
			// 根据authorId查出authorName
			TaxUserKey userKey = new TaxUserKey();
			userKey.setId(question.getAuthorId());
			TaxUser author = mapperFactory.getTaxUserMapper()
					.selectByPrimaryKey(userKey);
			questionLive.setAuthorName(author.getUsername());
			// 加入队列
			questionLiveList.add(questionLive);
		}
		return questionLiveList;
	}
	
	/**点击函数*/
	public synchronized void clickQuestion(int questionId){
		TaxQuestionKey questionKey = new TaxQuestionKey();
		questionKey.setId(questionId);
		TaxQuestion question = mapperFactory.getTaxQuestionMapper().selectByPrimaryKey(questionKey);
		question.setClick(question.getClick()+1);
		mapperFactory.getTaxQuestionMapper().updateByPrimaryKey(question);
	}
}
