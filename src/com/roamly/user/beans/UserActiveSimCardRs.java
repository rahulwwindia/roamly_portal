package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserActiveSimCardRs implements WsModel{

	@SerializedName("#result-set-1")
	private List<UserActiveSimCard> userActiveSimCard;
	@SerializedName("#update-count-1")
	private int updateCount;
	
	public List<UserActiveSimCard> getUserActiveSimCard() {
		return userActiveSimCard;
	}
 
	public int getUpdateCount() {
		return updateCount;
	}
	
}
