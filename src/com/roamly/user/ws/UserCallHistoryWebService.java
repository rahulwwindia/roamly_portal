package com.roamly.user.ws;


import java.util.Map;

import com.roamly.user.beans.UserCallHistoryRs;
import com.roamly.ws.WebService;

/**
 * Object having url and parameters to consume web service  
 * @document UserCallHistoryWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserCallHistoryWebService extends WebService<UserCallHistoryRs> {
 
	
	public UserCallHistoryWebService(Map<String, String> params)
	{
		super(params); 
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.callHistory");  
	}        
    
	@Override
	protected Class<?> getMapperClass() {
		
		return UserCallHistoryRs.class;
	}

}
