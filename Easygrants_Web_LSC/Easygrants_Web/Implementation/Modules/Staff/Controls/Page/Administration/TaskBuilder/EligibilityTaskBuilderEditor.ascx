<%@ Control Language="vb" AutoEventWireup="true" Codebehind="EligibilityTaskBuilderEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder.cEligibilityTaskBuilderEditor" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Task Builder</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' width='70%' runat='server'>
	<tr>
		<td><B>Task Name</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTaskName'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Description</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnDescription' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Type</B></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTaskType' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><B>Guideline File</B></td>
		<td width='10'>http://</td>
		<td>
			<span runat='server' id='spnGuidelineFile' visible='true'></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<b>External URL</b>&nbsp;&nbsp;
			<span runat='server' id='spnIsExternalGuidelineURL' visible='true'></span>
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
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Outcomes</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			<span runat='server' id='spnOutcomesList' visible='true'></span>
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskType' DataObjectDefinitionKey='WfTaskType' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskTypeID' PropertyKey='WfTaskTypeID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskType'>
					<Control ID='ctlTaskType'
						Container='spnTaskType'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTask' DataObjectDefinitionKey='WfTask' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfTaskTypeID' PropertyKey='WfTaskTypeID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask'>
					<Control ID='ctlTaskName'
						Container='spnTaskName'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Task Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Description is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='HelpFile'>
					<Control ID='ctlGuildelineFile'
						Container='spnGuidelineFile'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsExternalHelpURL'>
					<Control ID='ctlIsExternalGuidelineURL'
						Container='spnIsExternalGuidelineURL'
						Type='cCheckBox'
						Selected='True'/>
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
								<Argument AttributeName='PageKey' Value='EligibilityTaskBuilderEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='WfTask' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' BaseValue='WfTaskID='/>
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
								<Argument AttributeName='PageKey' Value='TaskBuilder'/>
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
								<Argument AttributeName='PageKey' Value='TaskBuilder'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskModuleConfigNavElement' DataObjectDefinitionKey='WfTaskModuleConfigNavElement' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTask' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
				<Argument Type='' TypeKey='' PropertyKey='StandardFormsID' Value='8'/>
				<Argument Type='' TypeKey='' PropertyKey='NavKey' Value='Eligibility'/>
				<Argument Type='' TypeKey='' PropertyKey='NavTitle' Value='Eligibility Quiz'/>
				<Argument Type='' TypeKey='' PropertyKey='SortOrder' Value='1'/>
			</DefaultValues>
			<DisplayProperties>
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
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskOutcome' DataObjectDefinitionKey='WfTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOutcomesList'
						Container='spnOutcomesList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfTaskOutcome' ColumnHeader='Outcome' Width='75%'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DataPresenter_Save_And_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='EligibilityTaskOutcomeEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskOutcomeID' AttributeName='WfTaskOutcomeID' BaseValue='WfTaskOutcomeID='/>
										<Argument Type='DataObjectCollection' TypeKey='WfTask' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' BaseValue='WfTaskID='/>
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