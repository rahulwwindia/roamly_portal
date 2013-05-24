package com.roamly.user.beans;

import com.roamly.ws.WsModel;

public class UserAddPolarCard implements WsModel {
	
	private String serialNo;
	private String pin;
	
	
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	

}
