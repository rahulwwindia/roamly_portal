package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserCallHistoryRs implements WsModel {

	@SerializedName("#result-set-1")
	private List<UserCallHistory> callHistories;
	@SerializedName("#update-count-1")
	private int updateCount;
	 
	public List<UserCallHistory> getCallHistories() {
		return callHistories;
	}
	public int getUpdateCount() {
		return updateCount;
	}
	
 
}
