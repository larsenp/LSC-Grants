<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Gar.Controls.PageSection.cGARModuleHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ import namespace='Core.Web.Modules' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- This module control requires a valid user,
	and a ModuleUser object implementing a PersonID property -->
<table border='0' width='100%'>
	<tr>
		<td align='center'>
			<b><%=(ctype(Page, cModulePage)).ModulePage_GetModuleDescriptiveName()%></b>
		</td>
		<td rowspan='2' align='right' valign='bottom' width='20'>
			<Core:cUserCtlLoader CtlID='ctlPrintableViewLink'
			Src='Easygrants/Controls/Base/PrintableViewLink.ascx'
			runat='server'/>
		</td>
	</tr>
	<tr align='center'>
		<td>
			<span runat='server' id='spnGAR' >
				<b>Form 
					<span runat='server' id='spnFullFormNumber' />:
					<span runat='server' id='spnFormName' />
					<span runat='server' id='spnServAreaTypeDescription' />
				</b>
			</span>
			<span runat='server' id='spnStandard'>
				<b><%=(ctype(Page, cModulePage)).ModulePage_GetTitle()%></b>
			</span>
			&nbsp;-&nbsp;
			<span id='lblOrgName' runat='server'/>
		</td>
	</tr>
</table>
<!-- Page Content - Controls -->

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.OrganizationName'>
					<Control ID='lblOrgName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='FormName' DataObjectDefinitionKey='FormName' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FullFormNumber'>
					<Control ID='spnFullFormNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='FormName'>
					<Control ID='spnFormName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServAreaTypeDescription'>
					<Control ID='spnServAreaTypeDescription'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>