package com.roamly.customercare.ws;

import java.util.Map;

import com.roamly.customercare.beans.CustomerDetails;
import com.roamly.ws.WebService;

/**
 * Object having url and parameters to consume web service  
 * @document CustomerDetailsWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class CustomerDetailsWebService extends WebService<CustomerDetails> {
	
	public CustomerDetailsWebService(Map<String, String> params)
	{ 
		super(params);  
	} 
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.getCustomerDetails");      
	}         
       
	@Override
	protected Class<?> getMapperClass() {
		  
		return CustomerDetails.class;   
	}

}
