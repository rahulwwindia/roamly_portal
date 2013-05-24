package com.roamly.user.beans;

import com.google.gson.annotations.SerializedName;

public class UserMyPhoneNum {

	@SerializedName("IsActive")
	private String activate;
	public String getNickName() {
		return nickName;
	}
	@SerializedName("NickName")
	private String nickName;

	@SerializedName("PhoneNum")
	private String phoneNum;
	@SerializedName("SerialNum")
	private String serialNum;
	public String getActivate() {
		return activate;
	}
	public String getPhoneNum() {
		return phoneNum;  
	}
	public String getSerialNum() {
		return serialNum;
	}
	 
	
	
	
}
