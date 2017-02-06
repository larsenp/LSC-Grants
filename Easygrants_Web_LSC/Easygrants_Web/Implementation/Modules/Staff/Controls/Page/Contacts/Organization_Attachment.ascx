<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Control Label (for  Address information) -->
<!--
<br>
The Attachments page allows you to upload related documents for this organization.  Select links from the <b>Go To:</b>
menu below to go to other Contact Information pages.  The links on the <b>History:</b> menu act as a "crumb trail" as 
you navigate through the Contact Information pages, allowing you to easily navigate or click back to a previously 
accessed page.-->
<br><br>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/OrganizationPages.ascx'
	runat='server'/>
<br>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='OrgVirtualFile' LinkTitle='Attachments' runat='server'/>
<!--<br><br> -->
<Core:cUserCtlLoader CtlID='ctlOrgSum' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Information.ascx'
	runat='server'/>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' id='tabTitle'>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>File/Document Attachments</b>
		</td>
	</tr>
</table>
<!--
<br>
Click the <b>Add</b> button below to add a file or document attachment to this contact record.  For files/documents that 
are already uploaded, click the <b>View</b> button to view the document in PDF format.  Click the <b>Edit</b> button to modify 
the file from the Attachments Editor page.  Click the <b>Delete</b> button to delete the file.
<br>
-->
<Core:cUserCtlLoader CtlID='ctlDocumentList' 
	Src='Core/Controls/PageSection/DocumentList.ascx'
	Properties='FileTypeID=30'
	runat='server'/>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
	