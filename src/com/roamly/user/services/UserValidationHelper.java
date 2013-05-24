package com.roamly.user.services;

public class UserValidationHelper {
	
	 public static boolean isNumeric(String str)  
	  {  
	    try  
	    {  
	      double d = Double.parseDouble(str);  
	    }  
	    catch(NumberFormatException nfe)  
	    {  
	      return false;  
	    }  
	    return true;  
	  }  

}
