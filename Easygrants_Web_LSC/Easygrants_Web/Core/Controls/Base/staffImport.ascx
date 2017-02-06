<%@ Control Language="vb" AutoEventWireup="true" Codebehind="staffImport.ascx.vb" Inherits="Core_Web.Controls.Base.cstaffImport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
<table id='tabStaffUpload' cellpadding='0' cellspacing='0' border='0' runat='server' width='100%'>
	<tr>
		<td align='left' width='40%' valign='center'>
			<b>Staff Access:&nbsp;&nbsp;</b>ImportType:&nbsp;&nbsp;<%=ImportType%>
		</td>
		<td id='tdConversionStatus' align='left' width='30%' valign='center' runat='server'>
			Conversion Status:&nbsp;&nbsp;<%=ConversionStatus%>
		</td>
		<td id='tdOptions' align='center' valign='bottom' width='30%' runat='server'>
			<Core:cButton id='btnView' Caption='View'  Target='_blank' runat='server'/>&nbsp;&nbsp;
			<Core:cButton id='btnReset' Caption='Reset' runat='server'/>
		</td>
	</tr>
</table>
