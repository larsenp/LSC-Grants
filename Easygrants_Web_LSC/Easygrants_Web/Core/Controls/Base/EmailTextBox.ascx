<%@ Control Language="vb" AutoEventWireup="true" Codebehind="EmailTextBox.ascx.vb" Inherits="Core_Web.Controls.Base.cEmailTextBox" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>
<input type='text' id='txtEmail' runat='server'>
<input type='hidden' name='<%=ID%>' value=''>
<asp:RegularExpressionValidator id='valRexEmail' runat='server'
	ControlToValidate='txtEmail'	
	ValidationExpression="^(\s*[a-zA-Z0-9_\-\.\']+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z0-9]{2,4})(\]?\s*)$"
	ErrorMessage='The email address you entered is not properly formatted.'
	Display='none'/>
<!-- ValidationExpression="^([a-zA-Z0-9_\-\.\']+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z0-9]{2,4})(\]?)$" -->
<!-- I got the above regular expression from http://www.regxlib.com/. PL 8/2/2002 -->
<asp:RequiredFieldValidator id='valReqEmail' runat='server'
	ControlToValidate='txtEmail'
	ErrorMessage=''
	Enabled='false'
	Display='none'/>