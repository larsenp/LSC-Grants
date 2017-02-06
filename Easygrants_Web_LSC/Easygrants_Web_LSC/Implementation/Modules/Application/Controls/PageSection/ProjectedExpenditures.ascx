<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Projected Expenditures by Type of Activity (Form G-12)
			
      </h1></td>
	</tr>
	<tr>
	  <td ><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" ><p>The<strong> Projected Expenditures by Type of Activity (Form G-12)</strong> page captures projected expenditures for the grant year for Cases, Other Services (previously referred to as Matters), and Supporting Activities. </p>
              <ul>
                <li><strong><font color="#990000">All applicants must complete Projected Expenditures by Type of Activity (Form G-12). </font></strong></li>
                <li>Enter whole numbers without punctuation such as decimal points or dollar signs.</li>
                <li>To save the data, click <strong>Save and Calculate</strong>.</li>
                <li>To continue to the next page, click <strong>Continue</strong>.</li>
                <li>Calculate total projected  expenses for the grant year based on the most current data available. Do not include expenses related to donated services (e.g., volunteer attorney time, donated office equipment). </li>
                <li>Total expenditures on this form should equal &quot;Total LSC expenditures&quot; reported on Form D-12. </li>
                <li>Applicants applying for more than one LSC service area must complete separate forms for each service area. </li>
                <li> Limit projected expenses to those incurred in delivering civil legal assistance to eligible clients as determined by 45 C.F.R. Part 1611. </li>
                <li>Percentages in column II of Form G-12 are automatically calculated based on the projected expenditures for the grant year entered in Column I. </li>
                <li><span runat='server' id='spnCasesDefinitions' /></li>
              </ul>
              <p><strong> Instructions for completing Section A:</strong></p>
              <p> Report projected LSC expenditures for the grant year for Cases, Other Services, and Supporting Activities. <strong>Note:</strong> The total of all expenditures entered in Section A must equal the total LSC expenditures reported in Form D-12. </p>
              <p><strong> Instructions for completing Section B:</strong></p>
              <p> Report projected  LSC expenditures for the grant year by case type. <strong>Note</strong>: The total for case expenditures, by case type in Section B must equal the amount for cases entered in Section A.&nbsp;</p>
              <p> Refer to the definitions at the end of this instruction before completing Form G-12. </p>
              <p><strong>Follow the steps below for assistance on this form: </strong></p>
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
<br />
  <Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<%--<tr>
		<td colspan="4" class="SeparatorHdg"><b>Service Area</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Service Area: <span runat='server' id='spnServiceArea' />
		</td>
	</tr>--%>
	<tr>
		<td class='SeparatorHdg'>
			Projected Expenditures by Type of Activity
		</td>
	</tr>
</table>
      
<br />
<!-- USER MODIFIIABLE CONTENT AREA -->

<Core:cUserCtlLoader CtlID='ctlGrid' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectedExpendituresGrid.ascx'
	runat='server'/>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False' >
		  <Filters>
			<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
		  </Filters>
		  <DisplayProperties>
				<%--<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnServiceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCasesDefinitions' Container='spnCasesDefinitions' Type='cLink' Caption='Click here for definitions before completing this page.'>
					  <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
						<Parameters>
						  <Argument Value='CasesDefinitions' />
						</Parameters>
					  </Action>
					</Control>
		  </DisplayProperty>
				
		</DisplayProperties>
		</DataObject>


	</ModuleSection>
</span>
<!-- End Embedded XML -->