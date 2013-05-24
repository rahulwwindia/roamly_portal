package com.roamly.user.beans;

import com.google.gson.annotations.SerializedName;
import com.roamly.ws.WsModel;

public class UserAutoRefillRs implements WsModel
 {
   @SerializedName("#update-count-1")
	private String updateCount;

public String getUpdateCount() {
	return updateCount;
} 
}
