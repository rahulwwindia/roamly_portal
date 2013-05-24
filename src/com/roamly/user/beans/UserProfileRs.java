package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserProfileRs implements WsModel{
	
	@SerializedName("#result-set-1") 
	private List<UserProfile> userProfile; 
	@SerializedName("#update-count-1")
	private int updateCount;
	    
	public List<UserProfile> getUserProfile() {
		return userProfile;  
	} 
	public int getUpdateCount() {
		return updateCount;
	} 

} 
