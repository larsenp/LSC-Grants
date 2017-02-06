<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cProjectedExpensesEditorPAI" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
		    <tr>
		      <td><h1>PAI Current Year Expenses (Form D-13)</h1></td>
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
                  <td valign="top" ><p>This <strong>PAI Current Year Expenses (Form D-13)</strong> page captures projected expenses for PAI from LSC and non-LSC funding sources for the current year. </p>
                      <ul>
                        <li><strong><font color="#990000">All Applicants for basic field &ndash; general service areas must complete PAI Projected Expenses (Form D-13). </font></strong></li>
                        <li>Calculate total projected current year expenses based on the Applicant&rsquo;s PAI plan and the most current expense data available. (<em>Note: LSC requires each Applicant to submit a copy of its current year PAI budget and PAI plan along with its  grant application. Review 45 C.F.R. Part 1614 before developing the PAI budget and plan. </em></li>
                        <li>Recipients are required to devote an amount equal to at least twelve and one-half percent (12 &frac12;%) of the Applicant&rsquo;s total basic field &ndash; general grant award in the involvement of private attorneys. (see 45 C.F.R. Part 1614) </li>
                        <li>Limit projected PAI expenses to those incurred in delivering civil legal assistance to eligible clients as determined by 45 C.F.R. Part 1611. </li>
                        <li>Refer to the definitions for expenses at the end of this instruction for a description of the types of expenses to be reported under each expense category. </li>
                        <li>Refer to the 45 C.F.R. &sect; 1614.4(a)(2) and to LSC Program Letter 07-2 for guidance on the types of activities that can be charged to PAI. </li>
                        <li>Enter whole numbers without punctuation such as decimal points or dollar signs.</li>
                        <li>To save the data, click <strong>Save and Calculate</strong>.</li>
                        <li>To continue to the next page, click <strong>Continue</strong>.</li>
                        <li><span runat='server' id='spnExpenseDefinitions' /> </li>
                      </ul>
                      <p><strong> Column (1) LSC Expenditures:</strong></p>
                      <p> Report total projected PAI expenses from LSC funds for the current year. </p>
                      <p><strong> Column (2) Non-LSC Expenditures:</strong></p>
                      <p> Report total PAI expenses from non-LSC funds for the current year. </p>
                      <p><strong> Column (3) Total Expenditures:</strong></p>
                      <p> This is a calculated field and reflects total projected PAI expenses from LSC and non-LSC sources. </p>
                      <p><strong> Follow the steps below for assistance on this form: </strong></p>
                      <ol>
                        <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
                        <li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>.</li>
                        <li>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov">haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. </li>
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

<%--<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Service Area</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table id="Table2" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td	width='10%'><b>Service Area</b></td>
		<td width='30%'><span id='spnSAname' runat='server'/></td>
		<td width='20%'></td>
		<td></td>
	</tr>
</table>--%>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'/>
<br />
<div style="text-align: center">
	<span runat='server' id='spnCalculate'/>
	<span runat='server' id='spnContinue'/>
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
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False' >
		  <Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
		  </Filters>
		  <DisplayProperties>
				<%--<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnSAname' Type='HtmlGenericControl'/>
				</DisplayProperty>--%>
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
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Type='cButton'
						Image='Continue'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Technology' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>

				
				<DisplayProperty PropertyKey=''>
				  <Control ID='ctlExpenseDefinitions' Container='spnExpenseDefinitions' Type='cLink' Caption='Click here to view definitions related to the types of expenses to be reported under each expense category.'>
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
				<Argument PropertyKey='CategoryTypeID' Value='5' />
				<Argument PropertyKey='ParentID' Value='0'>
					 <RelatedProperty PropertyKey='Parent'/>
				</Argument>
		  </Filters>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->

