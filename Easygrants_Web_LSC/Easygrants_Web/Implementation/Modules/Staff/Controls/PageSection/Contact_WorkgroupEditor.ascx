<%@ Control Language="vb" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='WorkGroupList' src='../../../../../Easygrants/Controls/PageSection/PersonWorkgroupEditor.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
<P>Use this page to add or remove members to or from a workgroup.</P>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Workgroups Editor</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>

<br>
<Easygrants:WorkGroupList id='ctlList' runat='server'/>
