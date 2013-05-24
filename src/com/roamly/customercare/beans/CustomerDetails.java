package com.roamly.customercare.beans;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.roamly.user.beans.UserCallHistory;
import com.roamly.user.beans.UserSMSHistory;
import com.roamly.ws.WsModel;

public class CustomerDetails implements WsModel{
	
	
	@SerializedName("#result-set-2")
	private List<UserSMSHistory> smsHistory;
	
	public List<UserSMSHistory> getSmsHistory() {
		return smsHistory;
	}
 
	public List<UserCallHistory> getCallHistory() {
		return callHistory;
	}
	@SerializedName("#result-set-1")
	private List<UserCallHistory> callHistory;
	
	@SerializedName("$HS_MSISDN")
	private String hs_msisdn; 
	
	@SerializedName("$VP_MSISDN")
	private String vp_msisdn;
	
	@SerializedName("$Balance")
	private String balance;
	
	@SerializedName("$State")
	private String state;
	
	public String getHs_msisdn() {
		return hs_msisdn;
	}
	
	public String getVp_msisdn() {
		return vp_msisdn;
	}
	
	public String getBalance() {
		return balance;
	}
	
	public String getState() {
		return state;
	}
	
	public String getCity() {
		return city;
	}
	
	public String getVp_network() {
		return vp_network;
	}
	
	public String getAccountId() {
		return accountId;
	}
	
	public String getCountryName() {
		return countryName;
	}
	
	public String getCustomerId() {
		return customerId;
	}
	
	public String getAddress() {
		return address;
	}
	
	public String getDidEffectiveDate() {
		return didEffectiveDate;
	}
	public String getDidExpiryDate() {
		return didExpiryDate;
	}
	
	public String getDidPhoneNo() {
		return didPhoneNo;
	}
	
	public String getVpCountryName() {
		return vpCountryName;
	}
	 
	public String getHsNetwork() {
		return hsNetwork;
	}
	 
	public String getHsCountryName() {
		return hsCountryName;
	}
	
	public String getAutoTopUpAmount() {
		return autoTopUpAmount;
	}
	
	public String getZipCode() {
		return zipCode;
	}
	@SerializedName("$City")
	private String city;
	
	@SerializedName("$VP_Network")
	private String vp_network;
	
	@SerializedName("$Account_ID")
	private String accountId;
	
	@SerializedName("$CountryName")
	private String countryName;
	@SerializedName("$Customer_ID")
	private String customerId;
	@SerializedName("$Address")
	private String address;
	@SerializedName("$DID_EffectiveDate")
	private String didEffectiveDate;
	
	
	@SerializedName("$DID_ExpiryDate")
	private String didExpiryDate;
	@SerializedName("$DID_PhoneNum")
	private String didPhoneNo;
	@SerializedName("$VP_CountryName")
	private String vpCountryName;
	@SerializedName("$HS_Network")
	private String hsNetwork;

	
	
	@SerializedName("$HS_CountryName")
	private String hsCountryName;
	@SerializedName("$AutoTopUpAmount")
	private String autoTopUpAmount;
	@SerializedName("$ZipCode")
	private String zipCode;
	
	
	
	
}
