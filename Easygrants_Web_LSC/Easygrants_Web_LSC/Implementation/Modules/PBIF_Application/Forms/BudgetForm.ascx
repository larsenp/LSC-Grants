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
<div style='width:600px'>
	<p>You must submit a proposed budget that includes the proposed Pro Bono Innovation Fund’s share of the project and other sources of support.  Submitting complete budget information requires you to do the following three steps:</p>

	<ol>
		<li>
			Complete a <em>Budget Detail</em> in the Excel template provided in the next section, which will populate the project <em>Budget Form</em> sheet in the Excel template.
		</li>
		<li>
			Upload the completed Excel spreadsheet <em>Budget Detail</em> in the next section
		</li>
		<li>
			<strong><u>Reenter</u> <em>Budget Form</em> data into the LSC Grants online Budget Form below.</strong> 
		</li>
	</ol>

	<p>
		For more information on eligible costs and completing the proposed project budgets please see Appendix I of the <a href='http://www.lsc.gov/sites/default/files/attach/2016/05/2016_PBIF_Application_Instructions.pdf' target='_blank'>Application Instructions</a>.
	</p>
</div>
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
  <br /><br />
  <div style="text-align:center"><span runat='server' id='spnSave'/><span runat='server' id='spnContinue'/></div>
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='LscPbifApp' DataObjectDefinitionKey='LscPbifApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
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
				<Argument PropertyKey='LscPBIFBudgetFundingTypeID' Value='2' Bool='Or'/>
				<Argument PropertyKey='LscPBIFBudgetFundingTypeID' Value='3' Bool='Or'/>
				<Argument PropertyKey='LscPBIFBudgetFundingTypeID' Value='4' Bool='Or'/>
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