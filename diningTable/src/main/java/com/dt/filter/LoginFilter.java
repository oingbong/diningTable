package com.dt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		Object mNo = (Object) (((HttpServletRequest)request).getSession()).getAttribute("mNo");
		Object tNo = (Object) (((HttpServletRequest)request).getSession()).getAttribute("tNo");
		if(mNo==null && tNo==null){ // 개인회원 혹은 레스토랑회원이 아닐경우
			(((HttpServletRequest)request).getSession()).setAttribute("msg", "로그인 하고 사용하시기 바랍니다.");
			((HttpServletResponse)response).sendRedirect("/diningTable/login.do");
		}else{
			chain.doFilter(request, response);
		}
		
	}

	@Override
	public void init(FilterConfig request) throws ServletException {
		// TODO Auto-generated method stub

	}

}
