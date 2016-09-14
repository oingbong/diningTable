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
	 * �α��� �� 
	 * ���� ȸ���� ������� �α��� ���� ���� ������ POST����� ó���� �ٸ�
	 * ��ڴ� �α��� �� �� ��:1 / session ���� mNo , ���� ����ȸ�� â���� �α��� �ؾ���
	 * ���� ȸ���� �α����� �� ��:2 / ��ڿ� ����
	 * ��������� �α����� �� ��:3 / session ���� tNo
	 * */
	
	// �α��� ��
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView loginForm(){
		ModelAndView view = new ModelAndView();
		view.addObject("viewPage","login.jsp");
		view.setViewName("template");
		return view;
	}
	
	// ȸ�� �α��� ó��
	@RequestMapping(value="/loginMember.do", method=RequestMethod.POST)
	public ModelAndView login(String mEmail, String mPwd, HttpSession session){
		ModelAndView view = new ModelAndView();
		MemberVo m = dao.login(mEmail, mPwd);
		if(m != null){
			int mNo = m.getmNo();
			//System.out.println("MainController �α��� �� �̸��Ͽ� ���� mNo �� : " + mNo);
			session.setAttribute("mNo", mNo);
			view.addObject("login",2); // �α��� ó���� ���� alert ���� ���� �ڵ�
			
			// redirect ������ ���� ������
			// 1�� : �ش� ������ ������ ����
			// 2�� : alert �̺�Ʈ�� ������� ���� 
			
			// 1�� ���
			view.addObject("viewPage", "main.jsp");
			view.setViewName("template");
			// 2�� ���
			//view.setViewName("redirect:/listRestaurant.do");
		}else{
			view.setViewName("redirect:/login.do");
		}
		return view;
	}
	
	// ������� �α��� ó��
	@RequestMapping(value="/loginCoMember.do", method=RequestMethod.POST)
	public ModelAndView loginRest(String tEmail, String tPwd, HttpSession session){
		ModelAndView view = new ModelAndView();
		RestaurantVo t = daoRest.login(tEmail, tPwd);
		if(t != null){
			int tNo = t.gettNo();
			//System.out.println("MainController �α��ν� �̸��Ͽ� ���� tNo �� : " + tNo);
			session.setAttribute("tNo", tNo);
			view.addObject("login",3);
			view.addObject("viewPage", "main.jsp");
			view.setViewName("template");
		}else{
			view.setViewName("redirect:/login.do");
		}
		return view;
	}
	
	
	// �α׾ƿ� ó��
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		// ���߿� mNo, tNo�� ���� session�� ���� �ϱ� (����� �α׾ƿ� ��ư Ŭ���� ���� �����ϰ� �Ǿ�����)
		request.getSession().removeAttribute("mNo");
		request.getSession().removeAttribute("tNo");
		
		view.addObject("logout",1); // �α׾ƿ� ó���� ���� alert ���� ���� �ڵ�
		view.addObject("viewPage", "main.jsp");
		view.setViewName("template");
		return view;
	}
}
