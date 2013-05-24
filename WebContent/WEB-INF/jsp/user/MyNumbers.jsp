<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><spring:message code="label.title"/></title>     
<link href="<%=request.getContextPath()%>/resources/styles/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/style_user.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel="stylesheet" type="text/css" />
</head>  
<body>   
<div id="container" class="full-width">   
<div id="header">
	<div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div>  
      <div id="accountContent2">
        <div id="contentTitle"><span class="title"><spring:message code="label.myPhoneNumbers"/></span></div>
        <div id="contentTx4"> 
          <div class="content">
            <table width="100%" border="0" cellpadding="5" cellspacing="0" class="table">
              <thead>
              <tr>
              <td ><spring:message code="label.phoneNumber"/></td>
                <td><spring:message code="label.serialNum"/></td>
                <td><spring:message code="label.active"/></td>
                </tr> 
                </thead> 
                <tbody>
              <c:forEach items="${phoneDetails}" var="phoneDetails"
						varStatus="status" end="10">
              <tr>
                <td>${phoneDetails.phoneNum}</td>
                <td>${phoneDetails.serialNum}</td> 
                <td>${phoneDetails.activate}</td>
              </tr> 
              </c:forEach>
              </tbody>
            </table> 
          </div>
          <div style="clear:both"></div>
        </div>
    <div style="clear: both"></div>
 
 
</div> 
<div id="rightmenu">  
	<tiles:insertAttribute name="rightmenu" />
</div>  
</div>
</body>
</html>
