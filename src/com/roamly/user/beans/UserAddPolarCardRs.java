package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserAddPolarCardRs implements WsModel {
	
	@SerializedName("#result-set-1")
	private List<UserAddPolarCard> addPolarCard;
	@SerializedName("#update-count-1")
	private int updateCount;
	 
	public List<UserAddPolarCard> addPolarCard() {
		return addPolarCard;
	} 
	public int getUpdateCount() {
		return updateCount;
	}
 

}
