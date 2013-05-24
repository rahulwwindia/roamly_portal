package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserProfileRs;
import com.roamly.user.beans.UserSMSHistoryRs;
import com.roamly.user.beans.UserUpdateProfileRs;
import com.roamly.ws.WebService;
/**
 * Object having url and parameters to consume web service  
 * @document UserUpdateProfileWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserUpdateProfileWebService extends WebService<UserUpdateProfileRs>  {
	
	public UserUpdateProfileWebService(Map<String, String> params)
	{ 
		super(params);  
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.updateProfile");   
	}         
     
	@Override
	protected Class<?> getMapperClass() {
		
		return UserUpdateProfileRs.class; 
	}


}
