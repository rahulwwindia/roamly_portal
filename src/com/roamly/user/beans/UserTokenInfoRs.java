package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserTokenInfoRs implements WsModel{
	
	@SerializedName("ccTokenForUser") 
	private String ccTokenForUser;

	public String getCcTokenForUser() {
		return ccTokenForUser;
	}

}
