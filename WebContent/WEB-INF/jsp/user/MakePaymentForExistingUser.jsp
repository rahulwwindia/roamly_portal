
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.roamly.user.beans.UserFullDetail"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>    
<% 
UserFullDetail userFullDetail= (UserFullDetail)session.getAttribute("userObj");

%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title" /></title>
<link href="<%=request.getContextPath()%>/resources/styles/style.css"
	rel="stylesheet" type="text/css" />
<link  
	href="<%=request.getContextPath()%>/resources/styles/style_user.css"
	rel="stylesheet" type="text/css" />
<link  
	href="<%=request.getContextPath()%>/resources/styles/main.css"
	rel="stylesheet" type="text/css" />
 
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>
	 
<script> 
$(document).ready(function() { 
 
//	$("#contentTx5").hide();   
	$("#loading").hide();
	
	});        

function paymentDetails()
{
	$("#contentTx5").show();	
}
   
  function activateCard()
  {
	  window.location.href="./mySIM.htm"; 
  }
 
 function makePayment()
  {
	    
	 if($("#ammountInUSD").val().trim()=='-1'){
		 alert("Please select amount");
			$("#ammountInUSD").focus();
			return false;
		}  
	 
	 if($("#nameOnCard").val().trim()==''){
		 alert("Please insert name on Card");
			$("#nameOnCard").focus();
			return false;
		}	
	 
	 if($("#email").val().trim()==''){
		 alert("Please insert email");
			$("#email").focus();
			return false;
		}	
	 
	 if(!validate(document.getElementById("email").value))
	 	{
		return false;
	 	}  
	  
	 if($("#cvvCode").val().trim()==''){
			alert("please insert CVC/CVV code");
			$("#cvvCode").focus();
			return false;
		} 
		
		if(isNaN(document.getElementById("cvvCode").value) || document.getElementById("cvvCode").value.length !=3 )
		{
		alert("Invalid CVC/CVV code");
		return false; 
		}  
	
  	if(document.getElementById("acceptTermsConditions").checked)
  	{
  	document.payment.action="./makePaymentWithToken.htm"
  	document.payment.submit();
  	} 
  	else     
  	{
  		alert("Accept terms and conditions");
  		return false;
  	} 
} 
 
 function useDifCard()
 {
	 window.location.href="./makePayment.htm?d=1";
 }
 
 
 function validate(email) {

	    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	    //var address = document.getElementById[email].value;
	    if (reg.test(email) == false) 
	    {
	        alert('Invalid Email Address');
	        return false;
	    }
	    else
	    	return true;
	    
	}  
 
 
 function callTax(){
	 document.getElementById("taxTable").innerHTML="";
	 $("#loading").show();
	$("#taxTable").ajaxStart(function(){
	    $("#loading").css("display","block");
	  });
	$("#taxTable").ajaxComplete(function(){
	    $("#loading").css("display","none");
	  });
		document.getElementById("totalAmount").value=document.getElementById("ammountInUSD").value;
		$.ajax({
		    type: "Get", 
		   
		    url: "getTaxesByStateName.htm?stateName=<%=userFullDetail.getState()%>",
			dataType:"json", 
			 
		     success: function(data){
		    	 if(data.piggyBack=="1")
		    	{
		    		 topUpAmount=parseFloat(document.getElementById("ammountInUSD").value);
		    		 gst=parseFloat(((topUpAmount*data.gst)/100));
			    	 pst=parseFloat(((topUpAmount+gst)*data.pst)/100);
			    	 hst=parseFloat((topUpAmount*data.hst)/100);
			    	 totalTax=0;
			    	 total=topUpAmount+pst+gst+hst;
		    	}
		    	 else
		    		 {
		    		 topUpAmount=parseFloat(document.getElementById("ammountInUSD").value);
			    	 pst=parseFloat((topUpAmount*data.pst)/100);
			    	 gst=parseFloat(((topUpAmount*data.gst)/100));
			    	 hst=parseFloat((topUpAmount*data.hst)/100);
			    	 totalTax=0;
			    	 total=topUpAmount+pst+gst+hst;
		    		 }  
		    	 document.getElementById("PST").value=pst;
		    	 document.getElementById("GST").value=gst;
		    	 document.getElementById("HST").value=hst;
		    	 document.getElementById("totalTAX").value = totalTax; 
		    	 document.getElementById("totalAmount").value=total;
		    	 
		    	 document.getElementById("PST").value=pst;
		    	 var taxTable="<table class='tablepayment' id='taxAutoTable' border='1' style='width:100px;vertical-align: middle;'><tr>" +
					"<th >Top Up Amount</th>" +
					"<th>PST ("+data.pst+"%)</th>" +
					"<th>GST ("+data.gst+"%)</th>" +
					"<th>HST ("+data.hst+"%)</th>" + 
					"<th>Total Amount</th>" +
					"</tr> " + 
					"<tr>" + 
					"<td>US$"+topUpAmount+"</td>" + 
					"<td>US$"+pst+"</td>" +
					"<td>US$"+gst+"</td>" + 
					"<td>US$"+hst+"</td>" +
					"<td>US$"+total+"</td>" +
					"</tr>" + 
					"</table>"; 
					
					document.getElementById("taxTable").innerHTML=taxTable;
		    	
		     }  
		    
		    });  
	}
 
  
 </script> 
<style>
.error { 
color: #ff0000;
font-style: italic;
}
 
.serialNo td {
    padding: 3px 0 0 1px;
    text-align: left;
}
</style> 
<style type="text/css">
* { font-family: Verdana; font-size: 96%; }
label { width: 10em; float: left; }
label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
p { clear: both; }
.submit { margin-left: 12em; }
em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
  <script>
  $(document).ready(function(){
    $("#payment").validate();
  });
  </script> 

</head>

<body>

<div id="container" class="full-width">
	<div id="header">
		<div id="headerTitle">
			<tiles:insertAttribute name="header" />
		</div>
	</div>
	<div id="accountContent2">
		<div id="contentTitle"> 
			<span class="title"><spring:message code="label.makeAPayment" /></span>
		</div>
			<form name="payment" id="payment" commandName="userDetailsWithToken" method="post">   
		<div id="contentTx4">
			<div class="head"><spring:message code="label.myPolar1" /></div>
			<div class="content">
				<div class="col full"> 
					
				 
		<c:choose> 
    <c:when test="${empty userActiveCardDetails}">
        please activate a sim 
        <input type="button" name="activate" value="Activate Card" onclick="activateCard()"></input>
    </c:when>
   		 <c:otherwise>
						<table class="serialNo">
							<tbody> 
								<tr> 
									<td align="left"><table width="167%">
             								<tr>    
                							<td>Serial Number</td>
                							<td>Balance</td> 
                							</tr>  
             								 <c:forEach items="${userActiveCardDetails}" var="activeSimList" varStatus="status">
											
											<tr>   
                							<td>${activeSimList.serialNum}</td>
                							<td><spring:message code="label.currency" /><fmt:formatNumber value="${activeSimList.balance}" pattern="0.00"></fmt:formatNumber></td>  
                							</tr> 
                							</c:forEach>
											</table></td> 
								</tr> 
							</tbody> 
						</table>   
					</span>
					<div class="paymentaccepted">
						<ul id="payments" name="payments"> 
							<li id="visa"><a href="#">Visa</a></li> 
							<li id="mastercard"><a href="#">Master Card</a></li>
					 		<li id="amex"><a href="#">Amex</a></li> 
		
 				</ul>    
 
						<div class="callHistGrayTinyLine"></div>
					</div> 
					<div style="clear: both"></div>
				
					<div class="col full">
						<div class="accountWhiteBoxTitle">TopUp</div>
						<div style="width: 100%; text-align: center;" 
							id="ctl00_ContentPlaceHolder1_PanelSP">
							<div class="clear separator"></div>
							<table class="tablepayment">
								<tbody>
									<tr> 
									<td><spring:message code="label.activeSimCards" /></td><td><select
											title="Select Polar Wireless Package"
											id="activeSimList"   
											name="activeSimList" style="width: 217px;">
											<c:forEach items="${userActiveCardDetails}" var="activeSimList" varStatus="status">
											<option value="${activeSimList.serialNum}:${activeSimList.balance}">${activeSimList.serialNum}:<spring:message code="label.currency" /><fmt:formatNumber value="${activeSimList.balance}" pattern="0.00"/></option>
											</c:forEach>      
										</select></td> 
										</tr>
										<tr>   
										<td><spring:message code="label.selectAnAmount" /></td><td><select
											title="Select Polar Wireless Package"
											id="ammountInUSD"
											onchange="javascript:callTax();"
											name="ammountInUSD" style="margin-left: 21px;">
											<option value="-1">Select Amount</option>
											<option value="10.0000">Prepaid Mobile Credit $10
													USD</option> 
												<option value="20.0000">Prepaid Mobile Credit $20
													USD</option> 
												 
												<option value="40.0000">Prepaid
													Mobile Credit $40 USD</option>
												<option value="80.0000">Prepaid Mobile Credit $80
													USD</option> 
												
										</select></td>  
									</tr>  
									<tr>  
										<td><span
											style="color: Black; font-size: 0.7em; font-weight: normal;"
											id="ctl00_ContentPlaceHolder1_Label3"></span></td>
									</tr>
									<tr><td></td><td><div id="loading"><img src='<%=request.getContextPath()%>/resources/images/loading.gif' width="25" hight="25"/><br></br>loading...</div></td></tr>
								</tbody>
							</table> 
						</div>
						<br>  
						<!-- <div style="width: 100%; text-align: center;"
								id="paymentMethod" name="paymentMethod"> 
								<table class="tablepayment">
									<tbody>
										<tr> 
											<td><select style="width: 295px;" id="cardType" 
												name="cardType" onchange="paymentDetails();">
													<option value="1" selected="selected">Select
														Payment Method</option>
													<option value="VISA">VISA</option>
													<option value="AMEX">American Express</option>
													 <option value="Mastercard">Master Card</option>
													<option value="Discover">Discover</option>
													
													<option valueclass="required email"="PayPal">PayPal</option>
													<option value="UKASH">UKASH</option>
													<option value="INTERAC Online">INTERAC Online</option>
											</select></td>
										</tr>
									</tbody>
								</table>
							</div> -->  
							<div id="taxTable"></div>
							<div style="clear: both"></div>
					</div>
					<!--
				 <div class="col lesshalf">
						<div class="accountWhiteBoxTitle"><spring:message code="label.transaction" /></div>
						<div style="width: 100%;" xmlhttp.responseText
							id="transaction" name="transaction">
							<table class="tablepayment">
								<tbody>
									<tr style="visibility: hidden; display: none;">
										<td align="left" style="width: 50%"><spring:message code="label.productDescription" />
										</td>
										<td class="label"><span class="label"
											id="ctl00_ContentPlaceHolder1_lbl_Decsription">
											<spring:message code="label.prepaidMCr" />
											</span></td>
									</tr>
									<tr> 
										<td align="left"></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_Price"></span></td>
									</tr>
									<tr>
										<td align="left" style="width: 50%"></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_gst"></span></td>
									</tr>
									<tr>
										<td align="left" style="width: 50%"></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_pst"></span></td>
									</tr>
									<tr> 
										<td align="left" style="width: 50%"></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_hst"></span></td>
									</tr>
									<tr>
										<td align="left" style="width: 50%"></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_fee"></span></td>
									</tr>
									<tr style="visibility: hidden; display: none;">
										<td align="left" style="width: 50%"></td>
										<td><span class="label"
											id="ctl00_ContentPlaceHolder1_lbl_shipping"></span></td>
									</tr>
									<tr>
										<td align="left" style="width: 50%"></td>
										<td><span style="font-weight: bold;" class="label"
											id="ctl00_ContentPlaceHolder1_lbl_total"></span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="clear: both"></div>
					</div>
					
					--><div style="clear: both"></div>
				</div>
						
			<div  class="col full">
				<div class="accountWhiteBoxTitle"><spring:message code="label.CreditCard" /></div>
				<div class="clear separator"></div>
				<table  class="tablepayment">
					<tbody>  
						<tr> 
							<td><spring:message code="label.nameOnCard" /></td>
							<td><input
								type="text" 
								id="nameOnCard"
								name="nameOnCard" class="required"  style="width: 220px;"></input><form:errors path="nameOnCard" cssClass="error" /></td>
								  
						</tr>   
						<tr>
							<td><spring:message code="label.email" /></td>
							<td><input
								type="text" 
								id="email"
								name="email" class="required email"  style="width: 220px;"></input><form:errors path="email" cssClass="error" /></td>
						</tr>
						 <%-- <tr>  
							<td class="autorefillpaymentcol1">Phone Number</td>
							<td colspan="2" class="autorefillpaymentcol2"><input
								type="text" style="width: 240px;"
								id="phone" 
								name="phone"><form:errors path="phone" cssClass="error" /></td>
						</tr>  --%> 
						   
						 
						<tr>
							<td ><spring:message code="label.cvv" /></td>
							<td><input
								type="text" style="width: 60px;"
								id="cvvCode" 
								name="cvvCode" class="required" maxlength="3"><form:errors path="cvvCode" cssClass="error" /> <span 
									style="color: OrangeRed; display: none;"
									id="ctl00_ContentPlaceHolder1_rv_CVV2"></span> <input
									type="hidden"
									id="ctl00_ContentPlaceHolder1_vce_rv_CVV2_ClientState"
									name="ctl00$ContentPlaceHolder1$vce_rv_CVV2_ClientState">
										<img width="18" src="../images/ratesQuestion.png"
										class="autorefilquest" alt="">
											<div style="display: none;" class="msg_body2">
												<div id="autorefillinfoBox1">
													<div>
														<img width="341" height="134" src="../images/cv_card1.jpg"
															alt="">
													</div>
												</div>
											</div></td>
						</tr>
						<%-- <tr> 
							<td class="autorefillpaymentcol1">PIN</td>
							<td colspan="2" class="autorefillpaymentcol2"><input
								type="text" style="width: 240px;"
								id="pin"
								name="pin"><form:errors path="pin" cssClass="error" /></td>
						</tr>
					 --%>
					</tbody> 
				</table>  
				 <input type="hidden" id="phone"	name="phone" value="00"/>
				<div id="contentTx4">
				
				
				
				<div class="content">
					<div style="margin-left:20px; vertical-align:center;">
						<span> <span style="font-size: 0.8em;"> <input 
					type="checkbox" name="acceptTermsConditions"
					id="acceptTermsConditions" class="required" style="float: left; width: 5px;" /> <label
					for="acceptTermsConditions" style="float: left; width: 240px;"><spring:message code="label.termsAndConditions"  /></label>
				</span>
						<div></div> 
					</div> 
					<div class="clear separator"></div>
					 <div id="auorefillSaveChangesBt">
						<input type="button" class="blue-button" value="Submit"
							hidefocus="true" id="ctl00_ContentPlaceHolder1_ib_autorefill"
							name="ctl00$ContentPlaceHolder1$ib_autorefill" onclick="javascript:makePayment()" />
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="blue-button" value="Use Different Card To TopUp"
							hidefocus="true" id="useDiffCard"
							name="useDiffCard" onclick="javascript:useDifCard()"  />
							   
					</div> 
					 
					
					</div>     
			
					  </c:otherwise>
				</c:choose>	 
				
				<input type="hidden" name="PST" id="PST"></input>
					<input type="hidden" name="GST" id="GST"></input>
					<input type="hidden" name="HST" id="HST"></input>
					<input type="hidden" name="totalTAX" id="totalTAX"></input>
					<input type="hidden" name="totalAmount" id="totalAmount"></input> 
				</form>
				</div> 
				</div>
			</div>  
		
			</div> 	  
	<div style="clear: both"></div>

</div>  
 <div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
</div> 
</div>
</div> 
</body>
</html>
