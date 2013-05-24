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
</head>  
<body>  
<div id="header"> 
	<div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div>
<div id="leftmenu">  
	<tiles:insertAttribute name="leftmenu" />
</div> 
    <div id="accountContent2">
      <div id="contentTitle"><span class="title">INVENTORY</span></div>
      <div id="contentTx4">
        <div class="tabs-head">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab-btn">
            <tr>
              <td class="first-btn active">Current Stock</td>
              <td>Current Stock</td>
              <td class="last-btn">Receving</td>
            </tr>
          </table>
        </div>
        <div class="content">
          <table class="shipping" width="75%">
            <tbody>
              <tr>
                <td><span id="ctl00_ContentPlaceHolder1_Label2" style="font-weight:bold;">Total Received:</span></td>
                <td style="text-align: center; width: 70px"><span id="ctl00_ContentPlaceHolder1_lbl_SimReceived">0</span></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$ib_xls_received" id="ctl00_ContentPlaceHolder1_ib_xls_received" disabled="disabled" title="Export to Excel" src="../Images/xls.jpg" style="border-width:0px;"></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$btn_received" id="ctl00_ContentPlaceHolder1_btn_received" disabled="disabled" title="Show details" hidefocus="true" src="../Images/folder-open.png" style="border-width:0px;"></td>
              </tr>
              <tr>
                <td colspan="4"></td>
              </tr>
              <tr>
                <td><span id="ctl00_ContentPlaceHolder1_Label5">Receiving is NOT confirmed:</span></td>
                <td style="text-align: center; width: 70px"><span id="ctl00_ContentPlaceHolder1_lbl_SimNotConfirmed">1</span></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$ib_xlsnotconf" id="ctl00_ContentPlaceHolder1_ib_xlsnotconf" title="Export to Excel" src="../Images/xls.jpg" onclick="ShowDL_DLG('/Partners/PartnerStock.ashx?R=88880&amp;T=3'); HideDL_DLG();" style="border-width:0px;"></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$ib_confirmhlp" id="ctl00_ContentPlaceHolder1_ib_confirmhlp" src="../Images/ratesQuestion.png" style="border-width:0px;"></td>
              </tr>
              <tr>
                <td colspan="4"><div class="callHistGrayTinyLine"> </div></td>
              </tr>
              <tr>
                <td><span id="ctl00_ContentPlaceHolder1_Label6" style="font-weight:bold;">Total Shipped:</span></td>
                <td style="text-align: center; width: 70px"><span id="ctl00_ContentPlaceHolder1_lbl_SimShipped">0</span></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$ib_xlsShipped" id="ctl00_ContentPlaceHolder1_ib_xlsShipped" disabled="disabled" title="Export to Excel" src="../Images/xls.jpg" style="border-width:0px;"></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$btn_shipped" id="ctl00_ContentPlaceHolder1_btn_shipped" disabled="disabled" title="Show details" hidefocus="true" src="../Images/folder-open.png" style="border-width:0px;"></td>
              </tr>
              <tr>
                <td colspan="4"></td>
              </tr>
              <tr>
                <td colspan="4"><div class="callHistGrayTinyLine"> </div></td>
              </tr>
              <tr>
                <td><span id="ctl00_ContentPlaceHolder1_Label4" style="font-weight:bold;">Current Inventory:</span></td>
                <td style="text-align: center; width: 70px"><span id="ctl00_ContentPlaceHolder1_lbl_SimNumber">1</span></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$ib_xls" id="ctl00_ContentPlaceHolder1_ib_xls" title="Export to Excel" src="../Images/xls.jpg" onclick="ShowDL_DLG('/Partners/PartnerStock.ashx?R=88880&amp;T=4'); HideDL_DLG();" style="border-width:0px;"></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$btn_inventory" id="ctl00_ContentPlaceHolder1_btn_inventory" title="Show details" hidefocus="true" src="../Images/folder-open.png" style="border-width:0px;"></td>
              </tr>
              <tr>
                <td colspan="4"></td>
              </tr>
              <tr>
                <td colspan="4"><div class="callHistGrayTinyLine"> </div></td>
              </tr>
              <tr>
                <td><span id="ctl00_ContentPlaceHolder1_Label7" style="font-weight:bold;">Total Activated:</span></td>
                <td style="text-align: center; width: 70px"><span id="ctl00_ContentPlaceHolder1_lbl_SimActivatedTotal">1</span></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$ib_xlsactivetotal" id="ctl00_ContentPlaceHolder1_ib_xlsactivetotal" title="Export to Excel" src="../Images/xls.jpg" onclick="ShowDL_DLG('/Partners/PartnerStock.ashx?R=88880&amp;T=6'); HideDL_DLG();" style="border-width:0px;"></td>
                <td style="text-align: center"></td>
              </tr>
              <tr>
                <td><span id="ctl00_ContentPlaceHolder1_lbl_ActivatedReseller">Acivated Comlink:</span></td>
                <td style="text-align: center; width: 70px"><span id="ctl00_ContentPlaceHolder1_lbl_SimActivated">1</span></td>
                <td style="text-align: center"><input type="image" name="ctl00$ContentPlaceHolder1$ib_xlsactive" id="ctl00_ContentPlaceHolder1_ib_xlsactive" title="Export to Excel" src="../Images/xls.jpg" onclick="ShowDL_DLG('/Partners/PartnerStock.ashx?R=88880&amp;T=5'); HideDL_DLG();" style="border-width:0px;"></td>
                <td style="text-align: center"></td>
              </tr>
            </tbody>
          </table>
        </div> 
    <div style="clear:both"></div>
  </div>
  </div>
  <div id="footer">  
	<tiles:insertAttribute name="footer" />
</div> 
</body>
</html>
