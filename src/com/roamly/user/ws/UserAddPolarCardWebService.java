package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserAddPolarCardRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;

/**
 * Object having url and parameters to consume web service  
 * @document UserAddPolarCardWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserAddPolarCardWebService extends WebService<WsModel> {
	
	public UserAddPolarCardWebService(Map<String, String> params)
	{
		super(params); 
	} 

	@Override    
	protected String getURL() {  
		 
		    return getWsUrl("ws.addPolarCard");   
	}        
   
	@Override
	protected Class<?> getMapperClass() {
		
		return UserAddPolarCardRs.class; 
	}
 
}
