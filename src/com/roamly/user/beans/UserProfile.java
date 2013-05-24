package com.roamly.user.beans;

import com.google.gson.annotations.SerializedName;
 
public class UserProfile {
	
	@SerializedName("Customer_ID")
	private String customerId;
	@SerializedName("FN")
	private String firstName;
	@SerializedName("LN")
	private String lastName;
	@SerializedName("StreetNum")
	private String streetNum;
	@SerializedName("Address")
	private String address;
	@SerializedName("City")
	private String city;
	@SerializedName("State")
	private String state;
	@SerializedName("Zip")
	private String postalCode;
	@SerializedName("Country_ID")
	private String countryId;
	@SerializedName("Email") 
	private String email;
	@SerializedName("TimeZone_ID")  
	private String timeZoneId;
 
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setStreetNum(String streetNum) {
		this.streetNum = streetNum;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public void setState(String state) {
		this.state = state;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setTimeZoneId(String timeZoneId) {
		this.timeZoneId = timeZoneId;
	}
	
	public String getCustomerId() {
		return customerId;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getStreetNum() { 
		return streetNum;
	}
	public String getAddress() {
		return address;
	}
	public String getCity() {
		return city;
	}
	public String getState() {
		return state;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public String getCountryId() {
		return countryId;
	} 
	public String getEmail() { 
		return email; 
	}
	public String getTimeZoneId() {
		return timeZoneId;
	}
	
	@Override
	public boolean equals(Object obj) {
		 
		if(obj instanceof UserProfile)
		{
			UserProfile userProfile = (UserProfile)obj;
		
			if(this.firstName.equals(userProfile.getFirstName()) && this.lastName.equals(userProfile.getLastName())
					&& this.streetNum.equals(userProfile.getStreetNum())&& this.address.equals(userProfile.getAddress())
		 			&& this.state.equals(userProfile.getState()) && this.postalCode.equals(userProfile.getPostalCode())
					&& this.city.equals(userProfile.getCity()) && this.countryId.equals(userProfile.getCountryId()) 
					&& this.email.equals(userProfile.getEmail()) && this.timeZoneId.equals(userProfile.getTimeZoneId()))
			return true;
			else
				return false;
		}
		else 
			return false;
	
		
	}
	

}

