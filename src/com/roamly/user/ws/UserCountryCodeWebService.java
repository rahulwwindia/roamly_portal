package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserActivateCardRs;
import com.roamly.user.beans.UserCountryCodeRs;
import com.roamly.ws.WebService;

/**
 * Object having url and parameters to consume web service  
 * @document UserCountryCodeWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserCountryCodeWebService extends WebService<UserCountryCodeRs> {

	public UserCountryCodeWebService(Map<String, String> params)
	{ 
		super(params);  
	}       
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.getCountryCode");      
	}            
         
	@Override
	protected Class<?> getMapperClass() {
		  
		return UserCountryCodeRs.class;   
	}
	
	

}
