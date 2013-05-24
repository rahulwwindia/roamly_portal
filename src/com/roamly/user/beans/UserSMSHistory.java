package com.roamly.user.beans;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.google.gson.annotations.SerializedName;

public class UserSMSHistory {
 
	@SerializedName("SMS_CDR_ID")
	private String smsCdrId;
	@SerializedName("Customer_ID")
	private String customerId;
	@SerializedName("SourcePhone")
	private String sourcePhone;
	@SerializedName("DestinationPhone")
	private String destinationPhone;
	@SerializedName("MessageUnits")
	private String messageUnits; 
	@SerializedName("DstCallTime")
	private String dstCallTime; 
	@SerializedName("Rate")
	private String rate;
	@SerializedName("ChargedAmount")
	private String chargedAmount;
	@SerializedName("Service_ID")
	private String serviceId; 
	@SerializedName("EN_Value")
	private String enValue;
	public String getSmsCdrId() {
		return smsCdrId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public String getSourcePhone() {
		return sourcePhone;
	}
	public String getDestinationPhone() {
		return destinationPhone;
	}
	public String getMessageUnits() {
		return messageUnits;
	}
	public String getDstCallTime() {
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(Long.parseLong(dstCallTime)); 
        String date = formatter.format(calendar.getTime());
		return date; 
	}
	public String getRate() {
		return rate;
	}
	public String getChargedAmount() {
		return chargedAmount;
	}
	public String getServiceId() { 
		return serviceId;
	}
	public String getEnValue() {
		return enValue;
	}   

	
}
