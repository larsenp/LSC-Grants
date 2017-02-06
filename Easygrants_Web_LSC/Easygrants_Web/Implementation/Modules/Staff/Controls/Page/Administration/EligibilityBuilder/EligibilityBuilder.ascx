<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" EnableViewState="false" %>
<br />
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Eligibility Builder</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAddEligibilityTemplate'></span>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnEligibilityTemplateList' visible='true'></span>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='EligibilityTemplate' DataObjectDefinitionKey='EligibilityTemplate' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAddEligibilityTemplate' 
						Type='cButton' 
						Image='Add'
						Container='spnAddEligibilityTemplate'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='EligibilityTemplateEditor'/>
									<Argument Type='Data' TypeKey='' BaseValue='EligibilityTemplateID=0'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlEligibilityTemplateList'
						Container='spnEligibilityTemplateList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='EligibilityTemplate'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='TemplateName' ColumnHeader='Eligibility Quiz Name' Width='70%'>
							<Sortable>
								<Argument PropertyKey='TemplateName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='EligibilityTemplateEditor'/>
										<Argument Type='DataObject' TypeKey='EligibilityTemplateID' AttributeName='EligibilityTemplateID' BaseValue='EligibilityTemplateID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='20%'>
							<Control ID='btnDelete1'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='EligibilityTemplateID' AttributeName='EligibilityTemplateID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='ctlCopy'
								Type='cButton'
								Image='Copy'
								Confirmation='Are you sure you want to copy this Eligibility Quiz?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='CopyEligibilityTemplate'/>
										<Argument Type='DataObject' TypeKey='EligibilityTemplateID' AttributeName='EligibilityTemplateID' BaseValue='EligibilityTemplateID='/>
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