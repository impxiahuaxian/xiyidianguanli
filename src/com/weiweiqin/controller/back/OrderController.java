package com.weiweiqin.controller.back;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weiweiqin.model.Order;
import com.weiweiqin.service.OrderService;
import com.weiweiqin.vo.common.OrderQueryVO;
import com.weiweiqin.vo.common.OrderVO;
import com.weiweiqin.vo.common.Page;
import com.weiweiqin.vo.common.Result;

@Controller
@RequestMapping("admin/order")
public class OrderController {

	private static final Logger logger = LoggerFactory
			.getLogger(OrderController.class);
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/edit.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String edit(OrderVO orderVO) {
		logger.info("Enter method edit...,orderVO="+orderVO);
		Result result = new Result();
		try {
			Order order = orderVO.getOrder();
			order.setAddDate(new Date());
			orderService.update(order);
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
			Order order = orderService.get(id);
			result.setObj(order);
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
			orderService.del(id);
		} catch (Exception e) {
			logger.error("数据库异常...", e);
			result.setResult(false);
			result.setErrorMsg("数据库异常。。。");
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
	
	@RequestMapping(value = "/memo.do", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String memo(int id, String memo, int state,HttpServletRequest req) {
		logger.info("Enter method memo....，id=" + id + "memo=" + memo);
		Result result = new Result();
		HttpSession session = req.getSession();
		String ip = req.getRemoteAddr();
		logger.info("oper ip=" + ip);
		if (session == null || session.getAttribute("user") == null) {
			result.setResult(false);
			result.setErrorMsg("您访问的地址不存在！");
			return result.toJson();
		}
		
		Order order = orderService.get(id);
		if (null != order) {
			order.setMemo(memo);
			order.setState(state);
			orderService.update(order);
		} else {
			result.setResult(false);
			logger.info("不存在该订单");
			result.setErrorMsg("不存在该订单");
			return result.toJson();
		}
		result.setResult(true);
		return result.toJson();
	}

}