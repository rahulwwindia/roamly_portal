package com.roamly.user.controllers;

import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserActiveSimCard;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.beans.UserMakePaymentCC;
import com.roamly.user.beans.UserMakePaymentCCRs;
import com.roamly.user.beans.UserPaymentDetailsWithToken;
import com.roamly.user.beans.UserState;
import com.roamly.user.beans.UserTaxesList;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserMakePaymentValidator;
import com.roamly.user.validator.UserMakePaymentValidatorExistingUser;

/**
 * Controller for make payment
 * @document UserMakePaymentController.java
 * @author  Rahul Mahajan
 * @version 1.0
 * @date 1-Oct-2012 
 */
@Controller 
@SessionAttributes("principal")
public class UserMakePaymentController {
	
	
	private static Logger logger = Logger.getLogger(UserMakePaymentController.class);
	private UserService userService;
	private UserMakePaymentValidator userValidator;
	private UserMakePaymentValidatorExistingUser userValidatorForExistingUser;
	    
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Autowired
	public void setUserValidator(UserMakePaymentValidator userValidator) {
		this.userValidator = userValidator;
	}   
	
	@Autowired
	public void setUserValidatorForExistingUser(
			UserMakePaymentValidatorExistingUser userValidatorForExistingUser) {
		this.userValidatorForExistingUser = userValidatorForExistingUser;
	}

	
	/**
	 * method just call MakePayment.jsp
	 * @param model
	 * @return
	 */
	@RequestMapping(value="makePayment.htm")
	public String makePayment(Model model,HttpSession session,HttpServletRequest req,Principal principal)
	{   
		    
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		List<UserActiveSimCard> activeCardList=userService.getUserActiveSimCardDetails(user.getCustomerId());
		session.setAttribute("activeCardList", activeCardList);
		model.addAttribute("userActiveCardDetails", activeCardList);
		
		if((req.getParameter("d")!=null )&& (req.getParameter("d").equals("1"))){
			 return "MakePayment";
		}  
			
		String tokenWithPin=userService.getUserToken((String)session.getAttribute("username"));
		session.setAttribute("token", tokenWithPin.split(",")[0]); 
		session.setAttribute("pin", tokenWithPin.split(",")[1]);  
		logger.info("tokenWithPin==="+tokenWithPin);   
			//model.addAttribute("userBalance", userService.getUserBalance(user.getAccountId()));
		 model.addAttribute("userDetails", new UserMakePaymentCC());
		 	 if(tokenWithPin.split(",")[0].equalsIgnoreCase("0"))
			 return "MakePayment"; 
		 else   
			 return "MakePaymentForExistingUser";   
	}   
	
	/**
	 * method call business logic  for make payment  
	 * @param req
	 * @param userDetails
	 * @param result
	 * @return view that will be display 
	 */ 
	@RequestMapping(value="paymentGateway.htm" , method = RequestMethod.POST) 
	public String paymentGateway(HttpServletRequest req,Model model,HttpSession session, @ModelAttribute("userDetails") UserMakePaymentCC userDetails, BindingResult result){
		   
		logger.info("yyyyy"+userDetails.getMakeDefaultSet());
		userValidator.validate(userDetails, result); 
		if (result.hasErrors()) {   
			 
			model.addAttribute("userActiveCardDetails", session.getAttribute("activeCardList"));
			model.addAttribute("userDetails", userDetails); 
			return "MakePayment"; 
		}  
	List<UserActiveSimCard> userActiveSimCards = (List<UserActiveSimCard>)session.getAttribute("activeCardList");
		 Iterator<UserActiveSimCard> itr = userActiveSimCards.iterator();
		 String simAccountID=null;
		 String simCustomerID=null;
		 String serialNo=null;
		 while(itr.hasNext()) {
			 UserActiveSimCard element = itr.next();
			 if(userDetails.getActiveSim().split(":")[0].equals(element.getSerialNum()))
			 {
				simAccountID = element.getSimAccount_ID();
				simCustomerID=element.getSimCustomer_ID(); 
				serialNo=element.getSerialNum();
				break;
			 } 
	      } 
		 session.removeAttribute("activeCardList");
		logger.info("userDetails active card");
		logger.info("Account ID"+simAccountID);
		logger.info("Customer ID"+simCustomerID);
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
	UserMakePaymentCCRs userMakePaymentCCRs=userService.paymentProcess(userDetails,simCustomerID,(String)session.getAttribute("username"),simAccountID,user.getCustomerId(),serialNo); 
	//logger.info("userMakePay----"+userMakePaymentCCRs.getReceiptNumber());
	if(userMakePaymentCCRs.getSuccess().equals("y"))	  
		return "MakePaymentSuccess"; 
	else 
		return "MakePaymentFailuer"; 
	} 
	   
	 
	/**
	 * method call business logic  for make payment  
	 * @param req
	 * @param userDetails
	 * @param result
	 * @return
	 */ 
	@RequestMapping(value="makePaymentWithToken.htm" , method = RequestMethod.POST) 
	public String paymentGatewayWithToken(HttpServletRequest req,HttpSession session, @ModelAttribute("userDetailsWithToken") UserPaymentDetailsWithToken userDetails, BindingResult result){
		  
		
		List<UserActiveSimCard> userActiveSimCards = (List<UserActiveSimCard>)session.getAttribute("activeCardList");
		 Iterator<UserActiveSimCard> itr = userActiveSimCards.iterator();
		 String simAccountID=null;
		 String simCustomerID=null;
		 String serialNo=null;
		 while(itr.hasNext()) {
			 UserActiveSimCard element = itr.next();
			 if(userDetails.getActiveSimList().split(":")[0].equals(element.getSerialNum()))
			 {
				simAccountID = element.getSimAccount_ID();
				simCustomerID=element.getSimCustomer_ID(); 
				serialNo=element.getSerialNum();
				break; 
			 } 
	      }
		 session.removeAttribute("activeCardList");
		logger.info("userDetails active card");
		logger.info("Account ID"+simAccountID);
		logger.info("Customer ID"+simCustomerID);
		
		userDetails.setToken((String)session.getAttribute("token"));
 
		userValidatorForExistingUser.validate(userDetails, result);
		if (result.hasErrors()) { 
			logger.info("in has error");
			return "MakePaymentFailuer";    
		}   
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj");
		 
		userService.paymentProcessForExistingUser(userDetails,simCustomerID,(String)session.getAttribute("username"),simAccountID,serialNo);
		  
		return "MakePaymentSuccess"; 
	}
	
	
	@RequestMapping(value="getTaxes.htm")
	public @ResponseBody UserTaxesList getTaxList(@RequestParam("stateCode") String stateCode)
	{  
	System.out.println("in get Tax"+stateCode); 
			return userService.getTaxList(stateCode);
		
		   
	}
	
	@RequestMapping(value="getStates.htm")
	public @ResponseBody List<UserState> getStatesList(@RequestParam("val1") String countryCode)
	{  
		 
		return userService.getStates(countryCode);
		
		   
	}
	
	@RequestMapping(value="getTaxesByStateName.htm")
	public @ResponseBody UserTaxesList getTaxesListByName(@RequestParam("stateName") String stateName)
	{  
		 
		return userService.getTaxListByName(stateName);
		
		   
	}
	
	

}
