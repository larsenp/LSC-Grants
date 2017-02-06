<%@ Control Language="vb" AutoEventWireup="true" Codebehind="DropDown.ascx.vb" Inherits="Core_Web.Controls.Base.cDropDown" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<asp:DropDownList id='selDropDown' runat='server'>
</asp:DropDownList>
<asp:RequiredFieldValidator id='valReqDropDown' runat='server'
	ControlToValidate='selDropDown'
	Enabled='false'
	Display='none'/>
<asp:RangeValidator id="valRangeDropDown"
	ControlToValidate='selDropDown'
	Enabled='false'
	Display='none'
	runat="server"/>			
