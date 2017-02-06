<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cEGDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Please provide the following information about yourself. Information you provided 
during registration appears in some fields; you may update the information as 
needed. Provision of racial/ethnic background is optional; it is requested for 
statistical purposes only.</P>
<P>All fields marked with an asterisk (<FONT color=red>*</FONT>) are required. Click on the <B>Save</B> button when you are finished. </P>
<br><br>
<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlAddInfoRevList' 
	Src='EasyGrants/Controls/PageSection/RevAddInfoRevList.ascx'
	runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


