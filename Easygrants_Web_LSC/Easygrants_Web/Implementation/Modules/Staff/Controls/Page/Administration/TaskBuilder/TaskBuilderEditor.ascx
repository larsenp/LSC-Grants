<%@ Control Language="vb" AutoEventWireup="true" Codebehind="TaskBuilderEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder.cTaskBuilderEditor" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Task Builder</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td><B>Task Name</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTaskName'></span>
		</td>
	</tr>
	<tr>
		<td><B>Description</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnDescription' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td><B>Type</B>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTaskType' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td><B>Guideline File</B></td>
		<td width='10'>http://</td>
		<td>
			<span runat='server' id='spnHelpFile' visible='true'></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<b>External URL</b>&nbsp;&nbsp;
			<span runat='server' id='spnIsExternalHelpURL' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td><B>Allow Copy?</B></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnAllowCopy' visible='true'></span>
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
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Forms</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnFormType' visible='true'/> &nbsp;&nbsp;&nbsp;<span runat='server' id='spnAddForms'></span>
			<asp:CustomValidator 
				id='CtlDuplicateMain'
				runat='server' Enabled='False'
				OnServerValidate='ValidateDuplicateMain' EnableClientScript='False'
				ErrorMessage='Only one Main form can be added. Select a different type.'
				Display='None'/>
			<asp:CustomValidator 
                id='CtlDuplicateReviewandSubmit'
                runat='server' Enabled='False'
                OnServerValidate='ValidateDuplicateReviewandSubmit' EnableClientScript='False'
                ErrorMessage='Only one Review and Submit form can be added. Select a different type.'
                Display='None'/>	                
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3'>
			<span runat='server' id='spnFormsList' visible='true'></span>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Outcomes</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAddOutcomes'></span>
		</td>
		<td>&nbsp;</td>
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
		<DataObject Key='WfTask' DataObjectDefinitionKey='WfTask' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
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
				<DisplayProperty PropertyKey='WfTaskTypeID'>
					<Control ID='ctlTaskType'
						Container='spnTaskType'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskType'
						StoredValue='WfTaskTypeID'
						DisplayValue='WfTaskType'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Type is required.'>
						<Filters>
							<Argument Type='Data' TypeKey='' PropertyKey='WfTaskTypeID' Value='5' Operator='NotEqual' />
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTaskType'/>
						</Sort>
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
				<DisplayProperty PropertyKey='IsCopyAllowed'>
					<Control ID='ctlAllowCopy'
						Container='spnAllowCopy'
						Type='cCheckBox'/>
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
								<Argument AttributeName='PageKey' Value='TaskBuilderEditor'/>
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
		
		<DataObject Key='WfTaskModuleConfigNavElementStandard' DataObjectDefinitionKey='WfTaskModuleConfigNavElement' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
				<Argument Group='('/>
				<Argument Type='' TypeKey='' PropertyKey='FormTypeID' Value='3' Bool=''>
					<RelatedProperty PropertyKey='StandardForms' />
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='FormTypeID' Value='4' Bool='Or'>
					<RelatedProperty PropertyKey='StandardForms' />
				</Argument>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject>	
		
		<DataObject Key='WfTaskModuleConfigNavElement' DataObjectDefinitionKey='WfTaskModuleConfigNavElement' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlFormType'
						Container='spnFormType'
						Type='cDropDown'
						DataObjectDefinitionKey='MasterFormType'
						StoredValue='MasterFormTypeID'
						DisplayNone='False'
						DisplayValue='Description'>						
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddForms' 
						Type='cButton' 
						Image='Add'
						Container='spnAddForms'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SavePageAndRedirect'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='TaskFormEditor'/>
								<Argument Type='Data' TypeKey='' BaseValue='WfTaskModuleConfigNavElementID=0'/>
								<Argument Type='Control' TypeKey='ctlFormType' ControlPropertyKey='SelectedValue' Value=''  BaseValue='MasterFormTypeID='/>
								<Argument Type='' TypeKey='' Value='True'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFormsvList'
						Container='spnFormsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskModuleConfigNavElement'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Order' Width='5%'>
							<Sortable>
								<Argument PropertyKey='SortOrder'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='NavTitle' ColumnHeader='Navigation Name' Width='25%'>
							<Sortable>
								<Argument PropertyKey='NavTitle'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StandardForms.Name' ColumnHeader='Form' Width='30%'>
							<Sortable>
								<Argument PropertyKey='Name'>
									<RelatedProperty PropertyKey='StandardForms' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StandardForms.Description' ColumnHeader='Form Description' Width='30%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='StandardForms' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DataPresenter_Save_And_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='TaskFormEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskModuleConfigNavElementID' AttributeName='WfTaskModuleConfigNavElementID' BaseValue='WfTaskModuleConfigNavElementID='/>
										<Argument Type='DataObject' TypeKey='WfTaskID' AttributeName='WfTaskID' BaseValue='WfTaskID='/>	
										<Argument Type='DataObjectRelated' TypeKey='StandardForms.StandardFormType.MasterFormTypeID' AttributeName='MasterFormTypeID' BaseValue='MasterFormTypeID='/>									
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' HeaderAlign='Left' DataAlign='Left'>
							<Parameters>
								<Argument Value='1' ValueKey='WfTask.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>
								<Argument Value='2' ValueKey='WfTask.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>
								<Argument Value='4' ValueKey='WfTask.WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>
								<Argument Value='3' ValueKey='WfTask.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskModuleConfigNavElementID' AttributeName='WfTaskModuleConfigNavElementID' Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='' ValueKey='WfTask.WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete1'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskModuleConfigNavElementID' AttributeName='WfTaskModuleConfigNavElementID' Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskOutcomeList' DataObjectDefinitionKey='WfTaskOutcome' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' />
				<Argument Type='' TypeKey='' PropertyKey='ThirdPartyActionID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddOutcomes' 
						Type='cButton' 
						Image='Add'
						Container='spnAddOutcomes'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SavePageAndRedirect'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='TaskBuilderOutcomeEditor'/>
								<Argument Type='Data' TypeKey='' BaseValue='WfTaskOutcomeID=0'/>
								<Argument Type='Control' TypeKey='ctlFormType' ControlPropertyKey='SelectedValue' Value=''  BaseValue='MasterFormTypeID='/>
								<Argument Type='' TypeKey='' Value='False'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOutcomesList'
						Container='spnOutcomesList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='WfTaskOutcome' ColumnHeader='Outcome' Width='95%'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DataPresenter_Save_And_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='TaskBuilderOutcomeEditor'/>
										<Argument Type='DataObject' TypeKey='WfTaskOutcomeID' AttributeName='WfTaskOutcomeID' BaseValue='WfTaskOutcomeID='/>
										<Argument Type='DataObjectCollection' TypeKey='WfTask' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' BaseValue='WfTaskID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' HeaderAlign='Left' DataAlign='Left'>
							<Parameters>
								<Argument Value='1' ValueKey='WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>
								<Argument Value='2' ValueKey='WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>
								<Argument Value='4' ValueKey='WfTaskAssignments.WfTaskStatusID' DisplayValue=''/>
								<Argument Value='ResubmissionRequested' ValueKey='WfTaskOutcome_Abbr' DisplayValue=''/>
								<Argument Value='3' ValueKey='WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskOutcomeID' AttributeName='WfTaskOutcomeID' Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='' ValueKey='WfTaskAssignments.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete1'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfTaskOutcomeID' AttributeName='WfTaskOutcomeID' Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>