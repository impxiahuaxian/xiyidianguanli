package com.weiweiqin.controller.home;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weiweiqin.model.Area;
import com.weiweiqin.model.City;
import com.weiweiqin.model.Province;
import com.weiweiqin.service.AreaService;
import com.weiweiqin.service.CityService;
import com.weiweiqin.service.ProvinceService;
import com.weiweiqin.vo.common.Result;

@Controller
@RequestMapping("/address")
public class AddressController {

	private static final Logger logger = LoggerFactory
			.getLogger(AddressController.class);

	@Autowired
	private ProvinceService provinceService;
	@Autowired
	private CityService cityService;
	@Autowired
	private AreaService areaService;
	
	@RequestMapping(value = "/getAll.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String getAll() {
		Result result = new Result();
		try {
			 List<Province> provinceList = provinceService.getAll();
			result.setObj(provinceList);
		} catch (Exception e) {
			logger.error("数据库异常...", e);
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}
	
	@RequestMapping(value = "/getByProvincecode.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String getByProvincecode(String provincecode) {
		Result result = new Result();
		try {
			List<City> cityList = cityService.getByProvincecode(provincecode);
			result.setObj(cityList);
		} catch (Exception e) {
			logger.error("数据库异常...", e);
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}
	
	@RequestMapping(value = "/getByCitycode.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String getByCitycode(String citycode) {
		Result result = new Result();
		try {
			List<Area> areaList = areaService.getByCitycode(citycode);
			result.setObj(areaList);
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
