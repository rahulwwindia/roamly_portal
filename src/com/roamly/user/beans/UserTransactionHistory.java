package com.roamly.user.beans;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

import org.springframework.format.annotation.DateTimeFormat;

import com.google.gson.annotations.SerializedName;

public class UserTransactionHistory {
	
	@SerializedName("Account_ID")
	private String accountId;
	@SerializedName("AccountDebit_ID")
	private String accountDebitId;  
	@SerializedName("PurchaseDate")
	private String purchaseDate;
	@SerializedName("Amount") 
	private String amount; 
	
	public String getAccountId() { 
		return accountId;
	}

	public String getAccountDebitId() {
		return accountDebitId;
	}

	public String getPurchaseDate() {
		
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(Long.parseLong(purchaseDate));
        String date = formatter.format(calendar.getTime());
        System.out.println(purchaseDate + " = " + date);
        
		return date;
	}

	public String getAmount() {
		return amount;
	}

	public double getTotal() {
		return total;
	}

	public String getGst() {
		return gst;
	}

	public String getPst() {
		return pst;
	}

	public String getHst() {
		return hst;
	}

	public String getEnd() {
		return end;
	}

	public String getShipping() {
		return shipping;
	}

	public String getTransFee() {
		return transFee;
	}

	public String getTax() {
		return tax;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public String getProductName() {
		return productName;
	}

	public String getTransaction_ID() {
		return transaction_ID;
	}

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
	
	@SerializedName("PaymentType")
	private String paymentType;

	@SerializedName("ProductName")
	private String productName;

	@SerializedName("Transaction_ID")
	private String transaction_ID;

	
}
