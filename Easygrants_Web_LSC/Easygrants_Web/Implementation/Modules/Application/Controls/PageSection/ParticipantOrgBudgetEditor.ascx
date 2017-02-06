<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Participant Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table  cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
     <tr>
        <td width='25%'><b><%=GetLabel("Organization")%> Name</b></td>
        <td><span id='spnProgram' runat='server'/></td>
    </tr>    
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Budget Requirements</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table  cellspacing='0' cellpadding='2' runat='server' border='0' width='100%'>
     <tr>
        <td width='25%'><b>Total Budget Limit</b></td>
        <td><span id='spnBudgetLimit' runat='server'/></td>
    </tr>    
     <tr>
        <td width='25%'><b>Award Term in Years</b></td>
        <td><span id='spnAwardTerm' runat='server'/></td>
    </tr>    
     <tr>
        <td width='25%'><b>Total Indirect Cost Rate</b></td>
        <td><span id='spnTotIndCostRate' runat='server'/>%</td>
    </tr>    
     <tr>
        <td width='25%'><b>Your Current Budget Total</b></td>
        <td><b><span id='spnCurBudgetTot' runat='server'/></b></td>
    </tr>      
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Budget Detail</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/Page/BudgetDetailsEditor.ascx'
	runat='server'/>
	
	<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>	
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID' />
			</Filters>			
			<DisplayProperties>	
				<DisplayProperty PropertyKey='AwardTerm'>
					<Control ID='spnAwardTerm'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalBudgetLimit' Format='$#,#.##'>
					<Control ID='spnBudgetLimit'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IndirectCostLimit' Format='###0.##' >
					<Control ID='spnTotIndCostRate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool=''/>
				<Argument Type='QueryString' TypeKey='BudgetID' PropertyKey='BudgetID' Value='' 	Bool='And'/>
				<Argument Type='' TypeKey='' PropertyKey='EntityTypeID' Value='2'/>
			</Filters>			
			<DisplayProperties>
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
					<Control ID='spnProgram' Type='HtmlGenericControl'> </Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Total' Format='$#,#.##'>
					<Control ID='spnCurBudgetTot'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>			
	</ModuleSection>
</span>		