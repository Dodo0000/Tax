package api;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.junit.Test;
import org.springframework.util.DigestUtils;
import org.tax.constant.CookieConst;

/**
 * @author wyhong
 * @date 2018-7-12
 */
public class UserApiTest {
	
	@Test 
	public void testLogout(){
		/*1.先尝试登陆*/
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("username", "wyhong");
		loginInfo.put("password", DigestUtils.md5DigestAsHex("456".getBytes()));
		//loginInfo.put("password", "password");
		Response loginResponse = null;
		try {
			loginResponse = Jsoup.connect("http://localhost:8080/Tax/api/v1/guest/login")
				.data(loginInfo)
				.method(Method.POST)
				.ignoreContentType(true)
				.execute();
			Thread.sleep(1000);
			System.out.println(loginResponse.body());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		/*2.测试发帖*/
		Map<String, String> questionData = new HashMap<String, String>();
		questionData.put("type", "1;2");
		questionData.put("title", "test_pre_logout");
		questionData.put("content", "test4");
		try {
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/user/question")
				.data(questionData)
				.method(Method.POST)
				.ignoreContentType(true)
				.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
		/*3.测试退出*/
		try {
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/user/logout")
				.method(Method.POST)
				.ignoreContentType(true)
				.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
		/*4.测试一下能不能在推出后访问user接口*/
		try {
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/confirm/confirmSolution/99377bd858e04f5ba82bf5d69a5b3c8b")
				.method(Method.POST)
				.ignoreContentType(true)
				//.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testPublishQuestion(){
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("username", "wyhong");
		loginInfo.put("password", DigestUtils.md5DigestAsHex("123".getBytes()));
		Response loginResponse = null;
		try {
			loginResponse = Jsoup.connect("http://localhost:8080/Tax/api/v1/guest/login")
				.data(loginInfo)
				.method(Method.POST)
				.ignoreContentType(true)
				.execute();
			Thread.sleep(1000);
			//System.out.println(response.body());
		} catch (IOException e) {
		} catch (InterruptedException e) {
		}
		Map<String, String> questionData = new HashMap<String, String>();
		questionData.put("type", "1;2");
		questionData.put("title", "ddddddddd");
		questionData.put("content", "test4");
		try {
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/user/question")
				.data(questionData)
				.method(Method.POST)
				.ignoreContentType(true)
				.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
		}
	}
	
	@Test
	public void testPublishAnswer(){
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("username", "wyhong");
		loginInfo.put("password", DigestUtils.md5DigestAsHex("456".getBytes()));
		Response loginResponse = null;
		try {
			loginResponse = Jsoup.connect("http://localhost:8080/Tax/api/v1/guest/login")
				.data(loginInfo)
				.method(Method.POST)
				.ignoreContentType(true)
				.execute();
			Thread.sleep(1000);
			//System.out.println(response.body());
		} catch (IOException e) {
		} catch (InterruptedException e) {
		}
		Map<String, String> answerData = new HashMap<String, String>();
		answerData.put("questionId", "1");
		answerData.put("content", "answer_content");
		try {
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/user/question/1/answer")
				.data(answerData)
				.method(Method.POST)
				.ignoreContentType(true)
				.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
		}
	}
	
	@Test
	public void testModifyPassword(){
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("username", "wyhong");
		loginInfo.put("password", DigestUtils.md5DigestAsHex("123".getBytes()));
		Response loginResponse = null;
		try {
			loginResponse = Jsoup.connect("http://localhost:8080/Tax/api/v1/guest/login")
				.data(loginInfo)
				.method(Method.POST)
				.ignoreContentType(true)
				.execute();
			Thread.sleep(1000);
			//System.out.println(response.body());
		} catch (IOException e) {
		} catch (InterruptedException e) {
		}
		Map<String, String> modifiedInfo = new HashMap<String, String>();
		modifiedInfo.put("password", DigestUtils.md5DigestAsHex("123".getBytes()));
		modifiedInfo.put("newPassword", DigestUtils.md5DigestAsHex("456".getBytes()));
		try {
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/user/password")
				.data(modifiedInfo)
				.method(Method.POST)
				.ignoreContentType(true)
				.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
		}
	}
	
	@Test
	public void testUpdateInfo(){
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("username", "wyhong");
		loginInfo.put("password", DigestUtils.md5DigestAsHex("456".getBytes()));
		Response loginResponse = null;
		try {
			loginResponse = Jsoup.connect("http://localhost:8080/Tax/api/v1/guest/login")
				.data(loginInfo)
				.method(Method.POST)
				.ignoreContentType(true)
				.execute();
			Thread.sleep(1000);
			//System.out.println(response.body());
		} catch (IOException e) {
		} catch (InterruptedException e) {
		}
		Map<String, String> userData = new HashMap<String, String>();
		//userData.put("username", "wyhong_updated");
		userData.put("email", "285944978@qq.com_updated");
		userData.put("telephone", "11111111111");
		userData.put("proList", "18;1818;181818");
		try {
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/user/update")
				.data(userData)
				.method(Method.POST)
				.ignoreContentType(true)
				.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
		}
	}
	
	@Test
	public void testConfirmSolution(){
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("username", "wyhong");
		loginInfo.put("password", DigestUtils.md5DigestAsHex("456".getBytes()));
		Response loginResponse = null;
		try {
			loginResponse = Jsoup.connect("http://localhost:8080/Tax/api/v1/guest/login")
				.data(loginInfo)
				.method(Method.POST)
				.ignoreContentType(true)
				.execute();
			Thread.sleep(1000);
			//System.out.println(response.body());
		} catch (IOException e) {
		} catch (InterruptedException e) {
		}
		Map<String, String> data = new HashMap<String, String>();
		try {
			//����Ͳ���ȷ�ϲ����Լ���������
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/user/confirm/6")
				.method(Method.POST)
				.ignoreContentType(true)
				.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testCollect(){
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("username", "wyhong");
		loginInfo.put("password", DigestUtils.md5DigestAsHex("456".getBytes()));
		Response loginResponse = null;
		try {
			loginResponse = Jsoup.connect("http://localhost:8080/Tax/api/v1/guest/login")
				.data(loginInfo)
				.method(Method.POST)
				.ignoreContentType(true)
				.execute();
			Thread.sleep(1000);
			//System.out.println(response.body());
		} catch (IOException e) {
		} catch (InterruptedException e) {
		}
		try {
			//����Ͳ���ȷ�ϲ����Լ���������
			Response response = Jsoup.connect("http://localhost:8080/Tax/api/v1/user/collect/1")
				.method(Method.POST)
				.ignoreContentType(true)
				.cookie(CookieConst.USER, loginResponse.cookie(CookieConst.USER))
				.execute();
			//System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
