package com.roamly.customercare.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.roamly.customercare.beans.CustomerDetailsForm;
import com.roamly.user.services.UserService;

/**
 * 
 Controller for customer care portal
 * 
 * @document CustomerDetailsController.java
 * @author Rahul Mahajan
 * @version 1.0
 * @date 18/11/2012
 */

@Controller
@SessionAttributes("principal")
@RequestMapping("customerCare") 
@PreAuthorize("hasRole('ROLE_CC')")
public class CustomerDetailsController {

	private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "ccForm.htm", method = RequestMethod.GET)
	public String customerDetailsView(Model model) {

		return "CustomerDetails";
	}

	@RequestMapping(value = "getDetails.htm")
	public String customerDetails(
			Model model,
			HttpSession session,
			@ModelAttribute("customerForm") CustomerDetailsForm customerDetailsForm,
			BindingResult result) {

		model.addAttribute("customerDetails",
				userService.getCustomerDetails(customerDetailsForm));
		model.addAttribute("customerForm", customerDetailsForm);
		return "CustomerDetails";
	}

}
