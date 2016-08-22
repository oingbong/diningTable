package com.dt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dt.dao.MemberDao;
import com.dt.dao.RestaurantDao;
import com.dt.vo.MemberVo;
import com.dt.vo.RestaurantVo;

@Controller
public class MainController {
	
	@Autowired
	private MemberDao dao;
	
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private RestaurantDao daoRest;
	
	public void setDaoRest(RestaurantDao daoRest) {
		this.daoRest = daoRest;
	}

	@RequestMapping("/main.do")
	public ModelAndView main(){
		ModelAndView view = new ModelAndView();
		view.addObject("viewPage","main.jsp");
		view.setViewName("template");
		return view;
	}
}
