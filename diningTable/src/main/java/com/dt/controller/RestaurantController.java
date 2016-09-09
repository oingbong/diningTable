package com.dt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dt.dao.RestaurantDao;
import com.dt.vo.RestaurantVo;

@Controller
public class RestaurantController {
	@Autowired
	private RestaurantDao dao;

	public void setDao(RestaurantDao dao) {
		this.dao = dao;
	}
	
	// 레스토랑 목록
	@RequestMapping(value="/listRestaurant.do", method=RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView view = new ModelAndView();
		view.addObject("list", dao.list());
		view.addObject("viewPage","listRestaurant.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 레스토랑 상세정보
	@RequestMapping("/detailRestaurant.do")
	public ModelAndView detail(int tNo){
		ModelAndView view = new ModelAndView();
		view.addObject("t", dao.detail(tNo));
		view.addObject("viewPage","detailRestaurant.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 레스토랑 검색 목록
	@RequestMapping(value="/listRestaurant.do", method=RequestMethod.POST)
	public ModelAndView listSearch(RestaurantVo t){
		ModelAndView view = new ModelAndView();
		view.addObject("list", dao.listSearch(t));
		view.addObject("viewPage","listRestaurant.jsp");
		view.setViewName("template");
		return view;
	}
}
