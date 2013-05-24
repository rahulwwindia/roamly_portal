<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title></title>
    <base target="_self">
    <link href="../styles/style.css" rel="stylesheet" type="text/css" />
    <link href="../styles/style_user.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function Done() {

            var simsel = 'false'

            var radio = document.getElementsByName('rbl_sims');

            for (var j = 0; j < radio.length; j++) {

                if (radio[j].checked)

                    simsel = radio[j].value;

            }





            //		        var uid = document.getElementById('hf_simsn').value;

            var resultok = 'true';

            var inbound = document.getElementById('cb_Inbound').checked;

            var outgoing = document.getElementById('cb_Outgoing').checked;

            var simmsg = document.getElementById('cb_SIM').checked;

            var callback = document.getElementById('cb_Callback').checked;

            var ld = document.getElementById('cb_LD').checked;

            var sms = document.getElementById('cb_SMS').checked;

            var data = document.getElementById('cb_Data').checked;

            var error = document.getElementById('cb_Error').checked;

            var warning = document.getElementById('cb_Warning').checked;

            var simsn = document.getElementById('hf_simsn').value;



            var retstring = resultok + "," + simsel + "," + simsn + "," + inbound + "," + outgoing + "," + simmsg

		        + "," + callback + "," + ld + "," + sms + "," + data + "," + error + "," + warning;

            //var ret = new Array(retstring, simsel, simsn);

            window.returnValue = retstring;

            window.close();

        }



        function Cancel() {

            var resultok = 'false';

            var simsel = 'false'

            var simsn = '';

            //var ret = new Array(resultok, simsel, simsn);

            var retstring = resultok + "," + simsel + "," + simsn;

            window.returnValue = retstring;

            window.close();

        }		    	

    </script>
    </head>

    <body>
    <form name="form1" method="post" action="Monitor_Settings.html" id="form1">
      <div>
        <input type="hidden" name="ToolkitScriptManager1_HiddenField" id="ToolkitScriptManager1_HiddenField" value="" />
        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
        <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
        <input type="hidden" name="__LASTFOCUS" id="__LASTFOCUS" value="" />
        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE0NjM2OTU2MzMPZBYCAgMPZBYCAgMPZBYCZg9kFhICGw8QZGQWAWZkAh0PDxYCHgdFbmFibGVkaGRkAh8PEA8WAh8AaGRkFgFmZAIhDw8WAh8AaGRkAiMPDxYCHwBoZGQCJQ8PFgIfAGhkZAInD2QWBAIBDzwrAA0AZAIDDw9kDxAWA2YCAQICFgMWAh4OUGFyYW1ldGVyVmFsdWVkFgIfAWQWAh8BZBYDAgMCAwIDZGQCKw8PZBYCHgdPbkNsaWNrBQdEb25lKCk7ZAItDw9kFgIfAgUJQ2FuY2VsKCk7ZBgCBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WDAUKY2JfSW5ib3VuZAULY2JfT3V0Z29pbmcFBmNiX1NJTQULY2JfQ2FsbGJhY2sFBWNiX0xEBQZjYl9TTVMFB2NiX0RhdGEFCGNiX0Vycm9yBQpjYl9XYXJuaW5nBQlpYl9zZWFyY2gFDGJ0bl9Db250aW51ZQUKYnRuX0NhbmNlbAUJR3JpZFZpZXcxD2dkHvyoBzs2qMihzMPRfd802iHIuxY=" />
      </div>
      <script type="text/javascript">

//<![CDATA[

var theForm = document.forms['form1'];

if (!theForm) {

    theForm = document.form1;

}

function __doPostBack(eventTarget, eventArgument) {

    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {

        theForm.__EVENTTARGET.value = eventTarget;

        theForm.__EVENTARGUMENT.value = eventArgument;

        theForm.submit();

    }

}

//]]>

</script> 
      <script src="/WebResource.axd?d=llzCaDyqC5ieCy5Yc0Szji6kEF69B9rRARKJ3qSkhe_ex122FwSocFrZGW5esIfmNI_1WRIwbqnzsEwzgJGFG9T3hbg1&amp;t=634244938260000000" type="text/javascript"></script> 
      <script src="/ScriptResource.axd?d=wvtxC3k961rKkt58vFg9VMUTvfxpxARbNP0pOpRokktqalXSj5j4f3R-yiv6KDQ_UelB2oKQF0vMaBSVXAPZAnwMDnRMJeIfQ-6R6WZ-75rM1MFsfU_cYz54wTIQQOPMsX8hIYJCT3HQT5QrGZRNpqd-DueY5m3TZp1SXc22ywsf1Svg0&amp;t=fffffffff9d85fa6" type="text/javascript"></script> 
      <script type="text/javascript">

//<![CDATA[

if (typeof(Sys) === 'undefined') throw new Error('ASP.NET Ajax client-side framework failed to load.');

//]]>

</script> 
      <script src="/ScriptResource.axd?d=K673xuk1RSLsUfB6O-SDqZjF9atPVAw3QwmYTVrb1ygrvrPKOimszE-vhGCvCyNyZrpN08MIy5kMYUHhdccT1caFHSofN09NFoBbxCdICN85kRRKX5_qlsTzLZP07iP-CIYiX5RulPjNkVJP0q-JZwRDfIN2ji3pMSlSGQQGa54_vkGI0&amp;t=fffffffff9d85fa6" type="text/javascript"></script>
      <div>
        <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWFQKAsM+nCgL09ID2CALl5vXOCgLLwqveCwLwwIL+BQLWwqOsDQLPwqPeCwLGn6jpCgKt4LW7BgKm4MKkCgLdhfeNDQK51a/BDQKUuu61AwKpvsFOAra+wU4Ct77BTgK93sjTBALyw8jwCwLhrLKuBgKY8LsdAr3hlqgLFoROeR5MjnAO/edyb5Zc6iLhFb8=" />
      </div>
      <script type="text/javascript">

//<![CDATA[

Sys.WebForms.PageRequestManager._initialize('ToolkitScriptManager1', document.getElementById('form1'));

Sys.WebForms.PageRequestManager.getInstance()._updateControls(['tUpdatePanel1'], [], [], 90);

//]]>

</script>
      <div>
        <div id="UpdatePanel1">
          <table>
            <thead>
              <tr>
                <th colspan="3"> <span id="Label4">MONITOR SETTINGS</span> </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colspan="3" style="text-align: left; border-top: solid 1px black"><span id="Label3">Filter</span></td>
              </tr>
              <tr>
                <td style="padding-left: 10px"><input id="cb_Inbound" type="checkbox" name="cb_Inbound" checked="checked" />
                  <label for="cb_Inbound">Inbound</label></td>
                <td style="padding-left: 10px; width: 80px"><input id="cb_Outgoing" type="checkbox" name="cb_Outgoing" checked="checked" />
                  <label for="cb_Outgoing">Outgoing</label></td>
                <td style="padding-left: 10px"><input id="cb_SIM" type="checkbox" name="cb_SIM" checked="checked" />
                  <label for="cb_SIM">Serv.Messages</label></td>
              </tr>
              <tr>
                <td style="padding-left: 10px"><input id="cb_Callback" type="checkbox" name="cb_Callback" checked="checked" />
                  <label for="cb_Callback">Call Forwarding</label></td>
                <td colspan="2" style="padding-left: 10px"><input id="cb_LD" type="checkbox" name="cb_LD" checked="checked" />
                  <label for="cb_LD">Long Distance</label></td>
              </tr>
              <tr>
                <td style="padding-left: 10px"><input id="cb_SMS" type="checkbox" name="cb_SMS" checked="checked" />
                  <label for="cb_SMS">SMS</label></td>
                <td colspan="2" style="padding-left: 10px"><input id="cb_Data" type="checkbox" name="cb_Data" checked="checked" />
                  <label for="cb_Data">GPRS</label></td>
              </tr>
              <tr>
                <td style="padding-left: 10px"><input id="cb_Error" type="checkbox" name="cb_Error" checked="checked" />
                  <label for="cb_Error">Error</label></td>
                <td colspan="2" style="padding-left: 10px"><input id="cb_Warning" type="checkbox" name="cb_Warning" checked="checked" />
                  <label for="cb_Warning">Warning</label></td>
              </tr>
              <tr>
                <td colspan="3" style="text-align: left; border-top: solid 1px black"><span id="Label5">SIM card</span></td>
              </tr>
              <tr>
                <td colspan="3"><table width="100%">
                    <tbody>
                    <tr>
                        <td style="text-align: left; padding-left: 10px"><span id="Label6">Show data for</span></td>
                        <td style="text-align: left;" colspan="2"><table id="rbl_sims" border="0" style="font-family:Arial;font-size:Small;">
                            <tr>
                            <td><input id="rbl_sims_0" type="radio" name="rbl_sims" value="false" checked="checked" />
                                <label for="rbl_sims_0">All cards</label></td>
                            <td><input id="rbl_sims_1" type="radio" name="rbl_sims" value="true" onclick="javascript:setTimeout('__doPostBack(\'rbl_sims$1\',\'\')', 0)" />
                                <label for="rbl_sims_1">Selected only</label></td>
                          </tr>
                          </table></td>
                      </tr>
                    <tr>
                        <td style="width: 140px; padding-left: 10px; text-align: right"><span id="lbl_Search" disabled="disabled">Find SIM by:</span></td>
                        <td colspan="2" style="width: 150px; padding-left: 10px; text-align: left"><select name="ddl_simsearch" id="ddl_simsearch" disabled="disabled" style="width:150px;">
                            <option selected="selected" value="0">SIM Serial Number </option>
                            <option value="1">Home MSISDN </option>
                            <option value="2">Customer ID </option>
                          </select></td>
                      </tr>
                    <tr>
                        <td style="width: 140px; padding-left: 10px; text-align: right"><span id="lbl_SearchText" disabled="disabled">Search text:</span></td>
                        <td style="width: 110px; padding-left: 10px; text-align: center"><input name="tb_Search" type="text" id="tb_Search" disabled="disabled" style="width:120px;" /></td>
                        <td style="width: 120px; padding-left: 10px; text-align: right"><input type="image" name="ib_search" id="ib_search" disabled="disabled" hideFocus="true" src="../Images/searchTn1.png" style="height:25px;width:80px;border-width:0px;" /></td>
                      </tr>
                    <tr>
                        <td colspan="3"></td>
                      </tr>
                    <tr>
                        <td colspan="3"><div id="PanelDummy" style="height:180px;width:100%;text-align:center;"> </div></td>
                      </tr>
                    <tr>
                        <td colspan="3" style="text-align: center; border-top: solid 1px black"><input type="button" class="blue-button" value="Continue" id="ctl00_ContentPlaceHolder1_btn_ZeroActivate" name="ctl00$ContentPlaceHolder1$btn_ZeroActivate">
                        <input type="button" class="blue-button" value="Cancel" id="ctl00_ContentPlaceHolder1_btn_ZeroActivate" name="ctl00$ContentPlaceHolder1$btn_ZeroActivate"></td>
                      </tr>
                  </tbody>
                  </table></td>
              </tr>
            </tbody>
          </table>
          <input type="hidden" name="hf_simsn" id="hf_simsn" value="Empty" />
        </div>
      </div>
      <script type="text/javascript">

//<![CDATA[

Sys.Application.initialize();

//]]>

</script>
    </form>
</body>
</html>
