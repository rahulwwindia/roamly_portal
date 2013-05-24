<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title"/></title>     
<link href="<%=request.getContextPath()%>/resources/styles/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/style_user.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel="stylesheet" type="text/css" />
<script 
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script> 
<script>  
$(document).ready(function() {
   
	  
	var countryCode=document.getElementById("hiddenCountryCode").value;  
	$('#countryId option[value="'+countryCode+'"]').attr('selected', 'selected');
	var stateCode=document.getElementById("hiddenStateCode").value;
	$('#state option[value="'+stateCode+'"]').attr('selected', 'selected'); 
	var localCode=document.getElementById("hiddenLocalCode").value;
	$('#timeZoneId option[value="'+localCode+'"]').attr('selected', 'selected'); 
	                   
	});  
	
	function innerPage(call)
	{
	
	  window.location.href=call;
	}

 
    
</script>
<style> 
.error { 
color: #ff0000;
font-style: italic;
}
</style>
  
</head>  
<body>   
<div id="container" class="full-width"> 
<div id="header">
	<div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div>
      <div id="accountContent2">
        <div id="contentTitle"><span class="title"><spring:message code="label.orderHistory"/></span></div>
        <div id="contentTx4">
          <div class="tabs-head">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab-btn">
                <tr>
                <td class="first-btn active" onclick="javascript:innerPage('myProfile.htm')"><spring:message code="label.basicInfo"/></td>
                   <%--  <td><spring:message code="label.accountSetting"/></td> --%> 
                    <%-- <td><spring:message code="label.currentPassword"/></td> --%> 
                   <%--  <td onclick="javascript:innerPage('changePassword.htm')"><spring:message code="label.currentPassword"/></td> --%>    
                    <td class="last-btn" onclick="javascript:innerPage('autoRefill.htm')"><spring:message code="label.autoRefil"/></td> 
                </tr>    
            </table>       
          </div>  
          <c:if test="${updateFlag==true}">
         	 <spring:message code="label.myProfileSuccess"/>   
			</c:if> 
          <div class="myAccountbody"> <span id="ctl00_ContentPlaceHolder1_UpdatePanel1">
          
            <table class="myAccountbody">
               <c:forEach items="${userProfile}" var="userProfile" varStatus="status" >
              <tbody>   
                <tr> 
                	
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.firstName"/></td>
                  <td align="left">${userProfile.firstName}</td> 
                	
                </tr>  
                <tr>  
                  <td class="myAcc-BasicInfosq1" ><spring:message code="label.lastName"/> </td> 
                  <td align="left">${userProfile.lastName}</td>
              	  
                </tr>
                <tr>
                  <td class="myAcc-BasicInfosq1"> <spring:message code="label.streetNum"/></td>
                  <td align="left">${userProfile.streetNum} , ${userProfile.address}</td>
              	
                </tr>
                <tr>
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.city"/></td>
                  <td align="left">${userProfile.city}</td>
                	
                </tr> 
                <tr>  
                
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.country"/></td> 
                  <td align="left">${userProfile.countryId}</td>
                </tr>  
                <tr>
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.state"/></td>
                  <td align="left">${userProfile.state}</td>
                    
                </tr>
                <tr> 
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.zip"/></td>
                  <td align="left">${userProfile.postalCode}</td>
  
                </tr>
                <tr>  
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.email"/></td> 
                  <td align="left">${userProfile.email}</td>
                
                </tr>
                <tr>     
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.timeZone"/></td>
                  <td align="left">${userProfile.timeZoneId}</td>
                    
                </tr>
              </tbody> 
              </c:forEach> 
            </table>
           
            </span>
            <div style="display:none;" id="ctl00_ContentPlaceHolder1_UpdateProgress1">
              <div style="border-right: black 1px solid; border-top: black 1px solid; left: 50%;
									border-left: black 1px solid; width: 100px; color: white; border-bottom: black 1px solid;
									position: absolute; top: 50%; height: 60px; background-color: white; background-position: center center;
									background-image: url(../Images/ajax-loader_green.gif); text-align: center; background-repeat: no-repeat;"> </div>
            </div>
          </div>
        </div>
      </div>
       <div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
	</div>   
      <div style="clear:both"></div>
      
      </div>  
    
</body>
</html>
