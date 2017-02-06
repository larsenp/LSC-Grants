<%@ Page Language="vb" AutoEventWireup="true"  CodeBehind="EmailTemplateEditor_Content.aspx.vb" Inherits="Easygrants_Web.Controls.PageSection.cEmailTemplateEditor_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" validateRequest="false" %>
<html>
	<head>
		<title>E-mail Template Editor</title>
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
		<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
	</head>
	<body>
		<form id="frmMain" method="post" runat="server">
			<!-- Embedded XML Page Functionality - please do not edit -->
			<span id='spnConfigXML' visible='false' runat='server'>
				<ModuleSection>				
				</ModuleSection>
			</span>
			<!-- End Embedded XML -->
		</form>
	</body>
</html>