<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Eligibility Builder</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Eligibility Quiz Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>
			<span runat='server' id='spnTemplateName'></span>
		</td>
	</tr>
	<tr>
		<td><b>Description&nbsp;</b><%=kDenoteRequiredField%></td>
		<td>
			<span runat='server' id='spnTemplateDescription' visible='true'></span>
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
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Eligibility Questions</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
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
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='EligibilityTemplate' DataObjectDefinitionKey='EligibilityTemplate' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TemplateName'>
					<Control ID='ctlTemplateName'
						Container='spnTemplateName'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Eligibility Quiz Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TemplateDescription'>
					<Control ID='ctlTemplateDescription'
						Container='spnTemplateDescription'
						Type='cTextBox'
						Size='50'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Description is required.'>
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
								<Argument AttributeName='PageKey' Value='EligibilityTemplateEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='EligibilityTemplate' DataObjectPropertyKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' BaseValue='EligibilityTemplateID='/>
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
								<Argument AttributeName='PageKey' Value='EligibilityBuilder'/>
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
								<Argument AttributeName='PageKey' Value='EligibilityBuilder'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='EligibilityTemplateQuestions' DataObjectDefinitionKey='EligibilityTemplateQuestions' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddQuestions' 
						Type='cButton' 
						Image='Add'
						Container='spnAddQuestions'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='DataPresenter'
								Method='DataPresenter_Save_And_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='EligibilityTemplateQuestionEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='EligibilityTemplate' DataObjectPropertyKey='EligibilityTemplateID' PropertyKey='EligibilityTemplateID' BaseValue='EligibilityTemplateID='/>
									<Argument Type='Data' TypeKey='' BaseValue='EligibilityTemplateQuestionID=0'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlQuestionsList'
						Container='spnQuestionsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='EligibilityTemplateQuestions'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='EligibilityQuestion.Description' ColumnHeader='Question' Width='65%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='EligibilityQuestion' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EligibilityAnswer.Description' ColumnHeader='Valid Answer' Width='15%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='EligibilityAnswer' />
								</Argument>
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
										<Argument AttributeName='PageKey' Value='EligibilityTemplateQuestionEditor'/>
										<Argument Type='DataObject' TypeKey='EligibilityTemplateID' AttributeName='EligibilityTemplateID' BaseValue='EligibilityTemplateID='/>
										<Argument Type='DataObject' TypeKey='EligibilityTemplateQuestionID' AttributeName='EligibilityTemplateQuestionID' BaseValue='EligibilityTemplateQuestionID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''  NewCell='False'>
							<Control ID='btnDelete1'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='EligibilityTemplateQuestionID' AttributeName='EligibilityTemplateQuestionID' Value=''/>
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