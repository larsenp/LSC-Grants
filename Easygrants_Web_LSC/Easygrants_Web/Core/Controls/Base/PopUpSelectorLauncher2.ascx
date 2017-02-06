<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cPopUpSelectorLauncher2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>

<table border='0' cellpadding='0' cellspacing='0' width='100%' runat='server'>
	<tr id='trObjName'>
		<td valign='top'>
			<span id='spnSelect' visible='true' runat='server'>
				<a href="javascript:LaunchPopUpSelector2('<%=WebAppl.Build_RootURL(URL)%>', '<%=txtObjName.ClientID%>','<%=hdnObjID.ClientID%>', 'ctlEducationLevel' , '<%=Height%>' , '<%=Width%>' )" class="CSSButtonStyle"><%=ButtonText%></a>
			</span>
			&nbsp;&nbsp;&nbsp;<b><%=Label%></b>&nbsp;<input type='text' id='txtObjName' runat='server' size='50' style='border-width:0px' onFocus='this.blur()'>
			</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id='spnClear' visible='false' runat='server'>
				<a href="javascript:ClearSelectedValue('<%=txtObjName.ClientID%>','<%=hdnObjID.ClientID%>')" >Clear</a>
			</span>
			<input type='hidden' id='hdnObjID' runat='server'/>
			&nbsp;&nbsp;
			<asp:CustomValidator id="valRequiredField" runat="server"
				OnServerValidate="ValidateRequiredField"
				Enabled='False'
				Display="None"/>
		</td>
	</tr>
</table>

<script language="JavaScript">
	function LaunchPopUpSelector2(url, value,ObjID, ControlName) {
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
			
		PopUpWindow = window.open(url + "&type=" + value + "&ObjValue=" + ObjID + "&EdType=" + ctlvalue,"Preview","height=<%=Height%>,width=<%=Width%>,top=100,left=400,scrollbars,resizable")
	}
</script>