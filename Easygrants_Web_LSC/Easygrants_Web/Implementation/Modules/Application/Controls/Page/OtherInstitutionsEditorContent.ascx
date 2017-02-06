<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Enter information in the Other <%=GetLabel("Organization")%>s Editor below.  All fields marked 
with an asterisk (<FONT color=red>*</FONT>) are required. For <%=GetLabel("Organization")%>, enter the 
full, formal name of the <%=GetLabel("Organization")%>.
</P>
<p>To save your changes, click on the <b>Save</b> button.  Click on the <b>Cancel</b> 
button to return to the People page without saving changes. 
</p>

<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlOtherInstitutiontEditor' 
	Src='EasyGrants/Controls/PageSection/OtherInstitution_Editor.ascx'
	runat='server'/>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


