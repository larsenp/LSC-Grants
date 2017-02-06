<%@ Control Language="vb" AutoEventWireup="true" Codebehind="DropDownText.ascx.vb" Inherits="Core_Web.Controls.Base.cDropDownText" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<asp:DropDownList id='selDropDown' runat='server'/><asp:ListBox id='ctlListBox' Enabled='false' Height='0' Width='0' runat='server'/>
<br><br>
<asp:Label id='spnText' runat='server'></asp:Label>

<asp:RequiredFieldValidator id='valReqDropDown' runat='server'
	ControlToValidate='selDropDown'
	Enabled='false'
	Display='none'/>
<asp:RangeValidator id="valRangeDropDown"
	ControlToValidate='selDropDown'
	Enabled='false'
	Display='none'
	runat="server"/>