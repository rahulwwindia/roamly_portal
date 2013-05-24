package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserMyAccountRs;
import com.roamly.user.beans.UserMyPhoneNumRs;
import com.roamly.ws.WebService;
import com.roamly.ws.WsModel;
/**
 * Object having url and parameters to consume web service  
 * @document UserMyPhoneNumWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserMyPhoneNumWebService extends WebService<WsModel>  {

	public UserMyPhoneNumWebService(Map<String, String> params)
	{
		super(params);      
	} 
	@Override
	protected String getURL() {

		return getWsUrl("ws.getPhoneDetails");
	} 
 
	@Override
	protected Class<?> getMapperClass() {
		 
		return UserMyPhoneNumRs.class;   
	}
}
