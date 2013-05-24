package com.roamly.user.beans;

import com.google.gson.annotations.SerializedName;

public class UserCountryCode {

	@SerializedName("PhoneCode")
	private String countryCode;
 
	public String getCountryCode() {
		return countryCode;
	}
} 
