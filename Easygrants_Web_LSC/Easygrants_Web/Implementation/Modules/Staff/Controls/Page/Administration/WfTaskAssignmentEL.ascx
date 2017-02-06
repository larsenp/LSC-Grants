<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cFilterListDataPresenterCtl"%>
<!-- USER MODIFIABLE CONTENT AREA -->
<table width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Filter Criteria
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Task
		</td>
		<td>
			<span runat='server' id='spnTask'/>
		</td>
	</tr>
	<tr>
		<td>
			Role
		</td>
		<td>
			<span runat='server' id='spnRole'/>
		</td>
	</tr>
	<tr>
		<td>
			Status
		</td>
		<td>
			<span runat='server' id='spnStatus'/>
		</td>
	</tr>
	<tr>
		<td>
			Outcome
		</td>
		<td>
			<span runat='server' id='spnOutcome'/>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnFind'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnList'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Filter' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTask'
						Type='cDropDown'
						Container='spnTask'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'
						FilterProperty='WfTaskID'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlRole'
						Type='cDropDown'
						Container='spnRole'
						DataObjectDefinitionKey='WfTaskRole'
						StoredValue='WfTaskRoleID'
						DisplayValue='WfTaskRole'
						FilterProperty='WfTaskRoleID'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStatus'
						Type='cDropDown'
						Container='spnStatus'
						DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatus'
						FilterProperty='WfTaskStatusID'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOutcome'
						Type='cDropDown'
						Container='spnOutcome'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						FilterProperty='WfTaskOutcomeID'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind'
						Type='cButton'
						Container='spnFind'
						Image='Find'>
						<Action
							PostBack='True'
							Object='ModulePageContent'
							Method='FilterListDataPresenter_Find'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='List' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' GetData='False'>
			<Filters>
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
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						DataObjectDefinitionKey='Person'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Find Results
						</HeaderHtml>
						<InstructionHtml>
							For more information or options regarding each of the items returned by the search, use the drop-down
							list next to the item you're interested in to choose an action, then click the <b>OK</b> button next 
							to that item.
						</InstructionHtml>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnGo'
								Type='cButton'
								Image='OK'>
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
						<DisplayProperty PropertyKey='' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'/>
								<Filters>
									<Argument Type='DataPresenter' TypeKey='DataObjectDefinitionKey' PropertyKey='DataObjectDefinitionKey'/>
										<RelatedProperty PropertyKey='EasylistActionType'/>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
								</Sort>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Name'/>
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole' ColumnHeader='Role'/>
						<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='ID'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>