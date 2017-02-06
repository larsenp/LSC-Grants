<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cAnswerList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="AnswerList.ascx.vb" %>
<table width='100%' borders='0' runat='server' id='tabAnswerList'/>
<asp:CustomValidator 
	id='valCusGeneral'
	runat='server'
	ErrorMessage='if you check an item that has an accompanying text box, you must provide text in the text box.'
	OnServerValidate='ValidateAnswerList'
	Display='none'/>
<asp:CustomValidator 
	id='valCusRequired'
	runat='server'
	ErrorMessage='Check at least one answer.'
	OnServerValidate='ValidateAnswerListRequired'
	Visible='false'
	Display='none'/>