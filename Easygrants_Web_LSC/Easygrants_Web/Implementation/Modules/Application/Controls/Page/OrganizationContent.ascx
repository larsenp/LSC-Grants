<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='Organization' src='../../../../../EasyGrants/Controls/PageSection/Organization.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Please provide information about your <%=GetLabel("Organization")%>.</P>
<P>To save your changes, click on the <B>Save</B> button.  All fields marked with an asterisk 
(<FONT color=red>*</FONT>) are required. 
</P>

<!-- Page Content - Controls -->

<Easygrants:Organization id='ctlOrganization' runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


