<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PasswordTextBox.ascx.vb" Inherits="Core_Web.Controls.Base.cPasswordTextBox" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<input type='password' id='txtPassword' runat='server'>
<input type='hidden' name='<%=ID%>' value=''>
<asp:RequiredFieldValidator id='valReqPassword' runat='server'
	ControlToValidate='txtPassword'
	ErrorMessage=''
	Enabled='false'
	Display='none'/>
<asp:CustomValidator 
	id='valPassword'
	runat='server'
	ErrorMessage='No space is allowed in a password !'
	OnServerValidate='ValidatePassword'
	Display='none'/>