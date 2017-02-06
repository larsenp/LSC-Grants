<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Contacts.cOrganizationContact" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/OrganizationPages.ascx'
	runat='server'/>
<br />
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='OrganizationContact' LinkTitle='~~Organization~~ Details' runat='server'/>
<Core:cUserCtlLoader CtlID='ctlInformation' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Information.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlOrganization' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Contact_Person.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactPhone' 
	Src='EasyGrants/Controls/PageSection/Contact_Phone.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlContactAddress' 
	Src='EasyGrants/Controls/PageSection/Contact_Address.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlWebAddress' 
	Src='EasyGrants/Controls/PageSection/Contact_Web_Address.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlOrganizationAffiliation' 
	Src='EasyGrants/Controls/PageSection/Organization_Affiliation.ascx'
	runat='server'/>		 

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>
