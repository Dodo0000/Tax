package org.tax.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.tax.VO.LoginInfo;
import org.tax.model.TaxUser;
import org.tax.service.TaxGuestService;

/**
 * @author wyhong
 * @date 2018-7-7
 */
public class TaxGuestServiceImpl implements TaxGuestService {
	
	@Override
	public String register(TaxUser user) {
		//未加验证码
		return null;
	}

	@Override
	public String login(LoginInfo loginInfo, HttpServletRequest request,
			HttpServletResponse response) {
		//未加验证码
		return null;
	}

	@Override
	public String search(String keyword, String proId) {
		//每个页的搜索栏，根据关键字搜索
		return null;
	}
	
	@Override
	public String getByCondition(String type, int page) {
		//最新、热门、悬赏然后排序显示即可	
		return null;
	}

	@Override
	public String getQuestions(String type, int page) {
		//由checkbox中根据类型和页码给出问题列表
		return null;
	}

	@Override
	public String getShares(int page) {
		//根据分页信息获取经验分享列表
		return null;
	}

	@Override
	public String getArticlesOfExperts(int page) {
		//根据分页信息获取专业精读列表
		return null;
	}

}
