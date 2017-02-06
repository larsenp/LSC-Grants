<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
Please complete all required information detailing your Other Support.  All fields marked with an asterisk (<FONT color=red>*</FONT>) are required. 
<ul>
	<li>Click <b>Save</b> to save the information and return to the main Other Support page.</li>
	<li>Click <b>Close</b> to close the Other Support Editor without saving.</li>
</ul>

<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlOtherSupportEditor' 
	Src='EasyGrants/Controls/PageSection/OtherSupport_Editor.ascx'
	runat='server'/>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


