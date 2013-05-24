<%@page import="java.util.Iterator"%>
<%@page import="com.roamly.user.beans.UserTransactionHistory"%>
<%@page import="java.util.List"%>
<%@page import="com.roamly.user.beans.UserTransactionHistoryRs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%

UserTransactionHistoryRs userTransactionHistoryRs = (UserTransactionHistoryRs)session.getAttribute("paymentHistory");
List<UserTransactionHistory> userTransactionHistory= userTransactionHistoryRs.getUserTransactionHistories();
%>

<% 

Iterator<UserTransactionHistory> itr = userTransactionHistory.iterator();
while(itr.hasNext()) {
	UserTransactionHistory element = itr.next();
	if(element.getAccountDebitId().equals(request.getParameter("debitId")))
	{ 
		System.out.println("element--"+element.getAmount());
%> 
<div class="head" ><spring:message code="label.totalpaymentDetails"/></div>
             
            <div style="background-color:White;width:100%; text-align:center;" id="allPaymentDetails">
              <div>
                <table style="text-align: left; margin: 0 35px 20px; padding: 5px 20px; "  id="ctl00_ContentPlaceHolder1_DetailsView2" class="grid" width="90%">
                  <tbody>
                <tr class="alternate"> 
                      <td class="FieldHeader"><spring:message code="label.amount"/></td>
                      <td><spring:message code="label.currency" /><fmt:formatNumber value="<%=element.getAmount() %>" pattern="0.00"/></td>
                    </tr> 
                    <tr class="alternate"> 
                      <td class="FieldHeader"><spring:message code="label.GST"/></td>
                     <td><spring:message code="label.currency" /><fmt:formatNumber value="<%=element.getGst() %>" pattern="0.00"/></td>
                    </tr>
                    <tr class="alternate">
                      <td class="FieldHeader"><spring:message code="label.PST"/></td>
                      <td><spring:message code="label.currency" /><fmt:formatNumber value="<%=element.getPst() %>" pattern="0.00"/></td> 
                    </tr>  
                    <tr class="alternate">
                      <td class="FieldHeader"><spring:message code="label.TAX"/></td>
                      <td><spring:message code="label.currency" /><fmt:formatNumber value="<%=element.getTax() %>" pattern="0.00"/></td>
                    </tr> 
              <tr class="alternate">
                      <td class="FieldHeader"><spring:message code="label.HST"/></td>
                     <td><spring:message code="label.currency" /><fmt:formatNumber value="<%=element.getHst() %>" pattern="0.00"/></td> 
                    </tr> 
                    <tr class="alternate">
                      <td class="FieldHeader"><spring:message code="label.Shipping"/></td>
                 <td><spring:message code="label.currency" /><fmt:formatNumber value="<%=element.getShipping()%>" pattern="0.00"/></td>
                    </tr>
                    <tr class="alternate">
                      <td class="FieldHeader"><spring:message code="label.transFee"/></td>
                  <td><spring:message code="label.currency" /><fmt:formatNumber value="<%=element.getTransFee()%>" pattern="0.00"/></td>
                    </tr> 
                    <tr class="alternate">
                      <td class="FieldHeader"><spring:message code="label.total"/></td>
                <td><spring:message code="label.currency" /><fmt:formatNumber value="<%=element.getTotal()%>" pattern="0.00"/></td>
                    </tr>  
                    <tr class="alternate">
                      <td class="FieldHeader"><spring:message code="label.paymentType"/></td>
                      <td><spring:message code="label.polarAdmin"/></td>
                    </tr>
                    <tr class="alternate"> 
                      <td class="FieldHeader"><spring:message code="label.transId"/></td>
                  <td><%=element.getTransactionId()%></td>
                           
                    </tr>   
                  </tbody>  
               
                </table>
              </div> 
            </div>
            <% 
            }
}
            %>
             