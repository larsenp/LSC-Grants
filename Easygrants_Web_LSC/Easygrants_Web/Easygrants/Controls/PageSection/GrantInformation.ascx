<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg" colspan='2'><b>Grant Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td width='15%'><b><%=GetLabel("GrantId")%></b></td><td><span id='spnGrantId' runat='server'></span></td></tr>
	<tr><td><b>Grantee <%=GetLabel("Organization")%></b></td><td><span id='spnGranteeOrg' runat='server'></span></td></tr>
	<tr><td><b>Primary Contact/PI</b></td><td><span id='spnPrimaryContact' runat='server'></span></td></tr>
	<tr><td><b><%=GetLabel("ProjectTitle")%></b></td><td><span id='spnProjectTitle' runat='server'></span></td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>	
			    <DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='spnGrantId'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnGranteeOrg'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstNameMiddleName'>
					<Control ID='spnPrimaryContact'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantTitle'>
					<Control ID='spnProjectTitle'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>	
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>