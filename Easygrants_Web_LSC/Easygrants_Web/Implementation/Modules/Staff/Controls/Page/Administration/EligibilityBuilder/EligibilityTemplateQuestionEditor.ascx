<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Eligibility Quiz Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Eligibility Quiz Name</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnQuizName' runat="server"></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Add or Edit Eligibility Question</b></td>
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
		<DataObject Key='EligibilityTemplate' DataObjectDefinitionKey='EligibilityTemplate' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TemplateName'>
					<Control ID='ctlQuizName'
						Container='spnQuizName'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='EligibilityTemplateQuestion' DataObjectDefinitionKey='EligibilityTemplateQuestions' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EligibilityTemplateQuestionID' PropertyKey='EligibilityTemplateQuestionID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' Value=''/>
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
								<Argument AttributeName='PageKey' Value='EligibilityTemplateQuestionEditor'/>
								<Argument Type='QueryString' TypeKey='EligibilityTemplateID' BaseValue='EligibilityTemplateID='/>
								<Argument Type='DataObjectCollection' TypeKey='EligibilityTemplateQuestion' DataObjectPropertyKey='EligibilityTemplateQuestionID' PropertyKey='EligibilityTemplateQuestionID' BaseValue='EligibilityTemplateQuestionID='/>
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
								<Argument AttributeName='PageKey' Value='EligibilityTemplateEditor'/>
								<Argument Type='QueryString' TypeKey='EligibilityTemplateID' BaseValue='EligibilityTemplateID='/>
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
								<Argument AttributeName='PageKey' Value='EligibilityTemplateEditor'/>
								<Argument Type='QueryString' TypeKey='EligibilityTemplateID' BaseValue='EligibilityTemplateID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>