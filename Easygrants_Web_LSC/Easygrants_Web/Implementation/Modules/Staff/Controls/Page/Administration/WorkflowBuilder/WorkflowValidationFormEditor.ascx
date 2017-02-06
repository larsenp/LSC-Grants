<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cWorkflowValidationFormEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />

<br />
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Add or Edit Validation</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task Name</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTaskName' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Form Name</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnFormName' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Form Description</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnFormDescription' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnTaskValidation' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign="top"><b>Submission Validation</b></td>
		<td width='10'>&nbsp;</td>
		<td valign="top">
			<span id='spnSubmissionValidation' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' align="center">
			<span id='spnSave' runat='server'></span>&nbsp;&nbsp;<span id='spnSaveAndClose' runat='server'></span>&nbsp;&nbsp;<span id='spnClose' runat='server'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTask' DataObjectDefinitionKey='WfTask' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask'>
					<Control ID='ctlTaskName'
						Container='spnTaskName'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskModuleConfigNavElement' DataObjectDefinitionKey='WfTaskModuleConfigNavElement' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskModuleConfigNavElementID' PropertyKey='WfTaskModuleConfigNavElementID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='StandardForms.Name'>
					<Control ID='ctlFormName'
						Container='spnFormName'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StandardForms.Description'>
					<Control ID='ctlFormDescription'
						Container='spnFormDescription'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTaskValidation' 
						Type='cButton' 
						Image='View Form Validation'
						Container='spnTaskValidation'>
							<Action
								PostBack='True'
								Object='DataPresenter'
								Method='ViewFormValidation'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ViewFormValidation'/>
									<Argument Type='QueryString' TypeKey='WfTaskModuleConfigNavElementID' BaseValue='WfTaskModuleConfigNavElementID='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskNavElement' DataObjectDefinitionKey='WfProjectTaskNavElement' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskModuleConfigNavElementID' PropertyKey='WfTaskModuleConfigNavElementID' />
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskModuleConfigNavElementID' PropertyKey='WfTaskModuleConfigNavElementID' />
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubmissionValidation'>
					<Control ID='ctlSubmissionValidation'
						Container='spnSubmissionValidation'
						Type='cTextArea'
						Rows='20'
						Cols='100'
						MaxLength='16000'
						RequiredField='False'>
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
								<Argument AttributeName='PageKey' Value='WorkflowValidationFormEditor'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
								<Argument Type='QueryString' TypeKey='WfTaskModuleConfigNavElementID' BaseValue='WfTaskModuleConfigNavElementID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkflowValidationEditor'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkflowValidationEditor'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>