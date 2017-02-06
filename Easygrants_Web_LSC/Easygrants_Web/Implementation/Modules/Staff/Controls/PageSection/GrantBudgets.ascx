<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantBudgets" CodeBehind="GrantBudgets.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Budget</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='BudgetList' DataObjectDefinitionKey='Budget'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'								
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='BudgetEditor'/>
									<Argument Type='Data' TypeKey='' BaseValue='BudgetID=0' Value=''/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Budget'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='BudgetType.Description' ColumnHeader='Budget Version' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
								    <RelatedProperty PropertyKey='BudgetType'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>		
						<DisplayProperty PropertyKey='Description' ColumnHeader='Description' Width='22%'>
							<Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='Total' ColumnHeader='Total Amount'  Format='c' Width='14%'>
							<Sortable>
								<Argument PropertyKey='Total'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName' ColumnHeader='Last Modified By'  Width='14%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='ModifiedByUser.Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='ModifiedByUser.Person'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='ModifyDate' ColumnHeader='Last Modified Date' Format='MM/dd/yyyy' Width='20%'>
							<Sortable>
								<Argument PropertyKey='ModifyDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' Width='20%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='BudgetEditor'/>
										<Argument Type='DataObject' TypeKey='BudgetID' AttributeName='BudgetID' BaseValue='BudgetID='/>
										<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' NewCell='false' >
							<Control ID='btnCopy'
								Type='cButton'
								Image='Copy'
								Confirmation='Are you sure you want to copy this item?'>
								<Action
									PostBack='True'
									Object='DataPresenter'
							        Method='CopyBudget'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='BudgetID' AttributeName='BudgetID'/>
										<Argument Type='DataObject' TypeKey='BudgetTypeID' AttributeName='BudgetTypeID'/>
										<Argument Type='DataObject' TypeKey='Description' AttributeName='Description'/>
										<Argument Type='DataObjectRelated' TypeKey='BudgetPeriods.BudgetPeriodName' AttributeName='BudgetPeriods.BudgetPeriodName' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' NewCell='false'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='BudgetID' AttributeName='BudgetID'/>
											<RelatedDataObjects>
												<RelatedDataObject DataObjectDefinitionKey='BudgetPeriod'>
													<RelationshipProperties>
														<RelationshipProperty parentProperty='BudgetID' childProperty='BudgetID' />
													</RelationshipProperties>
													<RelatedDataObjects>
														<RelatedDataObject DataObjectDefinitionKey='BudgetItem'>
															<RelationshipProperties>
																<RelationshipProperty parentProperty='BudgetPeriodID' childProperty='BudgetPeriodID' />
															</RelationshipProperties>
														</RelatedDataObject>
													</RelatedDataObjects>
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
<!-- End Embedded XML -->
</span>
	