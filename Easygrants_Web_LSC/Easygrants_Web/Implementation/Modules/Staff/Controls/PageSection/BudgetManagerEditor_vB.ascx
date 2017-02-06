<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="BudgetManagerEditor_vB.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cBudgetManagerEditor_vB" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />

<br>
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg' colspan='3'>Add or Edit Budget Categories</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="10%"><b><%=GetLabel("ProgramName")%></b></td>
		<td width="5%">&nbsp;</td>
		<td><span runat='server' id='spnProgram'></span></td>
	</tr>
	<tr>
		<td colspan='2'><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td><span runat='server' id='spnFundingOpportunity'></span></td>
	</tr>
	<tr>
		<td colspan='2'><b><%=GetLabel("FundingCycleName")%></b></td>
		<td><span runat='server' id='spnFundingCycle'></span></td>
	</tr>
	<tr>
		<td colspan='2'><b>Budget Category Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnBudgetCategoryName'></span>
			<asp:CustomValidator id="CtlUniqueBudgetCategory" runat="server"
				OnServerValidate="valUniqueBudgetCategory"
				Display="None"
				ErrorMessage="Budget Category Name must be unique."/>
		</td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
		<td class='FieldLabel'>Limit: 100 characters</span>
		</td>
	</tr>
	<tr>
		<td colspan='2'><b>Sort Order</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnBudgetCategorySort'></span>
			<asp:CustomValidator id="CtlUniqueBudgetCategorySort" runat="server"
				OnServerValidate="valUniqueBudgetCategorySort"
				Display="None"
				ErrorMessage="Sort Order must be unique."/>
		</td>
	</tr>
	<tr>
		<td><b>Guideline File</b></td>
		<td align='right'>http://</td>
		<td><span runat='server' id='spnGuideline' />&nbsp;&nbsp;&nbsp;&nbsp;<b>External URL</b>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnIsExternalHelpUrl'></span>
		</td>
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
		
		<DataObject Key='BudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value='' Bool=''/>
				<Argument Type='QueryString' TypeKey='BudgetCategoryID' PropertyKey='BudgetCategoryID' Value='' Bool='AND'/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='ParentID' Value='0' />					
				<Argument Type='' TypeKey='' PropertyKey='HasNotes' Value='False' />
				<Argument Type='' TypeKey='' PropertyKey='HasChild' Value='0'  />
				<Argument Type='' TypeKey='' PropertyKey='SortOrder' Value='0'  />
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
				<DisplayProperty PropertyKey='Guideline'>
					<Control ID='ctlGuideline'
						Container='spnGuideline'
						Type='cTextBox'
						Size='40'
						MaxLength='500' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsExternalHelpUrl'>
					<Control ID='ctlIsExternalHelpUrl'
						Container='spnIsExternalHelpUrl'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='IsExternalHelpUrl'/>
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
								<Argument AttributeName='PageKey' Value='BudgetManagerEditorvB'/>
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
		
	</ModuleSection>
</span>