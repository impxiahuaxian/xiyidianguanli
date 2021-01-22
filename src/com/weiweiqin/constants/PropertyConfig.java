package com.weiweiqin.constants;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
/**
 * 配置文件读取类
 * @author weiweiqin
 *
 */
public class PropertyConfig {
	 
	/**
	 * 短信服务地址
	 */
	private String smsurl;
	
	private static PropertyConfig instance = null;
	private static Properties props;

	public static PropertyConfig getInstance() {
		if (null == instance) {
			synchronized (PropertyConfig.class) {
				if (null == instance) {
					instance = new PropertyConfig();
				}
			}
		}
		return instance;
	}

	private static String getProperty(String key) {
		props = new Properties();
		try {
			File file = new File("config.properties");
			if (file.exists()) {
				props.load(new FileInputStream(file));
			} else {
				props.load(PropertyConfig.class.getClassLoader().getResourceAsStream("config.properties"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props.getProperty(key);
	}

	public static Properties getProps() {
		return props;
	}

	public static void setProps(Properties props) {
		PropertyConfig.props = props;
	}
	
	public String getSmsurl(){
		smsurl = PropertyConfig.getProperty("smsurl");
		return smsurl;
	}
}
