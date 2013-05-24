package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserMakePaymentCCRs;
import com.roamly.user.beans.UserPaymentDetailsWithTokenRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;

/**
 * Object having url and parameters to consume web service  
 * @document UserMakePaymentCCTokenWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserMakePaymentCCTokenWebService extends WebService<WsModel>{
	public UserMakePaymentCCTokenWebService(Map<String, String> params)
	{ 
		super(params);  
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.makePaymentByCCForExistingUser");   
	}         
	@Override
	protected Class<?> getMapperClass() {
		
		return UserPaymentDetailsWithTokenRs.class; 
	}


}
