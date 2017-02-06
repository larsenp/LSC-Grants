<%@ Page Language="vb" AutoEventWireup="true" Codebehind='FilterPopUp_Content.aspx.vb' Inherits='Easygrants_Web.Modules.Staff.Controls.Page.Reports.cFilterPopUp_Content' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Filters and Boolean Operators</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body>
<%--<span id='spnStyles' runat='server'/>--%>
		<table width ='100%' runat='server'>
		<tr>
		<td class='SeparatorHdg'>
			Filters
		</td>
		</tr>
		</table>
							The following filter will locate records for all person contacts with an office address in 
							New York state:<BR/><BR/>
							<table width='100%'>
								<tr>
									<td><b>Boolean</b></td>
									<td><b> Field </b></td>
									<td><b>Operator</b></td>
									<td><b>Value</b></td>
								</tr>
								<tr>
									<td>&lt;None&gt;</td>
									<td>Address - State</td>
									<td>  =</td>
									<td>New York</td>
								</tr>
							<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
							<tr><td colspan='4'>To further limit the results to <%=GetLabel("Organization")%> Contacts, add a second filter:</td.></tr>
						
							<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
								<tr>
									<td><b>Boolean</b></td>
									<td><b> Field </b></td>
									<td><b>Operator</b></td>
									<td><b>Value</b></td>
								</tr>
								<tr>
									<td>And</td>
									<td>Affiliation - Is Org Contact</td>
									<td> =</td>
									<td>True</td>
								</tr>
							  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
							<tr><td class='SeparatorHdg' colspan='4'>Boolean Operators</td></td></tr>
							<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
							<tr><td colspan='4'>When two conditions are linked with &quot;and&quot;, all query results must meet both conditions. The following example
							will only return records in which Address - State field value is 'New York' and the person is identified as the <%=GetLabel("Organization")%> Contact:
							</td></tr>
							<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
							<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
							
								<tr>
									<td><b>Boolean</b></td>
									<td><b> Field </b></td>
									<td><b>Operator</b></td>
									<td><b>Value</b></td>
								</tr>
								<tr>
									<td>&lt;None&gt;</td>
									<td>Address - State</td>
									<td> =</td>
									<td>New York</td>
								</tr>
								<tr>
									<td>And</td>
									<td>Affiliation - Is Org Contact</td>
									<td> =</td>
									<td>True</td>
								</tr>
							</table>
						<br/><br/>
						When two conditions are linked with "or", query results may meet either or both conditions. If in the above example the Boolean
						operator is changed to "or", the query results will include all records in which Address - State is New York(regardless of the
						value in the Affiliation - Is Org Contact is Yes(regardless of the value in the Address - State field)).
						<br><br>
						<table align =center><tr><a href="javascript:window.close()" class="CSSButtonStyle">Close</a></tr></table>

<script type="text/javascript">
	var trackKey = new String('<%=WebAppl.GetSystemSetting("GoogleAnalytics") %>');
	if (trackKey != "") {
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	}
</script>
<script type="text/javascript">
	var trackKey = new String('<%=WebAppl.GetSystemSetting("GoogleAnalytics") %>');
	if (trackKey != "") {
		var pageTracker = _gat._getTracker(trackKey);
		pageTracker._trackPageview();
	}
</script>
</body>
</html>

