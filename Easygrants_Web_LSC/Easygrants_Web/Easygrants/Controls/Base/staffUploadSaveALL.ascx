<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="staffUploadSaveALL.ascx.vb" Inherits="Core_Web.Controls.Base.cstaffUploadSaveALL" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="true" %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../../../Core/Controls/Base/CSSButton.ascx' %>
<%@ Register Tagprefix='Core' tagname='cLink' src='../../../Core/Controls/Base/Link.ascx' %>
<table id='tabStaffUpload' cellpadding='0' cellspacing='0' border='0' runat='server' width='100%' visible='false'>
	<tr>
		<td align='left' width='30%' valign='center'>
			<Core:cLink id='btnView'   Target='_blank' runat='server'/>
		</td>
		<td align='left' width='20%' valign='center'>
			<b>Staff Access:&nbsp;&nbsp;</b>FileType:&nbsp;&nbsp;<%=FileType%>
		</td>
		<td id='tdConversionStatus' align='left' width='30%' valign='center' runat='server'>
			Conversion Status:&nbsp;&nbsp;<%=ConversionStatus%>
		</td>
		<td id='tdOptions' align='center' valign='bottom' width='20%' runat='server'>			
			<Core:cButton id='btnReset' Caption='Reset' runat='server'/>
		</td>
	</tr>
</table>