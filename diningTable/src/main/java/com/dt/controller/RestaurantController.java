package com.dt.controller;

import javax.servlet.http.HttpSession;

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
	@RequestMapping("/listRestaurant.do")
	public ModelAndView list(){
		ModelAndView view = new ModelAndView();
		view.addObject("list", dao.list());
		view.addObject("viewPage","listRestaurant.jsp");
		view.setViewName("template");
		//view.setViewName("listRestaurant");
		return view;
	}
	
	// 레스토랑 상세 정보
	@RequestMapping("/detailRestaurant.do")
	public ModelAndView detail(HttpSession session){
		ModelAndView view = new ModelAndView();
		int getSessionTno = (Integer)session.getAttribute("tNo"); // session 값에 담긴 tNo
		view.addObject("t", dao.detail(getSessionTno));
		view.addObject("viewPage", "detailRestaurant.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 레스토랑 정보 삭제
	@RequestMapping("/deleteRestaurant.do")
	public ModelAndView delete(int tNo){
		ModelAndView view = new ModelAndView();
		int re = dao.delete(tNo);
		if(re >=1){
			view.setViewName("redirect:/listRestaurant.do");
		}else{
			view.addObject("msg", "레스토랑 정보 삭제 실패");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// 레스토랑 추가 폼
	@RequestMapping(value="/insertRestaurant.do", method=RequestMethod.GET)
	public ModelAndView insertForm(){
		ModelAndView view = new ModelAndView();
		view.addObject("viewPage", "insertRestaurant.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 레스토랑 추가 처리
	@RequestMapping(value="/insertRestaurant.do", method=RequestMethod.POST)
	public ModelAndView insert(RestaurantVo m){
		ModelAndView view = new ModelAndView();
		int re = dao.insert(m);
		if(re>=1){
			view.setViewName("redirect:/main.do");
		}else{
			view.addObject("msg", "레스토랑 추가 실패");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// 레스토랑 수정 폼
	@RequestMapping(value="/updateRestaurant.do", method=RequestMethod.GET)
	public ModelAndView updateForm(HttpSession session){
		ModelAndView view = new ModelAndView();
		int getSessionTno = (Integer)session.getAttribute("tNo");
		RestaurantVo t = dao.detail(getSessionTno);
		view.addObject("t", t);
		view.addObject("viewPage", "updateRestaurant.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 레스토랑 수정 처리
	@RequestMapping(value="/updateRestaurant.do", method=RequestMethod.POST)
	public ModelAndView update(RestaurantVo t){
		ModelAndView view = new ModelAndView();
		int re = dao.update(t);
		if(re >=1){
			view.setViewName("redirect:/listRestaurant.do");
		}else{
			view.addObject("msg", "레스토랑 정보 수정 실패");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// 이메일 중복 체크
	@RequestMapping("/checkEmailRest.do")
	public ModelAndView checkEmail(String tEmail){
		ModelAndView view = new ModelAndView();
		System.out.println("tEmail : " + tEmail);
		int re = dao.emailCheck(tEmail);
		System.out.println("re : " + re);
		view.addObject("re", re);
		return view;
	}
}