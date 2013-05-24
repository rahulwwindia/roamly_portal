package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserSMSHistoryRs implements WsModel {
	@SerializedName("#result-set-1") 
	private List<UserSMSHistory> smsHistory;
	@SerializedName("#update-count-1")
	private int updateCount;
	  
	public List<UserSMSHistory> getSMSHistory() {
		return smsHistory;  
	} 
	public int getUpdateCount() {
		return updateCount;
	} 

}
