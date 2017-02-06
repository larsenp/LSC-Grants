<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br><br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Primary Contact/PI</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table3" width="100%">
	<tr>
		<td	width='20%'><b>Name</b></td>
		<td><span id='spnName' runat='server'/></td>
	</tr>
	<tr>
		<td	width='20%'><b><%=GetLabel("Organization")%></b></td>
		<td><span id='spnOrganization' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Personnel List</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>	
</table>
<!-- Page Content - Controls -->
<Core:cUserCtlLoader CtlID='ctlCoPrincipal' 
	Src='EasyGrants/Controls/PageSection/CoPrincipal_List.ascx'
	runat='server'/>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
                <DisplayProperty PropertyKey='PrimaryPerson.FirstNameLastName'>
                    <Control ID='spnName' Type='HtmlGenericControl'/>
                </DisplayProperty>
                 <DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' >
                    <Control ID='spnOrganization' Type='HtmlGenericControl'/>
                </DisplayProperty>
	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

