package api;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.Connection.Method;
import org.junit.Test;
import org.springframework.util.DigestUtils;
import org.tax.util.LuceneUtil;

/**
 * @author wyhong
 * @date 2018-7-12
 */
public class GuestApiTest {

	@Test
	public void testRegister() {
		Map<String, String> userData = new HashMap<String, String>();
		userData.put("username", "wyhong");
		userData.put("email", "285944978@qq.com");
		userData.put("telephone", "17864154784");
		userData.put("password", DigestUtils.md5DigestAsHex("123".getBytes()));
		try {
			Response response = Jsoup
					.connect("http://localhost:8080/Tax/api/v1/guest/register")
					.data(userData).method(Method.POST).ignoreContentType(true)
					.execute();
			// System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testLogin() {
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("username", "wyhong");
		loginInfo.put("password", DigestUtils.md5DigestAsHex("123".getBytes()));
		try {
			Response response = Jsoup
					.connect("http://localhost:8080/Tax/api/v1/guest/login")
					.data(loginInfo).method(Method.POST)
					.ignoreContentType(true).execute();
			// System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testGetQuestions() {
		try {
			Response response = Jsoup
					.connect(
							"http://localhost:8080/Tax/api/v1/guest/question/2")
					.method(Method.GET).ignoreContentType(true).execute();
			System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testSearch() {
		try {
			// LuceneUtil.initIndexLib();
			Response response = Jsoup
					.connect(
							"http://localhost:8080/Tax/api/v1/guest/search/ccc/2/1")
					.method(Method.GET).ignoreContentType(true).execute();
			System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testGetByCondition() {
		try {
			Response response = Jsoup
					.connect(
							"http://localhost:8080/Tax/api/v1/guest//question/wrong_type/1")
					.method(Method.GET).ignoreContentType(true).execute();
			System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testGetShares() {
		try {
			Response response = Jsoup
					.connect("http://localhost:8080/Tax/api/v1/guest/share/2")
					.method(Method.GET).ignoreContentType(true).execute();
			System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testGetArticlesOfExperts() {
		try {
			Response response = Jsoup
					.connect("http://localhost:8080/Tax/api/v1/guest/expert/2")
					.method(Method.GET).ignoreContentType(true).execute();
			System.out.println(response.body());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
