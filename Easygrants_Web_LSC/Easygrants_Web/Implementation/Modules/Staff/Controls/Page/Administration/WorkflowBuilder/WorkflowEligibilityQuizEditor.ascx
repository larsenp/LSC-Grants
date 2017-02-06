<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Eligibility Task Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTask'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Eligibility Question</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Question&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnQuestion' runat="server"></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Valid Answer&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnValidAnswer' runat="server"></span></td>
	</tr>
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
		<DataObject Key='EligibilityTemplateQuestion' DataObjectDefinitionKey='WFProjectTaskEligibilityAnswer' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectTaskEligibilityAnswerID' PropertyKey='ProjectTaskEligibilityAnswerID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='QuestionID'>
					<Control ID='ctlQuestion'
						Container='spnQuestion'
						Type='cDropDown'
						DataObjectDefinitionKey='EligibilityQuestion'
						StoredValue='EligibilityQuestionID'
						DisplayValue='Description'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Question is required.'>
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ValidAnswerID'>
					<Control ID='ctlValidAnswer'
						Container='spnValidAnswer'
						Type='cDropDown'
						DataObjectDefinitionKey='EligibilityAnswer'
						StoredValue='EligibilityAnswerID'
						DisplayValue='Description'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Valid Answer is required.'>
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton' EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkflowEligibilityQuizEditor'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
								<Argument Type='DataObjectCollection' TypeKey='EligibilityTemplateQuestion' DataObjectPropertyKey='ProjectTaskEligibilityAnswerID' PropertyKey='ProjectTaskEligibilityAnswerID' BaseValue='ProjectTaskEligibilityAnswerID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkflowEligibilityQuizBuilder'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
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
								<Argument AttributeName='PageKey' Value='WorkflowEligibilityQuizBuilder'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>