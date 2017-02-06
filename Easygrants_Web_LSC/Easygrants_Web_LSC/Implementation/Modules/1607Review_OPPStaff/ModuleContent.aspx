<%@ Page Language="vb" AutoEventWireup="true" Inherits="Implementation.Web.cValidationSubModulePageImpl" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlJSTimer.ascx' 
	Src='Core/Controls/Base/JSTimer.ascx'
	runat='server' ID="Cuserctlloader1"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title><%=ModulePage_GetTitle()%></title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />	
</head>
<body onLoad="setTimeout('showAlert(10)', 60000*(<%=TimeOut%> - 10))">
<form id='frmMain' runat='server'>

</form>
</body>
</html>
