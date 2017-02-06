<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ReviewContent.ascx.vb" %>
<%@ Register Tagprefix='Easygrants' tagname='AddInfoAppList' src='../../../../../EasyGrants/Controls/PageSection/RevAddInfoAppList.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ReviewerAppFeedback' src='../../../../../EasyGrants/Controls/PageSection/ReviewerAppFeedback.ascx' %>


<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Please provide information about your <%=GetLabel("Organization")%>.</P>
<P>To save your changes, click on the <B>Save</B> button.  All fields marked with an asterisk 
(<FONT color=red>*</FONT>) are required. 
</P>

<!-- Page Content - Controls -->

<Easygrants:AddInfoAppList id='ctlAddInfoAppList' runat='server'/>
<p>
<Easygrants:ReviewerAppFeedback id='ctlReviewerAppFeedback' runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>