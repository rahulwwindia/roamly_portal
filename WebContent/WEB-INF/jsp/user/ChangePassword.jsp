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
                    <td class="first-btn active"> <a href="myProfile.htm"><spring:message code="label.basicInfo"/></a></td>
                    <td><spring:message code="label.accountSetting"/></td> 
                    <td> <a href="changePassword.htm"><spring:message code="label.currentPassword"/></a></td>
                    <td class="last-btn"><spring:message code="label.autoRefil"/></td>
                </tr>   
            </table> 
          </div>  
          <div class="myAccountbody"> <span id="ctl00_ContentPlaceHolder1_UpdatePanel1">
          <c:choose>
        <c:when test="${updateFlag==true}"> 
     			  Password Change Successfully   
    	</c:when>
			<c:otherwise>  
          <form:form name="changePassword" action="changePasswordCall.htm" commandName="changePassword" method="POST">  
             <form:errors path="passMismatch" cssClass="error" />    
            <table class="myAccountbody">  
              <tbody>    
                <tr>     
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.currentPassword"/></td>
                  <td align="left"><input type="password" style="width:300px;" id="currentPassword" name="currentPassword"><form:errors path="currentPassword" cssClass="error" /></td> 
                  
                </tr>    
                <tr>  
                  <td class="myAcc-BasicInfosq1"> <spring:message code="label.newPassword"/></td> 
                  <td align="left"><input type="password" style="width:300px;" id="newPassword" name="newPassword" ><form:errors path="newPassword" cssClass="error" /></td>
             
                </tr> 
                <tr> 
                  <td class="myAcc-BasicInfosq1"><spring:message code="label.reEnterPassword"/></td>
                  <td align="left"><input type="password" style="width:300px;" id="reEnterPassword" name="reEnterPassword" ><form:errors path="reEnterPassword" cssClass="error" /></td>
           	
                </tr> 
                 <tr> 
                  <td class="myAcc-BasicInfosq1"></td>
                  <td style="text-align: left">&nbsp; 
                    <input type="submit" class="blue-button" value="Change Password" hidefocus="true" id="changePassword" name="changePassword"></td>
                </tr> 
               </tbody>     
            </table> 
            </form:form> 
            	 </c:otherwise>  
            	 </c:choose> 
            </span>
            <div style="display:none;" id="ctl00_ContentPlaceHolder1_UpdateProgress1">
              <div style="border-right: black 1px solid; border-top: black 1px solid; left: 50%;
									border-left: black 1px solid; width: 100px; color: white; border-bottom: black 1px solid;
									position: absolute; top: 50%; height: 60px; background-color: white; background-position: center center;
									background-image: url(../Images/ajax-loader_green.gif); text-align: center; background-repeat: no-repeat;"> </div>
            </div>
          </div>
        </div>  
      <div style="clear:both"></div> 
   
</div> 
<div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
</div>  
</div>  
</body> 
</html>    

