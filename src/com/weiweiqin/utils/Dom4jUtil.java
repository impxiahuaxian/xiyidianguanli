package com.weiweiqin.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Title: TestDom4j.java
 * @Package
 * @Description: 解析xml字符串
 * @author 无处不在
 * @date 2012-11-20 下午05:14:05
 * @version V1.0
 */
public class Dom4jUtil {
	
	private static final Logger logger = LoggerFactory
			.getLogger(Dom4jUtil.class);

	@SuppressWarnings("rawtypes")
	public void readStringXml(String xml) {
		Document doc = null;
		try {

			// 读取并解析XML文档
			// SAXReader就是一个管道，用一个流的方式，把xml文件读出来
			//
			// SAXReader reader = new SAXReader(); //User.hbm.xml表示你要解析的xml文档
			// Document document = reader.read(new File("User.hbm.xml"));
			// 下面的是通过解析xml字符串的
			doc = DocumentHelper.parseText(xml); // 将字符串转为XML

			Element rootElt = doc.getRootElement(); // 获取根节点
			System.out.println("根节点：" + rootElt.getName()); // 拿到根节点的名称

			
			Iterator iter = rootElt.elementIterator("head"); // 获取根节点下的子节点head

			// 遍历head节点
			while (iter.hasNext()) {

				Element recordEle = (Element) iter.next();
				String title = recordEle.elementTextTrim("title"); // 拿到head节点下的子节点title值
				System.out.println("title:" + title);

				Iterator iters = recordEle.elementIterator("script"); // 获取子节点head下的子节点script

				// 遍历Header节点下的Response节点
				while (iters.hasNext()) {

					Element itemEle = (Element) iters.next();

					String username = itemEle.elementTextTrim("username"); // 拿到head下的子节点script下的字节点username的值
					String password = itemEle.elementTextTrim("password");

					System.out.println("username:" + username);
					System.out.println("password:" + password);
				}
			}
			Iterator iterss = rootElt.elementIterator("body"); // /获取根节点下的子节点body
			// 遍历body节点
			while (iterss.hasNext()) {

				Element recordEless = (Element) iterss.next();
				String result = recordEless.elementTextTrim("result"); // 拿到body节点下的子节点result值
				System.out.println("result:" + result);

				Iterator itersElIterator = recordEless.elementIterator("form"); // 获取子节点body下的子节点form
				// 遍历Header节点下的Response节点
				while (itersElIterator.hasNext()) {

					Element itemEle = (Element) itersElIterator.next();

					String banlce = itemEle.elementTextTrim("banlce"); // 拿到body下的子节点form下的字节点banlce的值
					String subID = itemEle.elementTextTrim("subID");

					System.out.println("banlce:" + banlce);
					System.out.println("subID:" + subID);
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	/**
	 * @description 将xml字符串转换成map
	 * @param xml
	 * @return Map
	 */
	@SuppressWarnings("rawtypes")
	public static Map<String,String> confirmShipResult(String xml) {
		Map<String,String> map = new HashMap<String,String>();
		Document doc = null;
		boolean result = false;
		try {
			// 将字符串转为XML
			doc = DocumentHelper.parseText(xml);
			// 获取根节点
			Element rootElt = doc.getRootElement();
			// 拿到根节点的名称
			System.out.println("根节点：" + rootElt.getName());

			// 获取根节点下的子节点head
			Iterator iter = rootElt.elementIterator("is_success");
			
			// 遍历head节点
			while (iter.hasNext()) {
				Element recordEle = (Element) iter.next();
				String text = recordEle.getText();
				
				if("T".equals(text)){
					result = true;
				}else if("F".equals(text)){
					result = false;
				}
				map.put("result",text);
			}
			
			if(!result){
				Iterator errIte = rootElt.elementIterator("error");
				while (errIte.hasNext()) {
					Element errElm = (Element) errIte.next();
					String text = errElm.getText();
					map.put("errorCode",text);
				}
			}
			
		} catch (DocumentException e) {
			logger.error("解析xml失败..."+xml,e);
			map.put("result","F");
			map.put("errorCode","解析XML失败");
		} catch (Exception e) {
			logger.error("解析xml失败..."+xml,e);
			map.put("result","F");
			map.put("errorCode","解析XML失败");
		}
		return map;
	}

	public static void main(String[] args) {

		// 下面是需要解析的xml字符串例子
		String xmlString = "<?xml version='1.0' encoding='utf-8'?>"+
							"<alipay><is_success>F</is_success><error>TRADE_NOT_EXIST</error></alipay>";
		Map<String, String> confirmShipResult = confirmShipResult(xmlString);
		System.out.println(confirmShipResult);
		
	}

}