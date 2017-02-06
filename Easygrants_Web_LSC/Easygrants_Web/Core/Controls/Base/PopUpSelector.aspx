<%@ Page Language="vb" AutoEventWireup="true" Codebehind="PopUpSelector.aspx.vb" Inherits="Core_Web.Controls.Base.cPopUpSelector" EnableViewState="true" %>
<%@ register tagprefix='Core' tagname='cDropDown' src='DropDown.ascx' %>
<%@ register tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
<%@ register tagprefix='Core' tagname='cLabel' src='Label.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <title><%=PopUpTitle%></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
	<%--<Core:cUserCtlLoader ID='ctlStyleLoader'
		CtlID='ctlStyles' 
		PathVar='DefaultModuleRoot'
		Src='/../../Implementation/CSS/DefaultStyles.ascx'
		runat='server'/>--%>
  </head>
  <body onload='if (document.frmMain.txtSearch) document.frmMain.txtSearch.focus()'>
	
    <form id="frmMain" method="post" runat="server">
		<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
			Src='Core/Controls/Base/ValidationSummary.ascx'
			Properties='HeaderText=Please correct the following:'
			runat='server'/>

		<asp:CustomValidator 
			id='valLength'
			runat='server'
			ErrorMessage='The text length is too short.'
			OnServerValidate='ValidateLength'
			Display='none'/>
		<p>
		<a name='OrgSelectTop'></a>
		<table id='tabMain' border='0' cellpadding='0' cellspacing='0' width='' runat='server' bgcolor='#EEEEEE'>
			<tr id='trInstName'>
				<td colspan='3' valign='top'>
					<span id='spInstName' runat='server'></span>
					<input type='text' id='txtInstID' runat='server' visible='false' />
					<input type='text' id='txtInstName' runat='server' visible='false' />
					<input type='text' id='txtEdLevel' runat='server' visible='false' />
				</td>
			</tr>
			<tr id='trSearch1'>
				<td colspan='3'>
					<b>Step 1</b><p>
					<span id='spnText' runat='server' visible='true'></span>
				</td>
			</tr>
			<tr id='trSearch2'>
				<td colspan='2'>
					<input type='text' id='txtSearch' size='20' maxlength='100' runat='server'/>
					<br><Core:cLabel  id='CtlDisplayLabel' runat='server'/><p>&nbsp;<p>
				</td>
				<td>
					<Core:cButton  id='btnFind'  Caption='Find' runat='server' bgcolor='#EEEEEE'/>&nbsp;&nbsp;
					<Core:cButton  id='btnCancel1b'  Caption='Close' runat='server' bgcolor='#EEEEEE' CausesValidation="False" />					
				</td>
			</tr>
			<tr id='trResults1'>
				<td colspan='3'>
					<b>Step 2</b><p>
					Select the <%=DataObjName%> from the list below.
				</td>
			</tr>	
			<tr id='trResults2'>
				<td colspan='3'>
					<Core:cDropDown id='ctlInstitutionList' DisplayNone='true' runat='server' /><br>&nbsp;
				</td>
			</tr>
			<tr id='trResults3' width='100%'>
				<td colspan='3'>
					<b>Step 2</b><p>
					<span id='spnNoResultsMessage' runat='server'/><p>&nbsp;<p>
				</td>
			</tr>	
			<tr id='trSelect'>
				<td align='right' bgcolor='#EEEEEE'>&nbsp;&nbsp;&nbsp;
					<Core:cButton  id='btnSelect' Caption='Select' runat='server' bgcolor='#EEEEEE'  CausesValidation="False"/>
				</td>
				<td align='center' valign='top' width='5%'>
					<span id='spDivider' runat='server'></span>
				</td>
				<td align='left' bgcolor='#EEEEEE'>
					<Core:cButton  id='btnCancel1' Caption='Close' runat='server' bgcolor='#EEEEEE' CausesValidation="False"/>
					&nbsp;
				</td>
			</tr>
		</table>
		<span id='spAnchorInstSelect' runat='server' visible='false'>
		<script language="JavaScript">
		window.opener.SetValueFromPopup('<%=(request.querystring("type"))%>','<%=(InstitutionID)%>','<%=(InstitutionName)%>');
		window.close();
		</script>
		</span>
		
		<span id='spRefreshParentPage' runat='server' visible='false'>
			<script language="JavaScript">
				function RefreshParentPage() {
					var aUrl = window.opener.location.href
					var aIndex = aUrl.indexOf('<%=request.querystring("valuequerystring")%>')
					if(aIndex != -1)
						aUrl = aUrl.substring(0, aIndex - 1)
					window.opener.location = aUrl + '&<%=request.querystring("valuequerystring")%>=<%=institutionid%>&<%=request.querystring("textquerystring")%>=<%=institutionname%>';
					window.close();
				}
				RefreshParentPage()
			</script>
		</span>
		
		<span id='spCloseWindow' runat='server' visible='false'>
		<script language="JavaScript">
		window.close();
		</script>
		</span>		
    </form>
  </body>
</html>
