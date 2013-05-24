package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserChangePasswordRs;
import com.roamly.user.beans.UserFullDetailsByUserName;
import com.roamly.user.beans.UserFullDetailsRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;
/**
 * Object having url and parameters to consume web service  
 * @document UserDetailsByUserNameWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserDetailsByUserNameWebService extends WebService<WsModel> {

	public UserDetailsByUserNameWebService(Map<String, String> params)
	{ 
		super(params);  
	} 
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.passHashByLogin");      
	}         
      
	@Override
	protected Class<?> getMapperClass() {
		  
		return UserFullDetailsByUserName.class;   
	}

	
}
