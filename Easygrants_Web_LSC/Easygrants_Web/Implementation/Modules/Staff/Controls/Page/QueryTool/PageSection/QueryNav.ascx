<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.QueryTool.PageSection.cQueryNav" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<asp:PlaceHolder Visible='true' id='PlaceHolder' runat='server'></asp:PlaceHolder>

<br>
<table width='100%'>
	<tr>
		<td width='45%'>
			<Core:cUserCtlLoader CtlID='btnReturn' Type='cButton' Properties='Caption=return_to_list&CausesValidation=False' runat='server'/>
			&nbsp;&nbsp;&nbsp;
		</td>
		<td>&nbsp;</td>
		<td>
			<Core:cUserCtlLoader CtlID='btnView' Type='cButton' Properties='Caption=View&CausesValidation=False' runat='server'/>
			&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>


<Core:cUserCtlLoader CtlID='ctlViewResults' Src='Core/Controls/Base/NewWindowOpener.ascx' runat='server'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->