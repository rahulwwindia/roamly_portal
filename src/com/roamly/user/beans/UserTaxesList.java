package com.roamly.user.beans;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserTaxesList implements WsModel{

	@SerializedName("$PST")
	private String PST;
	@SerializedName("$GST")
	private String GST;
	@SerializedName("$HST")
	private String HST;
	
	@SerializedName("$PiggyBack")
	private String piggyBack;
	
	public String getPiggyBack() {
		return piggyBack;
	}
	public String getPST() {
		return PST;
	}
	public String getGST() {
		return GST;
	}
	public String getHST() {
		return HST;
	}
	
	
}
