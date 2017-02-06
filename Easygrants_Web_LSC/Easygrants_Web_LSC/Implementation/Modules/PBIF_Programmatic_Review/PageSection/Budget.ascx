<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cLSCDataCollectionGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../../../../Core/Controls/Base/CSSButton.ascx' %>

<style>

<!--

	.Header {
		text-align: Left;
		vertical-align:top;
		font-weight: bold;
		Width:15%
	}
	
	.HeaderCol {
		text-align: center;
		vertical-align:top;
		font-weight: bold;
		Width:15%
	}

	.Totals {
		text-align: right;
		font-weight: bold;
		vertical-align:top;
		padding-right:5px
	}
	
	.SubTotals {
		text-align: right;
		font-weight: bold;
		vertical-align:top;
		padding-right:5px;
		Background-color: E6E6E6
	}
	
	.GridItem {
		font-size: 10pt;
		text-align: right;
	}
	
	.BudgetGrid {
	    padding:0px;
	    }
	
-->
</style>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/PBIF_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
	<p>
		The <em>Budget Form </em>includes three budget categories: Personnel Expenses, Project Expenses, and Third Party Contracts.&nbsp; Within these categories are twelve budget line items.
	</p>

	<p>The Budget Form also asks Applicants to indicate who is contributing to each of the budget line items.&nbsp; The following five columns capture this information: &nbsp;</p>

	<ol style="list-style-type:upper-alpha">
		<li>
			<strong>Pro Bono Innovation Fund Share</strong>: The amount requested from LSC for this grant.
		</li>
		<li>
			<strong>Applicant Share:</strong> The Applicant&rsquo;s contributions.
		</li>
		<li>
			<strong>Cash Support from Other Partners:</strong> Cash contributions from other partners.
		</li>
		<li>
			<strong>In-Kind Support from Other Partners:</strong> The value of in-kind contributions from other partners.
		</li>
		<li>
			<strong>Total Columns A through D:</strong> Provides the combined total of columns (A) - (D). This column will be automatically tabulated by the application system.
		</li>
	</ol>

	<p>
		For descriptions of each budget line item, see Appendix I of the <a href="http://lsc.gov/sites/lsc.gov/files/LSCProBonoInnovationFund2014NOFA.pdf">Notice of Funds Availability</a>.
	</p>

	<div style="width:100%" class='SeparatorHdg'>
	Budget
</div>
<br />
<b>Total Grant Request</b>&nbsp;<span runat='server' id='spnGrantRequest' /><br /><br />
<b>Total Project Budget</b>&nbsp;<span runat='server' id='spnProjectBudget' /><br /><br />
<div style="width:1100" >
<hr style="height:1px; color:Gray" />
  <span runat='server' id='spnBudgetGrid' />
</div>
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='WfTaskAssignmentApp' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='WfTaskID' Value='100'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscPbifApp' DataObjectDefinitionKey='LscPbifApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignmentApp' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AmountRequested' Format='$#,0'>
					<Control ID='spnGrantRequest'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalBudget' Format='$#,0'>
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
		<DataObject Key='BudgetCategory_LineItems' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProject.WfProjectID' PropertyKey="ProjectID"/>
				<Argument PropertyKey="HasChild" Value="0" />
				<Argument PropertyKey="ParentID" Value="0" Operator='GreaterThan'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
		</DataObject>
		<DataObject Key='BudgetCategory_Categories' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProject.WfProjectID' PropertyKey="ProjectID"/>
				<Argument PropertyKey="HasChild" Value="0" Operator="GreaterThan"/>
				<Argument PropertyKey="ParentID" Value="0" Operator='GreaterThan'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
		 </DataObject>	
		<DataObject Key='LscPBIFgBudgetFundingType' DataObjectDefinitionKey='LscPBIFgBudgetFundingType' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='EndDate' Operator='GreaterThan' />
				<Argument PropertyKey='EndDate' Value='' Bool='Or' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
		</DataObject>
		<DataObject Key='LscPBIFBudget' DataObjectDefinitionKey='LscPBIFBudget' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignmentApp' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPBIFBudgetTypeID' Value="1" />
			</Filters>
		</DataObject>
		<DataObject Key='LscPBIFBudgetTotal' DataObjectDefinitionKey='LscPBIFBudgetTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
			</Filters>
		</DataObject>
		<DataObject Key='LscPBIFBudgetItem' DataObjectDefinitionKey='LscPBIFBudgetItem' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
			</DefaultValues>
		</DataObject>
		<DataObject Key='LscPBIFBudgetByCategory' DataObjectDefinitionKey='LscPBIFBudgetByCategory' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscPBIFBudgetCategoryTotal' DataObjectDefinitionKey='LscPBIFBudgetCategoryTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
			</Filters>
		</DataObject>
		<DataObject Key='LscPBIFBudgetCategoryTotalByFundingType' DataObjectDefinitionKey='LscPBIFBudgetCategoryTotalByFundingType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscPBIFBudgetByFundingType' DataObjectDefinitionKey='LscPBIFBudgetByFundingType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPBIFBudget' DataObjectPropertyKey='LscPBIFBudgetID' PropertyKey='LscPBIFBudgetID' />
			</Filters>
		</DataObject>
		
		<DataCollectionGrid Container='spnBudgetGrid' CssClass='BudgetGrid'>
			<GridData DataObjectKey='LscPBIFBudgetItem' RowsDataPropertyKey='BudgetCategoryID' ColsDataPropertyKey='LscPBIFBudgetFundingTypeID' TotalPropertyKey='Amount' CssClass='GridItem'>
				<DisplayProperty PropertyKey='Amount' HtmlEncode='False' Format='#,0'>  
					<Control ID='spnGrid'
						Type='cLabel'/>
				</DisplayProperty>
			</GridData>
			<Columns>
				<MainColumns DataObjectKey='LscPBIFgBudgetFundingType' GridDataPropertyKey='LscPBIFBudgetFundingTypeID' SortPropertyKey='SortOrder'/>
				<TotalsColumns>
					<Column Key='LineTotals' DataObjectKey='LscPBIFBudgetByCategory' JoinPropertyKey='SortOrder' DataPropertyKey='CategoryTotal' CssClass='Totals' Format='$#,0'/>
				</TotalsColumns>
			</Columns>
			<Rows>
				<HeaderRows>
					<HeaderRow ColDataPropertyKey='Abbr' CssClass='HeaderCol' >
						<ExtraColumns>
							<Column Text='E' CssClass='HeaderCol' />
						</ExtraColumns>
					</HeaderRow>
					<HeaderRow ColDataPropertyKey='Description' CssClass='HeaderCol'>
						<ExtraColumns>
							<Column Text='Total Columns A through D'  CssClass='HeaderCol'/>
						</ExtraColumns>
					</HeaderRow>
				</HeaderRows>
				<MainRows DataObjectKey='BudgetCategory_LineItems' RowHeaderPropertyKey='Description' GridCategoryDataPropertyKey='ParentID'  RowHeaderCssClass='Header' GridDataPropertyKey='BudgetCategoryID' SortPropertyKey='SortOrder'/>
				<CategoryRows DataObjectKey='BudgetCategory_Categories' CategoryDataPropertyKey='BudgetCategoryID'  >
				    <SubTotals HeaderPrefix='Subtotal'>
				        <Row Key='SubTotals' DataObjectKey='LscPBIFBudgetCategoryTotalByFundingType' RowsDataPropertyKey='BudgetCategoryID' ColsDataPropertyKey='LscPBIFBudgetFundingTypeID' DataPropertyKey='Amount' Format='$#,0'  CssClass='SubTotals'>
				        <ExtraCells>
							    <Cell DataObjectKey='LscPBIFBudgetCategoryTotal' RowsDataPropertyKey='BudgetCategoryID' ColsDataPropertyKey='LscPBIFBudgetFundingTypeID'  DataPropertyKey='Amount' Format='$#,0' CssClass='SubTotals'/>
						    </ExtraCells>
					    </Row>
				    </SubTotals>
				</CategoryRows>
				<FooterRows>
					<Row Key='Percentages' DataObjectKey='LscPBIFBudgetByFundingType' JoinPropertyKey='LscPBIFBudgetFundingTypeID' DataPropertyKey='LscPBIFBudgetByFundingTypePct.BudgetPct' Format='#0%' HeaderText='Percentages' HeaderCssClass='Header' CssClass='Totals'/>
					<Row Key='Totals' DataObjectKey='LscPBIFBudgetByFundingType' JoinPropertyKey='LscPBIFBudgetFundingTypeID' DataPropertyKey='FundingTypeTotal' Format='$#,0' HeaderText='Totals'  HeaderCssClass='Header' CssClass='Totals'>
						<ExtraCells>
							<Cell DataObjectKey='LscPBIFBudgetTotal' DataPropertyKey='BudgetTotal' Format='$#,0' CssClass='Totals'/>
						</ExtraCells>
					</Row>
				</FooterRows>
			</Rows>
		</DataCollectionGrid>
    </ModuleSection>
  </span>