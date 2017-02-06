<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- Page Content - Top Of Page -->
<!--
From this page you can add, edit, or delete notes records for the selected grant. To add a
note, click the <b>Add</b> button and follow the instructions. To view or edit the note
(i.e., to edit any of the information related to the note), click the <b>Edit</b> button.
To delete a note, click the <b>Delete</b> button.<br>
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
	AutoVDateType='Last' Key='GrantsVirtualFile' LinkTitle='Grant Notes' runat='server'/>
<br /><br />
<Core:cUserCtlLoader CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>
<Core:cUserCtlLoader CtlID='ctlNotes' 
	Src='EasyGrants/Controls/PageSection/Grant_Notes.ascx'
	runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
