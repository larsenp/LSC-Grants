<%@ Control Language="vb" AutoEventWireup="true" Codebehind="DateTextBox.ascx.vb" Inherits="Core_Web.Controls.Base.cDateTextBox" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<input type='text' size='20' id='txtDate' runat='server'/>
<input type='hidden' name='<%=UniqueID%>' value=''/>
&nbsp;&nbsp;
<span id='spnCalendar' visible='false' runat='server'>
	<a id='ancCalendar' href="javascript:OpenWin('<%=URL%>')">Calendar</a>
</span>
<asp:RequiredFieldValidator id='valReqDate' runat='server'
	ControlToValidate='txtDate'
	Enabled='false'
	Display='none'/>
<asp:RegularExpressionValidator id='valRexDate' runat='server'
	ControlToValidate='txtDate'
	ValidationExpression='^(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$'
	ErrorMessage='The date entered is invalid or not formatted properly.'
	Enabled='false'
	Display='none'/>
<asp:CustomValidator id="valValidateDate" runat="server"
	ControlToValidate="txtDate"
	OnServerValidate="ValidateDate"
    Display="None"
    ErrorMessage="The date entered is not supported by the system."/>
	
	<!--^\d{1,2}\/\d{1,2}\/\d{4}$-->

