<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='20%'><b>Participant</b>&nbsp;&nbsp;</td>
		<td><span runat='server' id='spnName' visible='true'/></td>
	</tr>	
	<tr>
		<td><b>Participant <%=GetLabel("Organization")%></b>&nbsp;&nbsp;</td>
		<td><span runat='server' id='spnInst' visible='true'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='LastNameFirstName'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName'>
					<Control ID='spnInst' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
