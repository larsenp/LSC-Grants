<%@ Control Language="vb" AutoEventWireup="true" Codebehind="BudgetInfo.ascx.vb" Inherits="Implementation.Modules.Application.Controls.PageSection.cBudgetInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='100%'>
	 <tr>
		  <td class='SeparatorHdg'>
				<span runat='server' id='spnBudgetType' />
		  </td>
	 </tr>
</table>
	
<span runat="server" id='spnAdd' style="position:relative;left:20px"/>

<span runat='server' id='spnBudgetInfo' style="position:relative;left:20px" />
<div style="height:10px" >&nbsp;</div>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	<!--The codebehind for this control uses the following information to redirect to the appropriate budget editor 
	 based on the budget category type ID (1 = Projected Expenses, 2 = Projected Revenue, 3 = Current Expenses, 4 = Current Revenue)-->
		<BudgetEditorPageKeys>
		  <BudgetCategoryType ID='1' PageKey='ProjectedExpensesEditor' />
		  <BudgetCategoryType ID='2' PageKey='ProjectedRevenueEditor' />
		  <BudgetCategoryType ID='3' PageKey='CurrentExpensesEditor' />
		  <BudgetCategoryType ID='4' PageKey='CurrentRevenueEditor' />
		</BudgetEditorPageKeys>	 
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
		  <Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
		  </Filters>
		</DataObject>
		
		<!--Get top-level budget category for entire budget-->
		<DataObject Key='TopLevelBudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False'>
		  <Filters>
				<Argument PropertyKey='ParentID' Value='0' />
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='ProjectID' />
		  </Filters>
		</DataObject>
		
		<!--Get top-level budget category for the category type specified for this control-->
		<DataObject Key='BudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False'>
		  <Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='ProjectID' />
				<Argument Type='DataPresenter' TypeKey='CategoryTypeID' PropertyKey='CategoryTypeID'/>
				<Argument Type='DataObjectCollection' TypeKey='TopLevelBudgetCategory' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='ParentID' />
		  </Filters>
		  <DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					 <Control ID='spnBudgetType'
						  Type='HtmlGenericControl' />
				</DisplayProperty>
		  </DisplayProperties>
		</DataObject>
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='BudgetTypeID' Value='1' />
			</Filters>
		</DataObject>

		<!-- Get the budget period for this submission -->
		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'>
					<RelatedProperty PropertyKey='LscWfTABudgetPeriod' />
				</Argument>
			</Filters>
		</DataObject>
		
		<!--Get the budget item for the current Grantee Project in the top-level budget category within the category type-->
		<DataObject Key='BudgetItem' DataObjectDefinitionKey='BudgetItem' Updatable='False' CreateNew='False'>
		  <Filters>
				<Argument Type='DataObjectCollection' TypeKey='BudgetPeriod' DataObjectPropertyKey='BudgetPeriodID' PropertyKey='BudgetPeriodID'/>
				<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='BudgetCategoryID'/>
		  </Filters>
		  <DisplayProperties>
				<DisplayProperty PropertyKey=''>
					 <Control ID='btnAdd'
						  Type='cButton' 
						  Image='Add'
						  Container='spnAdd'>
						  <Action PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
	 								<Argument Type='DataPresenter' TypeKey='BudgetEditorPageKey' />
	 								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL=' />
								</Parameters>		
						  </Action>
					 </Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstBudgetInfo'
						Type='cDataListCtl' 
						Container='spnBudgetInfo'
							SeparatorWidth='2'
						  DataObjectDefinitionKey='BudgetItem'>
						<DisplayProperty PropertyKey='Amount' ColumnHeader='Total Amount' Format='$0,0.00' Width='70%' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='15%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
							  <Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
	 									<Argument Type='DataPresenter' TypeKey='BudgetEditorPageKey' />
	 									<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL=' />
									</Parameters>		
							  </Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='BudgetItemID' AttributeName='BudgetItemID'/>
											<RelatedDataObjects>
												<RelatedDataObject DataObjectDefinitionKey='BudgetItem'>
													<RelationshipProperties>
														<RelationshipProperty parentProperty='BudgetPeriodID' childProperty='BudgetPeriodID' />
														<RelationshipProperty parentProperty='CategoryTypeID' childProperty='CategoryTypeID' Bool='And' />
													</RelationshipProperties>
												</RelatedDataObject>
											</RelatedDataObjects>
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
<!-- End Embedded XML -->