<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table1">
	<tr>
		<td>
			<b>Name</b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnName' visible='true'></span>
		</td>
	</tr>	
	<tr>
		<td>
			<b>Primary <%=GetLabel("Organization")%></b>&nbsp;&nbsp;
		</td>
		<td>
			<span runat='server' id='spnInst' visible='true'></span>
		</td>
	</tr>	
	
<tr><td>&nbsp;</td></tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ID'
					PropertyKey='PersonID' 
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='LastNameFirstName'>
					<Control ID='spnName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName'>
					<Control ID='spnInst'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
										
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
