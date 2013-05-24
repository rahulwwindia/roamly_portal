
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
 
</head> 
<body>    
<div id="container" class="full-width"> 
<div id="header">
	<div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div>
<div id="accountContent2">
        <div id="contentTitle"><span class="title"><spring:message code="label.myAccount"/></span></div>
        <div id="contentTx4">
          <div class="head"><spring:message code="label.myPolar1"/></div>
          <div class="content">
             								<table width="50%" border="0">
             								<tr>    
                							<th><b>Serial Number</b></th>
                							<th><b>Balance</b></th>
                							</tr> 
             								 <c:forEach items="${userActiveCardDetails}" var="activeSimList" varStatus="status">
											
											<tr>   
                							<td>${activeSimList.serialNum}</td>
                							<td><spring:message code="label.currency" /><fmt:formatNumber value="${activeSimList.balance}" pattern="0.00"/></td>
                							</tr>
                							</c:forEach>
											</table>
											
											
          </div>  
          <div style="clear:both"></div>
        </div>
        <div id="contentTx4">
          <div class="head"><spring:message code="label.smsCenter"/></div>
          <div class="content">
            <ul>
              <li><spring:message code="label.NoMessages"/></li>
            </ul>
          </div> 
          <div style="clear:both"></div>
          <div id="payDetail"></div> 
        </div>
        <div id="contentTx4">
          <div class="head"><spring:message code="label.recentCall"/></div>
          <div class="content">
            <table width="100%" border="0" cellpadding="5" cellspacing="0" class="table">
              <thead>
              <tr> 
              <td><spring:message code="label.callTime"/></td>
                <td><spring:message code="label.source"/></td>
                <td><spring:message code="label.destination"/></td>
                <td><spring:message code="label.type"/></td>
                <td><spring:message code="label.length"/></td>
                <td><spring:message code="label.rate"/></td>
                <td><spring:message code="label.total"/></td>
                </tr>    
                  </thead> 
             <c:forEach items="${myAccount}" var="myAccount" varStatus="status" end="5"> 
              <tr>   
                <td><c:out value="${myAccount.perMinTotal}" default="Not Available" escapeXml="false"></c:out></td>
                <td><c:out value="${myAccount.sourcePhone}" default="Not Available" escapeXml="false"></c:out></td>
                <td><c:out value="${myAccount.destinationPhone}" default="Not Available" escapeXml="false"></c:out></td>
                <td><c:out value="${myAccount.perMinTotal}" default="Not Available" escapeXml="false"></c:out></td>
                <td><c:out value="${myAccount.callLength1Dst}" default="Not Available" escapeXml="false"></c:out></td>
                <td><c:out value="${myAccount.rate}" default="Not Available" escapeXml="false"></c:out></td>
                <td><c:out value="${myAccount.perMinTotal}" default="Not Available" escapeXml="false"></c:out></td>
                </tr>
                </c:forEach>
                </table> 
                </div> 
                </div>
                </div>
                <div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
</div>   
</div>  
</body> 
</html>   

      
