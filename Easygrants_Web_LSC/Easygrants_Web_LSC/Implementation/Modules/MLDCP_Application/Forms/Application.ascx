<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div style="width:600px">
	<table width='100%' border="0" cellpadding='0' cellspacing='0'>
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
		 <td><p>If you haven't already downloaded the template from grants.lsc.gov, you can download the application template <a href='http://grants.lsc.gov/sites/lsc.gov/files/Grants/Disaster/Application_Form_Midwest_Legal_Disaster_Coordination.doc' target="_blank">here</a>.</p><br />
		 </td>
		</tr>
	  <tr>
		 <td class='MinorSeparatorHdg'>2. Complete Application</td>
	  </tr>
	  <tr>
		<td>
			<p>Complete the application form as instructed in the <a href='http://grants.lsc.gov/sites/lsc.gov/files/Grants/Disaster/2014_Midwest_Legal_Disaster_Coordination_Project.pdf' target="_blank">Notice of Funds Availability</a></p>
			<br />
		</td>
	  </tr>
	  <tr>
		<td class='MinorSeparatorHdg'>3. Upload Application</td>
	  </tr>
		<td>
			  <p>To upload your completed Application document, do the following:</p>
			  <ol>
				 <li>Under the <strong>Type</strong> control located in the <strong>Upload</strong> section at the bottom of the screen,  select <strong>Midwest Legal Disaster Cooordination Project App</strong> from the drop-down menu.  </li>
				 <li>Click the <strong>Select Upload Type</strong> button. You will be taken to the <strong>Upload Editor</strong> page where you can upload your document.</li>
		 </ol></td>
	  </tr>
	  <tr>
		<td class='MinorSeparatorHdg'>4. Upload Additional Documents</td>
	  </tr>
	  <tr>
	  	<td>
			<p>You may upload additional documents to support your application. Select the type of document you want to upload from the drop-down selector and click <strong>Select Upload Type</strong>. You will be taken to the <strong>Upload Editor</strong> page where you can upload your document.</p>
		</td>
	  </tr>
	</table>
	
	<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
		Src='Core/Controls/Base/ValidationSummary.ascx'
		runat='server'/>
	<!-- Page Content - Controls -->
	
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploads.ascx' runat='server' />
</div>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
