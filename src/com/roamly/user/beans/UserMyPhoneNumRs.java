package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserMyPhoneNumRs implements WsModel {
	
	@SerializedName("#result-set-1") 
	private List<UserMyPhoneNum> userMyPhoneNums;
	@SerializedName("#update-count-1")
	private int updateCount;
	  
	public List<UserMyPhoneNum> getMyPhoneNums() {
		return userMyPhoneNums;  
	} 
	public int getUpdateCount() {
		return updateCount;
	} 

}
