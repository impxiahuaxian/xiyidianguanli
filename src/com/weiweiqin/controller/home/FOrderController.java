package com.weiweiqin.controller.home;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weiweiqin.model.Customer;
import com.weiweiqin.model.Order;
import com.weiweiqin.service.OrderService;
import com.weiweiqin.vo.common.OrderQueryVO;
import com.weiweiqin.vo.common.OrderVO;
import com.weiweiqin.vo.common.Page;
import com.weiweiqin.vo.common.Result;

@Controller
@RequestMapping("/order")
public class FOrderController {

	private static final Logger logger = LoggerFactory
			.getLogger(FOrderController.class);
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/add.do", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public String add(Order order,String nums,String clothesIds,String totalPrice,HttpSession session) {
		logger.info("Enter method add...,order="+order);
		Result result = new Result();
		try {
			// 设置顾客信息
			if (null != session.getAttribute("customer")) {
				Customer customer = (Customer) session.getAttribute("customer");
				order.setCustomerId(customer.getId());
			}
			order.setAddDate(new Date());
			order.setOuterid("E"+System.currentTimeMillis());
			//未处理状态
			order.setState(0);
			orderService.save(order, clothesIds,nums);
			result.setObj(order);
		} catch (Exception e) {
			logger.error("保存衣服信息异常...",e);
			result.setResult(false);
			result.setErrorMsg("保存衣服信息异常...");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}
	
	 

	@RequestMapping(value = "/list.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String pageList(OrderQueryVO orderVO,String showMobileFrom,HttpServletRequest req) {
		logger.info("Enter pageList ...,orderVO=" + orderVO);
		
		Result result = new Result();
		
		HttpSession session = req.getSession();
		if (session == null || session.getAttribute("user") == null) {
			result.setResult(false);
			result.setErrorMsg("您访问的地址不存在！");
			return result.toJson();
		}
		
		Page page = new Page();
		page.setCurrPage(orderVO.getCurrPage());
		Map<String, Object> conditions = new HashMap<String, Object>();
		conditions.put("state", orderVO.getState());
 

		if (!StringUtils.isEmpty(orderVO.getName())) {
			conditions.put("name", orderVO.getName().trim());
		}


		if (!StringUtils.isEmpty(orderVO.getMobile())) {
			conditions.put("mobile", orderVO.getMobile().trim());
		}

		if (!StringUtils.isEmpty(orderVO.getAddress())) {
			conditions.put("address", orderVO.getAddress().trim());
		}

		if (!StringUtils.isEmpty(orderVO.getStartDate())
				&& !StringUtils.isEmpty(orderVO.getEndDate())) {
			conditions.put("startDate", orderVO.getStartDate());
			conditions.put("endDate", orderVO.getEndDate());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		List<Order> orderList = orderService.pageList(page, conditions);
		List<OrderVO> orderVOList = new ArrayList<OrderVO>();

		if (null != orderList) {
			for (Order order : orderList) {
				OrderVO vo = new OrderVO();
				vo.setOrder(order);
				Date addDate = order.getAddDate();
				String format = sdf.format(addDate);
				vo.setAddDate(format);
				orderVOList.add(vo);
			}
		}
		int totalCount = orderService.totalCount(conditions);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("totalCount", totalCount);
		mp.put("list", orderVOList);
		result.setObj(mp);
		result.setResult(true);
		return result.toJson();
	}
	
	@RequestMapping(value = "/pageListForCustomer.do", method = {
			RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String pageListForCustomer(OrderQueryVO orderVO, HttpSession session) {
		  
		logger.info("Enter pageListForCustomer ...,orderVO=" + orderVO);
		
		Result result = new Result();
				
		Page page = new Page();
		page.setCurrPage(orderVO.getCurrPage());
		Map<String, Object> conditions = new HashMap<String, Object>();
		conditions.put("state", orderVO.getState());
 

		if (!StringUtils.isEmpty(orderVO.getName())) {
			conditions.put("name", orderVO.getName().trim());
		}
		// 如果用户登录了
		if (null != session.getAttribute("customer")) {
			Customer customer = (Customer) session.getAttribute("customer");
			conditions.put("customerId", customer.getId());
			// 用户未登录
		} else {
			conditions.put("customerId", "-1");
		}

		if (!StringUtils.isEmpty(orderVO.getMobile())) {
			conditions.put("mobile", orderVO.getMobile().trim());
		}

		if (!StringUtils.isEmpty(orderVO.getAddress())) {
			conditions.put("address", orderVO.getAddress().trim());
		}

		if (!StringUtils.isEmpty(orderVO.getStartDate())
				&& !StringUtils.isEmpty(orderVO.getEndDate())) {
			conditions.put("startDate", orderVO.getStartDate());
			conditions.put("endDate", orderVO.getEndDate());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		List<Order> orderList = orderService.pageList(page, conditions);
		List<OrderVO> orderVOList = new ArrayList<OrderVO>();

		if (null != orderList) {
			for (Order order : orderList) {
				OrderVO vo = new OrderVO();
				vo.setOrder(order);
				Date addDate = order.getAddDate();
				String format = sdf.format(addDate);
				vo.setAddDate(format);
				orderVOList.add(vo);
			}
		}
		int totalCount = orderService.totalCount(conditions);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("totalCount", totalCount);
		mp.put("list", orderVOList);
		result.setObj(mp);
		result.setResult(true);
		return result.toJson();
	}
	
	@RequestMapping(value = "/orderSuccess/{outerid}", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String orderSuccess(@PathVariable String outerid, String trade_no,
			String trade_status, HttpServletRequest request) {
		request.setAttribute("outerid", outerid);
		return "orderSuccess";
	}

}