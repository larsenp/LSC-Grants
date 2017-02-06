<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<p>From this page you can upload commonly used documents and images in this section for collective use. 
To upload a document template, click on the <b>Add button</b>. To view a document template, 
click on the corresponding <b>View</b> button. To replace a document template, 
click on the corresponding <b>Edit</b> button. To delete a document template from the eGrants system, 
click on the corresponding <b>Delete</b> button. 
<p>
<Core:cUserCtlLoader CtlID='ctlDocumentList' 
	Src='Core/Controls/PageSection/DocumentList.ascx'
	Properties='FileTypeID=25&Title=Word Templates'
	runat='server'/>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
