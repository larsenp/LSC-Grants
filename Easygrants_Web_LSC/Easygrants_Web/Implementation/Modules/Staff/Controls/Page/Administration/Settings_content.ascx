<%@ Control Language="vb" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='StaffSettings' src='../../../../../../Easygrants/Controls/PageSection/StaffSettings.ascx' %>

<!-- Page Content - Top Of Page -->
<br>
<P>Use this page to enable or disable displaying debug information.</P>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Debug Settings</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>

<br>
<Easygrants:StaffSettings id='ctlList' runat='server'/>