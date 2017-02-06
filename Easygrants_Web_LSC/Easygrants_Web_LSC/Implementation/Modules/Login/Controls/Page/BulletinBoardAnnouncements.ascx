<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>


<!-- USER MODIFIABLE CONTENT AREA -->


      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCRecipientInformation">LSC Recipient Information</a> | Announcements </td>
        </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><h1>Announcements</h1>
                <ul>
                  <li><a href="Controls/PDFs/progltr11_2.pdf">Program Letter 11-2</a> (updated Nov 03, 2011)&nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;514k)</li>
                  <li><a href="Controls/PDFs/SubgrantApprovalGuidance_2012.PDF">Subgrant Agreements for 2012: Requests for Approval</a>&nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;1.2Mb)</li>
                <ul>  <li><a href="Controls/PDFs/SubgrantAgreementForm_2012.DOC">Subgrant Agreement Form for 2012</a>  &nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/word-icon.gif" align="top" height="14" width="14">&nbsp;50k)</li>
                 <li><a href="Controls/PDFs/SUBRECIPIENT_PROFILE_FORM.DOC">Subrecipient Profile Form for 2012</a>  &nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/word-icon.gif" align="top" height="14" width="14">&nbsp;31k)</li>
                 <li><a href="Controls/PDFs/Budget_form_2012.DOC">Subrecipient Budget Form for 2012</a>  &nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/word-icon.gif" align="top" height="14" width="14">&nbsp;48k)</li>
                 </ul>
                 <!-- <li><a href="Controls/PDFs/CSRFAQ_20100920.doc">CSR Frequently Asked Questions</a>  (<font color="#FF0000">New Questions in Red</font>) (Updated September 16, 2010)&nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/word-icon.gif" align="top" height="14" width="14">&nbsp;358k)</li>
                  <li><a href="Controls/PDFs/LSCPerformanceCriteriaReferencingABAStandards1.pdf">LSC Performance Criteria</a>&nbsp;(updated June 12, 2007)&nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;389k)</li>
                  <li><a href="Controls/PDFs/arecpcol010503.pdf">Protocol Regarding Access of Info. in Grant Recipients' Files</a> &nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;34k)</li>
                  <li><a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCLogo">LSC Logo</a></li> -->
               
                </ul>
              </td>
            </tr>
          </table>         
            <div style="text-align:center" runat='server' id='spnClose' />
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Login' />
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
