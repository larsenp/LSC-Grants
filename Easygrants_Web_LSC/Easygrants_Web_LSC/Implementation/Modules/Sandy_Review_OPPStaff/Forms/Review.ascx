<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table width='600' border="0" cellpadding='0' cellspacing='0'>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Upload </h1></td>
  </tr>
  <tr>
    <td class='SeparatorHdg'>Instructions</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class='MinorSeparatorHdg'>1. Download Template</td>
  </tr>
  <tr>
    <td><p>If you haven't already downloaded the template from grants.lsc.gov, you can download the application template here by clicking the <strong>Sandy Disaster Grant Application Template</strong> link located in the <strong>Upload Checklist</strong> section below.</p><br />
	 </td>
	</tr>
  <tr>
    <td class='MinorSeparatorHdg'>2. Complete Review</td>
  </tr>
  <tr>
  	<td>
		<p>Complete the review form as instructed at ??
	</td>
  </tr>
  <tr>
  	<td class='MinorSeparatorHdg'>3. Upload Review</td>
  </tr>
  	<td>
        <p>To upload your completed review document, do the following:</p>
        <ol>
          <li>Under the <strong>Type</strong> control located in the <strong>Upload</strong> section at the bottom of the screen,  select <strong>Sandy Disaster Grant Proposal Narrative</strong> from the drop-down menu.  </li>
          <li>Click the <strong>Select Upload Type</strong> button. You will be taken to the <strong>Upload Editor</strong> page where you can upload your document.</li>
    </ol></td>
  </tr>
  <span id='spnSubmitButton' runat='server'/>
</table>

<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploads.ascx' runat='server' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
