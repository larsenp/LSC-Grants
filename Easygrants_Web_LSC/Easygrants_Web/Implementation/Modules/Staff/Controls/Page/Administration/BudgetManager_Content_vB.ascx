<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="BudgetManager_Content_vB.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cBudgetManager_Content_vB" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>

<!-- Page Content - Top Of Page -->
<table width='100%'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Budget Management</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><span id='spnProgram' runat='server'/></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'><%=GetLabel("FundingOpportunity")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader CtlID='ctlCmpt' Type='cDropDown' runat='server'/></td>
	</tr>
	
	<tr id='trProject' visible='false'>
		<td><b><span id='spnProject' runat='server'><%=GetLabel("FundingCycleName")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader CtlID='ctlProject' Type='cDropDown' runat='server'/></td>
	</tr>
</table>
<br><br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width="100%">	
	<tr>
		<td align="Center"><span runat='server' id='spnClear'/></td>
	</tr>
</table>
<br><br>
<table border='0' cellspacing='0' cellpadding='2' id='tbUploadList'  runat='server' width="100%">	
	<tr >
		<td colspan='2' class="SeparatorHdg"><b>Budget</b></td>
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




<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear' 
						Container='spnClear' 
						Type='cButton' 
						Image='Clear'>
						<Action PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							   <Argument Value='BudgetManagervB'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='BudgetCategoryMain' DataObjectDefinitionKey='BudgetCategory'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value='' Bool=''/>
				<Argument Type='Data' TypeKey='' PropertyKey='HasChild' Value='0' Bool='AND' />
				<Argument Type='Data' TypeKey='' PropertyKey='ParentID' Value='0' Bool='AND' />			
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
									<Argument Value='BudgetManagerEditorvB'/>
									<Argument Type='' TypeKey='' AttributeName='BudgetCategoryID' Value='BudgetCategoryID=0'/>
									<Argument Type='QueryString' TypeKey='WfProjectID'  BaseValue='WfProjectID=' bool=''/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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
						<DisplayProperty PropertyKey='Description' ColumnHeader='Budget Category' Width='75%'>
							<Sortable>
							    <Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
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
										<Argument AttributeName='PageKey' Value='BudgetManagerEditorvB'/>
										<Argument Type='DataObject' TypeKey='BudgetCategoryID' AttributeName='BudgetCategoryID' BaseValue='BudgetCategoryID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='' BaseValue='WfProjectID=' bool=''/>										
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
																											
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
<!-- End Embedded XML -->
</span>