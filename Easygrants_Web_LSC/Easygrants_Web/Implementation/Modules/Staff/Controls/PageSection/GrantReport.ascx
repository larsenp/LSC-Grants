<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grantee Reports</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd' visible='false'></span>
		</td>
	</tr>
	<tr>
		<td colspan='5'>
			Under Construction
		</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GrantReportList' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Group='('/>
					<Argument Type='QueryString'
						TypeKey='GranteeProjectID' 
						PropertyKey='GranteeProjectID'
						Value=''
						Bool=''/>
					<Argument Type='QueryString'
						TypeKey='GranteeProjectID' 
						PropertyKey='GranteeProjectID'
						Value=''
						Bool='Or'>
						<RelatedProperty PropertyKey='GranteeProject'/>
					</Argument>					
				<Argument Group=')' Bool=''/>
				<Argument Group='('/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3' Bool=''>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='5' Bool='Or'>
					<RelatedProperty PropertyKey='WfTask'/>
				</Argument>
				<Argument Group=')' Bool=''/>
				
			</Filters>
			<Sort>
				<Argument PropertyKey='GrantTitle'>	
					<RelatedProperty PropertyKey='GranteeProject'/>
				</Argument>
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
									<Argument AttributeName='PageKey' Value='AssignReportEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='WfTaskAssignmentID=0'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' ConfigurableHeader='True' />
						<DisplayProperty PropertyKey='WfTask.WfTask' ColumnHeader='Task'/>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Person'/>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr' ColumnHeader='Status'/>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='AssignReportEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='TaskID='/>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='PersonID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
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
	