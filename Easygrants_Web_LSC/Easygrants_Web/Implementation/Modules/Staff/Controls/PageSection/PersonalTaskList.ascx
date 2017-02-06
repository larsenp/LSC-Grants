<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Personal Tasks</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonalTaskList' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='PersonID' 
					Value='' 
					Bool=''/>
				<Argument Type='' 
					TypeKey='' 
					PropertyKey='WfTaskStatusID' 
					Value='1' 
					Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeProjectID' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						NoRecordMessage='No personal tasks.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='' NoWrap='True'  Width='200' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='PersonalTask'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey='EasylistAction' Direction='Ascending'/>
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl'/>
										<Argument Type='Object' ObjectType='EventSource'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True'>	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'/>
							</Sortable>
						</DisplayProperty>

						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task Name' >
							<Sortable>
								<Argument PropertyKey='WfTask'>
									<RelatedProperty PropertyKey='WfTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Primary Person' >
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.PersonPrimaryAffiliations.Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='25%'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson.PersonPrimaryAffiliations.Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.DueDate' ColumnHeader='Due Date' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='DueDate'>
									<RelatedProperty PropertyKey='WfProjectTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<!--
						<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WfTA' DebugOnly='False'/>
						<DisplayProperty PropertyKey='OpenDate' ColumnHeader='Open Date'/>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Person'/>
						-->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
