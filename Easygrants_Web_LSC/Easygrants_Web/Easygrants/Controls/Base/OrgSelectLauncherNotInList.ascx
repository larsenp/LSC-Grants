<%@ Control Language="vb" AutoEventWireup="true" Codebehind="OrgSelectLauncherNotInList.ascx.vb" Inherits="Easygrants_Web.Controls.Base.cOrgSelectLauncherNotInList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>

<table border='0' cellpadding='0' cellspacing='0' width='100%' runat='server'>
	<tr id='trOrgName'>
		<td valign='top' width='30%'>
			<input type='text' id='txtOrgName' runat='server' size='50' readonly onFocus='this.blur()' NAME="txtOrgName"/>
			<asp:RequiredFieldValidator id='valReqText' runat='server'
				ControlToValidate='txtOrgName'
				ErrorMessage=''
				Enabled='false'
				Display='none'/>
			<input type='hidden' id='hdnOrgID' runat='server' NAME="hdnOrgID"/>
			<input type='hidden' name='hdnpopup_1' value=''>						
		</td>
		<td>
			<span id='spnSelect' visible='true' runat='server' valign='top'>
					<a href="javascript:PopUp('<%=WebAppl.Build_RootURL("Easygrants/Controls/Base/pgOrgSelectPopUpNotInList.aspx")%>', 'hdnpopup_1')" class='CSSButtonStyle'>Select</a>
			</span>
		</td>
	</tr>
</table>
