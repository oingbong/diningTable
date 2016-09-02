package com.dt.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dt.dao.RestaurantDao;
import com.dt.vo.RestaurantVo;

@Controller
public class CoMemberController {
	@Autowired
	private RestaurantDao dao;

	public void setDao(RestaurantDao dao) {
		this.dao = dao;
	}
	
	// ������� ���
	@RequestMapping("/listCoMember.do")
	public ModelAndView list(){
		ModelAndView view = new ModelAndView();
		view.addObject("list", dao.list());
		view.addObject("viewPage","listCoMember.jsp");
		view.setViewName("template");
		return view;
	}
	
	// ������� �� ����
	@RequestMapping("/detailCoMember.do")
	public ModelAndView detail(HttpSession session){
		ModelAndView view = new ModelAndView();
		int getSessionTno = (Integer)session.getAttribute("tNo"); // session ���� ��� tNo
		view.addObject("t", dao.detail(getSessionTno));
		view.addObject("viewPage", "detailCoMember.jsp");
		view.setViewName("template");
		return view;
	}
	
	// ������� ���� ����
	@RequestMapping("/deleteCoMember.do")
	public ModelAndView delete(int tNo){
		ModelAndView view = new ModelAndView();
		int re = dao.delete(tNo);
		if(re >=1){
			view.setViewName("redirect:/listCoMember.do");
		}else{
			view.addObject("msg", "������� ���� ���� ����");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// ������� �߰� ��
	@RequestMapping(value="/insertCoMember.do", method=RequestMethod.GET)
	public ModelAndView insertForm(){
		ModelAndView view = new ModelAndView();
		view.addObject("viewPage", "insertCoMember.jsp");
		view.setViewName("template");
		return view;
	}
	
	// ������� �߰� ó��
	@RequestMapping(value="/insertCoMember.do", method=RequestMethod.POST)
	public ModelAndView insert(RestaurantVo t, HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		
		// ���ε� �� ���Ϻ��� ó��
		String path = request.getRealPath("/resources/upload");
		
		// ����ڰ� ���ε� �� ������ �ִ��� �ľ�
		MultipartFile uploadFile = t.getUploadFile();
		if(uploadFile != null){
			String fileName = uploadFile.getOriginalFilename();
			t.settImage(fileName);
			try {
				// ����ڰ� ���ε� �� ������ ������ byte[]�� �����
				byte []data = uploadFile.getBytes();
				// ����ϱ� ���� ���� ��ü ����
				FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("fileUpload error : " + e);
			}
		}
		
		int re = dao.insert(t);
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
	@RequestMapping(value="/updateCoMember.do", method=RequestMethod.GET)
	public ModelAndView updateForm(HttpSession session){
		ModelAndView view = new ModelAndView();
		int getSessionTno = (Integer)session.getAttribute("tNo");
		RestaurantVo t = dao.detail(getSessionTno);
		view.addObject("t", t);
		view.addObject("viewPage", "updateCoMember.jsp");
		view.setViewName("template");
		return view;
	}
	
	// ������� ���� ó��
	@RequestMapping(value="/updateCoMember.do", method=RequestMethod.POST)
	public ModelAndView update(RestaurantVo t, HttpServletRequest request){
		
		String path = request.getRealPath("/resources/upload");		
		MultipartFile uploadfile = t.getUploadFile();
		
		String newFname = uploadfile.getOriginalFilename(); // ���ο� ����
		String oldFname = dao.detail(t.gettNo()).gettImage(); // ���� ����
		

		// ���� �� ÷�������� �����ϸ� ����
		if(newFname != null && !newFname.equals("")){
			t.settImage(newFname); // image Į���� ���ο� ���ϸ��� �����

			// ���ο� ���� ���ε�
			try {
				byte []data = uploadfile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + newFname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		ModelAndView view = new ModelAndView();

		int re = dao.update(t);
		if(re >=1){
			if(newFname != null && !newFname.equals("") && oldFname != null && !oldFname.equals("")){
				File file = new File(path + "/" + oldFname); // ���� ���� ������ ���� ��
				file.delete(); // ���� ���� ����
			}
			view.setViewName("redirect:/listCoMember.do");
		}else{
			if(newFname != null && !newFname.equals("")){
				File file = new File(path + "/" + newFname); // ���ο� ���� ���� ���� ��
				file.delete(); // ���ο� ���� ����
			}
			view.addObject("msg", "������� ���� ���� ����");
			view.addObject("viewPage", "error.jsp");
			view.setViewName("template");
		}
		return view;
	}
	
	// �̸��� �ߺ� üũ
	@RequestMapping("/checkEmailCo.do")
	public ModelAndView checkEmail(String tEmail){
		ModelAndView view = new ModelAndView();
		System.out.println("tEmail : " + tEmail);
		int re = dao.emailCheck(tEmail);
		System.out.println("re : " + re);
		view.addObject("re", re);
		return view;
	}
}