package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserChangePasswordRs;
import com.roamly.user.beans.UserUpdateProfileRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;

/**
 * Object having url and parameters to consume web service  
 * @document UserChangePasswordWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserChangePasswordWebService extends WebService<WsModel>{
	
	public UserChangePasswordWebService(Map<String, String> params)
	{ 
		super(params);  
	} 
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.autoRefill");    
	}          
   
	@Override
	protected Class<?> getMapperClass() {
		  
		return UserChangePasswordRs.class;  
	}


}
