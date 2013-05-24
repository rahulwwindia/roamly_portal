package com.roamly.user.beans;

public class UserMakePaymentCC {

	private String PST;
	private String GST;
	private String HST;
	private String totalTAX;
	private String custName; 
	private String address1;
	private String address2;
	private String city;
	private String country;
	private String state;
	private String totalAmount;
	private String email;  
	private String phone; 
	private String creditCardNo;
	private String expiryDateMM;
	private String expiryDateYY;
	private String cvvCode;
	private String acceptTermsConditions;
	private String postalCode;
	private String paymentType;
	private String ammountInUSD;
	private String makeDefaultSet;
	private String activeSim;
	private String pin; 
	private String rePin;
	
	public String getPST() {
		return PST;
	}

	public void setPST(String pST) {
		PST = pST;
	}

	public String getGST() {
		return GST;
	}

	public void setGST(String gST) {
		GST = gST;
	}

	public String getHST() {
		return HST;
	}

	public void setHST(String hST) {
		HST = hST;
	}

	public String getTotalTAX() {
		return totalTAX;
	}

	public void setTotalTAX(String totalTAX) {
		this.totalTAX = totalTAX;
	}

	
	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getAddress1() {
		return address1;
	} 

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	
	 
	 
 
	public String getRePin() {
		return rePin;
	}

	public void setRePin(String rePin) {
		this.rePin = rePin;
	}

	private String cardType;
	

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	

	public String getAmmountInUSD() {
		return ammountInUSD;
	}

	public void setAmmountInUSD(String ammountInUSD) {
		this.ammountInUSD = ammountInUSD;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCreditCardNo() {
		return creditCardNo;
	}

	public void setCreditCardNo(String creditCardNo) {
		this.creditCardNo = creditCardNo;
	}

	public String getExpiryDateMM() {
		return expiryDateMM;
	}

	public void setExpiryDateMM(String expiryDateMM) {
		this.expiryDateMM = expiryDateMM;
	}

	public String getExpiryDateYY() {
		return expiryDateYY;
	}

	public void setExpiryDateYY(String expiryDateYY) {
		this.expiryDateYY = expiryDateYY;
	}

	public String getCvvCode() {
		return cvvCode;
	}

	public void setCvvCode(String cvvCode) {
		this.cvvCode = cvvCode;
	}

	public String getAcceptTermsConditions() {
		return acceptTermsConditions;
	}

	public void setAcceptTermsConditions(String acceptTermsConditions) {
		this.acceptTermsConditions = acceptTermsConditions;
	}



	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	

	
	public String getCustName() {
		return custName;
	}  

	public void setCustName(String custName) {
		this.custName = custName;
	}

	

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getActiveSim() {
		return activeSim;
	}

	public void setActiveSim(String activeSim) {
		this.activeSim = activeSim;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getMakeDefaultSet() {
		return makeDefaultSet;
	}

	public void setMakeDefaultSet(String makeDefaultSet) {
		this.makeDefaultSet = makeDefaultSet;
	}
	

}
