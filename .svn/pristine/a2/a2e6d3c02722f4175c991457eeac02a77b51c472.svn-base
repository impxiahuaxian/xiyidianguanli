package com.weiweiqin.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class KeywordUtil {

	public static void delRepeatKeywordTest(boolean shownum) {
		File kewordFile = new File("D://keyword//keyword.txt");
		String s = null;
		BufferedReader br = null;
		Map<String, String> mp = new TreeMap<String, String>();
		try {
			br = new BufferedReader(new FileReader(kewordFile));
			while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
				mp.put(s, s);
			}
			int m = 0;
			
			Set<String> keySet = mp.keySet();
			for (String string : keySet) {
				m++;
				if(shownum){
					System.out.println(m + "、" + string);
				}else{
					System.out.println(string);
				}
				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	 * 
	 * @param shownum 是否打印行数
	 * @param start 开始行数
	 * @param end 截止行数
	 */
	public static void delRepeatKeyword(boolean shownum,int start,int end) {
		File kewordFile = new File("D://keyword//keyword.txt");

		String s = null;
		BufferedReader br = null;
		Map<String, String> mp = new TreeMap<String, String>();
		int num = 0;
		
		Map<String, String> existMp = getExistMp(false);
		

		try {
			br = new BufferedReader(new FileReader(kewordFile));
			while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
				if(!existMp.containsKey(s)){
					mp.put(s, s);
				}
			}
			//System.out.println("去重后-----------------");
			Set<String> keySet = mp.keySet();
			for (String string : keySet) {
				num++;
				if(num >=start && num<=end){
					if(shownum){
						System.out.println(num+"、"+string);
					}else{
						System.out.println(string);
					}
				}
				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static Map<String, String> getExistMp(boolean shownum) {

		File isExistFile = new File("D://keyword//isexist.txt");

		String s = null;
		BufferedReader br = null;
		Map<String, String> mp = new TreeMap<String, String>();
		int num = 0;
		try {
			br = new BufferedReader(new FileReader(isExistFile));
			while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
				mp.put(s, s);
			}
			//System.out.println("去重后-----------------------------------------------------------------");
			Set<String> keySet = mp.keySet();
			for (String string : keySet) {
				num++;
				if(shownum){
					//System.out.println(num+"、"+string);
				}else{
					//System.out.println(string);
				}
				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return mp;
	}

	public static void main(String[] args) {
		//去重复关键字
		//delRepeatKeywordTest(false); 
		//delRepeatKeywordTest(false);
		//去除已经存在关键字
		//delRepeatKeyword(true,0,35068);
		delRepeatKeyword(false,0,14025);
	}

}
