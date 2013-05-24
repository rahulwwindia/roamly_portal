package com.roamly.user.beans;

public class UserPaymentDetailsWithToken {
 
	private String email;
	private String nameOnCard; 
	private String cvvCode;
	private String activeSimList;
	private String PST;
	private String GST;
	private String HST;
	private String totalTAX;
	private String totalAmount;
	
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

	public String getActiveSimList() {
		return activeSimList;
	}

	public void setActiveSimList(String activeSimList) {
		this.activeSimList = activeSimList;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	private String phone;
	
	

	private String ammountInUSD;
	private String cardType;
	private String token;

	
	

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	} 

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNameOnCard() {
		return nameOnCard;
	}

	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}

	public String getCvvCode() {
		return cvvCode;
	}

	public void setCvvCode(String cvvCode) {
		this.cvvCode = cvvCode;
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

}
