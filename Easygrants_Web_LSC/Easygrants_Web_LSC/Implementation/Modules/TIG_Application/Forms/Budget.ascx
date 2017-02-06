<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cLSCDataCollectionGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../../../../Core/Controls/Base/CSSButton.ascx' %>

<style>

<!--

	.Header {
		text-align: left;
		vertical-align:top;
		font-weight: bold;
	}

	.Totals {
		text-align: right;
		font-weight: bold;
		vertical-align:top;
		padding-right:20px
	}
	
	.GridItem {
		font-size: 8pt;
		text-align: center
	}
	
-->
</style>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
<p><strong>IMPORTANT</strong>: Prior to completing the Budget and the Budget Narrative, be sure to review the guidance provided for the Budget Form, Budget Narrative, and Description of Budget Line Items in <a href='http://www.lsc.gov/grants-grantee-resources/our-grant-programs/tig' target="_blank"><em>Appendix I: Guidelines for Preparing Applications</em> in the Legal Services Corporation Technology Initiative Grant Program's Application Instructions for 2016 Grant Funding.</a> </p>

<p>Please enter whole dollar amounts for any relevant fields for your project’s total budget. Do not enter anything if the field does not apply. LSC will allow costs that are directly allocable to the project. General administrative costs are not allowed. For each field completed, you will need to provide a budget narrative response on the following screen.</p>
<p><i><b>Note:</b></i> Do not request LSC funding to travel to the TIG Conference in column (a). LSC will add funding to send one person to the TIG Conference for each TIG awarded.</p>
<div style="width:100%" class='SeparatorHdg'>
	Budget
</div>
<br />
<b>Total Grant Request</b>&nbsp;<span runat='server' id='spnGrantRequest' /><br /><br />
<b>Total Project Budget</b>&nbsp;<span runat='server' id='spnProjectBudget' /><br /><br />
<div style="width:800" >
<hr style="height:1px; color:Gray" />
  <span runat='server' id='spnBudgetGrid' />
</div>
  <br /><br />
  <div style="text-align:center"><span runat='server' id='spnSave'/><span runat='server' id='spnContinue'/></div>
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantRequest' Format='$#,0'>
					<Control ID='spnGrantRequest'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectBudget' Format='$#,0'>
					<Control ID='spnProjectBudget'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
		</DataObject>
		<DataObject Key='BudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProject.WfProjectID' PropertyKey="ProjectID"/>
				<Argument PropertyKey="SortOrder" Value="13" Operator="NotEqual"/>
				<Argument PropertyKey="ParentID" Value="0" Operator="NotEqual"/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save and Calculate'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscTigBudgetFundingType' DataObjectDefinitionKey='LscTigBudgetFundingType' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='EndDate' Operator='GreaterThan' />
				<Argument PropertyKey='EndDate' Value='' Bool='Or' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
		</DataObject>
		<DataObject Key='LscTigBudget' DataObjectDefinitionKey='LscTigBudget' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscTigBudgetTypeID' Value="1" />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscTigBudgetTypeID' Value="1" />
			</DefaultValues>
		</DataObject>
		<DataObject Key='LscTigBudgetTotal' DataObjectDefinitionKey='LscTigBudgetTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudget' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID' />
			</Filters>
		</DataObject>
		<DataObject Key='LscTigBudgetItem' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudget' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudget' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID' />
			</DefaultValues>
		</DataObject>
		<DataObject Key='LscTigBudgetByCategory' DataObjectDefinitionKey='LscTigBudgetByCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudget' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID' />
			</Filters>
		</DataObject>
		<DataObject Key='LscTigBudgetByFundingType' DataObjectDefinitionKey='LscTigBudgetByFundingType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudget' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID' />
			</Filters>
		</DataObject>
		
		<DataCollectionGrid Container='spnBudgetGrid'>
			<GridData DataObjectKey='LscTigBudgetItem' RowsDataPropertyKey='BudgetCategoryID' ColsDataPropertyKey='LscTigBudgetFundingTypeID' CssClass='GridItem'>
				<DisplayProperty PropertyKey='Amount'>
					<Control ID='txtGrid'
						Type='cMoneyTextBox'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='All budget values must be whole numbers.'
						RegExErrorMessage='All budget values must be whole numbers.'
						MaxLength='10'
						Size='6' />
				</DisplayProperty>
			</GridData>
			<Columns>
				<MainColumns DataObjectKey='LscTigBudgetFundingType' GridDataPropertyKey='LscTigBudgetFundingTypeID' SortPropertyKey='SortOrder'/>
				<TotalsColumns>
					<Column Key='LineTotals' DataObjectKey='LscTigBudgetByCategory' JoinPropertyKey='SortOrder' DataPropertyKey='CategoryTotal' CssClass='Totals' Format='$#,0'/>
				</TotalsColumns>
			</Columns>
			<Rows>
				<HeaderRows>
					<HeaderRow ColDataPropertyKey='Abbr' CssClass='Header' >
						<ExtraColumns>
							<Column Text='E' CssClass='Header'/>
						</ExtraColumns>
					</HeaderRow>
					<HeaderRow ColDataPropertyKey='Description' CssClass='Header'>
						<ExtraColumns>
							<Column Text='Total Columns A through D'  CssClass='Header'/>
						</ExtraColumns>
					</HeaderRow>
				</HeaderRows>
				<MainRows DataObjectKey='BudgetCategory' RowHeaderPropertyKey='FullDescription' RowHeaderCssClass='Header' GridDataPropertyKey='BudgetCategoryID'  SortPropertyKey='SortOrder'/>
				<FooterRows>
					<Row Key='Percentages' DataObjectKey='LscTigBudgetByFundingType' JoinPropertyKey='LscTigBudgetFundingTypeID' DataPropertyKey='LscTigBudgetByFundingTypePct.BudgetPct' Format='#0%' HeaderText='Percentages' HeaderCssClass='Header' CssClass='Totals'/>
					<Row Key='Totals' DataObjectKey='LscTigBudgetByFundingType' JoinPropertyKey='LscTigBudgetFundingTypeID' DataPropertyKey='FundingTypeTotal' Format='$#,0' HeaderText='Totals'  HeaderCssClass='Header' CssClass='Totals'>
						<ExtraCells>
							<Cell DataObjectKey='LscTigBudgetTotal' DataPropertyKey='BudgetTotal' Format='$#,0' CssClass='Totals'/>
						</ExtraCells>
					</Row>
				</FooterRows>
			</Rows>
		</DataCollectionGrid>
    </ModuleSection>
  </span>