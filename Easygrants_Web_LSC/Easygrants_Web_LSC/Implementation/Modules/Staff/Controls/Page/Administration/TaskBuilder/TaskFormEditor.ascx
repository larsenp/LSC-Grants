<%@ Control Language="vb" AutoEventWireup="true" Codebehind="TaskFormEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder.cTaskFormEditor" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register tagprefix='Core' tagname='cLabel' src='../../../../../../../Core/Controls/Base/Label.ascx' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Form</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td><B>Task Name</B></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTaskName'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Form</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnForm' visible='true'></span>
			<asp:CustomValidator id="valUniqueForm" runat="server"
				OnServerValidate="ValidateUniqueForm"
				Display="None"
				ErrorMessage="This form is already added to this task. Each form can be added only once."/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Description</B></td>
		<td width='10'>&nbsp;</td>
		<td>
			<Core:cLabel id="ctlDescription" runat="server" />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Navigation Name</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnNavigationName' visible='true'></span>
			<asp:CustomValidator id="valUniqueNavigationName" runat="server"
				OnServerValidate="ValidateUniqueNavigationName"
				Display="None"
				ErrorMessage="Navigation Name must be unique."/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Help File</B></td>
		<td width='10'>http://</td>
		<td>
			<span runat='server' id='spnHelpFile' visible='true'></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<b>External URL</b>&nbsp;&nbsp;
			<span runat='server' id='spnIsExternalHelpURL' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Sort Order</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnSortOrder' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr runat='server' id='TrSubmissionValidation'>
		<td valign=top><B>Submission Validation</B></td>
		<td width='10'></td>
		<td valign='top'>
			<span runat='server' id='spnSubmissionValidation' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Advanced Configuration</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Enable Form After Submission</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEnableFormAfterSubmission' runat='server'/>
		</td>
	</tr>	
	<tr>
		<td><b>Disable Form Before Submission</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDisableFormBeforeSubmission' runat='server'/>
		</td>
	</tr>	
	<tr>
		<td><b>Enable Form For Resubmission</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnEnableFormForResubmission' runat='server'/>
		</td>
	</tr>	
	<tr>
		<td><b>Add Space Above Navigation Name</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAddSpaceAboveNavName' runat='server'/>
		</td>
	</tr>	
	<tr>
		<td><b>Parent Navigation Item</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnParentNavItem' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveClose'/>
			<span runat='server' id='spnCancel'/>
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
		<DataObject Key='WfTaskModuleConfigNavElement' DataObjectDefinitionKey='WfTaskModuleConfigNavElement' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskModuleConfigNavElementID' PropertyKey='WfTaskModuleConfigNavElementID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='StandardFormsID'>
					<Control ID='ctlForm'
						Container='spnForm'
						Type='cDropDown'
						DataObjectDefinitionKey='StandardForms'
						StoredValue='StandardFormsID'
						DisplayValue='Name'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Form is required.'>
						<Filters>
							<Argument Type='QueryString' TypeKey='MasterFormTypeID' PropertyKey='MasterFormTypeID' >
								<RelatedProperty PropertyKey='StandardFormType'/>
							</Argument>
							<Argument Type='Data' TypeKey='' PropertyKey='IsActive' Value='True'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='Name'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NavTitle'>
					<Control ID='ctlNavigationName'
						Container='spnNavigationName'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Navigation Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='HelpFile'>
					<Control ID='ctlHelpFile'
						Container='spnHelpFile'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsExternalHelpURL'>
					<Control ID='ctlIsExternalHelpURL'
						Container='spnIsExternalHelpURL'
						Type='cCheckBox'
						Selected='True'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='ctlSortOrder'
						Container='spnSortOrder'
						Type='cTextBox'
						Size='3'
						MaxLength='3'
						AllowNumbersOnly="True"
						RequiredField='True'
						ErrorMessage='Sort Order is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubmissionValidation'>
					<Control ID='ctlSubmissionValidation'
						Container='spnSubmissionValidation'
						Type='cTextArea'
						Rows='15'
						Cols='75'
						IsXML='True'
						InvalidXMLMessage='Invalid XML.'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsEnabledAfterSubmit'>
					<Control ID='ctlEnableFormAfterSubmission'
						Container='spnEnableFormAfterSubmission'
						Type='cCheckBox'
						Selected='False'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsDisabledBeforeSubmit'>
					<Control ID='ctlDisableFormBeforeSubmission'
						Container='spnDisableFormBeforeSubmission'
						Type='cCheckBox'
						Selected='False'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsSubmissionSection'>
					<Control ID='ctlEnableFormForResubmission'
						Container='spnEnableFormForResubmission'
						Type='cCheckBox'
						Selected='False'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AddSeparatorBefore'>
					<Control ID='ctlAddSpaceAboveNavName'
						Container='spnAddSpaceAboveNavName'
						Type='cCheckBox'
						Selected='False'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParentNavID'>
					<Control ID='ctlParentNavItem'
						Container='spnParentNavItem'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskModuleConfigNavElement'
						StoredValue='WfTaskModuleConfigNavElementID'
						DisplayValue='NavTitle'>
						<Filters>	
							<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />								
							<Argument Type='' TypeKey='' PropertyKey='FormTypeID' Value='3' Operator='NotEqual' >
								<RelatedProperty PropertyKey='StandardForms'/>
							</Argument>	
							<Argument Type='' TypeKey='' PropertyKey='FormTypeID' Value='4' Operator='NotEqual' >
								<RelatedProperty PropertyKey='StandardForms'/>
							</Argument>					
						</Filters>
						<Sort>
							<Argument PropertyKey='NavTitle'/>
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
								<Argument AttributeName='PageKey' Value='TaskFormEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='WfTaskModuleConfigNavElement' DataObjectPropertyKey='WfTaskModuleConfigNavElementID' PropertyKey='WfTaskModuleConfigNavElementID' BaseValue='WfTaskModuleConfigNavElementID='/>
								<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
								<Argument Type='QueryString' TypeKey='MasterFormTypeID' BaseValue='MasterFormTypeID='/>
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
								<Argument AttributeName='PageKey' Value='TaskBuilderEditor'/>
								<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
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
								<Argument AttributeName='PageKey' Value='TaskBuilderEditor'/>
								<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>