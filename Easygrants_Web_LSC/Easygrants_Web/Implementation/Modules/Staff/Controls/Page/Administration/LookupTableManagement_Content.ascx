<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<%-- <p>The Lookup Table Management page lists the all user editable drop-down lists in the Easygrants System.  
Click on the Edit button for a code table to view, modify, and add components of that particular table.  
Click on the blue column headers to sort the list alpha-numerically by the values in that column.</p> --%>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Lookup Tables</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>

<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Root' Key='LookupTables' LinkTitle='Lookup Tables' runat='server'/>

<Core:cUserCtlLoader CtlID='ctlLookupTableList' 
	Src='EasyGrants/Controls/PageSection/LookupTableList.ascx'
	runat='server'/>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
	</ModuleSection>
</span>