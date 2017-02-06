<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cBudgetDetailsItems" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Contact_Notes_View.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<font color='red'>	<b><span id='spnValidator' runat='server' /></b></font>
<span id='spnBudgetCategoryID' runat='server'  />
<span id="spnGuideLineDesc" runat='server' Visible='true' />
<span id="spnIsExternal" runat='server' Visible='true'/>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	
	<tr>
		<td   colspan='5'><b><span id="spnBudgetTitle" runat='server'/> - <span id="spnGuideline" runat='server'/></b></td>	   
	</tr>	
	<tr>
		<td colspan='5'><HR></td>
	</tr>
	<tr>
		<td width='15%'><b>Description&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10%'><b># of Units&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10%'><b>Per Unit Cost&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><b>Total&nbsp;</b></td>
		<td></td>	   
	</tr>
	<tr>
		<td colspan='5'><HR></td>
	</tr>
	<tr>
		<td><span id='spnDescription' runat='server' /></td>
		<td><span id='spnUnits' runat='server' /></td>
		<td><span id='spnUnitCost' runat='server' /></td>
		<td>$<span id='spnTotal' runat='server' /></td>
		<td><span id='spnAdd' runat='server' /></td>	   
	</tr>
	<tr>
		<td colspan='5'><HR></td>
	</tr>	
	<tr>
		<td colspan='5'><span runat='server' id='spnDataList'></span></td>
	</tr>
	<tr>
		<td><b>Total <span id='spnBudgetTitle1' runat='server' /></b></td>
		<td></td>
		<td></td>
		<td> $<span id='spnTotAmount' runat='server' /></td>
		<td></td>	   
	</tr>
	
</table>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width='15%'  valign='top'><b><span id='spnBudgetTitle2' runat='server' /> Details&nbsp;</b><%=kDenoteRequiredField%></td>		
		<td><b><span id='spnDetails' runat='server' /></b></td>			   
	</tr>
	<tr>
		<td></td>		
		<td>Provide any details regarding the <span id='spnBudgetTitle3' runat='server' /> line item(s) above. 1500 character limit, including spaces.</td>			   
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>		
		
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='BudgetCategory' Key='BudgetCategory'>		
			<DisplayProperties>
				<DisplayProperty PropertyKey='Guideline'>
					<Control ID='ctlGuideLineDesc'
						Container='spnGuideLineDesc'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='Guideline'>
					<Control ID='ctlGuideline' Container='spnGuideline' Type='cLink' Caption='View Detailed Instructions'>
						<Action PostBack='False' URL='Web' Target='_blank'></Action>
					</Control>							
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsExternalHelpUrl'>
					<Control ID='ctlIsExternal'
						Container='spnIsExternal'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey='BudgetCategoryID'>
					<Control ID='ctlBudgetCategoryID'
						Container='spnBudgetCategoryID'
						Type='cLabel'>
					</Control>	
				</DisplayProperty> 
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlBudgetTitle'
						Container='spnBudgetTitle'
						Type='cLabel'>
					</Control>	
				</DisplayProperty> 
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlBudgetTitle1'
						Container='spnBudgetTitle1'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlBudgetTitle2'
						Container='spnBudgetTitle2'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlBudgetTitle3'
						Container='spnBudgetTitle3'
						Type='cLabel'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlDescription' 
							 Type='cTextBox' 
							 Container='spnDescription' 
							 Size='50'>						
					</Control>
				</DisplayProperty>	
				 <DisplayProperty PropertyKey=''>
					<Control ID='ctlUnits' 
						 Type='cMoneyTextBox' 
						 Container='spnUnits' 
						 MaxLength='14'
					     Format='#,##0.##'						
						 RequiredField='False'
						 MaxInputDecimalPlaces='2'
						 RegExErrorMessage='# of Units must contain only digits, commas, and hyphens.'
						 DecimalErrorMessage='# of Units must be a number with up to 2 decimals.'
						 CommaErrorMessage='Commas are improperly formatted.'
						 Size='20'>						
					</Control>
				</DisplayProperty>					
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUnitCost'
						Container='spnUnitCost'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,##0.##'
						Size='20'
						RequiredField='False'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Unit Cost must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='Unit Cost must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlTotal'
						Container='spnTotal'
						Type='cLabel'>
					</Control>	
				</DisplayProperty> 
				<DisplayProperty PropertyKey='' >
					<Control ID='ctlTotAmount' 
						Container='spnTotAmount'
						Type='cLabel'>
					</Control>	
				</DisplayProperty> 				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'						
						Container='spnAdd'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='DataPresenter'
								Method='AddBudgetItem'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='BudgetDetails'/>									
									<Argument Type='QueryString' TypeKey='BudgetPeriodID' PropertyKey='BudgetPeriodID'  />											
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  />											
								</Parameters>							
							</Action>
					</Control>
				</DisplayProperty>  
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='BudgetID' PropertyKey='BudgetID' Value='' Bool=''/>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
		</DataObject>		

		<DataObject Key='BudgetDetails' DataObjectDefinitionKey='BudgetDetails' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' />
				<Argument Type='QueryString' TypeKey='BudgetPeriodID' PropertyKey='BudgetPeriodID' Value=''/>
			</Filters>
			<DefaultValues>
					<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' />
					<Argument Type='QueryString' TypeKey='BudgetPeriodID' PropertyKey='BudgetPeriodID' Value=''/>
			</DefaultValues>
			<DisplayProperties>				
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDetails'
						Container='spnDetails'
						Type='cTextArea'
						Rows='3'
						Cols='60'
						MaxLength='1500'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		<DataObject Key='BudgetItem' DataObjectDefinitionKey='BudgetItem'>
			<Filters>					
				<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' />
				<Argument Type='QueryString' TypeKey='BudgetPeriodID' PropertyKey='BudgetPeriodID' Value=''/>				
			</Filters>			
			<DisplayProperties>												
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'						
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Description'  ColumnHeader='Description' Width='20%'/>
						<DisplayProperty PropertyKey='NoOfUnits' ColumnHeader='# of Units'  Width='15%' Format='#,##0.00'/>
						<DisplayProperty PropertyKey='UnitCost' ColumnHeader='Per Unit Cost'  Width='12%' Format='$#,##0.00'/>	
						<DisplayProperty PropertyKey='Amount' ColumnHeader='Total'  Width='18%' Format='$#,##0.00'/>												
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='55%'>
							<Control ID='btnEditOA'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									AutoSave='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='BudgetDetails'/>
										<Argument Type='DataObject' TypeKey='BudgetItemID' AttributeName='BudgetItemID' BaseValue='BudgetItemID='/>											
										<Argument Type='DataPresenter' TypeKey='BudgetID' PropertyKey='BudgetID' BaseValue='BudgetID=' />										
										<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
										<Argument Type='QueryString' TypeKey='BudgetPeriodID' PropertyKey='BudgetPeriodID' BaseValue='BudgetPeriodID=' />
										<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
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
									Object='DataPresenter'
									Method='DeleteBudgetItem'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='BudgetItemID' AttributeName='BudgetItemID'/>
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
