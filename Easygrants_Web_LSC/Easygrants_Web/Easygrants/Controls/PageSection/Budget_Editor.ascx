<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cBudget_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />


<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr id='trType' visible='false'>
		<td>
			<b>Budget Type</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnBudgetType' runat='server'/>
		</td>
	</tr>
	<tr visible='false'>
		<td><b>Project Name&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnDescription' runat='server'/></td>
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
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value=''/>
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
						DisplayNone='False'>
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='BudgetTypeID' Value='2' Operator='NotEqual' />
							<Argument Type='' TypeKey='' PropertyKey='BudgetTypeID' Value='3' Operator='NotEqual' />
						</Filters>
						<Sort>
	                        <Argument PropertyKey='Description'/>
                        </Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Type='cTextBox'
						Container='spnDescription'
						Size='25'
						MaxLength='255'
						RequiredField='False'
						ErrorMessage='Enter a Description for the Budget.'>
					</Control>
				</DisplayProperty>																		
			</DisplayProperties>																		
		</DataObject>

	</ModuleSection>
</span>
<!-- End Embedded XML -->
