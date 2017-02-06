<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<!--
From this page you can manage the associated contacts for the selected grant. To add a
contact, click the <b>Add</b> button and follow the instructions. To view or edit a contact
(i.e., to edit any of the information related to the contact), click the <b>Edit</b> button.
To delete a contact, click the <b>Delete</b> button.<br>
<br>
Select one of the <b>Go To...</b> links below to go to one of the related grant information
pages.
<p> -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPages.ascx'
	runat='server'/>
<br />
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Last' Key='GrantsVirtualFile' LinkTitle='Grant Contacts' runat='server'/>
	<br /><br />
<Core:cUserCtlLoader CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
	
	<Core:cUserCtlLoader CtlID='ctlPrimaryPerson' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPrimaryContact.ascx'
	runat='server'/>	
	
	
	<Core:cUserCtlLoader CtlID='ctlGrantPrimaryContactList' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPrimaryContactList.ascx'
	runat='server'/>
	
	<Core:cUserCtlLoader CtlID='ctlPrimaryContactHistory' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantPrimaryContactHistory.ascx'
	runat='server'/>
	
	<Core:cUserCtlLoader CtlID='ctlGrantContacts' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantContacts.ascx'
	runat='server'/>
	
	<Core:cUserCtlLoader CtlID='ctlGrantOtherContacts' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantOtherContacts.ascx'
	runat='server'/>


<Core:cUserCtlLoader CtlID='ctlGrantOrganizationContacts' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantOrganizationContacts.ascx'
	runat='server'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>