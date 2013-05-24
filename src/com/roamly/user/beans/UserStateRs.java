package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserStateRs implements WsModel{
	
	@SerializedName("#result-set-1") 
	private List<UserState> userStateList;
	
	@SerializedName("#update-count-1")
	private int updateCount;
	
	public List<UserState> getUserStateList() {
		return userStateList;
	}
	
	public int getUpdateCount() {
		return updateCount;
	}

}
