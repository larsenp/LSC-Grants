<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br><br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<p>
The <b>Principal Investigators</b> section allows you to add or edit Principal or Co-Principal Investigators for the project. You must designate a Principal Investigator; only one Principal Investigator may be designated for the project.  There is no minimum or maximum number of Co-Principal Investigators that you may associate with the project.
<p>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Principal Investigators</b></td>
	</tr>	
</table>
<br>
<br>

<!-- Page Content - Controls -->

<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlPrincipal' 
	Src='EasyGrants/Controls/PageSection/Principal_List.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Co-Principal Investigators</b></td>
	</tr>	
</table>
<br>
<br>

<!-- Page Content - Controls -->

<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlCoPrincipal' 
	Src='EasyGrants/Controls/PageSection/CoPrincipal_List.ascx'
	runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


