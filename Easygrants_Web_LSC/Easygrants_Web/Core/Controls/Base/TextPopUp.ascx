<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TextPopUp.ascx.vb" Inherits="Core_Web.Controls.Base.cTextPopUp" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%--<span id='spnStyles' runat='server'/>--%>
<a id='ancLink' runat='server'/>

<script language="JavaScript">
	function writeToPopUpWindow(content) 
	{
		top.consoleRef=window.open('','textpopup',
			'width=<%=mWidth%>'
			+',height=<%=mHeight%>'
			+',menubar=0'
			+',toolbar=0'
			+',status=0'
			+',scrollbars=0'
			+',resizable=0')
		   
		top.consoleRef.document.writeln(
			'<html><head><title><%=mPopUpTitle%></title>'
			+'<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>"></link>'
			+'<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>"></link></head>'
			+'<body bgcolor=white onLoad="self.focus()">'
			+'<table width=100%>'
			+'<tr><td><font face="Arial, Helvetica, san serif" size="2">'
			+content
			+'</font></td></tr>'
			+'<tr><td>&nbsp;</td></tr>'
			+'<tr><td align="center">'
			+'<a href="javascript:window.close()" class="CSSButtonStyle">Close</a>'
			+'</td></tr>'
			+'</table>'
			+'</body></html>')
	 
		top.consoleRef.document.close()
	}
</script>	