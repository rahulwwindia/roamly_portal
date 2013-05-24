package com.roamly.user.beans;

import com.google.gson.annotations.SerializedName;

public class UserState {
	@SerializedName("State_ID")
	private String id;
	@SerializedName("EN_Value")
	private String state;
	
	public String getId() {
		return id; 
	}
	public String getState() {
		return state;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "id"+id +"state"+state;
	}

}
