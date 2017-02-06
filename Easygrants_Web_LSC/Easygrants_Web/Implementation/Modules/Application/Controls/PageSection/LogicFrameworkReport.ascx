<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cLogicFrameworkReport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table border='0' width='100%' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td colspan="4" align="Center" class="SeparatorHdg"><b><span runat='server' id='spnTaskName'/></b></td>
	</tr>
	<tr>
		<td colspan="4" align="Center" class="SeparatorHdg"><b><span runat='server' id='spnModuleName'/></b></td>
	</tr>	
</table>
<br>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server' ID="Table1">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td ><b>Long-term Project Outcome</b></td>
	</tr>
	<tr>
		<td colspan='5'><span runat='server' id='spnOutcomesandIndicatorsReport'/></td>
	</tr>
</table>
<br>



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<!-- End Embedded XML -->
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='LogicframeworkreportWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>			
				<DisplayProperty PropertyKey='WfProjectTask.WfTask.WfTask'>
					<Control ID='spnTaskName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
		<DataObject Key='GranteeProjectLogicFramework' DataObjectDefinitionKey='GranteeProjectLogicFramework' Updatable='True' CreateNew='True' >	
			<Filters>
               <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
            </Filters>	
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOutcomesandIndicatorsReport' Container='spnOutcomesandIndicatorsReport' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/LogicFrameworkReportDetailList.ascx' />
				</DisplayProperty>				               
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>


