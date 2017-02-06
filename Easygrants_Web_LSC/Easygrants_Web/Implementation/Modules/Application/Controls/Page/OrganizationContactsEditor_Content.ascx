<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Enter information in the <%=GetLabel("Organization")%> Contact Editor below.  All fields marked 
with an asterisk (<FONT color=red>*</FONT>) are required. For primary department, enter the department
at which the person can be contacted.
</P>
<p>To save your changes, click on the <B>Save</B> button. Click on the Cancel button to return to the 
<%=GetLabel("Organization")%> Contacts page without saving changes. 

</p>
<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlPrincipalEditor' 
	Src='EasyGrants/Controls/PageSection/OrganizationContacts_Editor.ascx'
	runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>