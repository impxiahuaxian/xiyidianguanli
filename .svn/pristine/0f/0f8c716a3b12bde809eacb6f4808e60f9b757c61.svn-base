package com.weiweiqin.controller.home;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SkipController {
	@RequestMapping(value = "/", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String index(HttpServletRequest request) {	
		return "index";
	}
	
	@RequestMapping(value = "/mobile", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String mobile(HttpServletRequest request) {	
		return "mobile";
	}
	
	@RequestMapping(value = "/order", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String order(HttpServletRequest request) {	
		return "addOrder";
	}
	
	@RequestMapping(value = "/s", method = { RequestMethod.POST,
			RequestMethod.GET })
		public String s() {	
			return "s";
		}
	
	@RequestMapping(value = "/li", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String li() {	
		return "li";
	}
	
	@RequestMapping(value = "/groupbuy", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String groupbuy() {	
		return "groupbuy";
	}
	
	@RequestMapping(value = "/detailGoods/{id}", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String detailGoods(@PathVariable int id,HttpServletRequest request) {
		request.setAttribute("id",id);
		return "detailGoods";
	}
	
	@RequestMapping(value = "/orderGoods", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String orderGoods() {	
		return "orderGoods";
	}
	
	@RequestMapping(value = "/addCart/{id}/{num}", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String addCart(@PathVariable int id,@PathVariable int num,HttpServletRequest request) {	
		request.setAttribute("id",id);
		request.setAttribute("num",num);
		return "addCart";
	}
	
	@RequestMapping(value = "/cart", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String cart() {	
		return "cart";
	}
	
	@RequestMapping(value = "/goPay/{outerid}", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String goPay(@PathVariable String outerid,HttpServletRequest request) {	
		request.setAttribute("outerid",outerid);
		return "goPay";
	}
	
	@RequestMapping(value = "/fashion", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String fashion() {	
		return "fashion";
	}
	
	@RequestMapping(value = "/register", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String register() {	
		return "register";
	}

	
	@RequestMapping(value = "/registerActive", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String registerActive(){
		return "registerActive";
	}
	
	@RequestMapping(value = "/login", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String login(){
		return "login";
	}
	
}
