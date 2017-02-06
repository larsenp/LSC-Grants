<%@ Control Language="vb" AutoEventWireup="true" Inherits="EasyGrants.Controls.Base.cSelectWfProject" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="SelectWfProject.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlSelectComp' 
	Src='Easygrants/Controls/Base/SelectCompetition.ascx'
	runat='server'
	Properties='DrillDown=True'/>

<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr id='trProject' visible='false'>
		<td width='20%'><b><span id='spnProject' runat='server'><%=GetLabel("FundingCycleName")%></span></b></td>
		<td><Core:cUserCtlLoader CtlID='ctlProject' Type='cDropDown' runat='server'/>&nbsp;<Core:cUserCtlLoader CtlID='btnProject' Type='cButton' Properties='Caption=Go' runat='server'/></td>
	</tr>
</table>
<span runat='server' id='spnConfigXML' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>