package com.roamly.user.beans;



import java.util.Date;

import com.google.gson.annotations.SerializedName;


public class UserPaymentHistory {
	 
	@SerializedName("Account_ID")
	private String accountId;
	@SerializedName("AccountDebit_ID")
	private String accountDebitId; 
	@SerializedName("PurchaseDate")
	private String purchaseDate;
	@SerializedName("Amount") 
	private String amount;
	@SerializedName("Total")
	private double total;
	@SerializedName("GST")
	private String gst;
	@SerializedName("PST")
	private String pst;
	@SerializedName("HST")
	private String hst; 
	@SerializedName("END")
	private String end;
	@SerializedName("Shipping")
	private String shipping;
	@SerializedName("TransFee")
	private String transFee;
	@SerializedName("TAX")
	private String tax; 
	@SerializedName("Transaction_ID") 
	private String transactionId;
	
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getAccountDebitId() {
		return accountDebitId;
	}
	public void setAccountDebitId(String accountDebitId) {
		this.accountDebitId = accountDebitId;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getGst() {
		return gst;
	}
	public void setGst(String gst) {
		this.gst = gst;
	}
	public String getPst() {
		return pst;
	}
	public void setPst(String pst) {
		this.pst = pst;
	}
	public String getHst() {
		return hst;
	}
	public void setHst(String hst) {
		this.hst = hst;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	public String getTransFee() {
		return transFee;
	}
	public void setTransFee(String transFee) {
		this.transFee = transFee;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	} 
	
	
	 
	
	 

	
	
 
}

