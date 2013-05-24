package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserProfileRs;
import com.roamly.ws.WebService;
/**
 * Object having url and parameters to consume web service  
 * @document UserProfileWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserProfileWebService extends WebService<UserProfileRs> {
 
	
	public UserProfileWebService(Map<String, String> params)
	{
		super(params); 
	} 
	@Override   
	protected String getURL() {   
		    return getWsUrl("ws.userProfile");    
	}        
      
	@Override
	protected Class<?> getMapperClass() {
		
		return UserProfileRs.class;
	}

}