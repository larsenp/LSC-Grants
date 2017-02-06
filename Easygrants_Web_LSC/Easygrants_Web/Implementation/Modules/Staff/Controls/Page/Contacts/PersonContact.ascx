<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Contacts.cPersonContact" EnableViewState="false" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<!--
<p>From this page you can manage Person Information for the selected person contact.  Select links from the 
<b>Go To:</b> menu below to go to other Person Information pages.  For example, click the <b>Activity</b> 
link to view any grant activity for this contact.  The links on the <b>History:</b> menu act as a "crumb 
trail" as you navigate through the contact information pages, allowing you to easily navigate or click 
back to a previously accessed page.</p> -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ContactPages.ascx'
	runat='server'/>
<br />

<b>History:&nbsp;</b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='PersonContact' LinkTitle='Person Contact Details' runat='server'/>

<Core:cUserCtlLoader CtlID='ctlPrimaryContactInfo' 
	Src='EasyGrants/Controls/PageSection/PrimaryContactInfo.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlOrganization' 
	Src='EasyGrants/Controls/PageSection/Contact_Organization.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactEmail' 
	Src='EasyGrants/Controls/PageSection/Contact_Email.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactPhone' 
	Src='EasyGrants/Controls/PageSection/Contact_Phone.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactAddress' 
	Src='EasyGrants/Controls/PageSection/Contact_Address.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactWebAddress' 
	Src='EasyGrants/Controls/PageSection/Contact_Web_Address.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlCategory' 
	Src='EasyGrants/Controls/PageSection/ContactCategoryAffiliation.ascx'
	runat='server'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
