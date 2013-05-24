package com.roamly.user.beans;

public class UserLoginDetails {
	private String customerId;
	private String accountId;
	private static UserLoginDetails userLoginDetails=null;
	
	private UserLoginDetails(String customerId,String accountId) {
		this.customerId=customerId;
		this.accountId=accountId;
	}
	
	public static UserLoginDetails getSingletonObject(String customerId,String accountId) {
		
		if(userLoginDetails==null)
		{
			userLoginDetails=new UserLoginDetails(customerId, accountId);
		} 
		return userLoginDetails;
	} 
	public String getCustomerId() {
		return customerId.trim();
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId.trim();
	}

	public String getAccountId() {
		return accountId.trim();
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId.trim();
	}

	public static UserLoginDetails getUserLoginDetails() {
		return userLoginDetails;
	}

	public static void setUserLoginDetails(UserLoginDetails userLoginDetails) {
		UserLoginDetails.userLoginDetails = userLoginDetails;
	}

}

