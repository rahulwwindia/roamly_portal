<%@page import="com.roamly.user.beans.UserFullDetail"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%
UserFullDetail userFullDetail=(UserFullDetail)session.getAttribute("userObj");

%> 
<div id="header" class="full-width clear">
          <div id="header-inner" class="inner-width clear">
              <div class="header-top clear">
                  <div class="left"><img src="<%=request.getContextPath()%>/resources/images/logo.png" alt="Roamly - Roam Like Home" title="Roamly - Roam Like Home" /></div>
                  <div class="right">  
                      <span class="welcome"><spring:message code="label.welcome"/>: <%=userFullDetail.getFullName() %></span> 
                   
						 <a href="myProfile.htm" title="<spring:message code="label.myProfile"/>" class="r-button orange header-button"><spring:message code="label.myProfile"/></a>
               
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