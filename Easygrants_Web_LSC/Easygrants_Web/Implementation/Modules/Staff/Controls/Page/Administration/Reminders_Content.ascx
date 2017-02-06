<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Reminders</b></td>
</tr>	
</table>
<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Reminder' DataObjectDefinitionKey='Reminder'>
			<Filters>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description' Direction='Ascending'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ReminderEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='ReminderID=0'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Reminder'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Reminder' Width='30%'>
							<Sortable>
							    <Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>					
						<DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Task' Width='20%'>
							<Sortable>
							   <Argument PropertyKey='Description'>
							        <RelatedProperty PropertyKey='WfProjectTask'/>
							    </Argument> 
							</Sortable>
						 </DisplayProperty>					
						<DisplayProperty PropertyKey='DaysToRemind' ColumnHeader='Days' Width='10%' />
						<DisplayProperty PropertyKey='ReminderBefore.Description' ColumnHeader='Before/After' Width='10%' />
						<DisplayProperty PropertyKey='ReminderTarget.Description' ColumnHeader='Target Date' Width='10%' />
						<DisplayProperty PropertyKey='IsEnabled' ColumnHeader='Enabled' Format='YesNo' Width='10%' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='10%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReminderEditor'/>
										<Argument Type='DataObject' TypeKey='ReminderID' AttributeName='ReminderID' BaseValue='ReminderID='/>
										<Argument Type='DataObject' TypeKey='ProgramID' AttributeName='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='DataObject' TypeKey='CompetitionID' AttributeName='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='DataObject' TypeKey='WfProjectID' AttributeName='WfProjectID' BaseValue='WfProjectID='/>										
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='ReminderID' AttributeName='ReminderID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
