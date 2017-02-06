<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="WorkflowEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cWorkflowEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b><%=PrevTaskHeader%></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Task&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlPrevTask' Type='cDropDown' runat='server' id="ctlPrevTaskLoader" /></td>
	</tr>
	<tr id='trPrevTaskOutcome' runat='server'>
		<td width='200'><b>Outcome&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnPrevTaskOutcome' runat='server'/>
			<asp:CustomValidator id="valValidateNextTask" runat="server"
				OnServerValidate="ValidateNextTask"
				Display="None"
				ErrorMessage=""/>
		</td>
	</tr>
	<tr>
		<td valign='top' width='200' nowrap><b>Advanced Filter</b></td>
		<td width='10'>&nbsp;</td>
		<td valign='top'>
			<span id='spnAdvancedFilter' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id='tblNextTaskInfo' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Next Task Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Task&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<Core:cUserCtlLoader CtlID='ctlNextTask' Type='cDropDown' runat='server' id="ctlNextTaskLoader" />
		</td>	
	</tr>
	<tr>
		<td width='200'><b>Default Outcome</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskDefOutcome' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td width='200'><b>Default Status</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskStatus' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td width='200'><b>Submitted Outcome</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskSubmittedOutcome' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td width='200'><b>Assign To</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskAssignTo' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td width='200'><b>Start Date&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnStartDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td width='200'><b>Open Date&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnOpenDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td width='200'><b>Due Date&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDueDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td width='200'><b>Close Date&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCloseDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td width='200'><b>End Date&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEndDate' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
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
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Processing</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAddProcessing'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnProcessingList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan='4' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveClose'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID'
					PropertyKey='WfProjectID' Value='' bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WfProjectTaskOutcome' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskOutcomeID'
					PropertyKey='WfProjectTaskOutcomeID' Value='' bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='PreviousTask' DataObjectDefinitionKey='WfTaskOutcome' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskOutcome'
					PropertyKey='WfTaskOutcomeID' DataObjectPropertyKey='TaskOutcomeID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlPrevTaskOutcome'
						Container='spnPrevTaskOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						DisplayNone='False'
						RequiredField='False'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskOutcome'
								PropertyKey='WfTaskID' DataObjectPropertyKey='WfProjectTask.WfTaskID' Value=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome'/>
						</Sort>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='FilterArgument' DataObjectDefinitionKey='FilterArgument' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='FilterArgumentID' PropertyKey='FilterArgumentID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ArgXml'>
					<Control ID='ctlAdvancedFilter'
						Container='spnAdvancedFilter'
						Type='cTextArea'
						Rows='10'
						Cols='60'
						MaxLength='2000'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='NextTaskEditor' DataObjectDefinitionKey='WfProjectTask' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskOutcome'
					PropertyKey='WfProjectTaskID' DataObjectPropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTaskID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
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
						Type='cButton' EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SavePageAndReload'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
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
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
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
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAddCommunication'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SaveAndRedirect'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkFlowBuilderEmailEditor'/>
								<Argument Type='' TypeKey='' BaseValue='WfProjectTaskOutcomeEventsID=0'/>
								<%--<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>--%>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProjectTaskOutcomeEvents' DataObjectDefinitionKey='WfProjectTaskOutcomeEvents' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskOutcomeID' PropertyKey='WfProjectTaskOutcomeID' Value=''/>
			</Filters>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCommunicationList'
						Container='spnCommunicationList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskOutcomeEvents'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='EventKey.EventCorrespondence.TemplateID' ColumnHeader='Template ID' Width='20%'>
							<Sortable>
								<Argument PropertyKey='TemplateID'>
									<RelatedProperty PropertyKey='EventKey.EventCorrespondence' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EventKey.EventCorrespondence.CorrespondenceDefinition.Title' ColumnHeader='Title' Width='30%'>
							<Sortable>
								<Argument PropertyKey='Title'>
									<RelatedProperty PropertyKey='EventKey.EventCorrespondence.CorrespondenceDefinition' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AssignToRoleWorkgroupStaffcontact.Description' ColumnHeader='Recipient' Width='30%'>
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
									Method='SaveAndRedirect'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkFlowBuilderEmailEditor'/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskOutcomeEventsID' AttributeName='WfProjectTaskOutcomeEventsID' BaseValue='WfProjectTaskOutcomeEventsID='/>
										<%--<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>--%>
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
		
		<DataObject Key='WorkflowEvents' DataObjectDefinitionKey='WorkflowEvents' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskOutcomeID' PropertyKey='WorkflowID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='WorkflowEventTypeID' Value='2'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddProcessing' 
						Type='cButton' 
						Image='Add'
						Container='spnAddProcessing'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SaveAndRedirect'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkflowProjectTaskProcessEditor'/>
								<Argument Type='Data' TypeKey='' BaseValue='WorkflowEventsID=0'/>
								<Argument Type='Data' TypeKey='' BaseValue='WorkflowEventTypeID=2'/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlProcessingList'
						Container='spnProcessingList'
						Type='cDataListCtl'
						SeparatorWidth='2'
						DataObjectDefinitionKey='WorkflowEvents'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='EventManagerEvents.EventName' ColumnHeader='Process Name' Width='30%' >
							 <Sortable>
								<Argument PropertyKey='EventName'>
									 <RelatedProperty PropertyKey='EventManagerEvents'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Order' Width='5%' >
							 <Sortable>
								<Argument PropertyKey='SortOrder'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ProcessType.Description' ColumnHeader='Type' Width='20%' >
							 <Sortable>
								<Argument PropertyKey='Description'>
									 <RelatedProperty PropertyKey='ProcessType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EventManagerEvents.ShortDescription' ColumnHeader='Short Description' Width='30%' >
							 <Sortable>
								<Argument PropertyKey='ShortDescription'>
									 <RelatedProperty PropertyKey='EventManagerEvents'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center' Width='15%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='SaveAndRedirect'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkflowProjectTaskProcessEditor'/>
										<Argument Type='DataObject' TypeKey='WorkflowEventsID' AttributeName='WorkflowEventsID' BaseValue='WorkflowEventsID='/>
										<Argument Type='Data' TypeKey='' BaseValue='WorkflowEventTypeID=2'/>
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
										<Argument Type='DataObject' TypeKey='WorkflowEventsID' AttributeName='WorkflowEventsID'/>
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