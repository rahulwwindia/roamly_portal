package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserStateRs;
import com.roamly.ws.WebService;
/**
 * Object having url and parameters to consume web service  
 * @document UserStateListWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserStateListWebService extends WebService<UserStateRs>{
	
	public UserStateListWebService(Map<String, String> params)
	{
		super(params);  
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.getStateList");  
	}         
    
	@Override
	protected Class<?> getMapperClass() {
		
		return UserStateRs.class; 
	}


}
