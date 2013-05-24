package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.user.controllers.UserActivateCard;
import com.roamly.ws.WsModel;

public class UserActivateCardRs implements WsModel {
	
	@SerializedName("status")
	private boolean activationStatus; 
	      
	public boolean getActivationStatus() {
		return activationStatus;
	}
}
