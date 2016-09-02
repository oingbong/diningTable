package com.dt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dt.dao.MemberDao;
import com.dt.dao.ReservationDao;
import com.dt.dao.RestaurantDao;
import com.dt.vo.ReservationVo;

@Controller
public class ReservationController {
	@Autowired
	private ReservationDao daoR;

	public void setDaoR(ReservationDao daoR) {
		this.daoR = daoR;
	}
	
	@Autowired
	private MemberDao daoM;
	
	public void setDaoM(MemberDao daoM) {
		this.daoM = daoM;
	}
	
	@Autowired
	private RestaurantDao daoT;
	
	public void setDaoT(RestaurantDao daoT) {
		this.daoT = daoT;
	}

	// 예약 하기 폼
	@RequestMapping(value="/insertReservation.do", method=RequestMethod.GET)
	public ModelAndView insertForm(HttpSession session, int tNo){
		ModelAndView view = new ModelAndView();
		int getSessionMno = (Integer) session.getAttribute("mNo");
		view.addObject("m", daoM.detail(getSessionMno));
		view.addObject("t", daoT.detail(tNo));
		view.addObject("viewPage","insertReservation.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 예약 하기 처리
	@RequestMapping(value="/insertReservation.do", method=RequestMethod.POST)
	public ModelAndView insert(ReservationVo r){
		ModelAndView view = new ModelAndView();
		int re = daoR.insert(r);
		if(re >= 1){
			view.setViewName("redirect:/main.do");
		}else{
			view.addObject("msg", "예약 추가 실패");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
}
