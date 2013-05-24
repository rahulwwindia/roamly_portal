package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserAutoRefillRs;
import com.roamly.user.beans.UserChangePasswordRs;
import com.roamly.ws.WebService;

/**
 * Object having url and parameters to consume web service  
 * @document UserAutoRefillWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserAutoRefillWebService extends WebService<UserAutoRefillRs> {
	
	public UserAutoRefillWebService(Map<String, String> params)
	{ 
		super(params);  
	} 
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.autoRefill");    
	}         
      
	@Override
	protected Class<?> getMapperClass() {
		  
		return UserAutoRefillRs.class;  
	}

	 
}
