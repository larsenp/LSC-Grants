<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table runat='server' width='100%' borders='0'>
	<tr>
		<td>
			Enter your login ID and click <b>Submit</b>. Your password will be sent
			to the primary e-mail address in your profile. To return to the Login page, click
			<b>Close</b>. 
		</td>
	</tr>
</table>

<Core:cUserCtlLoader CtlID='ctlLoginRetrieveEmailer' 
	Src='EasyGrants/Controls/PageSection/LoginRetrieveEmailer.ascx'
	runat='server'/>
	
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
