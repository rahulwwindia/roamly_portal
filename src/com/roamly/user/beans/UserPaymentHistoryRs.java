package com.roamly.user.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserPaymentHistoryRs implements WsModel {
	@SerializedName("#result-set-1") 
	private List<UserPaymentHistory> userPaymentHistory;
	@SerializedName("$TotalTAX")
	private String totalTAX; 
	@SerializedName("$TotalGST") 
	private String totalGST;
	@SerializedName("$TotalPST")  
	private String totalPST;
	@SerializedName("$TotalAmount") 
	private String totalAmount;

	public List<UserPaymentHistory> getUserPaymentHistory() {
		return userPaymentHistory;
	}

	public void setUserPaymentHistory(
			List<UserPaymentHistory> userPaymentHistory) {
		this.userPaymentHistory = userPaymentHistory;
	}

	public String getTotalTAX() {
		return totalTAX;
	}

	public void setTotalTAX(String totalTAX) {
		this.totalTAX = totalTAX;
	}

	public String getTotalGST() {
		return totalGST;
	}

	public void setTotalGST(String totalGST) {
		this.totalGST = totalGST;
	}

	public String getTotalPST() {
		return totalPST;
	}

	public void setTotalPST(String totalPST) {
		this.totalPST = totalPST;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

}
