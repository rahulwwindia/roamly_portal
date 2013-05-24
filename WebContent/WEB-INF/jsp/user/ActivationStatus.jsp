
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title"/></title>  
<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/style.css"
	rel="stylesheet" type="text/css" />
<link  
	href="<%=request.getContextPath()%>/resources/styles/style_user.css"
	rel="stylesheet" type="text/css" />   
 
 
 <script language=javascript> 

function callTopUp()
{
window.location.href = "<%=request.getContextPath()%>/makePayment.htm";
} 
  
</script> 
</head>  
<body>    
<div id="container" class="full-width"> 
<div id="header">
	<div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div>  
<div id="accountContent2">
         <div id="contentTitle"><span class="title"><spring:message code="label.activationStatus"/></span></div>
         <div id="contentTx4">
          <div class="head">
		  </div>
          <div class="content">
            <p>${cardActivationStatus} </p>
          </div> 
<c:choose>
    <c:when test="${flag==true}">
         <input type="button" name="topUp" value="Top Up" id="topUp" onclick="javascript:callTopUp();"></input>
    </c:when>
    <c:otherwise>         
    </c:otherwise>
</c:choose>
           
          <div style="clear:both"></div>
        </div>
         </div> 
         <div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
</div>   
</div>  
</body> 
</html>   

      
