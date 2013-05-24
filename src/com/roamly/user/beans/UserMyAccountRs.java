package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserMyAccountRs implements WsModel {
	
	@SerializedName("#result-set-1")
	private List<UserMyAccount> userMyAccounts;
	@SerializedName("#update-count-1")
	private int updateCount; 
	   
	public List<UserMyAccount> getMyAccounts() {
		return userMyAccounts;
	}   
	public int getUpdateCount() {
		return updateCount;
	}
 
}
