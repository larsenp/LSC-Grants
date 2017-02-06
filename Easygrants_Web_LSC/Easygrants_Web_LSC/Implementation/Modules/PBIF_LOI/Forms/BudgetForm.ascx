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
		font-size: 8pt;
		text-align: right;
	}
	
	.BudgetGrid {
	    padding:0px;
	    width:50%;
	    }
	
-->
</style>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br />
<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
	<p>
		The Estimated Budget includes three budget categories: Personnel Expenses, Project Expenses, and Third Party Contracts.  Within these categories are twelve general budget line items.
	</p>

	<p>
        For descriptions of each budget line item, see Appendix I of the <a href="http://www.lsc.gov/sites/default/files/attach/2016/02/2015_Pro_Bono_Innovation_Fund_Notice_of_Funds_Availability_0.pdf" target="_blank"> 2015 Pro Bono Innovation Fund Notice of Funds Availability.</a> 
	</p>

	<div style="width:100%" class='SeparatorHdg'>
	Estimated Budget
</div>

<div style="width:1100" >
    <span runat='server' id='spnBudgetGrid' />
    <p>
        Note: Applicants are encouraged to provide as complete an estimate as possible despite the preliminary nature of the Letter of Intent to Apply. LSC recognizes that the budget information provided is an initial estimate only and subject to change if applicants are invited to submit a full application.
    </p>
</div>

  <br /><br />
  <div style="text-align:center"><span runat='server' id='spnSave'/><span runat='server' id='spnContinue'/></div>
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
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
				<%--<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='EndDate' Operator='GreaterThan' />
				<Argument PropertyKey='EndDate' Value='' Bool='Or' />--%>
				<Argument PropertyKey='LscPBIFBudgetFundingTypeID' Value='1' Bool=''/>
				<Argument PropertyKey='LscPBIFBudgetFundingTypeID' Value='5' Bool='Or'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
		</DataObject>
		<DataObject Key='LscPBIFBudget' DataObjectDefinitionKey='LscPBIFBudget' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPBIFBudgetTypeID' Value="1" />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='LscPBIFBudgetTypeID' Value="1" />
			</DefaultValues>
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
				<DisplayProperty PropertyKey='Amount'>
					<Control ID='txtGrid'
						Type='cMoneyTextBox'
						AllowInputCommas='True'
						Format='#,0'
						TextAlign='Right'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='All budget values must be whole numbers.'
						RegExErrorMessage='All budget values must be whole numbers.'
						MaxLength='10'
						Size='6' />
				</DisplayProperty>
			</GridData>
			<Columns>
				<MainColumns DataObjectKey='LscPBIFgBudgetFundingType' GridDataPropertyKey='LscPBIFBudgetFundingTypeID' SortPropertyKey='SortOrder'/>
				<TotalsColumns>
					<%--<Column Key='LineTotals' DataObjectKey='LscPBIFBudgetByCategory' JoinPropertyKey='SortOrder' DataPropertyKey='CategoryTotal' CssClass='Totals' Format='$#,0'/>--%>
				</TotalsColumns>
			</Columns>
			<Rows>
				<HeaderRows>
                    <%--<HeaderRow ColDataPropertyKey='Abbr' CssClass='HeaderCol' >
						<ExtraColumns>
							<Column Text='E' CssClass='HeaderCol' />
						</ExtraColumns>
					</HeaderRow>--%>
					<HeaderRow ColDataPropertyKey='Description' CssClass='HeaderCol'>
						<%--<ExtraColumns>
							<Column Text='Totals'  CssClass='HeaderCol'/>
						</ExtraColumns>--%>
					</HeaderRow>
				</HeaderRows>
				<MainRows DataObjectKey='BudgetCategory_LineItems' RowHeaderPropertyKey='Description' GridCategoryDataPropertyKey='ParentID'  RowHeaderCssClass='Header' GridDataPropertyKey='BudgetCategoryID' SortPropertyKey='SortOrder'/>
				<CategoryRows DataObjectKey='BudgetCategory_Categories' CategoryDataPropertyKey='BudgetCategoryID'  >
				    <SubTotals HeaderPrefix='Subtotal'>
				        <Row Key='SubTotals' DataObjectKey='LscPBIFBudgetCategoryTotalByFundingType' RowsDataPropertyKey='BudgetCategoryID' ColsDataPropertyKey='LscPBIFBudgetFundingTypeID' DataPropertyKey='Amount' Format='$#,0'  CssClass='SubTotals'>
				            <%--<ExtraCells>
							    <Cell DataObjectKey='LscPBIFBudgetCategoryTotal' RowsDataPropertyKey='BudgetCategoryID' ColsDataPropertyKey='LscPBIFBudgetFundingTypeID'  DataPropertyKey='Amount' Format='$#,0' CssClass='SubTotals'/>
						    </ExtraCells>--%>
					    </Row>
				    </SubTotals>
				</CategoryRows>
				<FooterRows>
					
					<Row Key='Totals' DataObjectKey='LscPBIFBudgetByFundingType' JoinPropertyKey='LscPBIFBudgetFundingTypeID' DataPropertyKey='FundingTypeTotal' Format='$#,0' HeaderText='Totals'  HeaderCssClass='Header' CssClass='Totals'>
						<%--<ExtraCells>
							<Cell DataObjectKey='LscPBIFBudgetTotal' DataPropertyKey='BudgetTotal' Format='$#,0' CssClass='Totals'/>
						</ExtraCells>--%>
					</Row>
					<Row Key='Percentages' DataObjectKey='LscPBIFBudgetByFundingType' JoinPropertyKey='LscPBIFBudgetFundingTypeID' DataPropertyKey='LscPBIFBudgetByFundingTypePct.BudgetPct' Format='#0%' HeaderText='Percentages' HeaderCssClass='Header' CssClass='Totals'/>
				</FooterRows>
			</Rows>
		</DataCollectionGrid>
    </ModuleSection>
  </span>