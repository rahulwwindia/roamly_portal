package com.roamly.user.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.beans.UserFullDetailsByUserName;
import com.roamly.user.beans.UserFullDetailsRs;
import com.roamly.user.beans.UserLoginDetails;
import com.roamly.user.secure.*;
import com.roamly.user.ws.UserDetailsByUserNameWebService;
import com.roamly.user.ws.UserDetailsWebService;
import com.roamly.user.ws.UserSessionDetailsWebService;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetailsByNameServiceWrapper;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.mysql.jdbc.StringUtils;


/**
 * 
 * Authenticate user on the basic of there role.
 * 
 * @document CustomAuthenticationProvider.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 05/10/2012
 */

public class CustomAuthenticationProvider implements AuthenticationProvider {

	static final List<GrantedAuthority> AUTHORITIES = new ArrayList<GrantedAuthority>();
	private static Logger logger = Logger.getLogger(CustomAuthenticationProvider.class);

	
	/**
	 * authenticate user by login name and password, for
	 * unauthorised user BadCredentialsException  will be thrown
	 * 
	 * @param authentication
	 * @throws org.springframework.security.core.AuthenticationException
	 * @return Authentication object 
	 */
	public Authentication authenticate(Authentication authentication)
			throws org.springframework.security.core.AuthenticationException {
		UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) authentication;
		String username = String.valueOf(auth.getPrincipal());
		String password = String.valueOf(auth.getCredentials());
		UserFullDetail user = null;
		logger.info("in customer authentication class");
		
		boolean requestFromMajento = false;

		if (!StringUtils.isEmptyOrWhitespaceOnly(username)
				&& StringUtils.isEmptyOrWhitespaceOnly(password)) {
			requestFromMajento = true;
		} else {
			if (StringUtils.isEmptyOrWhitespaceOnly(username))
				throw new BadCredentialsException("User name Required ");
			if (StringUtils.isEmptyOrWhitespaceOnly(password))
				throw new BadCredentialsException("Password is Required ");
		}

		 logger.info("username:" + username);
		 logger.info("password:" + password); // Don't log passwords in real
	
		Map<String, String> params = new HashMap<String, String>();
 
		if (requestFromMajento) {
			ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder
					.currentRequestAttributes();
			HttpServletRequest request = attr.getRequest();
			String action = request.getParameter("action") != null ? request
					.getParameter("action") : "";
					logger.info("action:" + action);
					
			HttpSession session = request.getSession();
			if (session != null) {
				session.setAttribute("action", action);
				
			}
			params.put("sessionID", username.trim());
			params.put("login", username.trim());
			
			UserSessionDetailsWebService userSessionDetailsWebService = new UserSessionDetailsWebService(
					params);
			try {
				UserFullDetailsRs userDetailsRs = (UserFullDetailsRs) userSessionDetailsWebService
						.getResponseObject();
				
			
				
				List<UserFullDetail> userDetails = userDetailsRs
						.getUserDetails();
				user = userDetails.get(0);

				
				CustomAuthenticationProvider.session().setAttribute("username", user.getLoginId());
				CustomAuthenticationProvider.session().setAttribute("userObj",
						user);
				CustomAuthenticationProvider.session().setAttribute(
						"userName", user.getFullName()); 
				 

			} catch (Exception e) {

				throw new BadCredentialsException("Session Id does not match for " + auth.getPrincipal());
			}
		} else {
			params.put("login", username.trim());
			UserDetailsByUserNameWebService detailsByUserNameWebService = new UserDetailsByUserNameWebService(
					params);
			try {
				UserFullDetailsByUserName userDetailsByUserName = (UserFullDetailsByUserName) detailsByUserNameWebService
						.getResponseObject();
				String dataFrmDB = userDetailsByUserName.getUserDetails();
				String pwdNSaltFrmDb[] = dataFrmDB.split(":");

				String hashedPwdFrmDb = pwdNSaltFrmDb[0];
				 logger.info("hashedPwdFrmDb---- :"+hashedPwdFrmDb); 
				 String salt = pwdNSaltFrmDb[1];  
				String hashedPwd = Hash.genHash(password.trim(), salt.trim());
				 logger.info("Salt -             :"+salt.trim()); 
				 logger.info("hashedPwd (gen)    :"+hashedPwd);
				if (hashedPwd.trim().equalsIgnoreCase(hashedPwdFrmDb.trim())) {
					params.put("username", username.trim());
					params.put("password", hashedPwd.trim() + ":" + salt);

				
					UserDetailsWebService userDetailsWebService = new UserDetailsWebService(
							params);

					UserFullDetailsRs userDetailsRs = (UserFullDetailsRs) userDetailsWebService
							.getResponseObject();
					List<UserFullDetail> userDetails = userDetailsRs
							.getUserDetails();
					user = userDetails.get(0);
				 
					AUTHORITIES.add(new GrantedAuthorityImpl(user.getRole()));  
					CustomAuthenticationProvider.session().setAttribute(
							"userObj", user);
					CustomAuthenticationProvider.session().setAttribute(
							"userName", user.getFullName());

					
					CustomAuthenticationProvider.session().setAttribute("username", username);
				} else { 
					throw new BadCredentialsException(
							"Username/Password does not match for "
									+ auth.getPrincipal());
				} 

			} catch (Exception e) {

				logger.info("Exception: "+e);   
				throw new BadCredentialsException(
						"Username/Password does not match for "
								+ auth.getPrincipal());
			}
		}



		return new UsernamePasswordAuthenticationToken(user.getUsername(),
				user.getPassword(), AUTHORITIES);

	}

	/**
	 * Method use to get httpsession object
	 * 
	 * @return session
	 */
	public static HttpSession session() {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder
				.currentRequestAttributes();
		return attr.getRequest().getSession(true);
	}

	public boolean supports(Class<? extends Object> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	} 

}
