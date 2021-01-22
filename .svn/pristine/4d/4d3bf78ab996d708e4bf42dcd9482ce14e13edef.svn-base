package com.weiweiqin.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

/**
 * 通过手机号码,获得该号码的归属地
 * 
 * @author Administrator
 * 
 */
public class MobileFromUtil {
	// 正则表达式,抽取手机归属地
	public static final String REGEX_GET_MOBILE = "(?is)(<tr[^>]+>[\\s]*<TD[^>]+>[\\s]*卡号归属地[\\s]*</TD>[\\s]*<td[^>]+>([^<]+)</TD>[\\s]*</tr>)"; // 2:from
	// 正则表达式,审核要获取手机归属地的手机是否符合格式,可以只输入手机号码前7位
	public static final String REGEX_IS_MOBILE = "(?is)(^1[3|4|5|8][0-9]\\d{4,8}$)";

	/**
	 * 获得手机号码归属地
	 * 
	 * @param mobileNumber
	 * @return
	 * @throws Exception
	 */
	public static String getMobileFrom(String mobileNumber) throws Exception {
		if (!veriyMobile(mobileNumber)) {
			throw new Exception("不是完整的11位手机号或者正确的手机号前七位");
		}
		HttpClient client = null;
		GetMethod method = null;
//		NameValuePair mobileParameter = null;
//		NameValuePair actionParameter = null;
		int httpStatusCode;

		String htmlSource = null;
		String result = null;

		try {
			client = new HttpClient();
			client.getHostConfiguration().setHost("www.ip138.com", 80, "http");
			method = new GetMethod("/search.asp?mobile=" + mobileNumber
					+ "&action=mobile");
			// mobileParameter=new NameValuePair("mobile",mobileNumber);
			// actionParameter=new NameValuePair("action","mobile");
			// method.setRequestBody(new NameValuePair[] {
			// actionParameter,mobileParameter });
			// 设置编码
			method.getParams().setParameter(
					HttpMethodParams.HTTP_CONTENT_CHARSET, "GB2312");

			client.executeMethod(method);
			httpStatusCode = method.getStatusLine().getStatusCode();
			if (httpStatusCode != 200) {
				throw new Exception("网页内容获取异常！Http Status Code:"
						+ httpStatusCode);
			}

			htmlSource = method.getResponseBodyAsString();
			if (htmlSource != null && !htmlSource.equals("")) {
				result = parseMobileFrom(htmlSource);
			}
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			method.releaseConnection();
		}

		return result;

	}

	/**
	 * 从www.ip138.com返回的结果网页内容中获取手机号码归属地,结果为：省份 城市
	 * 
	 * @param htmlSource
	 * @return
	 */
	public static String parseMobileFrom(String htmlSource) {
		int begin = htmlSource.lastIndexOf("卡号归属地");
		htmlSource = htmlSource.substring(begin + 5, begin + 90);
		String result = "";
		for (int i = 0; i < htmlSource.length(); i++) {
			String s = htmlSource.charAt(i) + "";
			byte[] by = s.getBytes();
			// 这里就是判断单个string是否是中文
			if (by.length == 3) {
				result = result + s;
				continue;
			}
		}

		return result;

	}

	/**
	 * 验证手机号
	 * 
	 * @param mobileNumber
	 * @return
	 */
	public static boolean veriyMobile(String mobileNumber) {
		Pattern p = null;
		Matcher m = null;

		p = Pattern.compile(REGEX_IS_MOBILE);
		m = p.matcher(mobileNumber);

		return m.matches();
	}

	/**
	 * 测试
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		System.out.println(getMobileFrom("15951820625"));
	}

}
