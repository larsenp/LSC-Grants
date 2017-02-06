<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="BudgetManagerEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cBudgetManagerEditor" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
</br>
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg' colspan='2'>Add or Edit Budget Categories</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b><%=GetLabel("ProgramName")%></b></td>
		<td><span runat='server' id='spnProgram'></span></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td><span runat='server' id='spnFundingOpportunity'></span></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b></td>
		<td><span runat='server' id='spnFundingCycle'></span></td>
	</tr>
	<tr>
		<td><b>Budget Category Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnBudgetCategoryName'></span>
			<asp:CustomValidator id="CtlUniqueBudgetCategory" runat="server"
				OnServerValidate="valUniqueBudgetCategory"
				Display="None"
				ErrorMessage="Budget Category Name must be unique."/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit: 100 characters</td>
	</tr>
	<tr>
		<td><b>Sort Order</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnBudgetCategorySort'></span>
			<asp:CustomValidator id="CtlUniqueBudgetCategorySort" runat="server"
				OnServerValidate="valUniqueBudgetCategorySort"
				Display="None"
				ErrorMessage="Sort Order must be unique."/>
		</td>
	</tr>
	<tr>
		<td><b>Indirect Cost</b></td>
		<td><span runat='server' id='spnIsIndirectCost'></span>
			<asp:CustomValidator id="CustomValidator1" runat="server"
				OnServerValidate="valUniqueBudgetCategorySort"
				Display="None"
				ErrorMessage="Sort Order must be unique."/>
		</td>
	</tr>
	<tr><td Colspan='2'>&nbsp;</td></tr>
	<tr>
		<td  align="Center" Colspan='2'><span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnSaveandClose'/>&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
</br>
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg' colspan='2'>Add or Edit Budget Line Items</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
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


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='WfProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram' 
					Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfCompetition.CompetitionDisplayName'>
					<Control ID='spnFundingOpportunity' 
					Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='spnFundingCycle' 
					Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='BudgetCategoryList1' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value='' Bool=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='ParentID' Value='0' Bool='AND'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='BudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value='' Bool=''/>
				<Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' Value='' Bool='AND'/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value='' />
				<Argument Type='DataObjectCollection' TypeKey='BudgetCategoryList1' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='ParentID' Value='' />					
				<Argument Type='' TypeKey='' PropertyKey='HasNotes' Value='False' />
				<Argument Type='' TypeKey='' PropertyKey='HasChild' Value='1'  />
				<Argument Type='' TypeKey='' PropertyKey='SortOrder' Value='1'  />
			</DefaultValues>			
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlBudgetCategoryName'
						Container='spnBudgetCategoryName'
						Type='cTextBox'
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Budget Category Name is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='ctlBudgetCategorySort'
						Container='spnBudgetCategorySort'
						Type='cTextBox'
						Size='4'
						MaxLength='4'
						AllowNumbersOnly='True'						
						RequiredField='True'
						ErrorMessage='Sort Order is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsIndirectCost'>
					<Control ID='ctlIsIndirectCost'
						Container='spnIsIndirectCost'
						Type='cCheckBox'
						StoredValue='1'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' 
						Type='cButton' 
						Image='Save'>
						<Action PostBack='True' 
							AutoSave='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='BudgetManagerEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' BaseValue='BudgetCategoryID='/>
								<Argument Type='QueryString' TypeKey='WfProjectID'  BaseValue='WfProjectID=' bool=''/>
								
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveandClose' Container='spnSaveandClose' 
						Type='cButton' 
						Image='Save and Close'>
						<Action PostBack='True' 
							AutoSave='True' 
							Object='EventController' 
							Method='EventController_NavigateToURL'>
							<Parameters>
					   			<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' 
						Container='spnClose' 
						Type='cButton' 
						Image='Close'>
						<Action PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToURL'>
							<Parameters>
							   	<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='BudgetCategoryDetailItems' DataObjectDefinitionKey='BudgetCategory'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value='' Bool=''/>
				<Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='ParentID' Value='' Bool='AND' />
				<Argument Type='Data' TypeKey='' PropertyKey='ParentID' Value='0' Operator='NotEqual' Bool='AND' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='BudgetLineItemEditor'/>
									<Argument Type='QueryString' TypeKey='BudgetCategoryID'  BaseValue='BudgetCategoryID=' bool=''/>
									<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' BaseValue='BudgetCategoryID='/>
									<Argument Type='QueryString' TypeKey='WfProjectID'  BaseValue='WfProjectID=' bool=''/>		
									<Argument Type='' TypeKey='' AttributeName='BudgetLineItemID' Value='BudgetLineItemID=0'/>							
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='BudgetCategory'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Budget Category' Width='25%'>
							<Sortable>
							    <Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Sort Order' Width='25%' >
							<Sortable>
							    <Argument PropertyKey='SortOrder'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='HasNotes' ColumnHeader='Allow Notes' Format='YesNo' Width='25%' />
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
								    AutoSave='True'	
                                    Object='DataPresenter'
                                    Method='DataPresenter_Save_And_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='BudgetLineItemEditor'/>
										<Argument Type='DataObject' TypeKey='BudgetCategoryID' AttributeName='BudgetLineItemID' BaseValue='BudgetLineItemID='/>																				
										<Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='' BaseValue='BudgetCategoryID=' bool=''/>
										<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='' BaseValue='WfProjectID=' bool=''/>
										<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty  PropertyKey=''  ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='25%'>
							<Parameters>
								<Argument Value='' ValueKey='BudgetItem.BudgetCategoryID' Operator='NotEqual' DisplayValue=''/>	
								<Argument Value='' ValueKey='BudgetItem.BudgetCategoryID' DisplayValue='Control'>	
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='BudgetCategoryID' AttributeName='BudgetCategoryID'/>
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
