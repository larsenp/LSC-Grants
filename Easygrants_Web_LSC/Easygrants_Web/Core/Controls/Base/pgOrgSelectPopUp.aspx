<%@ Page Language="vb" AutoEventWireup="true" Codebehind="pgOrgSelectPopUp.aspx.vb" Inherits="Core_Web.Controls.Base.cOrgSelectPopUp" EnableViewState="true" %>
<%@ register tagprefix='Core' tagname='cDropDown' src='DropDown.ascx' %>
<%@ register tagprefix='Core' tagname='cButton' src='CSSButton.ascx' %>
<%--<%@ register tagprefix='Core' tagname='Styles' src='../../../Implementation/Modules/Home/Controls/Style/HomeModuleStyle.ascx' %>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <title>Institution Selector</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <%--<Core:Styles id='ctlStyles' runat='server'/>--%>
    <link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
  </head>
  <body>

    <form id="frmMain" method="post" runat="server">
		<asp:RequiredFieldValidator id='valReqOrg' runat='server'
											ControlToValidate='txtInstID'
											ErrorMessage='You must select an Institution.'
											Display='none'/>
		<a name='OrgSelectTop'></a>
		<table width='100%' runat='server'>
			<tr id='trInstruction'>
				<td colspan='3'>
					Click on the <b>Select...</b> button to select your Institution.
				</td>
			</tr>
		</table>
		<table id='tabMain' border='0' cellpadding='0' cellspacing='0' width='425' runat='server' bgcolor='#EEEEEE'>
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
					<b>Step 1</b><br>
					Enter all or part of the Institution name in the textbox below, then click <b>Find</b> to find the Institution.
				</td>
			</tr>
			<tr id='trSearch2'>
				<td colspan='2'>
					<input type='text' id='txtInstitutionSearch' size='20' maxlength='100' runat='server' />
				</td>
				<td>
					<Core:cButton  id='btnFind' Caption='Find'  runat='server' bgcolor='#EEEEEE'/>
				</td>
			</tr>
			<tr id='trResults1'>
				<td colspan='3'>
					<b>Step 2</b><br>
					Select your Institution from the list below.  
					Once you have finished, click <b>Select</b>.
				</td>
			</tr>	
			<tr id='trResults2'>
				<td colspan='3'>
					<Core:cDropDown id='ctlInstitutionList' DisplayNone='true' runat='server' />
				</td>
			</tr>
			<tr><td colspan='3'>&nbsp;</td></tr>
			<tr id='trSelect'>
				<td align='right' bgcolor='#EEEEEE'>
					<Core:cButton  id='btnSelect'  Caption='Select' runat='server' bgcolor='#EEEEEE'/>&nbsp;
				</td>
				<td align='center' valign='top' width='5%'>
					<span id='spDivider' runat='server'>&nbsp;|</span>&nbsp;
				</td>
				<td align='left' bgcolor='#EEEEEE'>
					<Core:cButton  id='btnCancel1'   Caption='Cancel' runat='server' bgcolor='#EEEEEE'/>
					<Core:cButton  id='btnCancel1b'  Caption='Cancel' runat='server' bgcolor='#EEEEEE'/>					
					&nbsp;
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr id='trOr'>
				<td colspan='3'>
					<font size='3'><b><i>- OR -</b></i></font><br>
					If your Institution does not appear in the list, you may type it in the textbox provided below, then click <b>Save</b>.
				</td>
			</tr>
			<tr id='trNewInstName'>
				<td>
					Institution Name
				</td>
				<td colspan='2'>
					<input type='text' id='txtInstitutionOther' size='40' maxlength='130' runat='server' />
					<asp:RequiredFieldValidator id='valReqInstOther' runat='server'
						ControlToValidate='txtInstitutionOther'
						ErrorMessage='You must enter an Institution name.'
						Display='none'
						Enabled='False'/>
				</td>
			</tr>
			<tr id='trCity'>
				<td>
					City
				</td>
				<td colspan='2'>
					<input type='text' id='txtCityOther' size='30' maxlength='30' runat='server' />
					<asp:RequiredFieldValidator id='valReqCityOther' runat='server'
						ControlToValidate='txtCityOther'
						ErrorMessage='You must enter a city name.'
						Display='none'
						Enabled='False'/>
				</td>
			</tr>
			<tr id='trState'>
				<td>
					State/Province
				</td>
				<td colspan='2'>
					<Core:cDropdown id='ctlState' runat='server' DisplayNone='True' />
				</td>
			</tr>
			<tr id='trCountry'>
				<td>
					Country
				</td>
				<td colspan='2'>
					<Core:cDropdown id='ctlCountry' runat='server' DisplayNone='True' />
				</td>
			</tr>
			<tr><td colspan='3'>&nbsp;</td></tr>
			<tr id='trSave'>
				<td align='right'>
					<Core:cButton  id='btnSave'  Caption='Save' runat='server' bgcolor='#EEEEEE'/>
				</td>
				<td align='center' width='5%'>
					<span id='spDivider1' runat='server'>&nbsp;|</span>&nbsp;
				</td>
				<td align='left'>
					<Core:cButton  id='btnCancel2'  Caption='Cancel' runat='server' bgcolor='#EEEEEE'/>
				</td>
			</tr>
		</table>
		<span id='spAnchorInstSelect' runat='server' visible='false'>
		<script language="JavaScript">
			window.opener.SetValueFromPopup('<%=(request.querystring("type"))%>','<%=(InstitutionID)%>','<%=(InstitutionName)%>');
			window.close();
		</script>
		</span>
		
		<span id='spCloseWindow' runat='server' visible='false'>
		<script language="JavaScript">
			window.close();
		</script>
		</span>		
		

		<span runat='server' id='spnConfigXML' visible='false'>
			<!DOCTYPE EasyGrants>
				<ModuleSection>
					<DisplayProperties>
						<DisplayProperty PropertyKey='Organization'>
							<Control ID='ctlInstitutionList'
								Type='cDropDown'
								DataObjectDefinitionKey='Organization'
								StoredValue='OrganizationID'
								DisplayValue='OrganizationName'>
								<Filters>
									<Argument Type='QueryString' TypeKey='find' Operator='Like' PropertyKey='OrganizationName'/>
									<Argument Type='QueryString' TypeKey='edlevel' PropertyKey='MedInstFlag'/>
									<Argument Type='' TypeKey='' PropertyKey='MasterInstitutionID' Value='not null'/>									
								</Filters>
								<Sort>
									<Argument PropertyKey='OrganizationName'/>
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='State'>
							<Control ID='ctlState'
								DataObjectDefinitionKey='State'
								StoredValue='StateID'
								DisplayValue='Description'/>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Country'>
							<Control ID='ctlCountry'
								DataObjectDefinitionKey='Country'
								StoredValue='CountryID'
								DisplayValue='CountryDesc'/>
						</DisplayProperty>
					</DisplayProperties>
				</ModuleSection>
		</span>
    </form>
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
