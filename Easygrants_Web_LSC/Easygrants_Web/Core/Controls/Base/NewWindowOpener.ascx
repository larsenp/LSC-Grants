<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cNewWindowOpener" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span id='spnOpen' runat='server' visible='false'>
	<script language="JavaScript">
		window.open("<%=NewWindowURL%>")
		window.document.location = "<%=RefreshURL%>"
	</script>
</span>
