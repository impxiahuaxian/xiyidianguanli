package com.weiweiqin.controller.back;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.weiweiqin.model.Clothes;
import com.weiweiqin.service.ClothesService;
import com.weiweiqin.vo.common.ClothesVO;
import com.weiweiqin.vo.common.Page;
import com.weiweiqin.vo.common.Result;

@Controller
@RequestMapping("admin/clothes")
public class ClothesController {

	private static final Logger logger = LoggerFactory
			.getLogger(ClothesController.class);
	@Autowired
	private ClothesService clothesService;
	
	@RequestMapping(value = "/add.do", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public String add(ClothesVO clothesVO) {
		logger.info("Enter method add...,clothesVO="+clothesVO);
		Result result = new Result();
		Clothes clothes = clothesVO.getClothes();
		try {
			clothes.setAddDate(new Date());
			clothesService.save(clothes);
		} catch (Exception e) {
			logger.error("保存衣服信息异常...",e);
			result.setResult(false);
			result.setErrorMsg("保存衣服信息异常...");
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
			List<Clothes> list = clothesService.getAll();
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
	
	@RequestMapping(value = "/edit.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String edit(ClothesVO clothesVO) {
		logger.info("Enter method edit...,clothesVO="+clothesVO);
		Result result = new Result();
		try {
			Clothes clothes = clothesVO.getClothes();
			clothes.setAddDate(new Date());
			clothesService.update(clothes);
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
			Clothes clothes = clothesService.get(id);
			result.setObj(clothes);
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
			clothesService.del(id);
		} catch (Exception e) {
			logger.error("数据库异常...", e);
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}
	/**
	 * 上架、下架
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/offShelf.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String offShelf(int id) {
		logger.info("Enter method offShelf...,id="+id);
		Result result = new Result();
		try {
			//clothesService.del(id);
			Clothes clothes = clothesService.get(id);
			if(clothes.getMark()==-1) {
				clothes.setMark(1);
			} else {
				clothes.setMark(-1);//
			}
			clothesService.update(clothes);
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Page page = new Page();
			page.setCurrPage(currPage);
			List<Clothes> clothesList = clothesService.pageList(page, null);
			List<ClothesVO> list = new ArrayList<ClothesVO>();
			if (null != clothesList && !clothesList.isEmpty()) {

				for (Clothes clothes : clothesList) {
					ClothesVO vo = new ClothesVO();
					vo.setClothes(clothes);
					vo.setAddDate(sdf.format(clothes.getAddDate()));
					list.add(vo);
				}
			}
			int totalCount = clothesService.totalCount(null);
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("list", list);
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