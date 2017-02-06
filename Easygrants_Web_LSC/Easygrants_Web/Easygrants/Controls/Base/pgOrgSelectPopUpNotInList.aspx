<%@ Page Language="vb" AutoEventWireup="true" Codebehind="pgOrgSelectPopUpNotInList.aspx.vb" Inherits="Easygrants_Web.Controls.Base.cOrgSelectPopUpNotInList" EnableViewState="true" %>
<%@ register tagprefix='Core' tagname='cDropDown' src='../../../Core/Controls/Base/DropDown.ascx' %>
<%@ register tagprefix='Core' tagname='cButton' src='../../../Core/Controls/Base/CSSButton.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <title><%=GetLabel("Organization")%> Selector</title>
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
  <body>

    <form id="frmMain" method="post" runat="server">
		<asp:RequiredFieldValidator id='valReqOrg' runat='server'
											ControlToValidate='txtInstID'
											ErrorMessage='You must select an ~~Organization~~.'
											Display='none'/>
		<a name='OrgSelectTop'></a>
		<table width='100%' runat='server' ID="Table1">
			<tr id='trInstruction'>
				<td colspan='3'>
					Click on the <b>Select...</b> button to select your <%=GetLabel("Organization")%>.
				</td>
			</tr>
		</table>
		<table id='tabMain' border='0' cellpadding='2' cellspacing='0' width='550' runat='server'  bgcolor='#EEEEEE'>
			<tr id='trInstName'>
				<td colspan='3' valign='top'>
					<span id='spInstName' runat='server'></span>
					<input type='text' id='txtInstID' runat='server' visible='false' NAME="txtInstID"/>
					<input type='text' id='txtInstName' runat='server' visible='false' NAME="txtInstName"/>
				</td>
			</tr>
			<tr id='trSearch1'>
				<td colspan='3'>
					<b>Step 1:  Search for the <%=GetLabel("Organization")%></b><br><br>
					Enter all or part of the <%=GetLabel("Organization")%> name in the text box below. Click <b>Find</b> to find the organization.
				</td>
			</tr>
			<tr>
				<td colspan='3'>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='3'>
					<font color='red'>
						<asp:Label ID="lblValidator1" Text="" runat="server"/>
					</font>
				</td>
			</tr>
			
			<tr id='trSearch2'>
				<td colspan='3'>
					<table  border='0' cellpadding='2' cellspacing='0' >
						<tr>
							<td><input type='text' id='txtInstitutionSearch' size='30' maxlength='100' runat='server' NAME="txtInstitutionSearch"/>
										<asp:RequiredFieldValidator id='ValInstitutionSearch' runat='server'
											ControlToValidate='txtInstitutionSearch'
											ErrorMessage='~~Organization~~ Name is required.' Enabled='False'
											Display='none'/>
							</td>
						</tr>
						<tr>
							<td><%=GetLabel("Organization")%> Name<font color='red'>*</font></td>				
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>				
							<td align='center'>
								<Core:cButton  id='btnFind' Caption='Find' runat='server' bgcolor='#EEEEEE'/>&nbsp;&nbsp;
								<Core:cButton  id='btnCancel1b' Caption='Cancel' runat='server' bgcolor='#EEEEEE' CausesValidation='false'/>	
							</td>
						</tr>
					</table>
					
				</td>				
			</tr>
			
			<tr id='trResults1'>
				<td colspan='3'>
					<b>Step 2: Select your <%=GetLabel("Organization")%></b><br><br>
					Select your <%=GetLabel("Organization")%> from the list below and click <b>Save</b>.
				</td>
			</tr>
			<tr>
				<td colspan='3'>&nbsp;</td>
			</tr>	
			<tr id='trResults2'>
				<td colspan='3'>
					<Core:cDropDown id='ctlInstitutionList' runat='server' />
				</td>
			</tr>
			<tr><td colspan='3'>&nbsp;</td></tr>
			<tr id='trSelect'>
				<td align='right' bgcolor='#EEEEEE'>
					<Core:cButton  id='btnSelect' Caption='Save' runat='server' bgcolor='#EEEEEE'/>&nbsp;
				</td>
				<td align='center' valign='top' width='5%'>
					<span id='spDivider' runat='server'>&nbsp;</span>&nbsp;
				</td>
				<td align='left' bgcolor='#EEEEEE'>
					<Core:cButton  id='btnCancel1' Caption='Cancel' runat='server' bgcolor='#EEEEEE'   CausesValidation='false'/>
									
					&nbsp;
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr id='trOr'>
				<td colspan='3'>
					<font size='3'><b><i>- OR -</b></i></font><br><br>
					If your <%=GetLabel("Organization")%> does not appear in the list above, you may enter your organization's information below and click <b>Save</b>.
				</td>
			</tr>

			<tr id='trValidator2'>
				<td colspan='3'>
					<font color='red'>
					<asp:Label ID="lblValidator2" 
		                Text=""
			            runat="server"/>
					</font>
				</td>
			</tr>
			
			<tr id='trNewInstName'>
				<td width='25%'><%=GetLabel("Organization")%> Name<font color='red'>*</font></td>
				<td colspan='2'>
					<input type='text' id='txtInstitutionOther' size='40' maxlength='130' runat='server' NAME="txtInstitutionOther"/>
					<asp:RequiredFieldValidator id='valReqInstOther' runat='server'
						ControlToValidate='txtInstitutionOther'
						ErrorMessage='~~Organization~~ Name is required.'
						EnableClientScript="False"
						Display='none'
						Enabled='False'/>
				</td>
			</tr>
			<tr id='trEIN'>
				<td>EIN/Tax ID<font color='red'>*</font></td>
				<td colspan='2'>
					<input type='text' id='txtEINOther' size='40' maxlength='10' runat='server' />
					<asp:RequiredFieldValidator id='ValReqEIN' runat='server'
							ControlToValidate='txtEINOther'
							ErrorMessage='EIN/Tax ID is required.'
							EnableClientScript="False"
							Display='none'
							Enabled='False'/>
					<asp:RegularExpressionValidator ID="valEIN" runat="server"     
                            ErrorMessage="EIN/Tax ID must contain numbers only." 
                            ControlToValidate="txtEINOther"     
                            ValidationExpression="^((N/A|NA|n/a|na|[0-9]*))$"
                            EnableClientScript="False" 
                            Display='none'
							Enabled='False'/>
					<asp:CustomValidator id='valCusEIN' runat='server'
							OnServerValidate='ValDoesEINExists'
							ErrorMessage='EIN/Tax ID already exists.'
							EnableClientScript="False"
							Display='None'
							Enabled='False'/>

				</td>
			</tr>
			<tr id='trEINInstructions'>
				<td>&nbsp;</td>
				<td colspan='2'>
					Enter "N/A" if your <%=GetLabel("Organization")%> does not have an EIN/Tax ID.
				</td>
			</tr>
			<tr id='trCity'>
				<td>City<font color='red'>*</font></td>
				<td colspan='2'>
					<input type='text' id='txtCityOther' size='30' maxlength='30' runat='server' NAME="txtCityOther"/>
					<asp:RequiredFieldValidator id='valReqCityOther' runat='server'
						ControlToValidate='txtCityOther'
						ErrorMessage='City is required.'
						EnableClientScript="False"
						Display='none'
						Enabled='False'/>
				</td>
			</tr>
			<tr id='trState'>
				<td>State/Province<font color='red'>*</font></td>
				<td colspan='2'>
					<Core:cDropdown id='ctlState' runat='server' DisplayNone='True' />
					<asp:RequiredFieldValidator id='ValStateOther' runat='server'
						ControlToValidate='ctlState'
						ErrorMessage='State/Province is required.'
						EnableClientScript="False"
						Display='none'
						Enabled='False'/>
				</td>
			</tr>
			<tr id='trStateInstruction'>
				<td>&nbsp;</td>
				<td colspan='2'>
					Select "N/A" if <%=GetLabel("Organization")%> is not located in a US State/Territory or Canadian Province.
				</td>
			</tr>
			<tr id='trCountry'>
				<td>Country<font color='red'>*</font></td>
				<td colspan='2'>
					<Core:cDropdown id='ctlCountry' runat='server' DisplayNone='True' />
					<asp:RequiredFieldValidator id='ValCountryOther' runat='server'
						ControlToValidate='ctlCountry'
						ErrorMessage='Country is required.'
						EnableClientScript="False"
						Display='none'
						Enabled='False'/>
				</td>
			</tr>
			<tr id='trType'>
				<td>Type<font color='red'>*</font></td>
				<td colspan='2'>
					<Core:cDropdown id='ctlType' runat='server' DisplayNone='True' />
					<asp:RequiredFieldValidator id='ValTypeOther' runat='server'
						ControlToValidate='ctlType'
						ErrorMessage='Type is required.'
						EnableClientScript="False"
						Display='none'
						Enabled='False'/>
				</td>
			</tr>
			<tr><td colspan='3'>&nbsp;</td></tr>
			<tr id='trSave'>
				<td align='right'>
					<Core:cButton  id='btnSave' Caption='Save' runat='server' bgcolor='#EEEEEE'/>
				</td>
				<td align='center' width='5%'>
					<span id='spDivider1' runat='server'>&nbsp;</span>&nbsp;
				</td>
				<td align='left'>
					<Core:cButton  id='btnCancel2' Caption='Cancel' runat='server' bgcolor='#EEEEEE'   CausesValidation='false'/>
				</td>
			</tr>
		</table>
		<span id='spAnchorInstSelect' runat='server' visible='false'>
			<script language="JavaScript">				
				var instituteName = "<%=InstitutionName%>";		
				window.opener.SetValueFromPopup('<%=(request.querystring("type"))%>','<%=(InstitutionID)%>',instituteName);
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
								DisplayValue='CommonOrganizationName'
								DisplayNone='False'>
								<Filters>
									<Argument Type='QueryString' TypeKey='find' Operator='Like' PropertyKey='CommonOrganizationName'/>
									<Argument Type='' TypeKey='' Operator='Equals' PropertyKey='AvailableInSelector' Value='True'/>
								</Filters>
								<Sort>
									<Argument PropertyKey='CommonOrganizationName'/>
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='State'>
							<Control ID='ctlState'
								Type='cDropDown'
								DataObjectDefinitionKey='State'
								StoredValue='StateID'
								DisplayText='Select' 
								DisplayValue='Description'>
								<Sort>
									<Argument PropertyKey='SortOrder' />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Country'>
							<Control ID='ctlCountry'
								DataObjectDefinitionKey='Country'
								StoredValue='CountryID'
								DisplayText='Select' 
								DisplayValue='CountryDesc'>
								<Sort>
									<Argument PropertyKey='SortOrder'/>
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationType'>
							<Control ID='ctlType'
								DataObjectDefinitionKey='OrganizationType'
								StoredValue='TypeID' 
								DisplayText='Select'
								DisplayValue='OrganizationName'>
								<Sort>
									<Argument PropertyKey='SortOrder'/>
								</Sort>
							</Control>
						</DisplayProperty>
					</DisplayProperties>
				</ModuleSection>
		</span>
    </form>

  </body>
</html>
