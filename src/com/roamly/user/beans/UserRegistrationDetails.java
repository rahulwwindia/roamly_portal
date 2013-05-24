package com.roamly.user.beans;

public class UserRegistrationDetails {
	private String userName;
	private String password;
	private String confirmPassword;	
	private String firstName;
	private String lastName;
	private String email;
	private String country; 
	private String serialNo;
	private String pinCode;
	private String imageCode;
	private String kaptchaCode;
	private String kaptchaMismatch;
	private String invalidEmail;
	 
	public String getInvalidEmail() {
		return invalidEmail;
	} 
	public void setInvalidEmail(String invalidEmail) {
		this.invalidEmail = invalidEmail;
	}
	public String getUserName() {
		return userName;
	} 
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	public String getKaptchaCode() {
		return kaptchaCode;
	}
	public void setKaptchaCode(String kaptchaCode) {
		this.kaptchaCode = kaptchaCode;
	}
	public String getKaptchaMismatch() {
		return kaptchaMismatch;
	}
	public void setKaptchaMismatch(String kaptchaMismatch) {
		this.kaptchaMismatch = kaptchaMismatch;
	}
	

}
