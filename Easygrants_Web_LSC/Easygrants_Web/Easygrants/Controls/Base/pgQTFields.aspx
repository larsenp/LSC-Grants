<%@ Page Language="vb" AutoEventWireup="true" Codebehind="Easygrants_Web.Controls.Base.pgQTFields.aspx.vb" Inherits="Easygrants_Web.Controls.Base.cpgQTFields"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<html>
	<head>
		<title>Query Tool Fields</title>
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
	</head>
	<body>
		<form id="frmMain" method="post" runat="server">
		<Core:cUserCtlLoader CtlID='ctlQTFields' 
			Src='Easygrants/Controls/Base/QTFieldList.ascx'
			runat='server'/>
		</form>
	</body>
</html>
