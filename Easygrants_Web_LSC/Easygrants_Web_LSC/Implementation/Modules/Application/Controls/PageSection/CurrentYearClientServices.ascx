<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
	  <td><h1>Current Year Client Services (Form G-1)</h1></td>
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
          <td valign="top" ><p>The <strong>Current Year Client Services (Form G-1)</strong> page captures current year information on client services. </p>
              <ul>
                <li><strong><font color="#990000">New applicants are required to complete Current Year Client Services (Form G-1).</font></strong></li>
                <li>Enter your information in the fields below.</li>
                <li>To save the data, click <b>Save</b>.</li>
                <li>To go to the next page, click <b>Continue</b>.</li>
                <li><strong>In Column (1) </strong>Report the number of cases that will be closed during the year after &quot;limited service.&quot; </li>
                <li><strong> In Column (2) </strong>Report the number of cases that will be closed during the year after the provision of &quot;extended service.&quot; </li>
                <li><strong>In Column (3) </strong>This is the total number of cases for the year, which is the sum of limited service cases, extended service cases, and the number of cases that will remain open at the end of the current year. </li>
                <li><strong> In Column (4) </strong>Report the number of cases that will remain open at the end of the current year.</li>
                <li><span runat='server' id='spnCurrentYearClientServicesDefinitions' /></li>
              </ul>
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
<br />
  <Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg' colspan='5'>
			Add or Edit Current Year Client Services
		</td>
	</tr>
	<tr> <td >&nbsp;</td></tr>
	<tr class='MinorSeparatorHdg'>
		<td width='28%'>
			Type of Legal Problem
		</td>
		<td width='18%'>
			Cases Closed after Limited Service
		</td>
		<td width='18%'>
			Cases Closed after Extended Service
		</td>
		<td width='18%'>
			Total
		</td>
		<td width='18%'>
			Cases Remaining Open at Year End
		</td>
	</tr>
	<tr> <td >&nbsp;</td></tr>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnClientServicesList' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			Total All Cases
		</td>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			<span runat='server' id='spnCasesClosedLimitedSvc' >&nbsp;</span>
		</td>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			<span runat='server' id='spnCasesClosedExtendedSvc' >&nbsp;</span>
		</td>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			<span runat='server' id='spnCasesClosedTotal' >&nbsp;</span>
		</td>
		<td style="font-weight:bold;border-bottom-style:solid;border-bottom-width:1px">
			<span runat='server' id='spnCasesOpen' >&nbsp;</span>
		</td>
	</tr>
	
</table>
<br /><br />
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' >
	<tr align='center'>
		<td>			
			<span runat='server' id='spnSave_and_Calculate'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscLegalProblemType' DataObjectDefinitionKey='LscLegalProblemType' Updatable='True' CreateNew='False'>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlClientServicesList' 
						Type='cDataPresenterList'
						Container='spnClientServicesList'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/CurrentYearClientServicesItem.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscClientServicesWfTATotals' DataObjectDefinitionKey='LscClientServicesWfTATotals'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CasesClosedLimitedSvc' Format='#,0'>
					<Control ID='spnCasesClosedLimitedSvc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesClosedExtendedSvc' Format='#,0'>
					<Control ID='spnCasesClosedExtendedSvc'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesClosedTotal' Format='#,0'>
					<Control ID='spnCasesClosedTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesOpen' Format='#,0'>
					<Control ID='spnCasesOpen'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Calculate'
						Container='spnSave_and_Calculate'
						Caption='Save and Calculate'
						Type='cButton'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Image='Continue'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PolicyBoardStructure' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCurrentYearClientServicesDefinitions' Container='spnCurrentYearClientServicesDefinitions' Type='cLink' Caption='Click here for definitions of description of limited and extended services and examples of legal problems, by type.'>
					  <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
						<Parameters>
						  <Argument Value='CurrentYearClientServicesDefinitions' />
						</Parameters>
					  </Action>
					</Control>
		    </DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
