<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cBudgetDetails" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
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
<tr>
	<td><b>Grant Agreement</b>
	</td>
	<td><span id='spnGrantAgreement' runat='server'/></td>
</tr>
<tr>
	<td><b>Notes</b></td>
	<td><span id='spnNotes' runat='server'/></td>
</tr>
<tr>
	<td></td>
	<td>Limit to 1000 characters</td>
</tr>
<tr><td>&nbsp;</td></tr>

</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave' />
		</td>
		<td align='center'>
			<span runat='server' id='spnSaveClose' />
		</td>
		<td>&nbsp;</td>		
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table   runat='server' id='TdBudgetDetailsItemsList' visible='false' width='100%'>
	
	<tr>
		<td class="SeparatorHdg" colspan='2'><b>Budget Detail Sections</b></td>
	</tr>
	
	<tr>
		<td colspan='2'>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnBudgetDetailsItemsList'/></td>
	</tr>
	<tr>
		<td colspan='2'><HR></td>
	</tr>
	<tr>
	<td  width='49%'><b>Budget Grand Total</b></td>
	<td><span id='spnBudgetGrandTotal' runat='server'/></td>
</tr>
<tr>
		<td colspan='2'><HR></td>
	</tr>	
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=Budget&QueryStringKey=BudgetID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' ID="Table3">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>		
		<td align='center'>
			<span runat='server' id='spnCancel' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center' ID="Table4">
	<tr>
		<td align='center'>
			<span runat='server' id='spnSubmit' />
		</td>
	</tr>
</table> 
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	

		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
		</DataObject>		
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='BudgetID' PropertyKey='BudgetID' Value='' Bool=''/>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False' />
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
				<DisplayProperty PropertyKey='GrantAgreement'>
					<Control ID='ctlGrantAgreement'
						Type='cCheckBox'
						Container='spnGrantAgreement'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Notes'>
					<Control ID='ctlNotes'
						Type='cTextArea'
						Container='spnNotes'
						Rows='3'
						Cols='60'
						MaxLength='1000'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Total' Format='$#,##0.00'>
					<Control ID='spnBudgetGrandTotal'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>																		
		</DataObject>
		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod' Updatable='True' CreateNew='True'>
			<Filters>
				 <Argument Type='DataObjectCollection' TypeKey='Budget' DataObjectPropertyKey='BudgetID' PropertyKey='BudgetID' />
				 <Argument Type='' TypeKey='' PropertyKey='BudgetPeriodNameID' Value='1'/>
			</Filters>
			<DefaultValues>
				 <Argument Type='DataObjectCollection' TypeKey='Budget' DataObjectPropertyKey='BudgetID' PropertyKey='BudgetID' />
				 <Argument Type='' TypeKey='' PropertyKey='BudgetPeriodNameID' Value='1'/>		
				 <Argument Type='' TypeKey='' PropertyKey='BudgetPeriodName' Value='Budget Period 1'/>		
				 <Argument Type='' TypeKey='' PropertyKey='BudgetYear' Value='Year 1'/>		
				 <Argument Type='' TypeKey='' PropertyKey='BudgetPeriodDescription' Value='Budget Period 1'/>		
				 <Argument Type='' TypeKey='' PropertyKey='BudgetPeriodDescriptionID' Value='1'/>						     		 
			</DefaultValues>
			<DisplayProperties>				
			</DisplayProperties>																		
		</DataObject>
			
	<DataObject Key='BudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='True' CreateNew='True'>	
			<Filters>
                <Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='ProjectID' />                
            </Filters>	
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlBudgetDetailsItemsList' Container='spnBudgetDetailsItemsList' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Easygrants/Controls/PageSection/BudgetDetailsItems.ascx' />
				</DisplayProperty>				               
			</DisplayProperties>
	</DataObject>	
	<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' Type='cButton' Image='Save' EnterKey='True' Caption='Save'>
						<Action PostBack='True' AutoSave='True' Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='BudgetDetails'/>
									<Argument Type='DataObjectCollection' TypeKey='Budget' DataObjectPropertyKey='BudgetID' PropertyKey='BudgetID' BaseValue='BudgetID='/>	
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>								
									<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose' Container='spnSaveClose' Type='cButton' Image='Save'  Caption='Save and Close'>
						<Action PostBack='True' AutoSave='True' Object='EventController'
								Method='EventController_NavigateToURL'>
								<Parameters>
									<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnCancel' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
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
<!-- End Embedded XML -->
