<%@ Control Language="vb" AutoEventWireup="true" Codebehind="TextBox.ascx.vb" Inherits="Core_Web.Controls.Base.cTextBox" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>

<input id='txtText' runat='server'>
<input type='hidden' name='<%=ID%>' value=''>
<asp:RequiredFieldValidator id='valReqText' runat='server'
	ControlToValidate='txtText'
	ErrorMessage=''
	Enabled='false'
	Display='none'/>