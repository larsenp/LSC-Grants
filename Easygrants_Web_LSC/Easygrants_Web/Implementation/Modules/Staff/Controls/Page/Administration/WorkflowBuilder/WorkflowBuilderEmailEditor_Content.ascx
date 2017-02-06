<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="WorkFlowBuilderEmailEditor_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder.cWorkFlowBuilderEmailEditor_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />
<br />
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
    <tr><td>&nbsp;</td></tr>
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
	<tr>
		<td><b>Outcome</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td colspan='2'><span id='spnPreviousTaskOutcome' runat='server'/></td>
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
		<DataObject Key='WfProjectTaskOutcome' DataObjectDefinitionKey='WfProjectTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskOutcomeID' PropertyKey='WfProjectTaskOutcomeID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectTask.WfTask.WfTask'>
					<Control ID='lblPreviousTask'
						Container='spnPreviousTask'
						Type='cLabel'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'>
					<Control ID='lblPreviousTaskOutcome'
						Container='spnPreviousTaskOutcome'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProjectTaskOutcomeEvents' DataObjectDefinitionKey='WfProjectTaskOutcomeEvents' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskOutcomeEventsID' PropertyKey='WfProjectTaskOutcomeEventsID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectTaskOutcomeID' PropertyKey='WfProjectTaskOutcomeID' Value=''/>
			</DefaultValues>
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
						DataObjectDefinitionKey='AssignToRoleWorkgroupStaffcontact'
						StoredValue='AssignTo'
						DisplayValue='Description'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Recipient is required.'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskOutcome'
								DataObjectPropertyKey='WfProjectTask.WfTask.WfTaskTypeID' PropertyKey='TaskTypeID' bool=''/>
							<Argument Type='Data' PropertyKey='TaskTypeID' Value='0' Bool='Or'/>
						</Filters>
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
							Object='DataPresenter'
							Method='ClosePage'>
						</Action>
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->