<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cProjectedExpensesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width='600' border="0" cellpadding="0" cellspacing="0">
		    <tr>
		      <td><h1>Projected Expenses (Form D-12)</h1></td>
  </tr>
		    <tr>
		      <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
                <tr>
                  <td colspan="4" class="SeparatorHdg">Instructions</td>
                </tr>
                <tr>
                  <td colspan="4" >&nbsp;</td>
                </tr>
                <tr>
                  <td valign="top" ><p>This <strong>Projected Expenses (Form D-12)</strong> page captures projected LSC and non-LSC expenses for the grant year. </p>
                      <ul>
                        <li><strong><font color="#990000">All applicants must complete Projected Expenses (Form D-12). </font></strong></li>
                        <li>Enter your budget detail in the fields below.</li>
                        <li>To save the data and see the totals, click <b>Save and Calculate</b>.</li>
                        <li>To return to the previous page, click <b>Close</b>.</li>
                        <li>Calculate total projected expenses for the grant year based on the most current data available. Do not include expenses related to donated services (e.g., volunteer attorney time, donated office equipment). </li>
                        <li>Applicants applying for more than one LSC service area must complete separate forms for each service area. </li>
                        <li> Refer to the definitions for expenses at the end of this instruction for a description of the types of expenses to be reported under each expense category. </li>
                        <li> Limit projected expenses to those incurred in delivering civil legal assistance to eligible clients as determined by 45 C.F.R. Part 1611.</li>
                        <li><span runat='server' id='spnExpenseDefinitions' /></li>
                      </ul>
                      <p><strong> Column (1) LSC Expenditures:</strong></p>
                      <p> Report total projected LSC expenses for the grant year. </p>
                      <p><strong> Column (2) Non-LSC Expenditures:</strong></p>
                      <p> Report total non-LSC expenses projected for the grant year. </p>
                      <p> <strong>Column (3) Total Expenditures:</strong></p>
                      <p> This is a calculated field and reflects total projected LSC and non-LSC expenses. </p>
                      <p><strong> A note about fund balances: </strong> The Corporation will assume that differences between projected Support and Revenue shown on Form D-14 and projected expenditures shown on Form D-12 are either planned fund balances or planned deficits. See 45 C.F.R. Part 1628 for LSC rules regarding LSC fund balances and deficits. </p>
                      <p><strong> Follow the steps below for assistance on this form: </strong></p>
                      <ol>
                        <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
                        <li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>.</li>
                        <li>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov"> haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. </li>
                      </ol></td>
                  <td >&nbsp;</td>
                  <td >&nbsp;</td>
                  <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
                </tr>
              </table></td>
  </tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Service Area</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td	width='10%'><b>Service Area</b></td>
		<td width='40%'><span id='spnSAname' runat='server'/></td>
		<td width='20%'><b>Projections for Calendar Year:</b></td>
		<td width='30%'><span id='spnProjectionsYear' runat='server'/></td>
	</tr>
</table>
<br>

<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'/>
<br />
<a name='footnote1' />
<sup><a href='#footref1'>1</a></sup>Report non-LSC expenses only for the provision of civil legal services.
<br>
<br />
<div style="text-align: center">
	<span runat='server' id='spnCalculate'/>
	<span runat='server' id='spnClose'/>
</div>

<!-- USER MODIFIIABLE CONTENT AREA -->


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
		  <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		  </Filters>
		  <DisplayProperties>
				<DisplayProperty PropertyKey='vLSCCompWftaOrgServareaYear.WFTAYear'>
					<Control ID='spnProjectionsYear' Type='HtmlGenericControl'/>
				</DisplayProperty>
		  </DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False' >
		  <Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
		  </Filters>
		  <DisplayProperties>
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnSAname' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate'
						Container='spnCalculate'
						Type='cButton'
						Image='Save_and_Calculate'>
						<Action
							PostBack='True'
							AutoSave='True'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
				  <Control ID='ctlExpenseDefinitions' Container='spnExpenseDefinitions' Type='cLink' Caption='Click here to view Expense Definitions.'>
					<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
					  <Parameters>
						<Argument Value='ExpenseDefinitions' />
					  </Parameters>
					</Action>
				  </Control>
				</DisplayProperty>
				
		</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' Updatable='True' CreateNew='True'>
		  <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' >
					<RelatedProperty PropertyKey='LscWfTABudgetPeriod' />
				</Argument>
		  </Filters>
		</DataObject>
		
		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod' Updatable='True' CreateNew='True'>
		  <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' >
					<RelatedProperty PropertyKey='LscWfTABudgetPeriod' />
				</Argument>
		  </Filters>
		</DataObject>
		
		<DataObject Key='TopBudgetCategory' DataObjectDefinitionKey='BudgetCategory' Updatable='False' CreateNew='False'>
		  <Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='WfProjectID' PropertyKey='ProjectID' />
				<Argument PropertyKey='CategoryTypeID' Value='1' />
				<Argument PropertyKey='ParentID' Value='0'>
					 <RelatedProperty PropertyKey='Parent'/>
				</Argument>
		  </Filters>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->

