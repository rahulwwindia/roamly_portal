package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserActiveSimCardRs;
import com.roamly.ws.WebService;

/**
 * Object having url and parameters to consume web service  
 * @document UserActiveSimDetailsWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserActiveSimDetailsWebService extends WebService<UserActiveSimCardRs> {
	
	public UserActiveSimDetailsWebService(Map<String, String> params)
	{
		super(params); 
	} 
 
	@Override    
	protected String getURL() {  
		 
		    return getWsUrl("ws.getUserActiveSimDetails");   
	}        
     
	@Override
	protected Class<?> getMapperClass() {
		
		return UserActiveSimCardRs.class; 
	}

}
