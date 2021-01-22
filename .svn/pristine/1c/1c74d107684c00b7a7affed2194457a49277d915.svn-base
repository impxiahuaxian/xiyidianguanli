package com.weiweiqin.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CacheFilter extends HttpServlet implements Filter {

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
		if(isCatchURL(currentURL)){
			int minutes = 120; 
			Date d = new Date(); 
			String modDate = d.toGMTString(); 
			String expDate = null; 
			expDate = (new Date(d.getTime() + minutes * 60000)).toGMTString(); 
			res.setHeader("Last-Modified", modDate); 
			res.setHeader("Expires", expDate); 
			res.setHeader("Cache-Control", "public"); // HTTP/1.1 
			res.setHeader("Pragma", "Pragma"); // HTTP/1.0 
		}
		chain.doFilter(req, res);
	}

	
	private boolean isCatchURL(String targetURL){
		String catchURLs = filterConfig.getInitParameter("catchURL");
		catchURLs = catchURLs.replaceAll("\n","");
		catchURLs = catchURLs.replaceAll("\t","");
		String[] split = catchURLs.split(";");
		if(split.length !=0){
			for (String catche : split) {
				if(targetURL.indexOf(catche) != -1)
					return true;
				}
		}
		return false;
		
	}
	
	 
}