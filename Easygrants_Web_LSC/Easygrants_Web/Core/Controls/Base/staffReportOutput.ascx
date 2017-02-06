<%@ Control Language="vb" AutoEventWireup="true" Codebehind="staffReportOutput.ascx.vb" Inherits="Core_Web.Controls.Base.cstaffReportOutput" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='..\..\..\Core\Controls\Base\CSSButton.ascx' %>

<table id='tabStaffReportOutput' cellpadding='0' cellspacing='0' border='0' runat='server' width='100%'>
	<tr>
		<td align='left' width='12%' valign='top'>
			<b>Staff Access:</b>
		</td>
		<td id='tdDefinition' align='left' width='35%' valign='center' runat='server'>
			Definition:&nbsp;&nbsp;<%=DefinitionDescription%><br>
			EntityID: &nbsp;&nbsp;<%=EntityID%>
		</td>
		<td id='tdGenStatus' align='left' width='23%' valign='top' runat='server'>
			Generation Status:&nbsp;&nbsp;<%=GenStatus%>
		</td>
		<td id='tdOptions' align='center' valign='bottom' width='30%' runat='server'>
			<b>Options</b><br>
			<Core:cButton id='btnReset' Caption='Reset' runat='server'/>&nbsp;&nbsp;
			<Core:cButton id='btnDelete' Caption='Delete' runat='server'/>
		</td>
	</tr>
</table>
