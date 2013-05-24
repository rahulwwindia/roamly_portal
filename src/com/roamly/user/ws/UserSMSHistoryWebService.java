package com.roamly.user.ws;

import java.util.Map;


import com.roamly.user.beans.UserSMSHistoryRs;
import com.roamly.ws.WebService;

/**
 * Object having url and parameters to consume web service  
 * @document UserSMSHistoryWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserSMSHistoryWebService extends WebService<UserSMSHistoryRs> {
	
	public UserSMSHistoryWebService(Map<String, String> params)
	{
		super(params);  
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.smsHistory");  
	}         
    
	@Override
	protected Class<?> getMapperClass() {
		
		return UserSMSHistoryRs.class; 
	}


} 
