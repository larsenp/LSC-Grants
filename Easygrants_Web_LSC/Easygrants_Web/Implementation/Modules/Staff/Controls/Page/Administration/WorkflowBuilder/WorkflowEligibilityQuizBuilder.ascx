<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cWorkflowEligibilityQuizBuilder" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>
<span runat="server" id="errMsg"></span>
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Eligibility Task Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task</b></td>
		<td>
			<span runat='server' id='spnTask'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Eligibility Template</b></td>
		<td>
			<span runat='server' id='spnTemplate' visible='true'></span><span runat='server' id='spnGo' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Eligibility Questions</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' width='70%' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnAddQuestions'></span>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnQuestionsList' visible='true'></span>
		</td>
	</tr>
	<td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td align='left'>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='EligibilityTemplate' DataObjectDefinitionKey='EligibilityTemplate' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='EligibilityTemplateID'>
					<Control ID='ctlTemplate'
						Container='spnTemplate'
						Type='cDropDown'
						DataObjectDefinitionKey='EligibilityTemplate'
						StoredValue='EligibilityTemplateID'
						DisplayValue='TemplateName'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Eligibility Template is required.'>
						<Sort>
							<Argument PropertyKey='TemplateName'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnGo'
						Container='spnGo'
						Type='cButton'
						Image='Go'
						Confirmation='Are you sure you want to use this Eligibility Template? Note: This will replace the existing Eligibility Questions. This action cannot be undone.'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CopyTemplateQuestions'>
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
								<Argument AttributeName='PageKey' Value='EligibilityWorkflow'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WFProjectTaskEligibilityAnswer' DataObjectDefinitionKey='WFProjectTaskEligibilityAnswer' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddQuestions' 
						Type='cButton' 
						Image='Add'
						Container='spnAddQuestions'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='WorkflowEligibilityQuizEditor'/>
									<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
									<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
									<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
									<Argument Type='Data' TypeKey='' BaseValue='ProjectTaskEligibilityAnswerID=0'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlQuestionsList'
						Container='spnQuestionsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WFProjectTaskEligibilityAnswer'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='EligibilityQuestion.Description' ColumnHeader='Question' Width='65%'>
							<%--<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='EligibilityQuestion' />
								</Argument>
							</Sortable>--%>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EligibilityAnswer.Description' ColumnHeader='Valid Answer' Width='15%'>
							<%--<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='EligibilityAnswer' />
								</Argument>
							</Sortable>--%>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='WorkflowEligibilityQuizEditor'/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
										<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
										<Argument Type='DataObject' TypeKey='ProjectTaskEligibilityAnswerID' AttributeName='ProjectTaskEligibilityAnswerID' BaseValue='ProjectTaskEligibilityAnswerID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete1'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='ProjectTaskEligibilityAnswerID' AttributeName='ProjectTaskEligibilityAnswerID' Value=''/>
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