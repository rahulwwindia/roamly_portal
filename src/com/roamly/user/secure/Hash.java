package com.roamly.user.secure;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash { 
  public static void main(String[] args) throws java.security.NoSuchAlgorithmException {

  
    String salt = "Hh";
    String password = "asdfasdf";
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    byte[] hash = md.digest((salt+password).getBytes());

    StringBuffer sb = new StringBuffer();
    for(byte b : hash) {
      sb.append(String.format("%02x", b));
    }

    System.out.println("Hash pass"+sb.toString());
  }
  
  public static String genHash(String toBeHashed,String salt) throws NoSuchAlgorithmException{
	    
	    String password = toBeHashed;
	    
	    MessageDigest md = MessageDigest.getInstance("SHA-256");
	    byte[] hash = md.digest((salt+password).getBytes());
	    StringBuffer sb = new StringBuffer();
	    for(byte b : hash) {
	      sb.append(String.format("%02x", b));
	    }
	    System.out.println("Hash :"+sb.toString());
	   
	    return sb.toString();
  }
}