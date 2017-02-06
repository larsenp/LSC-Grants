<%@ Page Language="vb" AutoEventWireup="true" Codebehind="Easygrants_Web.Controls.PageSection.pgViewAssignments.aspx.vb" Inherits="Easygrants_Web.Controls.PageSection.cpgViewAssignments" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<html>
	<head>
		<title>E-mail Template Editor</title>
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
	</head>
	<body>
		<form id="frmMain" method="post" runat="server">
		<Core:cUserCtlLoader CtlID='ctlAssignments' 
			Src='Implementation/Modules/ReviewStage/PageContent/Assignments.ascx'
			runat='server' />
		</form>
	</body>
</html>
