package com.roamly.user.beans;

import com.google.gson.annotations.SerializedName;

public class UserBalance {
	
	@SerializedName("Balance")
	private String balance;

	public String getBalance() {
		return balance;
	}

}
