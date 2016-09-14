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
	
	/*
	 * 로그인 시 
	 * 개인 회원과 레스토랑 로그인 폼은 동일 하지만 POST방식의 처리는 다름
	 * 운영자는 로그인 할 때 값:1 / session 에는 mNo , 또한 개인회원 창에서 로그인 해야함
	 * 개인 회원은 로그인할 때 값:2 / 운영자와 동일
	 * 레스토랑은 로그인할 때 값:3 / session 에는 tNo
	 * */
	
	// 로그인 폼
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView loginForm(){
		ModelAndView view = new ModelAndView();
		view.addObject("viewPage","login.jsp");
		view.setViewName("template");
		return view;
	}
	
	// 회원 로그인 처리
	@RequestMapping(value="/loginMember.do", method=RequestMethod.POST)
	public ModelAndView login(String mEmail, String mPwd, HttpSession session){
		ModelAndView view = new ModelAndView();
		MemberVo m = dao.login(mEmail, mPwd);
		if(m != null){
			int mNo = m.getmNo();
			//System.out.println("MainController 로그인 시 이메일에 대한 mNo 값 : " + mNo);
			session.setAttribute("mNo", mNo);
			view.addObject("login",2); // 로그인 처리에 대한 alert 띄우기 위한 코드
			
			// redirect 유무에 따른 문제점
			// 1번 : 해당 내용이 나오지 않음
			// 2번 : alert 이벤트가 적용되지 않음 
			
			// 1번 방법
			view.addObject("viewPage", "main.jsp");
			view.setViewName("template");
			// 2번 방법
			//view.setViewName("redirect:/listRestaurant.do");
		}else{
			view.setViewName("redirect:/login.do");
		}
		return view;
	}
	
	// 레스토랑 로그인 처리
	@RequestMapping(value="/loginCoMember.do", method=RequestMethod.POST)
	public ModelAndView loginRest(String tEmail, String tPwd, HttpSession session){
		ModelAndView view = new ModelAndView();
		RestaurantVo t = daoRest.login(tEmail, tPwd);
		if(t != null){
			int tNo = t.gettNo();
			//System.out.println("MainController 로그인시 이메일에 대한 tNo 값 : " + tNo);
			session.setAttribute("tNo", tNo);
			view.addObject("login",3);
			view.addObject("viewPage", "main.jsp");
			view.setViewName("template");
		}else{
			view.setViewName("redirect:/login.do");
		}
		return view;
	}
	
	
	// 로그아웃 처리
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		// 나중에 mNo, tNo에 따른 session값 삭제 하기 (현재는 로그아웃 버튼 클릭시 같이 삭제하게 되어있음)
		request.getSession().removeAttribute("mNo");
		request.getSession().removeAttribute("tNo");
		
		view.addObject("logout",1); // 로그아웃 처리에 대한 alert 띄우기 위한 코드
		view.addObject("viewPage", "main.jsp");
		view.setViewName("template");
		return view;
	}
}
