<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.PageSection.cPersonRelationships_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- Page Content - Controls -->
<table runat='server' width='100%' borders='0'>
	<tr>
		<td class='SeparatorHdg'>
			To Do
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span runat='server' id='spnPeople'/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Roles' DataObjectDefinitionKey='WfTaskAssignment' Updatable=''>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='PersonID' PropertyKey='PersonID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='Person' Join='None'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPeople'
						Container='spnPeople'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'>
						<!--
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='Grantee Project ID'/>
						<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WfTaskAssignment ID'/>
						<DisplayProperty PropertyKey='WfTaskID' ColumnHeader='WfTask ID'/>												
						<DisplayProperty PropertyKey='PersonID' ColumnHeader='Person ID'/>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Name'/>
						-->
						<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole' ColumnHeader='Role'/>
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Primary Applicant Name' />
						<DisplayProperty PropertyKey=''>
							<Control ID='btnView'
								Type='cButton'
								Image='View_Project_Summary'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='ProjectSummary'/>
										<!--<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' Value=''/>-->
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID=' Value=''/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
