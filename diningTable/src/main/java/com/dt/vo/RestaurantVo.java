package com.dt.vo;

import org.springframework.web.multipart.MultipartFile;

public class RestaurantVo {
	
	private int tNo;
	private String tEmail;
	private String tPwd;
	private String tType;
	private String tName;
	private String tPhone;
	private String tAddr;
	private String tTimeS;
	private String tTimeC;
	private String tTimeBs;
	private String tTimeBc;
	private String tHoliday;
	private String tImage;
	private String tMenu;
	
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public RestaurantVo(int tNo, String tEmail, String tPwd, String tType, String tName, String tPhone, String tAddr,
			String tTimeS, String tTimeC, String tTimeBs, String tTimeBc, String tHoliday, String tImage, String tMenu,
			MultipartFile uploadFile) {
		super();
		this.tNo = tNo;
		this.tEmail = tEmail;
		this.tPwd = tPwd;
		this.tType = tType;
		this.tName = tName;
		this.tPhone = tPhone;
		this.tAddr = tAddr;
		this.tTimeS = tTimeS;
		this.tTimeC = tTimeC;
		this.tTimeBs = tTimeBs;
		this.tTimeBc = tTimeBc;
		this.tHoliday = tHoliday;
		this.tImage = tImage;
		this.tMenu = tMenu;
		this.uploadFile = uploadFile;
	}

	public RestaurantVo(int tNo, String tEmail, String tPwd, String tType, String tName, String tPhone, String tAddr,
			String tTimeS, String tTimeC, String tTimeBs, String tTimeBc, String tHoliday, String tImage,
			String tMenu) {
		super();
		this.tNo = tNo;
		this.tEmail = tEmail;
		this.tPwd = tPwd;
		this.tType = tType;
		this.tName = tName;
		this.tPhone = tPhone;
		this.tAddr = tAddr;
		this.tTimeS = tTimeS;
		this.tTimeC = tTimeC;
		this.tTimeBs = tTimeBs;
		this.tTimeBc = tTimeBc;
		this.tHoliday = tHoliday;
		this.tImage = tImage;
		this.tMenu = tMenu;
	}

	public RestaurantVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public String gettEmail() {
		return tEmail;
	}

	public void settEmail(String tEmail) {
		this.tEmail = tEmail;
	}

	public String gettPwd() {
		return tPwd;
	}

	public void settPwd(String tPwd) {
		this.tPwd = tPwd;
	}

	public String gettType() {
		return tType;
	}

	public void settType(String tType) {
		this.tType = tType;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String gettPhone() {
		return tPhone;
	}

	public void settPhone(String tPhone) {
		this.tPhone = tPhone;
	}

	public String gettAddr() {
		return tAddr;
	}

	public void settAddr(String tAddr) {
		this.tAddr = tAddr;
	}

	public String gettTimeS() {
		return tTimeS;
	}

	public void settTimeS(String tTimeS) {
		this.tTimeS = tTimeS;
	}

	public String gettTimeC() {
		return tTimeC;
	}

	public void settTimeC(String tTimeC) {
		this.tTimeC = tTimeC;
	}

	public String gettTimeBs() {
		return tTimeBs;
	}

	public void settTimeBs(String tTimeBs) {
		this.tTimeBs = tTimeBs;
	}

	public String gettTimeBc() {
		return tTimeBc;
	}

	public void settTimeBc(String tTimeBc) {
		this.tTimeBc = tTimeBc;
	}

	public String gettHoliday() {
		return tHoliday;
	}

	public void settHoliday(String tHoliday) {
		this.tHoliday = tHoliday;
	}

	public String gettImage() {
		return tImage;
	}

	public void settImage(String tImage) {
		this.tImage = tImage;
	}

	public String gettMenu() {
		return tMenu;
	}

	public void settMenu(String tMenu) {
		this.tMenu = tMenu;
	}
	
}
