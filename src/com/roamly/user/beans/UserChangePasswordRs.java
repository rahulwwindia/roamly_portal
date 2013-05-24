package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserChangePasswordRs implements WsModel {
 

	@SerializedName("#result-set-1") 
	private List<UserChangePassword> userChangePassword; 
	@SerializedName("#update-count-1")
	private int updateCount;
	     
	public List<UserChangePassword> changePassword() {
		return userChangePassword;  
	} 
	public int getUpdateCount() { 
		return updateCount;
	}  
 

}
