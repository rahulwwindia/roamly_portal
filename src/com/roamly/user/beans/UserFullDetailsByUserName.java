package com.roamly.user.beans;

import java.util.List;
import java.util.Map;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserFullDetailsByUserName implements WsModel {
	
	@SerializedName("passHash") 
	private String userDetails; 
	     
	public String getUserDetails(){
		return userDetails;  
	} 

} 
