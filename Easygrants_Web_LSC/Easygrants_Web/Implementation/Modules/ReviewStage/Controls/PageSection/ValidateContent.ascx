<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>


<table width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Submission Status
		</td>
	</tr>
	<tr>
		<td>
			<Core:cValidate id='ctlValidate' DisplayFormat='Detail' runat='server'/>	
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
	</ModuleSection>
</span>