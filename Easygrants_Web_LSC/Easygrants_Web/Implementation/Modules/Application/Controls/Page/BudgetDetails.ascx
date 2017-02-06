<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr><td class="SeparatorHdg" colspan='2'><b>Budget Requirements</b></td></tr>
	<tr>
	    <td><b>Total Budget Limit</b></td>
        <td><span runat='server' id='spnBudLimit'/></td>	
	</tr>
	<tr>
	    <td><b>Award Term in Years</b></td>
        <td><span runat='server' id='spnAwardTerm'/></td>	
	</tr>
	<tr>
	    <td><b>Total Indirect Cost Rate</b></td>
        <td><span runat='server' id='spnIndirectCostRate'/>%</td>	
	</tr>
	<tr>
	    <td><b>Your Current Budget Total</b></td>
        <td><span runat='server' id='spnBudTotal'/></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr><td class="SeparatorHdg"><b>Budget Detail</b></td></tr>
</table>
<p>
<Core:cUserCtlLoader CtlID='ctlBudgetDetails' 
	Src='Implementation/Modules/Application/Controls/Page/BudgetDetailsEditor.ascx'
	runat='server' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProject.TotalBudgetLimit' Format='$#,#.##'><Control ID='spnBudLimit' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='WfProject.IndirectCostLimit' Format='###0.##'><Control ID='spnIndirectCostRate' Type='HtmlGenericControl' /> </DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.AwardTerm'><Control ID='spnAwardTerm' Type='HtmlGenericControl' /> </DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	    <DataObject Key='BudgetRequirements' DataObjectDefinitionKey='BudgetRequirements' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey='BudgetTotal' Format='$#,#.##'><Control ID='spnBudTotal' Type='HtmlGenericControl'/> </DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->