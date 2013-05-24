package com.roamly.user.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.services.UserService;
/**
 * 
 * @document UserTextMessagingController.java
 * @author  Rahul Mahajan
 * @version 1.0
 * @date 1-Oct-2012
 */
@Controller 
public class UserTextMessagingController {
	
	private UserService userService;

@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
 
@RequestMapping(value="textMessaging.htm")
public String textMessaging(Model model,HttpSession session)	{  
	
	UserFullDetail user= (UserFullDetail)session.getAttribute("userObj"); 
	model.addAttribute("userName", user.getFullName());  
	model.addAttribute("userBalance", userService.getUserBalance(user.getAccountId()));
	return "TextMessaging";
} 

@RequestMapping(value="sendTextMessaging.htm")
public String sendTextMessaging(Model model,HttpSession session)	{  
	
	UserFullDetail user= (UserFullDetail)session.getAttribute("userObj"); 
	model.addAttribute("userName", user.getFullName());  
	model.addAttribute("userBalance", userService.getUserBalance(user.getAccountId()));
	 
	return "TextMessaging";
} 


 
}
