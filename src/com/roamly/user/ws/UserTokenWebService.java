package com.roamly.user.ws;

import java.util.Map;

import com.roamly.user.beans.UserSMSHistoryRs;
import com.roamly.user.beans.UserTokenInfoRs;
import com.roamly.ws.WebService;

/**
 * Object having url and parameters to consume web service  
 * @document UserTokenWebService.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */
public class UserTokenWebService extends WebService<UserTokenInfoRs> {
	

	public UserTokenWebService (Map<String,String> params){
			super(params);  
	}
	@Override    
	protected String getURL() {  
		    return getWsUrl("ws.userTokenInfo");  
	}         
	@Override
	protected Class<?> getMapperClass() {
		
		return UserTokenInfoRs.class; 
	}

	

}
