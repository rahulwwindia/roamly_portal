<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<title>Roamly Mobile</title>
<base target="_self">
<link href="../styles/style.css" rel="stylesheet" type="text/css" />
<link href="../styles/MyStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

        function Done() {

            var simsel = 'true'

//            var radio = document.getElementsByName('rbl_sims');

//            for (var j = 0; j < radio.length; j++) {

//                if (radio[j].checked)

//                    simsel = radio[j].value;

//            }





            //		        var uid = document.getElementById('hf_simsn').value;

            var resultok = 'true';

            var simsn = document.getElementById('hf_simsn').value;

            var simvers = document.getElementById('hf_simvers').value;

            var retstring = resultok + "," + simsel + "," + simsn;

            var browserName = navigator.appName;

            if (browserName != "Microsoft Internet Explorer") {

                window.opener.document.getElementById('ctl00_ContentPlaceHolder1_tb_SIMSN').value = simsn;

            }

            else {

                var ret = new Array(resultok, simsn, simvers);

                window.returnValue = ret;

            }

            window.close();

        }



        function Cancel() {

            var resultok = 'false';

            var simsel = 'false'

            var simsn = '';

            var simvers = '';

            var ret = new Array(resultok, simsn, simvers);

            var retstring = resultok + "," + simsel + "," + simsn + "," + simvers;

            window.returnValue = ret;

            window.close();

        }		    	

    </script>
<link href="../styles/style_user.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form name="form1" method="post" action="SIM_Search.html" id="form1">
  <div>
    <input type="hidden" name="ToolkitScriptManager1_HiddenField" id="ToolkitScriptManager1_HiddenField" value="" />
    <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
    <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
    <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTU3MjkyOTE2OA9kFgICAw9kFgICAw9kFgJmD2QWBgIND2QWBAIBDzwrAA0BAA8WBB4LXyFEYXRhQm91bmRnHgtfIUl0ZW1Db3VudGZkZAIDDw9kDxAWA2YCAQICFgMWAh4OUGFyYW1ldGVyVmFsdWVkFgIfAmQWAh8CZBYDAgMCAwIDZGQCDw8PZBYCHgdPbkNsaWNrBQdEb25lKCk7ZAIRDw9kFgIfAwUJQ2FuY2VsKCk7ZBgCBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WAwUJaWJfc2VhcmNoBQxidG5fQ29udGludWUFCmJ0bl9DYW5jZWwFCUdyaWRWaWV3MQ88KwAKAgNmCGZkiGKm6r6bL6drE4EEZt0zUqw/wTc=" />
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
    <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCgKf7+jEAgKpvsFOAra+wU4Ct77BTgK93sjTBALyw8jwCwLhrLKuBgKY8LsdAr3hlqgLAqPiy9sHNA+Qx5LiXNd6NpFdVnNmOcdMsGE=" />
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
            <th style="text-align: center; border-bottom: solid 1px black"> <span id="Label4">SIM SEARCH</span> </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><table width="100%">
                <tbody>
                  <tr>
                    <td style="width: 140px; padding-left: 10px; text-align: right"><span id="lbl_Search">Find SIM by:</span></td>
                    <td colspan="2" style="width: 150px; padding-left: 10px; text-align: left"><select name="ddl_simsearch" id="ddl_simsearch" style="width:150px;">
                        <option selected="selected" value="0">SIM Serial Number </option>
                        <option value="1">Home MSISDN </option>
                        <option value="2">VSIM MSISDN </option>
                      </select></td>
                  </tr>
                  <tr>
                    <td style="width: 140px; padding-left: 10px; text-align: right"><span id="lbl_SearchText">Search text:</span></td>
                    <td style="width: 110px; padding-left: 10px; text-align: center"><input name="tb_Search" type="text" id="tb_Search" style="width:120px;" /></td>
                    <td style="width: 120px; padding-left: 10px; text-align: right"><input type="image" name="ib_search" id="ib_search" hideFocus="true" src="../Images/searchTn1.png" style="height:25px;width:80px;border-width:0px;" /></td>
                  </tr>
                  <tr>
                    <td colspan="3"><div id="PanelSims" style="height:180px;width:100%;text-align:center;">
                        <div>
                          <table class="grid" cellspacing="0" cellpadding="1" border="0" id="GridView1" style="border-collapse:collapse;">
                            <tr>
                              <td colspan="4">Not found.</td>
                            </tr>
                          </table>
                        </div>
                      </div></td>
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
      <input type="hidden" name="hf_simvers" id="hf_simvers" value="Empty" />
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
