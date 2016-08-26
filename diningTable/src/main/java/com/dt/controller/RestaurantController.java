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
	
	// ������� ���
	@RequestMapping("/listRestaurant.do")
	public ModelAndView list(){
		ModelAndView view = new ModelAndView();
		view.addObject("list", dao.list());
		view.addObject("viewPage","listRestaurant.jsp");
		view.setViewName("template");
		//view.setViewName("listRestaurant");
		return view;
	}
	
	// ������� �� ����
	@RequestMapping("/detailRestaurant.do")
	public ModelAndView detail(HttpSession session){
		ModelAndView view = new ModelAndView();
		int getSessionTno = (Integer)session.getAttribute("tNo"); // session ���� ��� tNo
		view.addObject("t", dao.detail(getSessionTno));
		view.addObject("viewPage", "detailRestaurant.jsp");
		view.setViewName("template");
		return view;
	}
	
	// ������� ���� ����
	@RequestMapping("/deleteRestaurant.do")
	public ModelAndView delete(int tNo){
		ModelAndView view = new ModelAndView();
		int re = dao.delete(tNo);
		if(re >=1){
			view.setViewName("redirect:/listRestaurant.do");
		}else{
			view.addObject("msg", "������� ���� ���� ����");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// ������� �߰� ��
	@RequestMapping(value="/insertRestaurant.do", method=RequestMethod.GET)
	public ModelAndView insertForm(){
		ModelAndView view = new ModelAndView();
		view.addObject("viewPage", "insertRestaurant.jsp");
		view.setViewName("template");
		return view;
	}
	
	// ������� �߰� ó��
	@RequestMapping(value="/insertRestaurant.do", method=RequestMethod.POST)
	public ModelAndView insert(RestaurantVo m){
		ModelAndView view = new ModelAndView();
		int re = dao.insert(m);
		if(re>=1){
			view.setViewName("redirect:/main.do");
		}else{
			view.addObject("msg", "������� �߰� ����");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// ������� ���� ��
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
	
	// ������� ���� ó��
	@RequestMapping(value="/updateRestaurant.do", method=RequestMethod.POST)
	public ModelAndView update(RestaurantVo t){
		ModelAndView view = new ModelAndView();
		int re = dao.update(t);
		if(re >=1){
			view.setViewName("redirect:/listRestaurant.do");
		}else{
			view.addObject("msg", "������� ���� ���� ����");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// �̸��� �ߺ� üũ
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