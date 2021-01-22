package com.weiweiqin.controller.back;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weiweiqin.model.VipType;
import com.weiweiqin.service.VipTypeService;
import com.weiweiqin.vo.common.Page;
import com.weiweiqin.vo.common.Result;

@Controller
@RequestMapping("admin/vipType") 
public class VipTypeController {

	private static final Logger logger = LoggerFactory
			.getLogger(VipTypeController.class);
	@Autowired
	private VipTypeService vipTypeService;
	
	@RequestMapping(value = "/add.do", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public String add(VipType vipType) {
		logger.info("Enter method add...,vipType="+vipType);
		Result result = new Result();
		try {
			vipTypeService.save(vipType);
		} catch (Exception e) {
			logger.error("保存衣服信息异常...",e);
			result.setResult(false);
			result.setErrorMsg("保存衣服信息异常...");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}
	
	@RequestMapping(value = "/edit.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String edit(VipType vipType) {
		logger.info("Enter method edit...,vipType="+vipType);
		Result result = new Result();
		try {
			vipTypeService.update(vipType);
		} catch (Exception e) {
			logger.error("数据库异常...", e);
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}

	@RequestMapping(value = "/get.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String get(int id) {
		Result result = new Result();
		try {
			VipType vipType = vipTypeService.get(id);
			result.setObj(vipType);
		} catch (Exception e) {
			logger.error("数据库异常...", e);
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}
	
	@RequestMapping(value = "/getAll.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String getAll() {
		Result result = new Result();
		try {
			List<VipType> list = vipTypeService.getAll();
			result.setObj(list);
		} catch (Exception e) {
			logger.error("数据库异常...", e);
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}
	
	@RequestMapping(value = "/del.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String del(int id) {
		logger.info("Enter method del...,id="+id);
		Result result = new Result();
		try {
			vipTypeService.del(id);
		} catch (Exception e) {
			logger.error("数据库异常...", e);
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}

	@RequestMapping(value = "/pageList.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String pageList(int currPage, HttpServletResponse response)
			throws UnsupportedEncodingException {

		Result result = new Result();
		try {
			Page page = new Page();
			page.setCurrPage(currPage);
			List<VipType> vipTypeList = vipTypeService.pageList(page, null);
			int totalCount = vipTypeService.totalCount(null);
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("list", vipTypeList);
			mp.put("totalCount", totalCount);
			result.setObj(mp);
		} catch (Exception e) {
			logger.error("数据库异常...", e);	
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}

}