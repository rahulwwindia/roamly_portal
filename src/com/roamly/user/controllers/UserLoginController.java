package com.roamly.user.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserLoginDetails;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserMakePaymentValidator;
 
/**
 * controller class use to perform all login controller operation  
 * @document UserLoginController.java
 * @author  Rahul Mahajan
 * @version 1.0
 * @date 1-Oct-2012 
 */
@Controller 
@SessionAttributes("principal")
public class UserLoginController {
	
	private UserService userService;
	private UserMakePaymentValidator userValidator;
	    
	@Autowired
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Autowired
	public void setUserValidator(UserMakePaymentValidator userValidator) {
		this.userValidator = userValidator;
	}  
	 
	/**
	 *method updatePassword change user password 
	 *@param Model
	 *@param HttpSession contain user information 
	 *@return String
	 */
	@RequestMapping(value = "/welcome.htm", method = RequestMethod.GET)
	public String printWelcome(ModelMap model, Principal principal) {
  
		String name = principal.getName(); 
		model.addAttribute("userName", name); 
		model.addAttribute("message", "Spring Security Custom Form example");
		return "main";

	} 
	/**
	 *call login page 
	 *@param Model 
	 *@return String
	 */
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public String login(ModelMap model) {
		
		return "login";
	}   
	
	
	@RequestMapping(value = "/customerLogin.htm", method = RequestMethod.GET)
	public String customerLogin(ModelMap model) {
		
		return "customerLogin";
	}  
	
	
	@RequestMapping(value = "/customerLoginFail.htm", method = RequestMethod.GET)
	public String customerLoginFail(ModelMap model) {
		
		return "customerLogin"; 
	}  
   
	/**
	 *method loginError call when login attempt not successful
	 *@param Model
	 *@return String  
	 */ 
	@RequestMapping(value = "/loginfailed.htm", method = RequestMethod.GET)
	public String loginError(ModelMap model) {

		model.addAttribute("error", "true");
		
		return "login";
 
	} 
	
	
	/**
	 *method logout user from current session
	 *@param Model
	 *@return String
	 */
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public String logout(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		  
 		SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);  
		return "redirect:http://roamly.com/customer/account/logout/";  
 
	}  
	

}
