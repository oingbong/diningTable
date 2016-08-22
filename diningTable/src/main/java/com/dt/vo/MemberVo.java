package com.dt.vo;

public class MemberVo {
	
	private int mNo;
	private String mEmail;
	private String mPwd;
	private String mType;
	private String mName;
	private String mPhone;
	private String mGender;
	private String mBirth;
	
	public MemberVo(int mNo, String mEmail, String mPwd, String mType, String mName, String mPhone, String mGender,
			String mBirth) {
		super();
		this.mNo = mNo;
		this.mEmail = mEmail;
		this.mPwd = mPwd;
		this.mType = mType;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mGender = mGender;
		this.mBirth = mBirth;
	}

	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmBirth() {
		return mBirth;
	}

	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	
}
