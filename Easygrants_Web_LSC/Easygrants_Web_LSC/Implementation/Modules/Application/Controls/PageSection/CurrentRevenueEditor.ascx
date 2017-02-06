<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cProjectedRevenueEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width='600' border="0" cellpadding="0" cellspacing="0">
		    <tr>
		      <td><h1>Current Year Revenue (Form D-4)</h1></td>
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
                  <td valign="top" ><p>The <strong>Current Year Revenue (D-4)</strong> page captures total projected support and revenue for  the current year. </p>
                      <ul>
                        <li><strong><font color="#990000">All applicants who are not current recipients of LSC funds must complete Current Year Revenue (D-4).</font></strong></li>
                        <li>Enter your budget detail in the fields below.</li>
                        <li>To save the data and see the totals, click <b>Save and Calculate</b>.</li>
                        <li>To return to the previous page, click <b>Close</b>.</li>
                        <li>Calculate total projected  support and revenue for  the current year based on the most current data available. </li>
                        <li><span runat='server' id='spnSupportandRevenueDefinitions' /></li>
                      </ul>
                    <p><strong> Instructions for Section (A):</strong></p>
                      <ul>
                        <li><strong>State and local government applicants &amp; sub state regional planning or coordinating agency applicants </strong>should report their projected support and revenue for  the current year for civil legal assistance activities from all sources using the categories designated in this section. </li>
                        <li><strong>Attorney and law firm applicants</strong> should report total projected support and revenue for  the current year from Federal/state funds available under Title XX of the Social Security Act, state and local grants, private foundations, IOLTA, attorney fee awards, carryover funds, publications' income, and other sources. </li>
                        <li><strong>Applicants</strong> should include any remaining amounts on Line 99, &quot;Other Funds,&quot; that are not otherwise captured under the specific categories of this section. Other appropriated funds should also be reported on Line 99. </li>
                      </ul>
                  <p><strong> Instructions for Section (B):</strong></p>
                      <ul>
                        <li><strong> &nbsp;</strong><strong>Attorney and law firm applicants</strong> that will provide civil legal assistance, but were not funded to do so by public or private grants, should report projected year gross fees and receipts for  the current year from client services. Also, report total gross receipts from other income earned in for-profit activities. </li>
                        <li><strong>Applicants</strong> who are not Attorney or law firm applicants should not complete this section. </li>
                      </ul>
                    <p><strong>Totals are calculated automatically based on the amounts entered in sections (A) and (B).</strong></p>
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
                <tr>
                  <td valign="top" >&nbsp;</td>
                  <td >&nbsp;</td>
                  <td >&nbsp;</td>
                  <td valign="top" >&nbsp;</td>
                </tr>
              </table></td>
  </tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Service Area</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
		<td	width='10%'><b>Service Area</b></td>
		<td width='30%'><span id='spnSAname' runat='server'/></td>
		<td width='30%'><b>Projections for Calendar Year:</b></td>
		<td width='20%'><span id='spnProjectionsYear' runat='server'/></td>
	</tr>
</table>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'/>
<br />
<div style="text-align: center">
	<span runat='server' id='spnCalculate'/>
	<span runat='server' id='spnClose'/>
</div>



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
		  <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		  </Filters>
		  <DisplayProperties>
				<DisplayProperty PropertyKey='vLSCCompWftaOrgServareaYear.WFTAYearCurrent'>
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
							Object='DataPresenter'
							Method='RecalculateBudget'>
						</Action>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='URL' TypeKey='PathAndQuery' />
							</Parameters>
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
				<Argument PropertyKey='CategoryTypeID' Value='4' />
				<Argument PropertyKey='ParentID' Value='0'>
					 <RelatedProperty PropertyKey='Parent'/>
				</Argument>
		  </Filters>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->