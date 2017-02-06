<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td>Enter or update Principal Investigator contact information below (the system may have already filled in certain fields). Click <b>Save</b> to save your changes and remain on this page. Click <b>Save and Continue</b> to save and return to the main Principal Investigators page.</td></tr>
</table>
<span id='oldText' visible='false' runat='server'>
	<P>Enter information in the Principal Investigator Editor below.  All fields marked 
	with an asterisk (<FONT color=red>*</FONT>) are required. For <%=GetLabel("Organization")%>, enter the 
	full, formal name of the <%=GetLabel("Organization")%>.
	</P>
	<p>To save your changes, click on the <b>Save</b> button.  Click on the <b>Cancel</b> button 
	to return to the Principal Investigator page without saving changes.  
	</p>
</span>
<!-- Page Content - Controls -->

<Core:cUserCtlLoader CtlID='ctlPrincipalEditor' 
	Src='Easygrants/Controls/PageSection/Principal_Editor.ascx'
	runat='server' />
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


