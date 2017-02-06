<%@ Control Language="vb" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core'%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Add or Edit Workgroup Task</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader CtlID='ctlEditor' 
				Src='EasyGrants/Controls/PageSection/WorkGroupTask_Editor.ascx' 
				runat='server'/>

