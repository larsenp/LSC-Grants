<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cWorkflowProjectTaskEditorImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b><%=TaskType%> Task Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTask' runat='server'/>
			<asp:CustomValidator id="valValidateUniqueTask" runat="server"
				OnServerValidate="ValidateUniqueTask"
				Display="None"
				ErrorMessage="This task has already been added to the current funding cycle."/>
		</td>
	</tr>
	<tr>
		<td><b>Description&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDescription' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td>
			Limit: 100 characters
		</td>	
	</tr>
	<tr>
		<td><b>Default Status&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskStatus' runat='server'/>
		</td>	
	</tr>
	<tr id='trDefaultOutcome'>
		<td><b>Default Outcome&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskDefOutcome' runat='server'/>
		</td>	
	</tr>
	<tr id='trSubmittedOutcome'>
		<td><b>Submitted Outcome&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskSubmittedOutcome' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Assign To&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnNextTaskAssignTo' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Start Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnStartDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Open Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnOpenDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Due Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDueDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Close Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCloseDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>End Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEndDate' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Initial Task</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnInitialProjectTask' runat='server'/>
		</td>
	</tr>
	<tr id="trInGrantFile" runat="server" visible="false">
		<td width='200'><b>Available in Grant File?&nbsp;</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAvailableInGrantFile' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id='tblPDFInfo' border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>PDF Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAddPDF'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnPDFList' visible='true'></span>
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
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
    <tr>
        <td colspan='4' align=center><span id='spnSave' runat='server'></span>&nbsp;&nbsp;<span id='spnSaveAndClose' runat='server'></span>&nbsp;&nbsp;<span id='spnClose' runat='server'></span></td>
    </tr>  
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfProjectTaskEditor' DataObjectDefinitionKey='WfProjectTask' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value='' bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value=''/>
				<Argument Type='DataPresenter' TypeKey='WorkflowTypeID' PropertyKey='WorkflowTypeID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskID'>
					<Control ID='ctlNextTask'
						Container='spnNextTask'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Task is required.'>
						<Filters>
							<Argument Type='QueryString' TypeKey='TaskTypeID' PropertyKey='WfTaskTypeID' Bool='Or'/>
							<Argument Type='Data' PropertyKey='WfTaskTypeID' Value='6' Bool='Or'/>
							<Argument Type='Data' PropertyKey='WfTaskTypeID' Value='7' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Description is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DefaultStatusID'>
					<Control ID='ctlNextTaskStatus'
						Container='spnNextTaskStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatus'
						DefaultValue='1'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Default Status is required.'>
						<Sort>
							<Argument PropertyKey='WfTaskStatus'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='DefaultOutcomeID'>
					<Control ID='ctlNextTaskDefOutcome'
						Container='spnNextTaskDefOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Default Outcome is required.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskEditor' PropertyKey='WfTaskID' DataObjectPropertyKey='WfTaskID' bool=''/>
							<Argument Type='' TypeKey='' PropertyKey='ThirdPartyActionID' Value=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubmittedOutcomeID'>
					<Control ID='ctlNextTaskSubmittedOutcome'
						Container='spnNextTaskSubmittedOutcome'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Submitted Outcome is required.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskEditor' PropertyKey='WfTaskID' DataObjectPropertyKey='WfTaskID' bool=''/>
							<Argument Type='' TypeKey='' PropertyKey='ThirdPartyActionID' Value=''/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskOutcome'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='AssignTo'>
					<Control ID='ctlNextTaskAssignTo'
						Container='spnNextTaskAssignTo'
						Type='cDropDown'
						DataObjectDefinitionKey='AssignToRoleWorkgroupStaffcontact'
						StoredValue='AssignTo'
						DisplayValue='Description'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Assign To is required.'>
						<Filters>
							<Argument Type='QueryString' TypeKey='WfTaskTypeID'
								PropertyKey='TaskTypeID' bool=''/>
							<Argument Type='Data' PropertyKey='TaskTypeID' Value='0' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='Start Date is required.'
						NotSupportedDateErrorMessage='Start Date must be mm/dd/yyyy format.'/>
				</DisplayProperty>
 				<DisplayProperty PropertyKey='OpenDate'>
					<Control ID='ctlOpenDate'
						Container='spnOpenDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='Open Date is required.'
						NotSupportedDateErrorMessage='Open Date must be mm/dd/yyyy format.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DueDate'>
					<Control ID='ctlDueDate'
						Container='spnDueDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='Due Date is required.'
						NotSupportedDateErrorMessage='Due Date must be mm/dd/yyyy format.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CloseDate'>
					<Control ID='ctlCloseDate'
						Container='spnCloseDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='Close Date is required.'
						NotSupportedDateErrorMessage='Close Date must be mm/dd/yyyy format.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='True'
						ErrorMessage='End Date is required.'
						NotSupportedDateErrorMessage='End Date must be mm/dd/yyyy format.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='InitialProjectTask'>
					<Control ID='ctlInitialProjectTask'
						Container='spnInitialProjectTask'
						Type='cCheckBox'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantFileAvailabilityID'>
					<Control ID='ctlAvailableInGrantFile'
						Container='spnAvailableInGrantFile'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='False'
						DefaultValue=''
						DataObjectDefinitionKey='GrantFileAvailability'
						StoredValue='GrantFileAvailabilityID'
						DisplayValue='Description'>
					</Control>
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
							AutoSave='True' 
							Object='DataPresenter'
							Method='UpdateWfProjectTaskAndReload'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkflowProjectTaskEditor'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
								<Argument Type='QueryString' TypeKey='WfTaskTypeID' BaseValue='WfTaskTypeID='/>
								<Argument Type='DataObjectCollection' TypeKey='WfProjectTask' DataObjectPropertyKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='WfBuilderPageKey' BaseValue='WfBuilderPageKey='/>
							</Parameters>
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
							AutoSave='True'
							Object='DataPresenter'
							Method='UpdateWfProjectTaskAndClose'>
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
		
		<DataObject Key='PDFList' DataObjectDefinitionKey='WfProjectTaskPDF' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddPDF' 
						Type='cButton' 
						Image='Add'
						Container='spnAddPDF'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SaveAndRedirect'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='PDFReportEditor'/>
								<Argument Type='Data' TypeKey='' BaseValue='WfProjectTaskPDFID=0'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
								<Argument Type='QueryString' TypeKey='WfTaskTypeID' BaseValue='WfTaskTypeID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPDFList'
						Container='spnPDFList'
						Type='cDataListCtl'
						SeparatorWidth='2'
						DataObjectDefinitionKey='WfProjectTaskPDF'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Description' ColumnHeader='PDF Description' Width='30%' >
							 <Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FinalPDFReportKeyLink.Description' ColumnHeader='PDF Key' Width='30%' >
							 <Sortable>
								<Argument PropertyKey='Description'>
								        <RelatedProperty PropertyKey='FinalPDFReportKeyLink'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PDFGenerationID' ColumnHeader='Lock Generated PDFs' Width='20%' >
							 <Sortable>
								<Argument PropertyKey='PDFGenerationID'/>
							</Sortable>
							<Parameters>
								<Argument Value='True' ValueKey='PDFGenerationID' DisplayValue='Yes' />
								<Argument Value='False' ValueKey='PDFGenerationID' DisplayValue='No' />
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center' Width='20%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='SaveAndRedirect'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PDFReportEditor'/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskPDFID' AttributeName='WfProjectTaskPDFID' BaseValue='WfProjectTaskPDFID='/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
										<Argument Type='QueryString' TypeKey='WfTaskTypeID' BaseValue='WfTaskTypeID='/>
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
										<Argument Type='DataObject' TypeKey='WfProjectTaskPDFID' AttributeName='WfProjectTaskPDFID'/>
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
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WorkflowID' Value=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='WorkflowEventTypeID' Value='1'/>
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
								<Argument Type='Data' TypeKey='' BaseValue='WorkflowEventTypeID=1'/>
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
										<Argument Type='Data' TypeKey='' BaseValue='WorkflowEventTypeID=1'/>
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