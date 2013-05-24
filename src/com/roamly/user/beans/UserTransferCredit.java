package com.roamly.user.beans;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserTransferCredit implements WsModel {

	@SerializedName("#update-count-1")
	private int updateCount;
	 
	public int getUpdateCount() {
		return updateCount;
	}
	public String get$Customer_ID() {
		return $Customer_ID;
	}
	public String get$IsBalanceOK() {
		return $IsBalanceOK;
	}
	public String get$Account_ID() {
		return $Account_ID;
	}
	private String $Customer_ID;
	private String $IsBalanceOK;
	private String $Account_ID;
}
