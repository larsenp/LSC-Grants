<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='600' >
	<tr>
	  <td colspan="4"><h1>Uploads</h1></td>
  </tr>
	<tr><td colspan="4" ><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
      <tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
      </tr>
      <tr>
        <td colspan="4" >&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" ><p>The uploads listed in the <strong>Upload Checklist</strong> below are required for this application. To upload a document:</p>
            <ol>
              <li>In the <strong>Upload Checklist</strong> section below, click to download the template/instructions associated with the document, if available, as a guide to create your upload.</li>
              <li>Then when you are ready to upload the document, select the <strong>Type</strong> from the drop-down in the <strong>Uploads</strong> section below and click <strong>Select Upload Type</strong>. You will be then be taken to the Upload Editor page where you can upload your document.</li>
              <li>Follow the instructions on the Upload Editor page to upload the document.</li>
          </ol></td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
        <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
      </tr>
      
    <tr><td>Email <a href="mailto:competition@lsc.gov">competition@lsc.gov</a> with any questions regarding these instructions. </td></tr>
    </table>	
	    </td>
	</tr>
	<tr>
	  <td colspan="4" >&nbsp;</td>
  </tr>	
</table>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploads.ascx' runat='server' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
