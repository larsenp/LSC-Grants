<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.QueryTool.PageSection.cSelectFieldName" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="False" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

 
 <table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='3'>
			Select Query Criteria - Step One: Select Field
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='1%'>&nbsp;</td>
		<td width='10%'><b>Field Name</b></td>
		<td><asp:DropDownList runat='server' id='ctlFieldName'/> </td>
	</tr>
</table>
<br>
 
 




<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	
	</ModuleSection>
</span>
<!-- End Embedded XML -->