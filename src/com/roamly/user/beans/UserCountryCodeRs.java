package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserCountryCodeRs implements WsModel {
	
	
	@SerializedName("#result-set-1")
	private List<UserCountryCode> userCountryCode;
	@SerializedName("#update-count-1")
	private int updateCount;
	 
	
	public List<UserCountryCode> getUserCountryCode() {
		return userCountryCode;
	}


	public int getUpdateCount() {
		return updateCount;
	}
	 

}
