<%@ Control Language="vb" AutoEventWireup="true" Inherits="EasyGrants.Controls.Base.cNewGranteeProjectByPerson" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="NewGranteeProjectByPerson.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>
<table width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Select Project
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<Core:cUserCtlLoader CtlID='ctlWfProject' 
				Src='Easygrants/Controls/Base/SelectWfProject.ascx'
				runat='server'
				Properties='DrillDown=True'/>
		</td>
	</tr>
</table>

<Core:cUserCtlLoader CtlID='ctlNewGranteeProjectInfo' 
	Src='Easygrants/Controls/Base/NewGranteeProjectInfo.ascx'
	runat='server'/>

<span runat='server' id='spnConfigXML' visible='False'>
	<ModuleSection>
	</ModuleSection>
</span>
