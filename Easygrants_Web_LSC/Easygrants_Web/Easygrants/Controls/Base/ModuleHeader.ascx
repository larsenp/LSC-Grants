<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ import namespace='Core.Web.Modules' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIIABLE CONTENT AREA -->
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
			<b><%=(ctype(Page, cModulePage)).ModulePage_GetTitle()%></b>
			&nbsp;-&nbsp;
			<span id='lblFirstName' runat='server'/>&nbsp;<span id='lblLastName' runat='server'/>
		</td>
	</tr>
</table>
<!-- Page Content - Controls -->

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='Person' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FirstName'>
					<Control ID='lblFirstName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LastName'>
					<Control ID='lblLastName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>