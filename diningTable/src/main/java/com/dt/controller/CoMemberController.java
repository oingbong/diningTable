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
	public ModelAndView insert(RestaurantVo t, HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		
		// 업로드 할 파일복사 처리
		String path = request.getRealPath("/resources/upload");
		
		// 사용자가 업로드 한 파일이 있는지 파악
		MultipartFile uploadFile = t.getUploadFile();
		if(uploadFile != null){
			String fileName = uploadFile.getOriginalFilename();
			t.settImage(fileName);
			try {
				// 사용자가 업로드 한 파일의 내용을 byte[]에 담아줌
				byte []data = uploadFile.getBytes();
				// 출력하기 위한 파일 객체 생성
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
	public ModelAndView update(RestaurantVo t, HttpServletRequest request){
		
		String path = request.getRealPath("/resources/upload");		
		MultipartFile uploadfile = t.getUploadFile();
		
		String newFname = uploadfile.getOriginalFilename(); // 새로운 파일
		String oldFname = dao.detail(t.gettNo()).gettImage(); // 기존 파일
		

		// 수정 할 첨부파일이 존재하면 실행
		if(newFname != null && !newFname.equals("")){
			t.settImage(newFname); // image 칼럼에 새로운 파일명을 담아줌

			// 새로운 파일 업로드
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
				File file = new File(path + "/" + oldFname); // 기존 파일 삭제를 위한 것
				file.delete(); // 기존 파일 삭제
			}
			view.setViewName("redirect:/listRestaurant.do");
		}else{
			if(newFname != null && !newFname.equals("")){
				File file = new File(path + "/" + newFname); // 새로운 파일 삭제 위한 것
				file.delete(); // 새로운 파일 삭제
			}
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