package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserBalanceRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;

/**
 * Object having url and parameters to consume web service  
 * @document UserBalanceWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserBalanceWebService extends WebService<WsModel>{
	

	public UserBalanceWebService(Map<String, String> params)
	{
		super(params); 
	} 

	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.userBalance");    
	}        
    
	@Override
	protected Class<?> getMapperClass() { 
		return UserBalanceRs.class;
	}

}
