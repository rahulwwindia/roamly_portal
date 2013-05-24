package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserTaxesList;
import com.roamly.ws.WebService;
/**
 * Object having url and parameters to consume web service  
 * @document UserTaxesWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserTaxesWebService extends WebService<UserTaxesList>{
	
	public UserTaxesWebService(Map<String, String> params)
	{
		super(params);  
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.getTaxesByStateId");  
	}         
    
	@Override
	protected Class<?> getMapperClass() {
		
		return UserTaxesList.class; 
	}


}
