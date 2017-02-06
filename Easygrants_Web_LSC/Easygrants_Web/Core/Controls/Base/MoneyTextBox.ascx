<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cMoneyTextBox" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="MoneyTextBox.ascx.vb" %>
<input id='txtText' runat='server'>
<input type='hidden' name='<%=ID%>' value=''>

<asp:RequiredFieldValidator id='valReqText' runat='server'
	ControlToValidate='txtText'
	ErrorMessage=''
	Enabled='false'
	Display='none'/>

<!--The following regular expression validator serves only to ensure that no invalid characters are entered.
Full validation of comma placement and decimal places is handled by the custom validators.
-->

<span id='SpnCurrencyRegex' runat='server' visible='False'>^\s*-?[\d,]*(\.\d)?\d*\s*$</span>
<asp:CustomValidator id='valCusFormats' runat='server'
	ErrorMessage='The currency field is improperly formatted.'
	Enabled='true'
	Display='none'
	OnServerValidate='ValidateCurrencyField'/>



<SCRIPT LANGUAGE="JavaScript">
	
</SCRIPT>