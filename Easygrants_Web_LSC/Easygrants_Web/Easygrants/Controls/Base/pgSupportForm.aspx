<%@ Page Language="vb" AutoEventWireup="true" Codebehind="Easygrants_Web.Controls.Base.pgSupportForm.aspx.vb" Inherits="Easygrants_Web.Controls.Base.cpgSupportForm"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<html>
	<head>
		<title>Support Form</title>
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
	</head>
	<body>
		<form id="frmMain" method="post" runat="server">
		<Core:cUserCtlLoader CtlID='ctlSupportFormEmailer' 
			Src='Easygrants/Controls/Base/SupportForm.ascx'
			runat='server'/>
		</form>
	</body>
</html>