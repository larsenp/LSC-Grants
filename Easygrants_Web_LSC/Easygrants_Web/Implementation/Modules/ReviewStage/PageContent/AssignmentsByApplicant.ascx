<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ReviewStage.PageContent.cAssignmentsByApplicant" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ register tagprefix='Core' tagname='cCloseWindow' src='../../../../Core/Controls/Base/CloseWindow.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Assignment Details - By Applicant</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%' nowrap='true'><b>Committee Name:</b></td><td><span id='spnReviewCommittee' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td><span runat='server' id='spnClose' visible='true'/></td>
	</tr>	
	<tr>
		<td><span runat='server' id='spnCloseControl' visible='false'/></td>
	</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
	  
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Group='(' Bool=''/>
					<Argument Type='Data' 
						TypeKey=''
						PropertyKey='ReviewPreferenceTypeID' 
						Value='1'
						Bool=''/>
					<Argument Type='Data' 
						TypeKey=''
						PropertyKey='ReviewPreferenceTypeID' 
						Value='2' 
						Bool='Or'/>
				<Argument Group=')' Bool=''/>	
				<Argument Type='QueryString' 
					TypeKey='ReviewCommitteeID'
					PropertyKey='ReviewCommitteeID' 
					Value='' 
					Bool='And'/>
				<Argument Type='Data' 
					TypeKey='WfTaskID' 
					PropertyKey='WfTaskID' 
					Value='22' 
					Bool='And'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='ReviewCommitteeName.ReviewCommitteeDescription'>
					<Control ID='spnReviewCommittee'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Applicant Name'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectInfo.ScienceClassification.Description' ColumnHeader='Applicant Science' />
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='Applicant ~~Organization~~' />
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Reviewer Name' />
						<DisplayProperty PropertyKey='ReviewCommitteeScience.ScienceClassification.Description' ColumnHeader='Reviewer Science' />
						<DisplayProperty PropertyKey='ReviewAssignmentType.Description' ColumnHeader='Assignment' />						
						<DisplayProperty PropertyKey='ReviewPreferenceType.Description' ColumnHeader='Preference' />
						<!-- <DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='AssignmentsEditorByApp'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GPID='/>
										<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
										<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty> -->						
						<!--<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WFTAID' />-->
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
