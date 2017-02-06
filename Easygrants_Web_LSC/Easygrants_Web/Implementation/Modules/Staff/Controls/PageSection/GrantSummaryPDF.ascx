<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantSummaryPDF.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cGrantSummaryPDF" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grant Summary</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Name information) -->
	<tr>
		<td	valign="top" width="140"><b>Primary Contact</b></td>
		<td width="400">
			<span id='spnPrimaryPerson' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td	valign="top" width="140"><b><%=GetLabel("Organization")%></b></td>
		<td width="400">
			<span id='spnPrimaryOrganization' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td	valign="top" width="140"><b>Grant Number</b></td>
		<td width="400">
			<span id='spnNumber' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td	valign="top" width="140"><b><%=GetLabel("ProgramName")%></b></td>
		<td width="400">
			<span id='spnProgram' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td	valign="top" width="140"><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td width="400">
			<span id='spnCompetition' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%>&nbsp;&nbsp;</b></td>
		<td colspan=3>
			<span id='spnProject' runat='server'/>
		</td>
	</tr>
	<tr visible='false'>
		<td>&nbsp;</td>
	</tr>
	<tr visible='false'>
		<td>&nbsp;&nbsp;</td>
		<td colspan=3>
			<span id='spnGrantSummaryEditor' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Available PDFs</b></td>
	</tr>
</table>
<table id='tbPDF' border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Select PDF Type To View</b>&nbsp;&nbsp;<span id='spnDefinition' runat='server'/></td>
		<td></td>
	</tr>
	<tr id='trViewPDF' runat='server'>
		<td>
			<Core:cUserCtlLoader CtlID='ctlGrantReportLink' Type='cReportOutputLink' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='spnPrimaryPerson'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnPrimaryOrganization'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='spnNumber'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnProject'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='GranteeProject' -->

		<DataObject Key='WfProjectPDF' DataObjectDefinitionKey='WfProjectPDF'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID'
					Value='' bool=''/>
			</Filters>
		</DataObject><!-- Key='WFProject' -->
		
		<DataObject Key='ReportOutputDefinition' DataObjectDefinitionKey='ReportOutputDefinition'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfProjectPDF'
					DataObjectPropertyKey='FinalPDFReportKey'
					PropertyKey='Key' Value='' bool=''/>
			</Filters>
		</DataObject>
		
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<!--
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID' Value='' bool=''/>
				-->
				<Argument Type='' TypeKey='' PropertyKey='WfTaskRoleID'
					Value='1' bool='And'/>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='PrimaryPersonID'
					PropertyKey='PersonID' Value='' bool='And'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlDefinition'
						Container='spnDefinition'
						Type='cDropDown'
						DataObjectDefinitionKey='ReportOutputDefinition'
						StoredValue='ReportOutputDefinitionID'
						DisplayValue='Description'>
						<SelectedValue>
							<Argument Type='QueryString' 
								TypeKey='DefinitionID'
								PropertyKey='ReportOutputDefinitionID'
								Value=''/>
						</SelectedValue>
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='EntityDataObjectKey'
								Value='WfTaskAssignment' bool=''/>
						</Filters>
			
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantReportLink'
						Type='cReportOutputLink'
						DisplayText=''>
						<Parameters>
							<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' Value=''/>
							<Argument Type='Control' TypeKey='ctlDefinition' ControlPropertyKey='SelectedValue' PropertyKey='DefinitionID' Value='' />
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key='AppWfTA' -->

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit' 
						Type='cButton' 
						Image='Edit'
						Container='spnGrantSummaryEditor'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='GrantSummaryEditor'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryPersonID' BaseValue='PrimaryPersonID=' />
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' BaseValue='PrimaryOrganizationID=' />
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject><!-- Key=Base -->
	</ModuleSection>
<!-- End Embedded XML -->
</span>
