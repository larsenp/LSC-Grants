<%@ Control Language="vb" AutoEventWireup="true" Codebehind="TextArea.ascx.vb" Inherits="Core_Web.Controls.Base.cTextArea" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>

<textarea id='txtText' runat='server'>
</textarea>
<asp:RequiredFieldValidator id='valReqText' runat='server'
	ControlToValidate='txtText'
	ErrorMessage=''
	Enabled='false'
	Display='none'/>
<asp:CustomValidator 
	id='valLength'
	runat='server'
	ErrorMessage='The text length in the text area is too long.'
	OnServerValidate='ValidateLength'
	Display='none'/>
<asp:CustomValidator 
	id='valXML'
	runat='server'
	ErrorMessage='Well formed XML is required.'
	OnServerValidate='ValidateXML'
	Display='none'/>
<asp:CustomValidator 
	id='ValWordLength'
	runat='server'
	ErrorMessage='The Word Count in the text area is too long.'
	OnServerValidate='ValidateWordCount'
	Display='none'/>