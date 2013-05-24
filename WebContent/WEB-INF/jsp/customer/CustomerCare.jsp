<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.roamly.user.beans.UserFullDetail"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title" /></title>
<link href="<%=request.getContextPath()%>/resources/styles/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/resources/styles/style_user.css"
	rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel="stylesheet" type="text/css" />

</head> 

<body>


<script>
   
function getCustomerDetails()
{
	

	if(document.getElementById("firstName").value=="") 
	{
		alert("please insert first name");
		return false;
		
	} 
	if(document.getElementById("lastName").value=="") 
	{
		alert("please insert last name");
		return false;
		
	} 
	
	if(document.getElementById("serialNo").value=="") 
	{
		alert("please insert serial no");
		return false;
		
	}  
	if(document.getElementById("email").value=="") 
	{
		alert("please insert email id");
		return false;
	}else
		{
		if(validate(document.getElementById("email").value))
			document.customerForm.submit();   
		} 
	 
	
	
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
   
   
</script> 
</head>  
<body>    
<div id="container" class="full-width"> 
  <div id="accountContent2"  style="min-height: 700px; width: 1024px;">
  <div id="header" class="full-width clear">
          <div id="header-inner" class="inner-width clear">
              <div class="header-top clear">
                  <div class="left"><img src="<%=request.getContextPath()%>/resources/images/logo.png" alt="Roamly - Roam Like Home" title="Roamly - Roam Like Home" /></div>
                  <div class="right">  
                      <span class="welcome"><spring:message code="label.welcome"/>: <%=session.getAttribute("userName") %> </span> 
                   
						<%--  <a href="myProfile.htm" title="<spring:message code="label.myProfile"/>" class="r-button orange header-button"><spring:message code="label.myProfile"/></a> --%>
               
                     <a href="<c:url value="/j_spring_security_logout"/>" 
					hidefocus="true" title="<spring:message code="label.logout"/>" id="ctl00_LogoutButton"
				    class="r-button orange header-button"><spring:message code="label.logout"/></a> 
                  </div>      
              </div>  
              <div class="clear"></div>
              <div class="header-bottom clear">
                  <div class="left">
                  </div>
                  <%-- <div class="right">
                      <a href="?lang=en" title="USA" class="country usa"><spring:message code="label.USA"/></a>
                      <a href="?lang=de" title="Russia" class="country russia"><spring:message code="label.Russia"/></a>
                  </div> --%>
              </div>
          </div> 
          <div class="clear"></div> 
          <div id="nav-top" class="clear">
              <div id="nav-top-inner" class="inner-width clear">
              </div>
          </div>
        </div>  
        <div id="contentTitle"><span class="title"><spring:message code="label.customerDetails"/></span></div>
        <div id="contentTx4">
          <div class="myAccountbody"> <span id="ctl00_ContentPlaceHolder1_UpdatePanel1">
          <form:form name="customerForm" action="getDetails.htm" commandName="customerForm" method="POST">  
           <table class="myAccountbody">  
              <tbody>       
                <tr>        
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.firstName"/></td>
                  <td align="left"><input type="text" style="width:300px;" id="firstName" name="firstName" value="${customerForm.firstName}"><form:errors path="firstName" cssClass="error" /></td> 
                  
                </tr>    
                <tr>  
                  <td class="myAcc-BasicInfosq1"> <spring:message code="label.lastName"/></td> 
                  <td align="left"><input type="text" style="width:300px;" id="lastName" name="lastName" value="${customerForm.lastName}" ><form:errors path="lastName" cssClass="error" /></td>
             
                </tr>  
                <tr>  
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.serialNum"/></td>
                  <td align="left"><input type="text" style="width:300px;" id="serialNo" name="serialNo" value="${customerForm.serialNo}"  ><form:errors path="serialNo" cssClass="error" /></td>
                </tr> 
                  <tr> 
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.email"/></td>
                  <td align="left"><input type="text" style="width:300px;" id="email" name="email" value="${customerForm.email}" ><form:errors path="email" cssClass="error" /></td>
                </tr> 
                <tr><td></td><td></td></tr>
                 <tr> 
                  <td class="myAcc-BasicInfosq1"></td>
                  <td style="text-align: left">&nbsp;  
                    <input type="button" class="blue-button" value="Details" hidefocus="true" id="details" name="details" onclick="javascript:getCustomerDetails();"></td>
                </tr> 
               </tbody>      
            </table>    
            </form:form> 
          
            </span>
            <div style="display:none;" id="ctl00_ContentPlaceHolder1_UpdateProgress1">
              <div style="border-right: black 1px solid; border-top: black 1px solid; left: 50%;
									border-left: black 1px solid; width: 100px; color: white; border-bottom: black 1px solid;
									position: absolute; top: 50%; height: 60px; background-color: white; background-position: center center;
									background-image: url(../Images/ajax-loader_green.gif); text-align: center; background-repeat: no-repeat;"> </div>
            </div>
          </div> 
   
      </div>
      <c:choose>
		 <c:when test="${empty customerDetails}">
        
        </c:when>
  <c:otherwise> 
      <div id="contentTx4"> 
			<div class="head"><spring:message code="label.details" /></div>
			<div class="content"> 
				<table border="0" width="100%" cellspacing="0" cellpadding="0" 
					class="table">
					<thead>
					<tr>
						<td><spring:message code="label.accountId" />:</td>
						<td><c:out value="${customerDetails.accountId}" 
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						<tr>
						<td><spring:message code="label.customerId" />:</td>
						<td><c:out value="${customerDetails.customerId}" 
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						<tr>
						<td><spring:message code="label.city" />:</td>
						<td><c:out value="${customerDetails.city}" 
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						
						
						
						<tr>
							<td><spring:message code="label.state" />:</td>
							<td><c:out value="${customerDetails.state}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						<tr>
							<td><spring:message code="label.zipCode" />:</td>
							<td><c:out value="${customerDetails.zipCode}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						<tr>
							<td><spring:message code="label.address" />:</td>
								<td><c:out value="${customerDetails.address}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						<tr>
							<td><spring:message code="label.didEffectiveDate" />:</td>
							<td><c:out value="${customerDetails.didEffectiveDate}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						<tr>
							<td><spring:message code="label.didExpiryDate" />:</td>
							<td><c:out value="${customerDetails.didExpiryDate}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						
						<tr>
						<td><spring:message code="label.homeCountry" />:</td>
						<td><c:out value="${customerDetails.hsCountryName}" 
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						<tr>
						<td><spring:message code="label.roamingCountry" /></td>
						<td><c:out value="${customerDetails.vpCountryName}" 
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						<tr>
						<td><spring:message code="label.homeCarrierPhone" />:</td>
						<td><c:out value="${customerDetails.hs_msisdn}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						
						<tr>
						<td><spring:message code="label.roamlyCarrier" />:</td>
						<td><c:out value="${customerDetails.vp_msisdn}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						
						<tr>
						<td><spring:message code="label.homeCarrier" />:</td>
						<td><c:out value="${customerDetails.hsNetwork}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						
						<tr>
						<td><spring:message code="label.balance" />:</td>
						<td><c:out value="${customerDetails.balance}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						
						<tr>
						<td><spring:message code="label.topUpAmount" />:</td>
						<td><c:out value="${customerDetails.autoTopUpAmount}"
										default="Not Available" escapeXml="false"></c:out></td>
						</tr>
						
					</thead> 
					<tbody> 
					
						</tbody> 
				</table>
			</div>  
		</div>
		
		<div id="contentTx4">
			<div class="head"><spring:message code="label.callDetails" /></div>
			<div class="content">
				<table border="0" width="100%" cellspacing="0" cellpadding="5"
					class="table">
					<thead>
						<tr>
							<td><spring:message code="label.callTime" /></td>
							<td><spring:message code="label.source" /></td>
							<td><spring:message code="label.destination" /></td>
							<td><spring:message code="label.type" /></td>
							<td><spring:message code="label.length" /></td>
							<td><spring:message code="label.rate" /></td>
							<td><spring:message code="label.total" /></td>
						</tr>
					</thead>
					<c:forEach items="${customerDetails.callHistory}" var="callHistory"
						varStatus="status" end="5">
						<tbody> 
							<tr> 
								<td><c:out value="${callHistory.dstCallTime}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.sourcePhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.destinationPhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.enShortName}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.callLength60Src}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.rate}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${callHistory.perMinTotal}"
										default="Not Available" escapeXml="false"></c:out></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		<div id="contentTx4">
			<div class="head"><spring:message code="label.smsDataUsage" /></div>
			<div class="content">
				<table border="0" width="100%" cellspacing="0" cellpadding="5"
					class="table">
					<thead> 
						<tr>
							<td><spring:message code="label.callTime" /></td>
							<td><spring:message code="label.source" /></td>
							<td><spring:message code="label.destination" /></td>
							<td><spring:message code="label.type" /></td>
							<td><spring:message code="label.length" /></td>
							<td><spring:message code="label.rate" /></td>
							<td><spring:message code="label.total" /></td>
						</tr>
					</thead>
					<c:forEach items="${customerDetails.smsHistory}" var="smsHistory"
						varStatus="status" end="4"> 
						<tbody> 
							<tr>  
								<td><c:out value="${smsHistory.dstCallTime}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.sourcePhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.destinationPhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.enValue}" 
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.sourcePhone}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.rate}"
										default="Not Available" escapeXml="false"></c:out></td>
								<td><c:out value="${smsHistory.chargedAmount}"
										default="Not Available" escapeXml="false"></c:out></td>
							</tr>
						</tbody>
					</c:forEach> 
				</table>
			</div> 
		</div>    
        </c:otherwise>
        </c:choose> 
      <div style="clear:both"></div> 
      <div class="one-fifth no-padding-right column left"></div> 
   
</div> 
</div> 
</div>  
</body> 
</html>     
