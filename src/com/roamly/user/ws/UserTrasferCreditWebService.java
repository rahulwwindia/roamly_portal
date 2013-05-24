package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserTransferCredit;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;

/**
 * Object having url and parameters to consume web service  
 * @document UserTrasferCreditWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserTrasferCreditWebService extends WebService<WsModel>  {

	public UserTrasferCreditWebService(Map<String, String> params)
	{ 
		super(params);  
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.transferCredit");   
	}         
       
	@Override
	protected Class<?> getMapperClass() {
		
		return UserTransferCredit.class; 
	}


}
