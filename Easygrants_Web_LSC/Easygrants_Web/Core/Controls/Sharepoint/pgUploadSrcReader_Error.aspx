<%@ Page Language="vb" AutoEventWireup="true" Codebehind="pgUploadSrcReader_Error.aspx.vb" Inherits="Core_Web.Controls.Sharepoint.pgUploadSrcReader_Error"%>
<html>
<head>
	<title>Process Error</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body>
<%--<span id='spnStyles' runat='server'/>--%>

<table runat='server' width='100%'>
	<tr>
		<td class="ModuleHdg" align="center">
			<b>Upload Error</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			<b>Validation Error</b>
		</td>
	</tr>	
	<tr>
		<td>
			There was a problem opening your document.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			<b>Error Description</b>
		</td>
	</tr>
	<tr>
		<td>
			An undetermined error occurred. Please contact technical support.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
</table>
</BODY>
</HTML>
