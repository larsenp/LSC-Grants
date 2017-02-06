<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cLSCDataCollectionGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

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

<span runat='server' id='spnBudgetGrid' />
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
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
		<DataObject Key='LscTigBudget' DataObjectDefinitionKey='LscTigBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscTigBudgetTypeID' Value="1" />
			</Filters>
		</DataObject>
		<DataObject Key='LscTigBudgetTotal' DataObjectDefinitionKey='LscTigBudgetTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudget' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID' />
			</Filters>
		</DataObject>
		<DataObject Key='LscTigBudgetItem' DataObjectDefinitionKey='LscTigBudgetItem' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscTigBudget' DataObjectPropertyKey='LscTigBudgetID' PropertyKey='LscTigBudgetID' />
				<Argument PropertyKey='SortOrder' Value='13' Operator='NotEqual' >
					<RelatedProperty PropertyKey='BudgetCategory'/>
				</Argument>
			</Filters>
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
				<DisplayProperty PropertyKey='Amount' Format='$#,0' HtmlEncode='False'>
					<Control ID='lblGrid'
						Type='cLabel'
						DateFormat='$#,0'/>
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