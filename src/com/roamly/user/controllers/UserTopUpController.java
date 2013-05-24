package com.roamly.user.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserTopUpDetails;
import com.roamly.user.services.UserService;
/**
 *
 * Controller for user account  
 * @document  UserTopUp.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 05/10/2012
 */
@Controller 
@SessionAttributes("principal")
public class UserTopUpController
{ 
	private UserService userService;
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	 
	/**
	 * call business logic to Top Up account by consuming web services and 
	 * render the result to TopUp.jsp
	 *@param model
	 *@param session contain user object
	 *@return String@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	 */
	@RequestMapping(value="topUp.htm")
	public String getTopUp(Model model,HttpSession session,@ModelAttribute("userDetails") UserTopUpDetails usertTopUpDetails )
	{
		userService.getTopUp(usertTopUpDetails); 
			return "topUp";
	} 
	
	
}
