package com.weiweiqin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter extends HttpServlet implements Filter {

	private static final long serialVersionUID = 1L;
	private FilterConfig filterConfig;

	public void destroy() {
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String currentURL = req.getRequestURI();
		String targetURL = currentURL.substring(currentURL.indexOf("/", 1));
		currentURL.length();
		HttpSession session = req.getSession();

		// 判断是不是请求登陆页面，如果是则放过
		if(targetURL.lastIndexOf(".jsp") != -1 || targetURL.lastIndexOf(".do") != -1){
			if (!isFreePage(targetURL)) {
				if (session == null || session.getAttribute("user") == null) {
					res.sendRedirect(req.getContextPath() + filterConfig.getInitParameter("errorURL"));
					return;
				}
			}
		}
		chain.doFilter(req, res);
	}
	
	private boolean isFreePage(String targetURL){
		String freeURLs = filterConfig.getInitParameter("freeURL");
		freeURLs = freeURLs.replaceAll("\n","");
		freeURLs = freeURLs.replaceAll("\t","");
		String[] split = freeURLs.split(";");
		if(split.length !=0){
			for (String freeURL : split) {
				if(freeURL.indexOf(targetURL) != -1){
					return true;
				}
			}
		}
		return false;
		
	}
}