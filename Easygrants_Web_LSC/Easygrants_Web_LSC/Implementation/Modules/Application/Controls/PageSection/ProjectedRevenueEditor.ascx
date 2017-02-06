<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cProjectedRevenueEditor" Codebehind="ProjectedRevenueEditor.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
		    <tr>
		      <td><h1>Projected Revenue (Form D-14)</h1></td>
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
                  <td valign="top" ><p>The <strong>Projected Revenue (Form D-14)</strong> page captures projected support and revenue data for the grant year.</p>
                      <ul>
                        <li><font color="#990000"><strong>All applicants must complete this page.</strong></font></li>
                        <li>Applicants who apply for more than one service area must complete a separate form for each service area. </li>
                        <li>To save the data and see the totals, click <b>Save and Calculate</b>.</li>
                        <li>To return to the previous page, click <b>Close.</b></li>
                        <li><span runat='server' id='spnSupportandRevenueDefinitions' /></li>
                      </ul>
                      <p> <strong>A note about fund balances: </strong>The Corporation will assume that differences between projected Support and Revenue shown on Form D-14 and projected expenditures shown on Form D-12 are either planned fund balances or planned deficits. See 45 C.F.R. Part 1628 for LSC rules regarding LSC fund balances and deficits.</p>
                      <p><strong> Instructions for Section (A):</strong> </p>
                      <p>All Applicants should report:</p>
                      <ol>
                        <li> The amount of  support and revenue for the grant year requested from LSC for each service area.</li>
                        <li> The amount of projected  support and revenue for the grant year from interest/investment income to be earned on LSC funds, LSC attorney fee awards, LSC publication income, LSC carryover funds, and other funds. </li>
                      </ol>
                      <p><strong> Instructions for Section (B):</strong></p>
                      <ol>
                        <li> <strong>Applicants currently funded by LSC</strong> should report total support and revenue for the grant year from Federal/state funds available under Title XX of the Social Security Act, funds available under the Older Americans Act, state and local grants, private foundations, IOLTA, non-LSC attorney fee awards, non-LSC carryover funds, non-LSC publications' income, and other sources.</li>
                        <li><strong>State and local government Applicants &amp; sub state regional planning or coordinating agency Applicants </strong>should report their projected grant year support and revenue for civil legal assistance activities from all sources using the categories designated in this section.</li>
                        <li><strong>Attorney and law firm Applicants</strong> should report total projected year  support and revenue for the grant year from Federal/state funds available under Title XX of the Social Security Act, state and local grants, private foundations, IOLTA, non-LSC attorney fee awards, non-LSC carryover funds, non-LSC publications' income, and other sources.</li>
                        <li> <strong>All Applicants</strong> should include any remaining amounts on Line 99, &quot;Other Funds,&quot; that are not otherwise captured under the specific categories of this section. </li>
                      </ol>
                      <p><strong> Instructions for Section (C):</strong></p>
                      <ol>
                        <li><strong>Attorney and law firm Applicants</strong> that will provide civil legal assistance but were not funded to do so by public or private grants, should report projected  gross fees and receipts for the grant year from client services. Also, report projected gross receipts from other income earned in for-profit activities.</li>
                        <li> <strong>Applicants</strong> who are not Attorney and law firm Applicants should not complete this section.</li>
                      </ol>
                      <p><strong> Instructions for Section (D):</strong></p>
                      <p> This section is calculated automatically based on the amounts entered in sections (A), (B), and (C).<strong>&nbsp;</strong></p>
                      <p> <strong>Follow the steps below for assistance on this form:</strong></p>
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
                <tr>
                  <td valign="top" >&nbsp;</td>
                  <td >&nbsp;</td>
                  <td >&nbsp;</td>
                  <td valign="top" >&nbsp;</td>
                </tr>
              </table></td>
  </tr>
</table>
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
					<Control ID='ctlSupportandRevenueDefinitions' Container='spnSupportandRevenueDefinitions' Type='cLink' Caption='Click here for Support and Revenue Definitions.'>
					  <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
						<Parameters>
						  <Argument Value='SupportandRevenueDefinitions' />
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
				<Argument PropertyKey='CategoryTypeID' Value='2' />
				<Argument PropertyKey='ParentID' Value='0'>
					 <RelatedProperty PropertyKey='Parent'/>
				</Argument>
		  </Filters>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->