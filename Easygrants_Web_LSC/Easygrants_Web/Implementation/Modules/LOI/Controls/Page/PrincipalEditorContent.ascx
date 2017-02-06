<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />

<br><br>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>The system may have already filled in certain fields based on information previously entered.</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>Check the <b>Primary</b> box below and click <b>Save and Continue</b> if this is the contact information for the primary PI.</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>Enter new contact information for other PIs and co-PIs in the text boxes below and <b><i>do not</i></b> check the <b>Primary</b> box.</td></tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<span id='oldText' visible='false' runat='server'>
	<P>Enter information in the Principal Investigator Editor below.  All fields marked 
	with an asterisk (<FONT color=red>*</FONT>) are required. For institution, enter the full, formal name of 
	the institution.  This page defaults to the contact information entered on the Contact Info page.  If this is your Primary Investigator, check the Primary checkbox below and click Save.  To enter contact information for a co-PI, do not check the Primary box below, and edit the contact information so that it contains the co-PI contact information.
	</P>
	<p>To save your changes, click on the <B>Save</B> button. Click on the <b>Cancel</b> button to return to the 
	Principal Investigators page without saving changes. 

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


