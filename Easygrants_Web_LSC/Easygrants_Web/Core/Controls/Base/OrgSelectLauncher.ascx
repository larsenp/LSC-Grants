<%@ Control Language="vb" AutoEventWireup="true" Codebehind="OrgSelectLauncher.ascx.vb" Inherits="Core_Web.Controls.Base.cOrgSelectLauncher" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>

<table border='0' cellpadding='0' cellspacing='0' width='100%' runat='server'>
	<tr id='trOrgName'>
		<td valign='top'>
			<input type='text' id='txtOrgName' runat='server' size='50' readonly onFocus='this.blur()'>
			<asp:RequiredFieldValidator id='valReqText' runat='server'
				ControlToValidate='txtOrgName'
				ErrorMessage=''
				Enabled='false'
				Display='none'/>
			<input type='hidden' id='hdnOrgID' runat='server'/>
			<input type='hidden' name='hdnpopup_1' value=''>
			&nbsp;&nbsp;
			<a href="javascript:PopUp('<%=WebAppl.Build_RootURL("Core/Controls/Base/pgOrgSelectPopUp.aspx")%>', 'hdnpopup_1', 'ctlEducationLevel')"><img SRC="<%=WebAppl.Build_RootURL("Core/images/Select___.jpg")%>" border="0"></a>
		</td>
	</tr>
</table>
