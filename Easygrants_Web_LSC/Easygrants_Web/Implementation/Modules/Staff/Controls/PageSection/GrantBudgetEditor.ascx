<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cGrantBudgetEditor" Codebehind="GrantBudgetEditor.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table border='0' cellspacing='0' cellpadding='2' runat='server' id='tblBudget' width='100%'>

<tr><td colspan='2' class='SeparatorHdg'><b>Budget</b></td></tr>
<tr><td colspan='2'>&nbsp;</td></tr>
<tr>
	<td width='15%'>
		<b>Budget Version&nbsp;</b><%=kDenoteRequiredField%>
	</td>
	<td>
		<span id='spnBudgetType' runat='server'/>
	</td>
</tr>

<tr>
	<td><b>Description&nbsp;</b><%=kDenoteRequiredField%>
	</td>
	<td><span id='spnDescription' runat='server'/></td>
</tr>
<tr><td>&nbsp;</td></tr>

</table>

<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'/>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=Budget&QueryStringKey=BudgetID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />
	
<table id="Table1" border='0' cellspacing='0' cellpadding='2'  runat='server' width='100%'>
<tr><td>&nbsp;</td></tr>
<tr>
	<td align='center'>
	    <span runat='server' id='spnCalculate'/>
		<span runat='server' id='spnSaveAndClose'/>
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>

</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	    <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='BudgetID' 
					PropertyKey='BudgetID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='BudgetID' 
					PropertyKey='BudgetID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BudgetTypeID'>
					<Control ID='ctlBudgetType'
						Container='spnBudgetType'
						Type='cDropDown'
						DataObjectDefinitionKey='BudgetType'
						StoredValue='BudgetTypeID'
						DisplayValue='Description'	
						RequiredField='True'
						DisplayText='Select'
						DisplayNone='False'
						ErrorMessage='Budget Version is required.'>
						<Sort>
							<Argument PropertyKey='Abbr' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Type='cTextBox'
						Container='spnDescription'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Description is required.'>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>																		
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate'
						Container='spnCalculate'
						Type='cButton'
						Image='Calculate_and_Save'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='RecalculateBudget'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<%--<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>--%>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='Close'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->