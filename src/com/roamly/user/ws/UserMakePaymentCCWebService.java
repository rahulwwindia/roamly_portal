package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserMakePaymentCCRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;

/**
 * Object having url and parameters to consume web service  
 * @document UserMakePaymentCCWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */

public class UserMakePaymentCCWebService extends WebService<WsModel> {
	
	public UserMakePaymentCCWebService(Map<String, String> params)
	{ 
		super(params);  
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.makePaymentByCC");   
	}         
	@Override
	protected Class<?> getMapperClass() {
		
		return UserMakePaymentCCRs.class; 
	}

}
