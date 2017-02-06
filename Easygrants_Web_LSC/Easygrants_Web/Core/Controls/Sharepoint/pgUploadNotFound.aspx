<%@ Page Language="vb" AutoEventWireup="true" Codebehind="pgUploadReader.aspx.vb" Inherits="Core_Web.Controls.Sharepoint.cpgUploadNotFound"%>
<%=errMsg%>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr id="trNotFound" visible="false">
		<td colspan="4">The file you requested is not found in SharePoint.</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr id="trFileDeletedInDB" visible="false">
		<td colspan="4">The file you requested is not in the database.</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr id="trSharepointDown" visible="false">
		<td colspan="4"><span runat='server' id='spnsharepointdown'></span></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>