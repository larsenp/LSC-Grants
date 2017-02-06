<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='BudgetID' 
					PropertyKey='BudgetID' 
					Value='' 
					Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='BudgetPeriodList' DataObjectDefinitionKey='BudgetPeriod'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='Budget' 
					DataObjectPropertyKey='BudgetID' 
					PropertyKey='BudgetID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description'>
					<RelatedProperty PropertyKey='PeriodName'/>
				</Argument>
			</Sort>
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
									<Argument AttributeName='PageKey' Value='GranteeProjectBudgetEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='BudgetPeriodID=0'/>
									<Argument Type='DataPresenter' TypeKey='GranteeProjectID' AttributeName='' BaseValue='GranteeProjectID='/>
									<Argument Type='DataPresenter' TypeKey='BudgetID' AttributeName='' BaseValue='BudgetID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='BudgetPeriod'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='PeriodName.Description' ColumnHeader='Year' HeaderColspan='1' HeaderAlign='Left'>
							<!--<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='PeriodName'/>
								</Argument>
							</Sortable> -->
						</DisplayProperty>
						<DisplayProperty PropertyKey='Total' Align='Right' ColumnHeader='Amount' HeaderColspan='1' HeaderAlign='Center' Format='$#,##0.##' DisplayTotal='PROJECT TOTAL'/>
						<DisplayProperty PropertyKey='StartDate' Align='Center' ColumnHeader='Start Date' HeaderAlign='Center' Format='MM/dd/yyyy' />
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='End Date' HeaderAlign='Center' Format='MM/dd/yyyy' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GranteeProjectBudgetEditor'/>
										<Argument Type='DataObject' TypeKey='BudgetPeriodID' AttributeName='BudgetPeriodID' BaseValue='BudgetPeriodID='/>
										<Argument Type='DataObject' TypeKey='BudgetID' AttributeName='BudgetID' BaseValue='BudgetID='/>
										<Argument Type='DataPresenter' TypeKey='GranteeProjectID' AttributeName='' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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
											<Argument Type='DataObject' TypeKey='BudgetPeriodID' AttributeName='BudgetPeriodID'/>
											<RelatedDataObjects>
												<RelatedDataObject DataObjectDefinitionKey='BudgetItem'>
													<RelationshipProperties>
														<RelationshipProperty parentProperty='BudgetPeriodID' childProperty='BudgetPeriodID' />
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
<!-- End Embedded XML -->
</span>
