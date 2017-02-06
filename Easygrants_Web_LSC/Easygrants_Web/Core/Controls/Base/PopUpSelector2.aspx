<%@ Page Language="vb" AutoEventWireup="true" Codebehind="PopUpSelector2.aspx.vb" Inherits="Core_Web.Controls.Base.cPopUpSelector2" EnableViewState="true" %>
<%@ register tagprefix='Core' tagname='cDropDown' src='DropDown.ascx' %>
<%@ register tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
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
			runat='server'/>

		<asp:CustomValidator 
			id='valLength'
			runat='server'
			ErrorMessage='The text length is too short.'
			OnServerValidate='ValidateLength'
			Display='none'/>
			
        <asp:CustomValidator
	        runat='server'
	        id='valSearchReq'
	        Display='None'
	        OnServerValidate='ValidateRequired'
	        ErrorMessage='Search text is required.' />
			
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
					<b>Step 1: Search for the <%=DataObjDisplay1%> </b><p>
					<span id='spnText' runat='server' visible='true'></span> <p>&nbsp;</p> 
				</td>
			</tr>
			<tr id='trSearch2'>
				<td colspan='2'>
					<input type='text' id='txtSearch' size='40' maxlength='100' runat='server' />
					<br><span id='spnDisplayLabel' runat='server'></span> <font color='red'>*</font>
				</td>
			</tr>
			<tr id='trCancelFind'>	
				<td align='center'>
					<br>
					<Core:cButton  id='btnFind' Caption='Find' runat='server' bgcolor='#EEEEEE'  CausesValidation="false" />
					&nbsp;&nbsp;<Core:cButton  id='btnCancel1b' Caption='Close' runat='server' bgcolor='#EEEEEE' CausesValidation="false"/>					
				</td>
			</tr>
			<tr id='trResults1'>
				<td colspan='3'>
					<b>Step 2: Select the <%=DataObjDisplay1%></b><p>
					Select the <%=DataObjDisplay1%> from the list below and click <b>Select</b>. <span id='spnDisplayLabel1' runat='server'></span><p>&nbsp;</p> 
				</td>
			</tr>	
			<tr id='trResults2'>
				<td colspan='3'>
					<Core:cDropDown id='ctlInstitutionList' DisplayNone='true' runat='server' /><br>&nbsp;
				</td>
			</tr>
			<tr id='trResults3' width='100%'>
				<td colspan='3'>
					<b>Step 2: Select the <%=DataObjDisplay1%></b><p>
					<span id='spnNoResultsMessage' runat='server'/><p>&nbsp;<p> 
				</td>
			</tr>	
			<tr id='trSelect'>
				<td align='right' bgcolor='#EEEEEE'>&nbsp;&nbsp;&nbsp;
					<Core:cButton  id='btnSelect' Caption='Select' runat='server' bgcolor='#EEEEEE' CausesValidation="false"/>
					&nbsp;
				</td>
				<td align='center' valign='top' width='5%'>
					<span id='spDivider' runat='server'></span>
				</td>
				<td align='left' bgcolor='#EEEEEE'>
					<Core:cButton  id='btnCancel1' Caption='Cancel' runat='server' bgcolor='#EEEEEE' CausesValidation="false"/>
				</td>
			</tr>
		</table>
		<span id='spAnchorInstSelect' runat='server' visible='false'>
		<script language="JavaScript">
		window.opener.SetValuesFromPopup('<%=(request.querystring("type"))%>','<%=(request.querystring("ObjValue"))%>','<%=(InstitutionID)%>','<%=(InstitutionName)%>');
		window.close();
		</script>
		</span>
		
		<span id='spRefreshParentPageReturnURL' runat='server' visible='false'>
			<script language="JavaScript">
				function RefreshParentPageReturnURL() {
					var aUrl = window.opener.location.href
					var aIndex = aUrl.indexOf('<%=querystring%>')
					if(aIndex != -1)
						aUrl = aUrl.substring(0, aIndex - 1)
					aUrl = AddQueryString(aUrl, '<%=request.querystring("valuequerystring")%>', '<%=institutionid%>')
					window.opener.location = aUrl + '&<%=request.querystring("textquerystring")%>=<%=institutionname%>';
					window.close();
				}		
				RefreshParentPageReturnURL()
				
				function AddQueryString(aURL, aParamName, aValue) {
					//Examine URL, get location within string of parameter with name aParamName
					var aIndex, aNewURL;
					aIndex = aURL.indexOf(aParamName);
					if(aIndex == -1) {
						if (aURL.indexOf("?") == -1) {
							aNewURL = aURL + "?";
							aNewURL += aParamName + "=" + aValue + "&";
						}
						else  {
							aNewURL = aURL + "&";
							aNewURL += aParamName + "=" + aValue;
						}
					}
					else {
						var aParamNameLength, aValueLength, aValueQueryString, aValueQueryStringStartIndex;
						var aUrl1, aUrl2, aCurIndex, aCurValueQueryString, aCurValueQueryStringLength
						aParamNameLength = aParamName.length;
						aValueLength = aValue.length;
						aValueQueryStringLength = aParamNameLength + 1 + aValueLength;
						aValueQueryString = aParamName + "=" + aValue;
						aValueQueryStringStartIndex = aURL.indexOf(aParamName)
						aCurIndex = aURL.indexOf("&", aValueQueryStringStartIndex)
						if(aCurIndex != -1) {
							aCurValueQueryString = aURL.substring(aValueQueryStringStartIndex, aCurIndex)
						}
						else {
							aCurValueQueryString = aURL.substring(aValueQueryStringStartIndex, aURL.length)
						}
						aCurValueQueryStringLength = aCurValueQueryString.length;
						aUrl1 = aURL.substring(0, aValueQueryStringStartIndex)
						if(aCurIndex != -1) {
							if(aValueQueryStringStartIndex + aCurValueQueryStringLength < aURL.length - 1) {
								aUrl2 = aURL.substring(aValueQueryStringStartIndex + aCurValueQueryStringLength, aURL.length)
								}
						}
						if(aCurIndex == -1) {
							if(aValueQueryStringStartIndex + aCurValueQueryStringLength < aURL.length + 1) {
									aUrl2 = aURL.substring(aValueQueryStringStartIndex + aCurValueQueryStringLength, aURL.length)
							}
						}				
					aNewURL = aUrl1 + aValueQueryString + aUrl2
					}		
					return aNewURL
				}
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