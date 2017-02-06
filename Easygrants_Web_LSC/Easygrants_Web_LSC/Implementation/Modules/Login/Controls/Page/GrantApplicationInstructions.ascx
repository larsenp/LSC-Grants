<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


  <!-- USER MODIFIABLE CONTENT AREA -->

  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCApplicantInformation">LSC Applicant Information</a> | Grant Application Instructions</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h1>Grant Application Instructions</h1></td>
    </tr>
    <tr>
      <td><p>The LSC 2011 Request for Proposals (RFP) will be available from <a href="https://lscgrants.lsc.gov"><u>www.lscgrants.lsc.gov</u></a> April 8, 2010. Applicants must complete and submit grant applications, following the requirements of the RFP, using this website.  June 7, 2010 is the deadline for submitting grant applications for 2011 LSC grants.</p>
<p>In order to submit a grant application, an Applicant must first submit a Notice of Intent to Compete (NIC) to LSC. The NIC will be available April 8, 2010.  The deadline for submitting The NIC is May 13, 2010. LSC requires Applicants to submit the NIC using this website.</p>
 <p><i>Note:</i> LSC will hold an Applicants’ Informational Session (AIS) Wednesday, May 5, 2010 (2:00 p.m. E.D.T.).  This is a free telephonic conference sponsored by LSC to assist Applicants in preparing the competitive grant application and to promote participation in the competitive grants process. See details about the conference at <a href="https://lscgrants.lsc.gov"><u>www.lscgrants.lsc.gov</u></a>, <i>“LSC Grants Announcements and Updates.”</i></p>
 <p>Contact the LSC service desk at <a href="mailto:competition@lsc.gov">competition@lsc.gov</a> if you have any questions regarding this notice.</p>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center"><span runat="server" id='spnClose'/></div></td>
    </tr>
  </table>
 <!-- Embedded XML Page Functionality - please do not edit -->
    <span id='spnConfigXML' visible='false' runat='server'>
	 <ModuleSection>
        <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
          <Filters></Filters>
          <DisplayProperties>

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
