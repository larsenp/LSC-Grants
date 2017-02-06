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
<p>Please enter whole dollar amounts for any relevant fields for your project's total budget.  Do not enter anything 
if the field does not apply.  For each field completed, you will need to provide a Budget Narrative on the following 
screen.</p>
<p>If you have negotiated a grant amount different from the approved amount, the total in column A must match the negotiated amount.
If not, the total in column A must match the approved amount displayed  above. In all cases, the total in column A must match the total
amount from the Payment Schedule form.</p>
<br />
<div style="width:100%" class='SeparatorHdg'>
	Budget
</div>
<br />
<b>Approved Grant Amount</b>&nbsp;<span runat='server' id='spnRecommendedAmount' /><br /><br />
<hr style="height:1px; color:Gray" />
  <span runat='server' id='spnBudgetGrid' />
  <br /><br />
  <div style="text-align:center"><span runat='server' id='spnSave'/><span runat='server' id='spnContinue'/></div>
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RecommendedAmount' Format='$#,0'>
					<Control ID='spnRecommendedAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscTigBudgetLine' DataObjectDefinitionKey='LscTigBudgetLine' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument PropertyKey='LscTigBudgetLineID' Value='16' Operator='NotEqual' />
				<Argument Group='(' Bool='And' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='EndDate' Operator='GreaterThan' Bool=''/>
				<Argument PropertyKey='EndDate' Value='' Bool='Or' />
				<Argument Group=')' Bool='' />
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
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
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
		<DataObject Key='LscTigBudgetByLine' DataObjectDefinitionKey='LscTigBudgetByLine' Updatable='False' CreateNew='False'>
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
			<GridData DataObjectKey='LscTigBudgetItem' RowsDataPropertyKey='LscTigBudgetLineID' ColsDataPropertyKey='LscTigBudgetFundingTypeID' CssClass='GridItem'>
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
					<Column Key='LineTotals' DataObjectKey='LscTigBudgetByLine' JoinPropertyKey='LscTigBudgetLineID' DataPropertyKey='LineTotal' CssClass='Totals' Format='$#,0'/>
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
				<MainRows DataObjectKey='LscTigBudgetLine' RowHeaderPropertyKey='FullDescription' RowHeaderCssClass='Header' GridDataPropertyKey='LscTigBudgetLineID'  SortPropertyKey='SortOrder'/>
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