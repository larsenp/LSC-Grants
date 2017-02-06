<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
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
        <td  width='25%'><b>Award Term in Years</b></td>
        <td><span id='spnAwardTerm' runat='server'/></td>
     </tr>
     <tr>
       <td width='25%'><b>Total Indirect Cost Rate</b></td>
        <td><span id='spnTotIndCostRate' runat='server'/>%</td>
    </tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
