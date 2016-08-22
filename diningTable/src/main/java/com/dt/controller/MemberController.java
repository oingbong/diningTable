package com.dt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dt.dao.MemberDao;
import com.dt.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	// 회원 목록
	@RequestMapping("/listMember.do")
	public ModelAndView list(){
		ModelAndView view = new ModelAndView();
		view.addObject("list", dao.list());
		view.addObject("viewPage","listMember.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 회원 상세 정보
	@RequestMapping("/detailMember.do")
	public ModelAndView detail(HttpSession session){
		ModelAndView view = new ModelAndView();
		int getSessionMno = (Integer) session.getAttribute("mNo"); // session 에 담긴  mNo 값 가져오기
		//System.out.println("Controller 에서 getSessionMno 값 : " + getSessionMno);
		view.addObject("m", dao.detail(getSessionMno));
		view.addObject("viewPage", "detailMember.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 회원 정보 삭제
	@RequestMapping("/deleteMember.do")
	public ModelAndView delete(int mNo){
		ModelAndView view = new ModelAndView();
		int re = dao.delete(mNo);
		if(re >=1){
			view.setViewName("redirect:/listMember.do");
		}else{
			view.addObject("msg", "회원 정보 삭제 실패");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// 회원 추가 폼
	@RequestMapping(value="/insertMember.do", method=RequestMethod.GET)
	public ModelAndView insertForm(){
		ModelAndView view = new ModelAndView();
		view.addObject("viewPage", "insertMember.jsp");
		view.setViewName("template");
		//view.setViewName("insertMember");
		return view;
	}
	
	// 회원 추가 처리
	@RequestMapping(value="/insertMember.do", method=RequestMethod.POST)
	public ModelAndView insert(MemberVo m){
		ModelAndView view = new ModelAndView();
		int re = dao.insert(m);
		if(re>=1){
			view.setViewName("redirect:/main.do");
		}else{
			view.addObject("msg", "회원 추가 실패");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// 회원 수정 폼
	@RequestMapping(value="/updateMember.do", method=RequestMethod.GET)
	public ModelAndView updateForm(HttpSession session){
		ModelAndView view = new ModelAndView();
		int getSessionMno = (Integer) session.getAttribute("mNo"); // session 에 담긴 mNo 값 가져오기
		MemberVo m = dao.detail(getSessionMno);
		view.addObject("m", m);
		view.addObject("viewPage", "updateMember.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 회원 수정 처리
	@RequestMapping(value="/updateMember.do", method=RequestMethod.POST)
	public ModelAndView update(MemberVo m){
		ModelAndView view = new ModelAndView();
		int re = dao.update(m);
		if(re >=1){
			view.setViewName("redirect:/listMember.do");
		}else{
			view.addObject("msg", "회원 정보 수정 실패");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
}
