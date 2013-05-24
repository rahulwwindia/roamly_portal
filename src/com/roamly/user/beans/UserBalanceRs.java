package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserBalanceRs implements WsModel {
	
 
	@SerializedName("#result-set-1")
	private List<UserBalance> userBalance;
	@SerializedName("#update-count-1")
	private int updateCount;
	   
	public List<UserBalance> getUserBalance() {
		return userBalance; 
	}  
	public int getUpdateCount() {
		return updateCount;
	} 
	 

}
