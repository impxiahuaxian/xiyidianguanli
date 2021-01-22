package com.weiweiqin.controller.home;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weiweiqin.model.Clothes;
import com.weiweiqin.service.ClothesService;
import com.weiweiqin.vo.common.Result;

@Controller
@RequestMapping("/clothes")
public class FClothesController {

	private static final Logger logger = LoggerFactory
			.getLogger(FClothesController.class);
	@Autowired
	private ClothesService clothesService;
	
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

}