<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cThirdPartyEmailEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />


<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='4' class="SeparatorHdg"><b>Workflow Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task Information</b></td>
	</tr>
	<tr>
		<td><b>Task</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td colspan='2'><span id='spnPreviousTask' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>E-mail</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>E-mail Template&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnEmailTemplate' runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnEmailTemplateView' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Recipient&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnRecepient' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Action&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAction' runat='server'/>
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
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='lblPreviousTask'
						Container='spnPreviousTask'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProjectTaskOutcomeEvents' DataObjectDefinitionKey='WfProjectTaskOutcomeEvents' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskOutcomeEventsID' PropertyKey='WfProjectTaskOutcomeEventsID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEmailTemplate'
						Container='spnEmailTemplate'
						Type='cDropDown'
						DataObjectDefinitionKey='CorrespondenceDefinition'
						StoredValue='CorrespondenceDefinitionID'
						DisplayValue='Title'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='E-mail Template is required.'>
						<Sort>
							<Argument PropertyKey='Title'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EventRecipientID'>
					<Control ID='ctlRecepient'
						Container='spnRecepient'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskRole'
						StoredValue='WfTaskRoleID'
						DisplayValue='WfTaskRole'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Recipient is required.'>
						<Filters>
							<Argument Type='Data' PropertyKey='TaskTypeID' Value='6'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskRole'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ActionID'>
					<Control ID='ctlAction'
						Container='spnAction'
						Type='cDropDown'
						DataObjectDefinitionKey='ThirdPartyAction'
						StoredValue='ThirdPartyActionID'
						DisplayValue='ThirdPartyAction'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Action is required.'>
						<Sort>
							<Argument PropertyKey='ThirdPartyAction'/>
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
							Object='DataPresenter'
							Method='SavePageAndReload'/>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEmailTemplateView' 
						Type='cButton' 
						Image='View'
						Container='spnEmailTemplateView'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ViewEmailTemplate'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='EmailTemplateEditor'/>
								<Argument Type='Control' TypeKey='ctlEmailTemplate' ControlPropertyKey='SelectedValue' BaseValue='CorrespondenceDefinitionID=' />
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
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ThirdPartyBuilderEditor'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
								<Argument Type='QueryString' TypeKey='WfTaskTypeID' BaseValue='WfTaskTypeID='/>
								<Argument Type='QueryString' TypeKey='WfBuilderPageKey' BaseValue='WfBuilderPageKey='/>
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
								<Argument AttributeName='PageKey' Value='ThirdPartyBuilderEditor'/>
								<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
								<Argument Type='QueryString' TypeKey='CompetitionID' BaseValue='CompetitionID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='TaskTypeID' BaseValue='TaskTypeID='/>
								<Argument Type='QueryString' TypeKey='WfTaskTypeID' BaseValue='WfTaskTypeID='/>
								<Argument Type='QueryString' TypeKey='WfBuilderPageKey' BaseValue='WfBuilderPageKey='/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->