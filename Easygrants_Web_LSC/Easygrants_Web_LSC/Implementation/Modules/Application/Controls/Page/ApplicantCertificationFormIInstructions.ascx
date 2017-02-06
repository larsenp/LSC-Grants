<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

  
  <!-- USER MODIFIABLE CONTENT AREA -->

  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h1>Applicant Certification (Form I)</h1></td>
    </tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
      <td><p>  Applicants are required to sign and return Applicant Certification (Form I) certifying that they will comply with the LSC grant assurances. <span id="mPageFrameCtl_ctlPageContent_ctlTaskUploads_spnUploadsList">Applicant Certification (Form I)</span> will be available during the month of August 2009. When <span id="mPageFrameCtl_ctlPageContent_ctlTaskUploads_spnUploadsList">Applicant Certification (Form I)</span> is published, LSC will send an email to all Applicants informing them of its availability and instructions on how to proceed.</p>
        <p> Applicants for 2010 grants should file all parts of the grant application by June 5, 2009, 5:00 p.m. E.D.T. except for <span id="mPageFrameCtl_ctlPageContent_ctlTaskUploads_spnUploadsList">Grant Assurances (Form C)</span> and <span id="mPageFrameCtl_ctlPageContent_ctlTaskUploads_spnUploadsList">Applicant Certification (Form I)</span>. <span id="mPageFrameCtl_ctlPageContent_ctlTaskUploads_spnUploadsList">Applicant Certification (Form I)</span> will be available also during the month of August 2009 to coincide with the availability of <span id="mPageFrameCtl_ctlPageContent_ctlTaskUploads_spnUploadsList">Grant Assurances (Form C)</span>. </p>
        <p><strong> Follow the steps below for assistance on this form: </strong></p>
        <ol>
          <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
          <li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>.</li>
          <li>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov"> haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. </li>
        </ol>
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
								<Argument Value='Uploads' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
    </ModuleSection>
  </span>
