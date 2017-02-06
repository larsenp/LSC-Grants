<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form D-1: Actual Expenses</h1></td>
  </tr>
</table>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<div style='width:600' class='SeparatorHdg'>Expenses</div>
<br />
<Core:cUserCtlLoader CtlID='ctlExpenses' 
	Src='Implementation/Modules/GAR/ActualExpenses/Controls/PageSection/ActualExpensesReadOnly.ascx'
	runat='server' ID="Cuserctlloader3"
	Properties='DisplayFundCode=False'/>


<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>

</ModuleSection>
</span>

						<%--<Action PostBack='False'
							URL='/Easygrants_Web_LSC/Implementation/Modules/Home/HomeModuleContent.aspx?Config=HomeModuleConfig&amp;amp;Page=PrintableView&amp;amp;PageFrame=Print'
							Target='_blank'/>--%>

