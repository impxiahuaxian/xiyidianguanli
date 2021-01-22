package com.weiweiqin.utils;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Sendsms {
	
	private static final Logger logger = LoggerFactory.getLogger(Sendsms.class);
	
	private static String Url = "http://121.199.16.178/webservice/sms.php?method=Submit";
	
	/*
	 * genCode验证码，mobile手机号码
	 */
	public static Map<String,String> sendMsg(int genCode,String mobile){
		logger.info("genCode="+genCode+":mobile="+mobile);
		Map<String,String> result = new HashMap<String,String>();
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
		
	    String content = "您的验证码是："+genCode+"。请不要把验证码泄露给其他人。";
		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "cf_518shoes"), 
			    new NameValuePair("password", "kmDBZJ"), 			    
			    new NameValuePair("mobile",mobile), 
			    new NameValuePair("content", content),
		};
		
		method.setRequestBody(data);		
		
		
		try {
			client.executeMethod(method);	
			
			String SubmitResult =method.getResponseBodyAsString();
					
			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			result.put("code",code);
			result.put("msg", msg);
			result.put("smsid",smsid);
			
			//返回2标示成功
			if("2".equals(code)){
				logger.info("短信提交成功");
			}else{
				logger.info("短信提交失败");
				logger.info("code="+code+":msg="+msg+":smsid="+smsid);
			}
			
		} catch (HttpException e) {
			logger.info("http异常...",e);
			result.put("msg","发送短信异常!");
		} catch (IOException e) {
			logger.info("IO异常...",e);
			result.put("msg","发送短信异常1!");
		} catch (DocumentException e) {
			logger.info("document解析异常...",e);
			result.put("msg","发送短信异常2!");
		}	
		return result;
	}

	public static void main(String[] args) {
		for(int i =0;i<1000;i++){
			Random r = new Random();
			int genCode = r.nextInt(899999)+100000;
			System.out.println(genCode);
		}
		
		//sendMsg(genCode,"13666067037");
	}

}