package com.roamly.user.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserChangePassword;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserChangePasswordValidator;
import com.roamly.user.validator.UserMakePaymentValidator;

/**
*
* Controller for change password 
* @document  UserChangePasswordController.java
* @author Rahul Mahajan
* @version 1.0 
* @date 05/10/2012
*/
@Controller 
@SessionAttributes("principal")
public class UserChangePasswordController {
	
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
	 * Use to just call ChangePassword.jsp
	 *@param Model 
	 *@return String
	 */
	@RequestMapping(value = "/changePassword.htm", method = RequestMethod.GET)
	public String changePassword(ModelMap model) {
		model.addAttribute("updateFlag", false);
		return "ChangePassword";  
	} 
	 
	/**
	 * call business login to update Password  
	 *@param model
	 *@param session contain user information 
	 *@return String 
	 */
	@RequestMapping(value = "/changePasswordCall.htm", method = RequestMethod.POST)
	public String updatePassword(ModelMap model,HttpSession session, @ModelAttribute("changePassword") UserChangePassword changePassword, BindingResult result) { 
	 	 
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		UserChangePasswordValidator userValidator = new UserChangePasswordValidator();
		userValidator.validate(changePassword, result);
		if (result.hasErrors()) { 
			System.out.println("in has error"); 
			return "ChangePassword";   
		}  
		else
		{ 
		model.addAttribute("updateFlag", userService.changeUserPassword(changePassword,user.getCustomerId())); 
		return "ChangePassword";  
		} 
	} 
	

}
