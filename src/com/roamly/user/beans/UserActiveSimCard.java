package com.roamly.user.beans;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.google.gson.annotations.SerializedName;

public class UserActiveSimCard {
	
	NumberFormat formatter = new DecimalFormat("#0.00");
	@SerializedName("IsActive")
	private String activate;
	
	@SerializedName("AutoRefill")
	private String autoRefill;
	
	@SerializedName("PhoneTopUp")
	private String phoneTopUp;
	
	@SerializedName("Amount")
	private String amount; 
	 
	@SerializedName("LowBalance")
	private String lowBalance; 
	
	 
	
	@SerializedName("Nickname")
	private String nickName;
	  
	@SerializedName("ActivationDate")
	private String activationDate;
	
	
	@SerializedName("IsDefault")
	private String isDefault;

 
	@SerializedName("SerialNum")
	private String serialNum;
	@SerializedName("Balance")
	private String balance;
	
	@SerializedName("SIMAccount_ID")
	private String simAccount_ID;

	@SerializedName("SIMCustomer_ID")
	private String simCustomer_ID;
 
	public String getSimAccount_ID() {
		return simAccount_ID;
	}
	public String getSimCustomer_ID() {
		return simCustomer_ID;
	}
	
	public String getActivate() {
		return activate;
	}
	public String getNickName() {
		return nickName;
	} 
	public String getAutoRefill() {
		return autoRefill;
	}
	public String getPhoneTopUp() {
		return phoneTopUp;
	}
	public String getAmount() {
		return formatter.format(Double.parseDouble(amount)); 
	}
	public String getLowBalance() {
		return formatter.format(Double.parseDouble(lowBalance)); 
	}
	
	public String getActivationDate() {
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(Long.parseLong(activationDate));
        String date = formatter.format(calendar.getTime());
        System.out.println(activationDate + " = " + date);
        

		return date;  
	}
	public String getIsDefault() {
		return isDefault; 
	} 
	
	
	public String getSerialNum() {
		return serialNum;
	}
	public String getBalance() {
		return balance;
	}
	
}
