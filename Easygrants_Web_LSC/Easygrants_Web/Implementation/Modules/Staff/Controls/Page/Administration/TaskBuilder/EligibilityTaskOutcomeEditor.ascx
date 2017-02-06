<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder.cTaskOutcomeEditor" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Task</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Task Name</B></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTaskName'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Outcome</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnOutcome' visible='true'></span>
			<asp:CustomValidator id="valUniqueOutcome" runat="server"
				OnServerValidate="ValidateUniqueOutcome"
				Display="None"
				ErrorMessage="Outcome must be unique."/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit: 30 characters</td>
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
		<DataObject Key='WfTaskOutcome' DataObjectDefinitionKey='WfTaskOutcome' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskOutcomeID' PropertyKey='WfTaskOutcomeID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcome'>
					<Control ID='ctlOutcome'
						Container='spnOutcome'
						Type='cTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Outcome is required'>
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
								<Argument AttributeName='PageKey' Value='EligibilityTaskOutcomeEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='WfTaskOutcome' DataObjectPropertyKey='WfTaskOutcomeID' PropertyKey='WfTaskOutcomeID' BaseValue='WfTaskOutcomeID='/>
								<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
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
								<Argument AttributeName='PageKey' Value='EligibilityTaskBuilderEditor'/>
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
								<Argument AttributeName='PageKey' Value='EligibilityTaskBuilderEditor'/>
								<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>