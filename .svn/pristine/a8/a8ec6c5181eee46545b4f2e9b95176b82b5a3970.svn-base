package com.weiweiqin.vo.common;

import java.io.Serializable;

import com.google.gson.Gson;

/**
 * 结果VO
 * @author weiweiqin
 *
 */
public class Result implements Serializable{

	private static final long serialVersionUID = 2076324875575488461L;
	
	private boolean result;
	
	private Object obj;
	
	private String errorMsg;
	
	private int errorCode;
	
	
	public String toJson(){
		Gson gson = new Gson();
		return gson.toJson(this);
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}
	
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("result=");
		sb.append(result);
		sb.append("obj=");
		sb.append(obj);
		sb.append("errorMsg");
		sb.append(errorMsg);
		sb.append("errorCode");
		sb.append(errorCode);
		return sb.toString();
	}
}