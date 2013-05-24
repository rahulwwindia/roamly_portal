package com.roamly.user.controllers;



import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.user.beans.UserActiveSimCard;
import com.roamly.user.beans.UserDateForm;
import com.roamly.user.beans.UserFullDetail;
import com.roamly.user.services.UserDateFormatFactory;
import com.roamly.user.services.UserService;
import com.roamly.user.validator.UserCallHistoryValidator;
import com.roamly.user.validator.UserMakePaymentValidator;

/**
*
* Controller for user call history and sms history 
* @document  UserCallHistoryController.java
* @author Rahul Mahajan
* @version 1.0
* @date 05/10/2012
*
*/

@Controller 
@SessionAttributes("principal")
public class UserCallHistoryController {
	
	
	private UserService userService;
	private UserCallHistoryValidator userCallHistoryValidator;
	    
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	} 

	 
	/**
	 * call business logic to get sms and call history  by consuming web services and 
	 * render the result to CallHistory.jsp
	 * @param model
	 * @param session session use to retrieve  user information
	 * @return view name
	 */
	@RequestMapping(value="callHistory.htm" , method = RequestMethod.GET)
	public String callHistory(Model model,HttpSession session)
	{    
	  
		UserFullDetail user= (UserFullDetail)session.getAttribute("userObj"); 
		UserDateForm userDateForm = new UserDateFormatFactory().getDateFormat();
		System.out.println("Customer Id: "+user.getCustomerId());
		List<UserActiveSimCard> activeCardList=userService.getUserActiveSimCardDetails(user.getCustomerId());
		 System.out.println("simCustomerID:***********"+activeCardList.get(0).getSimCustomer_ID());  
		session.setAttribute("activeCardList", activeCardList); 
		Iterator<UserActiveSimCard> itr = activeCardList.iterator();
		 String simAccountID=null; 
		 String simCustomerID=null; 
		 while(itr.hasNext()) {  
			 UserActiveSimCard element = itr.next();  
			 
			 if(element.getIsDefault().equals("1"))
			 {
				simAccountID = element.getSimAccount_ID();  
				simCustomerID=element.getSimCustomer_ID();
				System.out.println("simCustomerID:"+simCustomerID);   
				System.out.println("sim account Id"+simAccountID);
				model.addAttribute("userActiveCardDetails", activeCardList); 
				model.addAttribute("callHistory", userService.getCallHistory(simCustomerID,userDateForm));
				//System.out.println("----"+userService.getCallHistory(user.getCustomerId(),userDateForm));   
				model.addAttribute("smsHistory", userService.getSMSHistory(simCustomerID,userDateForm));
				return "CallHistory";
				   
			 }  
			 else
				 return "CallHistoryFailure";
	      }
		 return "CallHistoryFailure";
		   
	}   
	/**
	 * call business logic to get sms and call history in date range by consuming web services and 
	 * render the result to CallHistory.jsp
	 *@param model
	 *@param session session use to retrieve  user information 
	 *@param userDateForm  object contain from date,to date fields
	 *@return String
	 */  
		@RequestMapping(value="callHistoryGo.htm" , method = RequestMethod.POST)
		public String callHistory(Model model,HttpServletRequest req,HttpSession session ,@ModelAttribute("dateForm") UserDateForm userDateForm,BindingResult result)
		{    
			  
			List<UserActiveSimCard> userActiveSimCards = (List<UserActiveSimCard>)session.getAttribute("activeCardList");
	 System.out.println("userActiveSimCards"+userActiveSimCards);
			model.addAttribute("userActiveCardDetails",userActiveSimCards); 

			userCallHistoryValidator.validate(userDateForm, result);
			if (result.hasErrors()) { 
	
				return "CallHistory";    
			}    
			 
			UserFullDetail user= (UserFullDetail)session.getAttribute("userObj"); 
			userDateForm = new UserDateFormatFactory().getDateFormat(userDateForm);  
			
						    
			Iterator<UserActiveSimCard> itr = userActiveSimCards.iterator();
			 String simAccountID=null; 
			 String simCustomerID=null; 
			 
			 while(itr.hasNext()) {
				 UserActiveSimCard element = itr.next();
			
				 if(userDateForm.getActiveSim().split(":")[0].equals(element.getSerialNum()))
				 {
					 System.out.println("simCustomerID :"+userDateForm.getActiveSim().split(":")[0]); 
					simAccountID = element.getSimAccount_ID();  
					simCustomerID=element.getSimCustomer_ID();
					 System.out.println("simCustomerID :"+simCustomerID);   
					break;  
				 } 
		      }
			 
			  
		     
			     
			model.addAttribute("optionSel", userDateForm.getActiveSim()); 
			model.addAttribute("callHistory", userService.getCallHistory(simCustomerID,userDateForm));
			model.addAttribute("smsHistory", userService.getSMSHistory(simCustomerID,userDateForm)); 
			return "CallHistory";  
		} 
	public UserCallHistoryValidator getUserCallHistoryValidator() {
		return userCallHistoryValidator;
	}
	@Autowired
	public void setUserCallHistoryValidator(UserCallHistoryValidator userCallHistoryValidator) {
		this.userCallHistoryValidator = userCallHistoryValidator;
	}  
		
}
