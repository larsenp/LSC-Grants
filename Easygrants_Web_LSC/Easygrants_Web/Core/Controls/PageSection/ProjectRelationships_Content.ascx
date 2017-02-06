<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.PageSection.cProjectRelationships_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- Page Content - Controls -->
<table runat='server' width='100%' borders='0'>
	<tr>
		<td class='SeparatorHdg'>
			Application Project Assignments for <span id='spnPrimaryPerson' runat='server'/> - <span runat='server' id='spnProject'/>
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
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
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
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName'>
					<Control ID='spnPrimaryPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfTask.WfProject.WfProjectName'>
					<Control ID='spnProject'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPeople'
						Container='spnPeople'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Name'/>
						<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole' ColumnHeader='Role'/>
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnView'
								Type='cButton'
								Image='View Person Summary'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='PersonInfo'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' Value=''/>
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
