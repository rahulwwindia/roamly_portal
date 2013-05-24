package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserFullDetailsRs implements WsModel {
	
	@SerializedName("#result-set-1") 
	private List<UserFullDetail> userDetails; 
	@SerializedName("#update-count-1")
	private int updateCount;
	     
	public List<UserFullDetail> getUserDetails(){
		return userDetails;  
	} 
	public int getUpdateCount() { 
		return updateCount; 
	}  

} 
