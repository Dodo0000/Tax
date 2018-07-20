package org.tax.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.tax.VO.PasswordModification;
import org.tax.VO.PublishQuestionInfo;
import org.tax.constant.CookieConst;
import org.tax.constant.FilePathConst;
import org.tax.constant.Message;
import org.tax.constant.SessionConst;
import org.tax.constant.StatusCode;
import org.tax.factory.MapperFactory;
import org.tax.model.TaxAnswer;
import org.tax.model.TaxFavourite;
import org.tax.model.TaxFavouriteExample;
import org.tax.model.TaxInvitation;
import org.tax.model.TaxQuestion;
import org.tax.model.TaxQuestionExample;
import org.tax.model.TaxUser;
import org.tax.model.TaxUserExample;
import org.tax.model.TaxUserKey;
import org.tax.model.TaxUserPro;
import org.tax.result.Result;
import org.tax.service.TaxUserService;
import org.tax.session.MySession;
import org.tax.session.SessionControl;
import org.tax.util.FormatUtil;
import org.tax.util.LuceneUtil;
import org.tax.model.TaxUserProExample;
import org.tax.VO.Candidate;

import com.alibaba.fastjson.JSON;

/**
 * @author wyhong
 * @date 2018-7-7
 */
public class TaxUserServiceImpl implements TaxUserService {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(TaxGuestServiceImpl.class);

	@Autowired
	private MapperFactory mapperFactory;

	/** 从cookie中获取uid username password查询并返回信息给前端 */
	@Override
	public String getUser(HttpServletRequest request,
			HttpServletResponse response) {
		Result result = new Result();
		TaxUser user = getUserFromRequest(request);
		if (user == null) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
		} else {
			result.setResult(user);
		}
		return JSON.toJSONString(result);
		// Result result = new Result();
		// //找出cookie
		// Cookie[] cookies = request.getCookies();
		// Cookie userCookie = null;
		// for (Cookie cookie : cookies) {
		// if(cookie.getName().equals(CookieConst.USER)){
		// userCookie = cookie;
		// }
		// }
		// /**其实以后这里可以省略，在拦截器加上*/
		// if(userCookie!=null){
		// //先decodedUserCookieVal 默认格式 uid;username;password
		// String decodedUserCookieVal =
		// URLDecoder.decode(userCookie.getValue());
		// if(decodedUserCookieVal.split(";").length==3){
		// String uid = decodedUserCookieVal.split(";")[0];
		// String username = decodedUserCookieVal.split(";")[1];
		// String password = decodedUserCookieVal.split(";")[2];
		// TaxUserExample exampleOfUser = new TaxUserExample();
		// exampleOfUser.createCriteria().andIdEqualTo(uid).andUsernameEqualTo(username).andPasswordEqualTo(password);
		// List<TaxUser> userList =
		// mapperFactory.getTaxUserMapper().selectByExample(exampleOfUser);
		// //用户cookie正确
		// if(userList.size()>0){
		// TaxUser user = userList.get(0);
		// result.setResult(user);
		// return JSON.toJSONString(result);
		// }
		// }
		// }
		// //不合法的cookie
		// result.setMessage(Message.INVALID_PARAMS);
		// result.setStatus(StatusCode.INVALID_PARAMS);
		// return JSON.toJSONString(result);
	}

	/** 返回用户头像，若用户没有登陆采用default头像 改了刷新不加同步会有问题 */
	@Override
	public void generateUserAvatar(HttpServletRequest request,
			HttpServletResponse response) {
		TaxUser user = getUserFromRequest(request);
		/**这里从session中获取uid然后再从数据库中查*/
		TaxUserKey userKey = new TaxUserKey();
		userKey.setId(user.getId());
		user = mapperFactory.getTaxUserMapper().selectByPrimaryKey(userKey);
		String imgPath = null;
		if (user == null)
			imgPath = FilePathConst.DEFAULT_USER_IMG;
		else
			imgPath = user.getImage();// user.getImage()默认not null
		ServletOutputStream out = null;
		FileInputStream ips = null;
		try {
			// 获取图片存放路径
			LOGGER.debug("***** imgPath: "+imgPath);
			ips = new FileInputStream(new File(imgPath));
			//response.setContentType("multipart/form-data");
			out = response.getOutputStream();
			// 读取文件流
			int len = 0;
			byte[] buffer = new byte[1024 * 10];
			while ((len = ips.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				ips.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/** 根据用户输入的type形式为 1;2;3;5 返回score最高的3个最多 */
	@Override
	public String getRelaventUsers(String questionTypes,
			HttpServletRequest request) {
		Result result = new Result();
		TaxUserProExample exampleOfUserPro = new TaxUserProExample();
		exampleOfUserPro.setDistinct(true);

		String[] questionTypesArr = questionTypes.split(";");
		List<Integer> proIdList = new ArrayList<Integer>();
		for (String typeStr : questionTypesArr) {
			try {
				Integer typeInt = Integer.parseInt(typeStr);
				proIdList.add(typeInt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		/** 设置查找的相关推荐用户不能是提问用户自己 */
		TaxUser currentUser = getUserFromRequest(request);
		exampleOfUserPro.createCriteria().andProIdIn(proIdList)
				.andUserIdNotEqualTo(currentUser.getId());
		List<Candidate> candidates = mapperFactory.getTaxUserProMapper()
				.selectByExample(exampleOfUserPro);
		if (candidates == null || candidates.size() == 0) {
			result.setMessage(Message.Empty_Query_Result);
			result.setStatus(StatusCode.Empty_Query_Result);
			return JSON.toJSONString(result);
		}
		candidates.subList(0, Math.min(candidates.size(), 3));
		result.setResult(candidates);
		return JSON.toJSONString(result);
	}

	/** 用户登出 */
	@Override
	public String logout(HttpServletRequest request,
			HttpServletResponse response) {
		LOGGER.debug("**********debug in logout section: ");
		Result result = new Result();
		Cookie[] cookies = request.getCookies();
		Cookie userCookie = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(CookieConst.USER)) {
				userCookie = cookie;
				break;
			}
		}
		/** 测试cookie中是什么 */
		LOGGER.debug("**********encoded: userCookieVal: "
				+ userCookie.getValue());
		// 根据userCookie中的信息 uid;username;password
		String decodeUserCookieVal = URLDecoder.decode(userCookie.getValue());
		LOGGER.debug("**********decoded: userCookieVal: " + decodeUserCookieVal);
		// 默认userCookie中存 uid;username;password三个信息
		if (userCookie == null || decodeUserCookieVal.split(";").length != 3) {
			LOGGER.debug("**********1111");
			result.setMessage(Message.LOGOUT_COOKIE_EXCEPTION);
			result.setStatus(StatusCode.LOGOUT_COOKIE_EXCEPTION);
			return JSON.toJSONString(result);
		}
		String uid = decodeUserCookieVal.split(";")[0];
		String username = decodeUserCookieVal.split(";")[1];
		String password = decodeUserCookieVal.split(";")[2];
		if (uid == null || username == null || password == null) {
			LOGGER.debug("**********2222");
			result.setMessage(Message.LOGOUT_COOKIE_EXCEPTION);
			result.setStatus(StatusCode.LOGOUT_COOKIE_EXCEPTION);
			return JSON.toJSONString(result);
		}
		// 若username password都合法那么就删除uid对应的session，否则不删除，放置伪造cookie登出
		TaxUserExample exampleOfUser = new TaxUserExample();
		exampleOfUser.createCriteria().andUsernameEqualTo(username)
				.andPasswordEqualTo(password);
		List<TaxUser> userList = mapperFactory.getTaxUserMapper()
				.selectByExample(exampleOfUser);
		if (userList.size() <= 0 || !userList.get(0).getId().equals(uid)) {
			LOGGER.debug("**********33333");
			result.setMessage(Message.LOGOUT_COOKIE_EXCEPTION);
			result.setStatus(StatusCode.LOGOUT_COOKIE_EXCEPTION);
			return JSON.toJSONString(result);
		}
		LOGGER.debug("**********4444");
		// 若果cookie中的用户信息合法, 根据uid删除掉相应的session, 删除相应的cookie
		SessionControl.getInstance().rmSession(uid);
		/** 删完要加回去 */
		userCookie.setMaxAge(0);
		userCookie.setPath(CookieConst.PATH);
		response.addCookie(userCookie);
		return JSON.toJSONString(result);
	}

	/** 这里假定用户名不能修改 */
	@Override
	public String updateInfo(TaxUser user, HttpServletRequest request) {
		Result result = new Result();
		// 检查是否用户在登陆状态(由拦截器搞)
		TaxUser originalUser = getUserFromRequest(request);
		// 根据包装跟新数据的user更新originalUser
		if (!originalUser.getId().equals(user.getId())
				|| user.getEmail() == null || user.getTelephone() == null) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		} else if (user.getEmail().equals("") || user.getEmail().equals("\\s+")
				|| user.getTelephone().equals("")
				|| user.getTelephone().equals("\\s+")) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		}
		// 更新三个字段email telephone proList
		originalUser.setEmail(user.getEmail());
		originalUser.setTelephone(user.getTelephone());
		/** 若用户没有填写proList那么不修改 */
		if (user.getProList() != null && !user.getProList().equals(""))
			originalUser.setProList(user.getProList());
		// 检查用户名 密码是否正确
		TaxUserExample exampleOfUser = new TaxUserExample();
		exampleOfUser.createCriteria()
				.andUsernameEqualTo(originalUser.getUsername())
				.andPasswordEqualTo(originalUser.getPassword());
		List<TaxUser> selectUser = mapperFactory.getTaxUserMapper()
				.selectByExample(exampleOfUser);
		if (selectUser == null || selectUser.size() == 0) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		}
		// 修改信息
		int flag = mapperFactory.getTaxUserMapper().updateByExampleSelective(
				originalUser, exampleOfUser);
		if (flag <= 0) {
			result.setMessage(Message.UPDATE_FALIUER);
			result.setStatus(StatusCode.UPDATE_FALIUER);
			return JSON.toJSONString(result);
		}
		// 根据用户的proList更新tax_user_pro表
		TaxUserProExample exampleOfUserPro = new TaxUserProExample();
		exampleOfUserPro.createCriteria()
				.andUserIdEqualTo(originalUser.getId());
		mapperFactory.getTaxUserProMapper().deleteByExample(exampleOfUserPro);
		if (originalUser.getProList() != null
				&& !originalUser.getProList().equals("\\s+")) {
			String[] proStrs = originalUser.getProList().split(";");
			for (String proStr : proStrs) {
				TaxUserPro up = new TaxUserPro();
				up.setUserId(originalUser.getId());
				Integer proIdInt = Integer.parseInt(proStr);
				up.setProId(proIdInt);
				mapperFactory.getTaxUserProMapper().insert(up);
			}
		}
		return JSON.toJSONString(result);
	}

	/** 以后修改为从鸿哥的Factory获取Session */
	@Override
	public String modifyPassword(PasswordModification info,
			HttpServletRequest request) {
		Result result = new Result();
		// 检查是否用户在登陆状态(由拦截器搞)
		// 检查新旧密码是否一致
		if (info == null || info.getPassword() == null
				|| info.getNewPassword() == null) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		}

		/***************************************************************/
		// 测试时候才打开
		// TaxUserKey dubiUserKey = new TaxUserKey();
		// dubiUserKey.setId("a9da429220a64a12a34264cd971acdf7");
		// TaxUser dubi =
		// mapperFactory.getTaxUserMapper().selectByPrimaryKey(dubiUserKey);
		// TaxUser user = dubi;
		// PasswordModification passwordInfo = new PasswordModification();
		// passwordInfo.setPassword(dubi.getPassword());
		// passwordInfo.setNewPassword("newpassowrd");
		// info = passwordInfo;
		// passwordInfo.setNewPassword("");//非法修改
		/***************************************************************/

		// 从Session取出用户,确定旧密码是否正确
		// TaxUser user =
		// (TaxUser)request.getSession().getAttribute(SessionConst.USER);
		// 2018/7/12:wyhong
		TaxUser user = getUserFromRequest(request);
		if (!user.getPassword().equals(info.getPassword())) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
		} else if (info.getPassword().equals(info.getNewPassword())) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
		} else {
			// 更新密码
			user.setPassword(info.getNewPassword());
			mapperFactory.getTaxUserMapper().updateByPrimaryKey(user);
		}
		return JSON.toJSONString(result);
	}

	/**
	 * 以后修改为从鸿哥的Factory获取Session 更改需要： 细化检验各个字段
	 * */
	@Override
	public synchronized String publishQuestion(TaxQuestion question,
			String[] invitedUserIdArr, HttpServletRequest request) {
		LOGGER.debug("************debug in publishQuestion");
		LOGGER.debug("************debug publishQuestionInfo title: "
				+ question.getTitle());
		LOGGER.debug("************debug publishQuestionInfo content: "
				+ question.getContent());
		LOGGER.debug("************debug publishQuestionInfo type: "
				+ question.getType());
		LOGGER.debug("************debug publishQuestionInfo prize: "
				+ question.getPrize());
		Result result = new Result();
		// Question id 自增那么不需要管直接插入即可
		// 设置问题的authorId
		// 2018/7/12:wyhong
		if (question.getTitle() == null || question.getTitle().equals("")
				|| question.getTitle().split("\\s+").length == 0) {
			result.setMessage(Message.PUBLISH_QUESTION_EMPTY_TITLE);
			result.setStatus(StatusCode.PUBLISH_QUESTION_EMPTY_TITLE);
			return JSON.toJSONString(result);
		} else if (question.getContent() == null
				|| question.getContent().equals("")
				|| question.getContent().split("\\s+").length == 0) {
			result.setMessage(Message.PUBLISH_QUESTION_EMPTY_CONTENT);
			result.setStatus(StatusCode.PUBLISH_QUESTION_EMPTY_CONTENT);
			return JSON.toJSONString(result);
		}
		/** 设置问题 */
		// 设置问题作者id
		TaxUser author = getUserFromRequest(request);
		question.setAuthorId(author.getId());
		// 设置问题的publishDate
		question.setPublishDate(new Date());
		/**
		 * 先把问题插入，再取出最后一个插入的questionId 这里修改了mapper的insertSelective
		 * */
		mapperFactory.getTaxQuestionMapper().insertSelective(question);
		/**
		 * 方案二直接用mapper中外加的 selectLastInsetId （感觉没那么安全）
		 * */

		/** select last insert id */
		/** 设置邀请表 */
		if (invitedUserIdArr != null && invitedUserIdArr.length != 0) {
			for (String invitedUserId : invitedUserIdArr) {
				TaxInvitation invitation = new TaxInvitation();
				// 设置被被邀请回答的用户id
				invitation.setUserId(invitedUserId);
				LOGGER.debug("************debug publishQuestionInfo invitedUserId: "
						+ invitedUserId);
				// 设置问题id
				invitation.setQuestionId(question.getId());
				LOGGER.debug("************debug publishQuestionInfo questionId: "
						+ question.getId());
				// 把这个invitation插入
				mapperFactory.getTaxInvitationMapper().insert(invitation);
			}
		}
		/**
		 * 发布问题的时候要对问题进行索引
		 * */
		LuceneUtil.creatIndex(question);

		return JSON.toJSONString(result);
	}

	/** 可以考虑整理到util中 */
	private TaxUser getUserFromRequest(HttpServletRequest request) {
		String userId = null;
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(CookieConst.USER)) {
				try {
					userId = URLDecoder.decode(cookie.getValue(), "UTF-8")
							.split(";")[0];
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		LOGGER.debug("userId:" + userId);
		MySession session = SessionControl.getInstance().getSession(userId);
		LOGGER.debug("session num:"
				+ SessionControl.getInstance().getNumOnline());
		LOGGER.debug("*****************sessionId in user services:"
				+ session.getId() + ";userId:" + userId);
		return (TaxUser) session.getAttribute(SessionConst.USER);
	}

	/**
	 * 以后修改为从鸿哥的Factory获取Session 前端封装好了questionId title content字段 需要先检验
	 * questionId是否合法 title content不为空 还要设置publishDate
	 * */
	@Override
	public String publishAnswer(TaxAnswer answer, HttpServletRequest request) {
		LOGGER.debug("********debug in publishAnswer Section: ");
		LOGGER.debug("********debug in publishAnswer answer"
				+ answer.getQuestionId());
		LOGGER.debug("********debug in publishAnswer content"
				+ answer.getContent());
		Result result = new Result();
		/** 检验封装过来的answer是否合法 */
		if (answer.getContent() == null || answer.getContent().equals("")
				|| answer.getContent().split("\\s+").length == 0) {
			result.setMessage(Message.PUBLISH_ANSWER_EMPTY_CONTENT);
			result.setStatus(StatusCode.PUBLISH_ANSWER_EMPTY_CONTENT);
			return JSON.toJSONString(result);
		}
		TaxUser author = getUserFromRequest(request);
		if (author == null) {
			result.setMessage(Message.PLEASE_LOGIN);
			result.setStatus(StatusCode.PLEASE_LOGIN);
			return JSON.toJSONString(result);
		}
		LOGGER.debug("********debug in publishAnswer authorId" + author.getId());
		// 设置答案作者id
		answer.setAuthorId(author.getId());
		// 设置问题的publishDate
		answer.setPublishDate(new Date());
		// 存放问题
		int flag = mapperFactory.getTaxAnswerMapper().insert(answer);
		if (flag <= 0) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
		}
		return JSON.toJSONString(result);
	}

	@Override
	public String confirmSolution(int questionId, HttpServletRequest request) {
		Result result = new Result();
		// 确保当前登陆user是请求正确的questionId
		TaxQuestionExample exampleOfQuestion = new TaxQuestionExample();
		// 匹配当前登陆用户id 问题id
		TaxUser user = getUserFromRequest(request);
		exampleOfQuestion.createCriteria().andAuthorIdEqualTo(user.getId())
				.andIdEqualTo(questionId);
		List<TaxQuestion> questionList = mapperFactory.getTaxQuestionMapper()
				.selectByExample(exampleOfQuestion);
		if (questionList.size() <= 0) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
		} else {
			TaxQuestion question = questionList.get(0);
			// 确认解答
			question.setStatus(1);
			int flag = mapperFactory.getTaxQuestionMapper().updateByPrimaryKey(
					question);
			if (flag <= 0) {
				result.setMessage(Message.INVALID_PARAMS);
				result.setStatus(StatusCode.INVALID_PARAMS);
			}
		}
		return JSON.toJSONString(result);
	}

	/** 以后这里应该采用消息队列 */
	@Override
	public synchronized String collectQuestion(int questionId,
			HttpServletRequest request) {
		Result result = new Result();
		TaxQuestionExample exampleOfQuestion = new TaxQuestionExample();
		exampleOfQuestion.createCriteria().andIdEqualTo(questionId);
		List<TaxQuestion> questionList = mapperFactory.getTaxQuestionMapper()
				.selectByExample(exampleOfQuestion);
		if (questionList.size() <= 0) {
			result.setMessage(Message.INVALID_PARAMS);
			result.setStatus(StatusCode.INVALID_PARAMS);
			return JSON.toJSONString(result);
		} else {
			TaxQuestion question = questionList.get(0);
			// 更新收藏数
			question.setFavourite(question.getFavourite() + 1);
			int flag = mapperFactory.getTaxQuestionMapper().updateByPrimaryKey(
					question);
			if (flag <= 0) {
				result.setMessage(Message.INVALID_PARAMS);
				result.setStatus(StatusCode.INVALID_PARAMS);
				return JSON.toJSONString(result);
			}
			/**
			 * 若在favourite表中已经有查到对饮qid与uid的数据那么就不应该再被收藏
			 * */
			TaxFavouriteExample exampleOfFavourite = new TaxFavouriteExample();
			exampleOfFavourite.createCriteria()
					.andQuestionIdEqualTo(questionId)
					.andUserIdEqualTo(getUserFromRequest(request).getId());
			List<TaxFavourite> favList = mapperFactory.getTaxFavouriteMapper()
					.selectByExample(exampleOfFavourite);
			if (favList.size() > 0) {
				result.setMessage(Message.DUPLICATE_COLLECT);
				result.setStatus(StatusCode.DUPLICATE_COLLECT);
				return JSON.toJSONString(result);
			}

			// 2018/7/12 wyhong:插入收藏实体
			TaxFavourite favourite = new TaxFavourite();
			favourite.setQuestionId(questionId);
			favourite.setUserId(getUserFromRequest(request).getId());
			mapperFactory.getTaxFavouriteMapper().insert(favourite);
		}
		return JSON.toJSONString(result);
	}

	/** 鸿哥说写编辑头像，图片上传 */
	@Override
	public String modifyAvatar(String userId, MultipartFile multipartFile) {
		LOGGER.debug("*****debug in modifyAvatar section");
		LOGGER.debug("*****debug in modifyAvatar userId:" + userId);
		Result result = new Result();
		TaxUserKey userKey = new TaxUserKey();
		userKey.setId(userId);
		TaxUser user = mapperFactory.getTaxUserMapper().selectByPrimaryKey(
				userKey);
		LOGGER.debug("*****debug in modifyAvatar user:" + user.toString());
		/** 先把user独享的img先清空 */
		String filePath = FilePathConst.USER_IMG_DIR
				+user.getId()+"_"+multipartFile.getOriginalFilename();
		LOGGER.debug("*****debug in modifyAvatar filePath" + filePath);
		try {
			/**先根据user.getImg若不是默认的图片删除*/
			if(!user.getImage().equals(FilePathConst.DEFAULT_USER_IMG)){
				new File(user.getImage()).delete();
			}
			multipartFile.transferTo(new File(filePath));
			user.setImage(filePath);
			// 更新
			mapperFactory.getTaxUserMapper().updateByPrimaryKey(user);
			LOGGER.debug("*****debug in modifyAvatar after user"
					+ user.toString());
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return JSON.toJSONString(result);
	}

}
