package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserActivateCardRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;
/**
 * Object having url and parameters to consume web service  
 * @document UserActivateCardWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserActivateCardWebService extends WebService<WsModel> {

	public UserActivateCardWebService(Map<String, String> params)
	{ 
		super(params);  
	} 
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.activateCard");      
	}         
      
	@Override
	protected Class<?> getMapperClass() {
		  
		return UserActivateCardRs.class;   
	}

	
}
