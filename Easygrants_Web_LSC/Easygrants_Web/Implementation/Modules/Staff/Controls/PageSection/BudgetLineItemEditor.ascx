<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="BudgetLineItemEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cBudgetLineItemEditor" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<br>
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg' colspan='2'>Budget Category Information</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="15%"><b><%=GetLabel("ProgramName")%></b></td>
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
		<td><b>Budget Category Name</b></td>
		<td><span runat='server' id='spnBudgetCategoryName'></span></td>
	</tr>
</table>
<br>
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg' colspan='2'>Add or Edit Budget Line Items</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="15%"><b>Line Item Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnLineItemName'></span>
			<asp:CustomValidator id="CtlValLineItemName" runat="server"
				OnServerValidate="valLineItemName"
				Display="None"
				ErrorMessage="Line Item Name must be unique."/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>Limit: 100 characters</td>
	</tr>
	<tr>
		<td width="15%"><b>Sort Order</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnSortOrder'></span>
			<asp:CustomValidator id="CtlUniqueLineItemSort" runat="server"
				OnServerValidate="valUniqueLineItemSort"
				Display="None"
				ErrorMessage="Sort Order must be unique."/>
		</td>
	</tr>
	<tr>
		<td width="15%"><b>Allow Notes</b></td>
		<td><span runat='server' id='spnAllowNotes'></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td  align="Center" Colspan='3'><span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnSaveandClose'/>&nbsp;&nbsp;&nbsp;
				<span runat='server' id='spnClose'/>
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
		<DataObject Key='BudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnBudgetCategoryName' 
					Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='BudgetCategoryLineItems' DataObjectDefinitionKey='BudgetCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='BudgetLineItemID' PropertyKey='BudgetCategoryID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value='' />
				<Argument Type='QueryString' TypeKey='BudgetCategoryID'  PropertyKey='ParentID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='HasChild' Value='0'  />
				<Argument Type='DataObjectCollection' TypeKey='BudgetCategory' DataObjectPropertyKey='IsIndirectCost' PropertyKey='IsIndirectCost' Update='True' Create='True'/>
			</DefaultValues>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlLineItemName'
						Container='spnLineItemName'
						Type='cTextBox'
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Line Item Name is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='ctlSortOrder'
						Container='spnSortOrder'
						Type='cTextBox'
						Size='4'
						MaxLength='4'
						AllowNumbersOnly='True'						
						RequiredField='True'
						ErrorMessage='Sort Order is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='HasNotes'>
					<Control ID='ctlHasNotes' 
						Container='spnAllowNotes'
						Type='cCheckBox'
						StoredValue='1' 
						DisplayValue='HasNotes'>
					</Control>
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
								<Argument AttributeName='PageKey' Value='BudgetLineItemEditor'/>
								<Argument Type='QueryString' TypeKey='BudgetCategoryID'  BaseValue='BudgetCategoryID=' bool=''/>
								<Argument Type='QueryString' TypeKey='WfProjectID'  BaseValue='WfProjectID=' bool=''/>
								<Argument Type='DataObjectCollection' TypeKey='BudgetCategoryLineItems' DataObjectPropertyKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' BaseValue='BudgetLineItemID='/>
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
                            Method='EventController_NavigateToModulePageKey'>							    								
							<Parameters>
								<Argument AttributeName='PageKey' Value='BudgetManagerEditor'/>
								<Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='' BaseValue='BudgetCategoryID=' bool=''/>
								<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='' BaseValue='WfProjectID=' bool=''/>
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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
                            Method='EventController_NavigateToModulePageKey'>							    								
							<Parameters>
								<Argument AttributeName='PageKey' Value='BudgetManagerEditor'/>
								<Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='' BaseValue='BudgetCategoryID=' bool=''/>
								<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='' BaseValue='WfProjectID=' bool=''/>
							   	<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>