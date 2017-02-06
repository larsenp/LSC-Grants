<%@ Control Language="vb" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Edit Workgroup</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>

<Core:cUserCtlLoader CtlID='ctlList' 
				Src='EasyGrants/Controls/PageSection/WorkGroupEditor_List.ascx' 
				runat='server'/>
<br>
<!-- The Below section commented out as per mantis issue # 2826 -->
<%-- <Core:cUserCtlLoader CtlID='ctlTaskList' 
				Src='EasyGrants/Controls/PageSection/WorkGroupTaskEditor_List.ascx' 
				runat='server'/> --%>

