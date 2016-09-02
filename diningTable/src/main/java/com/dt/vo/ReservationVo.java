package com.dt.vo;

import java.util.Date;

public class ReservationVo {
	private int rNo;
	private Date rDate;
	private String rTime;
	private int rNumber;
	private String rRequest;
	private int mNo;
	private int tNo;
	
	
	public ReservationVo(int rNo, Date rDate, String rTime, int rNumber, String rRequest, int mNo, int tNo) {
		super();
		this.rNo = rNo;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rNumber = rNumber;
		this.rRequest = rRequest;
		this.mNo = mNo;
		this.tNo = tNo;
	}

	public ReservationVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrTime() {
		return rTime;
	}

	public void setrTime(String rTime) {
		this.rTime = rTime;
	}

	public int getrNumber() {
		return rNumber;
	}

	public void setrNumber(int rNumber) {
		this.rNumber = rNumber;
	}

	public String getrRequest() {
		return rRequest;
	}

	public void setrRequest(String rRequest) {
		this.rRequest = rRequest;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}
}
