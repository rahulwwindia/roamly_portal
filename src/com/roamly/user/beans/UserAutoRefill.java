package com.roamly.user.beans;


 
public class UserAutoRefill {
	
	private String serialNo;
	private String autoRefill;
	private String amount;
	private String balance;
	private String topUp; 
	private String phoneTopUpList;
	private String autoRefillList;
	
	
	public String getPhoneTopUpList() {
		return phoneTopUpList; 
	} 
	public void setPhoneTopUpList(String phoneTopUpList) {
		this.phoneTopUpList = phoneTopUpList;
	}
	public String getAutoRefillList() {
		return autoRefillList;
	}
	public void setAutoRefillList(String autoRefillList) {
		this.autoRefillList = autoRefillList;
	}
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	public String getAutoRefill() {
		return autoRefill;
	}
	public void setAutoRefill(String autoRefill) {
		this.autoRefill = autoRefill;
	}
	public String getAmount() {
		return amount;
	} 
	public void setAmount(String amount) {
		this.amount = amount;
	} 
	public String getBalance() {
		 

		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;   
	}
	public String getTopUp() {
		return topUp;
	}
	public void setTopUp(String topUp) {
		this.topUp = topUp;
	}
	


}


