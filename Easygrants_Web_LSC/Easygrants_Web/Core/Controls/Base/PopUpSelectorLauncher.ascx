<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PopUpSelectorLauncher.ascx.vb" Inherits="Core_Web.Controls.Base.cPopUpSelectorLauncher" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>

<table border='0' cellpadding='0' cellspacing='0' width='100%' runat='server'>
	<tr id='trObjName'>
		<td valign='top'>
			<input type='text' id='txtObjName' runat='server' size='50' onFocus='this.blur()'>
			<asp:RequiredFieldValidator id='valReqText' runat='server'
				ControlToValidate='txtObjName'
				ErrorMessage=''
				Enabled='false'
				Display='none'/>
			<input type='hidden' id='hdnObjID' runat='server'/>
			<input type='hidden' name='<%=ID%>hdnpopup_1' value=''>
			&nbsp;&nbsp;
			<span id='spnSelect' visible='true' runat='server' style="vertical-align:top">
				<a href="javascript:LaunchPopUpSelector('<%=WebAppl.Build_RootURL(URL)%>', '<%=ID%>hdnpopup_1', 'ctlEducationLevel')" class="CSSButtonStyle"><%--<img SRC="<%=WebAppl.Build_RootURL("Core/images/Select___.jpg")%>" border="0">--%>Select</a>
			</span>
		</td>
	</tr>
</table>
<script language="JavaScript">
    function LaunchPopUpSelector(url, value, ControlName) {
	    var form = document.forms[0]
	    var ctlvalue
    	
	    ctlvalue = 0;
    	
	    for (i=0; i < form.elements.length; i++)
	    {
    				
		    if (form.elements[i].name == "mPageFrameCtl:ctlPageContent:" + ControlName + ":selDropDown")
		    {
			    ctlvalue = form.elements[i].options[form.elements[i].selectedIndex].value;
		    }
	    }
    	
	    PopUpWindow = window.open(url + "&type=" + value + "&EdType=" + ctlvalue,"Preview","height=<%=Height%>,width=<%=Width%>,top=<%=Top%>,left=<%=Left%>,scrollbars,resizable")
   }
</script>