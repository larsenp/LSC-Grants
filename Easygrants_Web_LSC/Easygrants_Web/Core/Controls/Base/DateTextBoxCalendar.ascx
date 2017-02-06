<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="DateTextBoxCalendar.ascx.vb" Inherits="Core_Web.Controls.Base.cDateTextBoxCalendar" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<input type='text' size='20' id='txt_Date' runat='server' />&nbsp;&nbsp;
<span id='spnCalendar' visible='true' runat='server' style='vertical-align:bottom'>
	<asp:image id="imgCalendar" runat="server" ImageUrl="~/Core/Images/DateTextBox/calendar.gif"></asp:image>
</span>
&nbsp;&nbsp;
<span id='spnTimeControls' runat='server'>
    <asp:DropDownList id='ctlHour' runat='server' >
	    <asp:ListItem Value='1'>1</asp:ListItem>
	    <asp:ListItem Value='2'>2</asp:ListItem>
	    <asp:ListItem Value='3'>3</asp:ListItem>
	    <asp:ListItem Value='4'>4</asp:ListItem>
	    <asp:ListItem Value='5'>5</asp:ListItem>
	    <asp:ListItem Value='6'>6</asp:ListItem>
	    <asp:ListItem Value='7'>7</asp:ListItem>
	    <asp:ListItem Value='8'>8</asp:ListItem>
	    <asp:ListItem Value='9'>9</asp:ListItem>
	    <asp:ListItem Value='10'>10</asp:ListItem>
	    <asp:ListItem Value='11'>11</asp:ListItem>
	    <asp:ListItem Value='12' Selected='True'>12</asp:ListItem>
    </asp:DropDownList>&nbsp;
    <asp:DropDownList id="ctlMinute" runat='server' >
	    <asp:ListItem Value='0'>00</asp:ListItem>
	    <asp:ListItem Value='15'>15</asp:ListItem>
	    <asp:ListItem Value='30'>30</asp:ListItem>
	    <asp:ListItem Value='45'>45</asp:ListItem>
    </asp:DropDownList>&nbsp;
    <asp:DropDownList id="ctlAMPM" runat='server' >
	    <asp:ListItem Value='AM'>AM</asp:ListItem>
	    <asp:ListItem Value='PM'>PM</asp:ListItem>
    </asp:DropDownList>&nbsp;
    <span runat='server' id='spnTimeZone'></span>
</span>

<asp:RequiredFieldValidator id='valReqDate' runat='server'
	ControlToValidate='txt_Date'
	Enabled='false'
	Display='none'/>
<asp:RegularExpressionValidator id='valRexDate' runat='server'
	ControlToValidate='txt_Date'
	ValidationExpression='^(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$'
	ErrorMessage='The date entered is invalid or not formatted properly.'
	Enabled='false'
	Display='none'/>
<asp:CustomValidator id="valValidateDate" runat="server"
	ControlToValidate="txt_Date"
	OnServerValidate="ValidateDate"
    Display="None"
    ErrorMessage="The date entered is not supported by the system."/>