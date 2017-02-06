<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" EnableViewState="false" %>
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Task Builder (Eligibility)</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAddEligibilityTask'></span>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnEligibilityTaskList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Task Builder</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAddTask'></span>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnTaskList' visible='true'></span>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='EligibilityWfTask' DataObjectDefinitionKey='WfTask' Updatable='False'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='WfTaskModuleConfigID' Value='0' Operator='GreaterThan'>
					<RelatedProperty PropertyKey='WfTaskModuleConfig' />
				</Argument>
				<Argument Type='Data' TypeKey='' PropertyKey='WfTaskTypeID' Value='5'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='WfTask'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddEligibilityTask' 
						Type='cButton' 
						Image='Add'
						Container='spnAddEligibilityTask'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='EligibilityTaskBuilderEditor'/>
									<Argument Type='Data' TypeKey='' BaseValue='WfTaskID=0'/>
									<Argument Type='Data' TypeKey='' BaseValue='WfTaskTypeID=5'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlEligibilityTaskList'
						Container='spnEligibilityTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTask'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task Name' Width='40%'>
							<Sortable>
								<Argument PropertyKey='WfTask'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='HelpFile' ColumnHeader='Guideline File' Width='40%'>
							<Control ID='ctlEligibilityLink' Type='cLink'>
								<Action PostBack='False' URL='Web' Target='_blank'></Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='HelpFile'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnEligibilityEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='EligibilityTaskBuilderEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>
										<Argument Type='DataObject' TypeKey='WfTaskTypeID' AttributeName='WfTaskTypeID' BaseValue='WfTaskTypeID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='20%'>
							<Parameters>
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTasks.WfProjectTaskID' DisplayValue=''/>
								<Argument Value='' ValueKey='WfProjectTasks.WfProjectTaskID' DisplayValue='Control'>
									<Control ID='btnEligibilityDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' Value=''/>
												<RelatedDataObjects>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskModule'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='WfTaskID' childProperty='WfTaskID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskModuleConfig'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='WfTaskID' childProperty='WfTaskID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskModuleConfigNavElement'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='WfTaskID' childProperty='WfTaskID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskModuleConfigPageFrames'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='WfTaskID' childProperty='WfTaskID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
										        </RelatedDataObjects>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='ctlEligibilityCopy'
								Type='cButton'
								Image='Copy'
								Confirmation='Are you sure you want to copy this Task?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CopyTaskEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='WfTask' DataObjectDefinitionKey='WfTask' Updatable='False'>
			<Filters>
				<Argument Type='Data' TypeKey='' PropertyKey='WfTaskModuleConfigID' Value='0' Operator='GreaterThan'>
					<RelatedProperty PropertyKey='WfTaskModuleConfig' />
				</Argument>
				<Argument Type='Data' TypeKey='' PropertyKey='WfTaskTypeID' Value='5' Operator='NotEqual'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='WfTask'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddTask' 
						Type='cButton' 
						Image='Add'
						Container='spnAddTask'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='TaskBuilderEditor'/>
									<Argument Type='Data' TypeKey='' BaseValue='WfTaskID=0'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlTaskList'
						Container='spnTaskList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTask'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task Name' Width='40%'>
							<Sortable>
								<Argument PropertyKey='WfTask'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='HelpFile' ColumnHeader='Guideline File' Width='20%'>
							<Control ID='ctlLink' Type='cLink'>
								<Action PostBack='False' URL='Web' Target='_blank'></Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='HelpFile'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskType.WfTaskType' ColumnHeader='Task Type' Width='20%'>
							<Sortable>
								<Argument PropertyKey='WfTaskType'>
									<RelatedProperty PropertyKey='WfTaskType' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='TaskBuilderEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='20%'>
							<Parameters>
								<Argument Value='' Operator='NotEqual' ValueKey='WfProjectTasks.WfProjectTaskID' DisplayValue=''/>
								<Argument Value='' ValueKey='WfProjectTasks.WfProjectTaskID' DisplayValue='Control'>
									<Control ID='btnEligibilityDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' Value=''/>
										        <RelatedDataObjects>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskModule'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='WfTaskID' childProperty='WfTaskID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskModuleConfig'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='WfTaskID' childProperty='WfTaskID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskModuleConfigNavElement'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='WfTaskID' childProperty='WfTaskID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskModuleConfigPageFrames'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='WfTaskID' childProperty='WfTaskID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
										        </RelatedDataObjects>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='ctlCopy'
								Type='cButton'
								Image='Copy'
								Confirmation='Are you sure you want to copy this Task?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CopyTaskEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>
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