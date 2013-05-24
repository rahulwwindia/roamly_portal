package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserCallHistoryRs;
import com.roamly.user.beans.UserTransactionHistoryRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;
/**
 * Object having url and parameters to consume web service  
 * @document UserTransactionHistoryWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserTransactionHistoryWebService extends WebService<WsModel> {
	
	public UserTransactionHistoryWebService(Map<String, String> params)
	{
		super(params); 
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.getTransactionHistory");
	}        
    
	@Override
	protected Class<?> getMapperClass() {
		
		return UserTransactionHistoryRs.class;
	}
}
