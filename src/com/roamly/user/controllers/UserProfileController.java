package com.roamly.user.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserActiveSimCard;
import com.roamly.user.beans.UserAutoRefill;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.beans.UserMakePaymentCC;
import com.roamly.user.beans.UserProfile;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserMakePaymentValidator;
import com.roamly.user.validator.UserProfileValidator;
/**
 * controller to view and update user profile   
 * @document UserProfileController.java
 * @author  Rahul Mahajan
 * @version 1.0
 * @date 1-Oct-2012
 */
@Controller 
@SessionAttributes("principal") 
public class UserProfileController {
	
	private static Logger logger = Logger.getLogger(UserProfileController.class);
	private UserService userService;
	private UserProfileValidator userProfileValidator;  
	    
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Autowired
	public void setUserProfileValidator(UserProfileValidator userProfileValidator) {
		this.userProfileValidator = userProfileValidator;
	} 
	/**
	 *method use to view user profile 
	 *@param model
	 *@param session contain user information
	 *@return String
	 */
	
	@RequestMapping(value="myProfile.htm")
	public String myProfile(Model model,HttpSession session)
	{   
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		logger.info("my profile*****"+user.getCustomerId());  
		model.addAttribute("userProfile", userService.getUserProfile(user.getCustomerId()));  
		return "MyProfile";  
	}
	/**
	 * call the business logic to update user profile
	 * @param model
	 * @param session contain user information
	 * @param userProfile 
	 * @param result
	 * @return String
	 */
	@RequestMapping(value="myProfileUpdate.htm")
	public String myProfileUpdate(Model model,HttpSession session,@ModelAttribute("myProfile") UserProfile userProfile ,BindingResult result)
	{     
		      
		userProfileValidator.validate(userProfile, result);
		if (result.hasErrors()) {  
			logger.info("in has error");
			UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
			logger.info("my profile*****"+user.getCustomerId());  
			model.addAttribute("userProfile", userService.getUserProfile(user.getCustomerId()));  
  
			return "MyProfile";  
		}    
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		model.addAttribute("updateFlag", userService.updateUserProfile(userProfile,user.getCustomerId()));
		return "MyProfile";    
	}    
	 
	@RequestMapping(value="myNumbers.htm")
	public String getMyNumbers(Model model,HttpSession session)
	{   
		  
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		  
		model.addAttribute("phoneDetails", userService.getUserPhoneDetails(user.getCustomerId()));
		return "myNumbers"; 
	} 
	
	@RequestMapping(value="autoRefill.htm")
	public String autoRefil(Model model,HttpSession session)
	{  

		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		  	List<UserActiveSimCard> activeCardList=userService.getUserActiveSimCardDetails(user.getCustomerId());
			model.addAttribute("userActiveCardDetails", activeCardList);
		return "AutoRefill"; 
	} 
	
	
	@RequestMapping(value="autoRefillGo.htm")
	public String autoRefilGo(Model model,HttpServletRequest req,HttpSession session,@ModelAttribute("autoForm") UserAutoRefill userDetails)
	{    
  
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		  
		  	 
		  	model.addAttribute("autoStatus", userService.autoRefill(userDetails));
			List<UserActiveSimCard> activeCardList=userService.getUserActiveSimCardDetails(user.getCustomerId()); 
		  	model.addAttribute("userActiveCardDetails", activeCardList);
		return "AutoRefill";  
	}  
	
	
}
