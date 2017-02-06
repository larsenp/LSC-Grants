<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>

  
  <!-- USER MODIFIABLE CONTENT AREA --><style type="text/css">
<!--
.style2 {
	font-family: Arial;
	font-size: 10pt;
	color: black;
}
-->
</style>
  	<table width="600" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCApplicantInformation">LSC Applicant Information</a> | LSC Applicant Information System Bulletin Board</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><h1>LSC Applicant Information System Bulletin Board</h1></td>
      </tr>
      <tr>
        <td><p> Welcome to the LSC Applicant Information Network Bulletin Board. This Bulletin Board contains information of use and interest to applicants for Legal Services Corporation funds. Please email questions and comments to: <a href="mailto:competition@lsc.gov">competition@lsc.gov</a>. </p>
            <p><strong>Announcements:</strong></p>
            <ul>
              <li><span runat='server' id='spnRFPAppendices2009' /></li>
              <li><a href="Controls/PDFs/NoticeofAvailabilityofCalendarYear2009.pdf">Notice of Availability of Calendar Year 2009 Competitive Grant Funds</a><a href="Controls/PDFs/VA20AS1NICList.pdf"></a>&nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;20k)</li>
              <li><a href="Controls/PDFs/2009keycompetitionactivitiesanddates.pdf">Key Competition and Grant Renewal Dates for 2009 Funding </a>&nbsp;(updated February 29, 2008, <img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;31k)</li>
            </ul>
            <p><strong>Reference Materials:</strong></p>
            <ul>
              <li><a href="Controls/PDFs/1996-04-011634FinalRule.pdf">Competitive Bidding for Grants and Contracts regulation - Preamble (45 C.F.R. Part 1634)</a><a href="Controls/PDFs/2008RFP.pdf"></a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;854k)</li>
              <li><a href="http://www.lsc.gov/laws/">LSC Act and Regulations</a></li>
              <li><a href="http://www.lsc.gov/laws/appropriations.php">LSC Appropriations</a></li>
            </ul>
            <p><strong><span runat='server' id='spnArchivedFiles' /></strong> </p></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="center"><span runat="server" id='spnClose'/></div></td>
      </tr>
    </table>
  	<!-- Embedded XML Page Functionality - please do not edit -->
    <span id='spnConfigXML' visible='false' runat='server'> <ModuleSection> <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'> <Filters></Filters> <DisplayProperties> <DisplayProperty PropertyKey=''> <Control ID='ctlArchivedFiles' Container='spnArchivedFiles' Type='cLink' Caption='LSC Grants Archived Files'> <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
<Parameters>
                    <Argument Value='ArchivedFiles' />
    </Parameters>
                </Action>
              </Control>
            </DisplayProperty>
			
			<DisplayProperty PropertyKey=''>
              <Control ID='ctlRFPAppendices2009' Container='spnRFPAppendices2009' Type='cLink' Caption='FY 2009 Request For Proposals - Appendices'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='RFPAppendices2009' />
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
						Method='EventController_NavigateToModulePageKey'>
						<Parameters>
							<Argument Value='LSCApplicantInformation' />
						</Parameters>
					</Action>
				</Control>	
			</DisplayProperty>
			
			<DisplayProperty PropertyKey=''>
              <Control ID='ctlLogin' Container='spnLogin' Type='cLink' Caption='LSC Grants Login'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='Login' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty>
			

        </DisplayProperties>
      </DataObject>
    </ModuleSection>
  </span>