<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ThirdPartyBuilderEditor_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cThirdPartyBuilderEditor_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Parent Task</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnParentTask' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Related Task Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTask' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Default Outcome</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskDefOutcome' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Default Status</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskStatus' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Submitted Outcome</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskSubmittedOutcome' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Assign To</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskAssignTo' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Start Date</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnStartDate' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Open Date</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnOpenDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Due Date</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDueDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Close Date</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCloseDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>End Date</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEndDate' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id="tblNotifyCommunication" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Notification Communication</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAddNotifyCommunication'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnNotifyCommunicationList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id="tblCommunication" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Submission Communication</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAddCommunication'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnCommunicationList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='4' align=center>
			<span id='spnSave' runat='server'></span><span id='spnSaveAndClose' runat='server'></span><span id='spnClose' runat='server'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ParentProjectTaskID'>
					<Control ID='ctlParentTask'
						Container='spnParentTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfProjectTaskID'
						DisplayValue='WfTask.WfTask'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Parent Task: Task is required.'>
						<Filters>
							<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
							<Argument Type='QueryString' TypeKey='TaskTypeID' PropertyKey='WfTaskTypeID' Value=''>
								<RelatedProperty PropertyKey='WfTask' />
							</Argument>
							<Argument Type='' TypeKey='' PropertyKey='ParentProjectTaskID' Value=''/>
							<Argument Type='QueryString' TypeKey='WfBuilderPageKey' PropertyKey='Description'>
								<RelatedProperty PropertyKey='WorkflowType'/>
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask'>
								<RelatedProperty PropertyKey='WfTask' />
							</Argument>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProjectTaskID'>
					<Control ID='ctlNextTask'
						Container='spnNextTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfProjectTaskID'
						DisplayValue='WfTask.WfTask'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Related Task Information: Task is required.'>
						<Filters>
							<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
							<Argument Type='Data' TypeKey='' PropertyKey='WfTaskTypeID' Value='6'>
								<RelatedProperty PropertyKey='WfTask' />
							</Argument>
							<Argument Type='QueryString' TypeKey='WfBuilderPageKey' PropertyKey='Description'>
								<RelatedProperty PropertyKey='WorkflowType'/>
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask'>
								<RelatedProperty PropertyKey='WfTask' />
							</Argument>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='DefaultOutcome.WfTaskOutcome'>
					<Control ID='ctlNextTaskDefOutcome'
						Container='spnNextTaskDefOutcome'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DefaultStatus.WfTaskStatus'>
					<Control ID='ctlNextTaskStatus'
						Container='spnNextTaskStatus'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubmittedOutcome.WfTaskOutcome'>
					<Control ID='ctlNextTaskSubmittedOutcome'
						Container='spnNextTaskSubmittedOutcome'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AssignToRoleWorkgroupStaffcontact.Description'>
					<Control ID='ctlNextTaskAssignTo'
						Container='spnNextTaskAssignTo'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate' DateFormat='MM/dd/yyyy'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cLabel'/>
				</DisplayProperty>
 				<DisplayProperty PropertyKey='OpenDate' DateFormat='MM/dd/yyyy'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DueDate' DateFormat='MM/dd/yyyy'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CloseDate' DateFormat='MM/dd/yyyy'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate' DateFormat='MM/dd/yyyy'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton' 
						EnterKey='True'
						Image='Save'>
						<Action 
							PostBack='True'
							Object='DataPresenter'
							Method='SavePageAndReload'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SavePageAndClose'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='WfBuilderPageKey' Value=''/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
								<Argument Type='QueryString' TypeKey='WfTaskTypeID' BaseValue='WfTaskTypeID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='WfBuilderPageKey' Value=''/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
								<Argument Type='QueryString' TypeKey='WfTaskTypeID' BaseValue='WfTaskTypeID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProjectTaskOutcomeEventsNotify' DataObjectDefinitionKey='WfProjectTaskOutcomeEvents' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTaskOutcome' />
				</Argument>
				<Argument Type='Data' PropertyKey='ActionID' Value='null' Operator='NotEqual'/>
			</Filters>	
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddNotify' 
						Type='cButton' 
						Image='Add'
						Container='spnAddNotifyCommunication'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='RedirectToThirdPartyNotification'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ThirdPartyEmailEditor'/>
								<Argument Type='Data' TypeKey='' Value='WfProjectTaskOutcomeEventsID=0'/>
								<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCommunicationListNotify'
						Container='spnNotifyCommunicationList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcomeEvents'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='EventKey.EventCorrespondence.TemplateID' ColumnHeader='Template ID' Width='25%'>
							<Sortable>
								<Argument PropertyKey='TemplateID'>
									<RelatedProperty PropertyKey='EventKey.EventCorrespondence' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EventKey.EventCorrespondence.CorrespondenceDefinition.Title' ColumnHeader='Title' Width='20%'>
							<Sortable>
								<Argument PropertyKey='Title'>
									<RelatedProperty PropertyKey='EventKey.EventCorrespondence.CorrespondenceDefinition' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ThirdPartyAction.ThirdPartyAction' ColumnHeader='Action' Width='15%'>
							<Sortable>
								<Argument PropertyKey='ThirdPartyAction'>
									<RelatedProperty PropertyKey='ThirdPartyAction' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskRole.WfTaskRole' ColumnHeader='Recipient' Width='25%'>
							<Sortable>
								<Argument PropertyKey='WfTaskRole'>
									<RelatedProperty PropertyKey='WfTaskRole' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEditNotify'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='RedirectToThirdPartyNotification'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ThirdPartyEmailEditor'/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeEventsID' AttributeName='WfProjectTaskOutcomeEventsID' BaseValue='WfProjectTaskOutcomeEventsID='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeID' AttributeName='WfProjectTaskOutcomeID' BaseValue='WfProjectTaskOutcomeID='/>
										<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDeleteNotify'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeEventsID' AttributeName='WfProjectTaskOutcomeEventsID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProjectTaskOutcomeEvents' DataObjectDefinitionKey='WfProjectTaskOutcomeEvents' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value=''>
					<RelatedProperty PropertyKey='WfProjectTaskOutcome' />
				</Argument>
				<Argument Type='Data' PropertyKey='ActionID' Value='null'/>
			</Filters>	
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAddCommunication'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='RedirectToSubmissionCommunication'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkFlowBuilderEmailEditor'/>
								<Argument Type='' TypeKey='' Value='WfProjectTaskOutcomeEventsID=0'/>
								<Argument Type='' TypeKey='' Value='ThirdParty=True'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCommunicationList'
						Container='spnCommunicationList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcomeEvents'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='EventKey.EventCorrespondence.TemplateID' ColumnHeader='Template ID' Width='25%'>
							<Sortable>
								<Argument PropertyKey='TemplateID'>
									<RelatedProperty PropertyKey='EventKey.EventCorrespondence' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EventKey.EventCorrespondence.CorrespondenceDefinition.Title' ColumnHeader='Title' Width='35%'>
							<Sortable>
								<Argument PropertyKey='Title'>
									<RelatedProperty PropertyKey='EventKey.EventCorrespondence.CorrespondenceDefinition' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AssignToRoleWorkgroupStaffcontact.Description' ColumnHeader='Recipient' Width='25%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='AssignToRoleWorkgroupStaffcontact' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='RedirectToSubmissionCommunication'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkFlowBuilderEmailEditor'/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeEventsID' AttributeName='WfProjectTaskOutcomeEventsID' BaseValue='WfProjectTaskOutcomeEventsID='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeID' AttributeName='WfProjectTaskOutcomeID' BaseValue='WfProjectTaskOutcomeID='/>
										<Argument Type='' TypeKey='' Value='ThirdParty=True'/>
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
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeEventsID' AttributeName='WfProjectTaskOutcomeEventsID' Value=''/>
										<RelatedDataObjects>
									        <RelatedDataObject DataObjectDefinitionKey='EventCorrespondence'>
										        <RelationshipProperties>
											        <RelationshipProperty parentProperty='EventKeyID' childProperty='EventID' />
										        </RelationshipProperties>
									        </RelatedDataObject>
										</RelatedDataObjects>
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
