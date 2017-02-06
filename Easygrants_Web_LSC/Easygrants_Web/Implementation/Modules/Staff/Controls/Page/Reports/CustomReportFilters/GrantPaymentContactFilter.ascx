<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cCustomReportOpener"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br>
<p>Select filters for the selected report in the section
below. The filters are optional. If you
do not select any filters, the report will base calculations on all applicable
data in the system.</p>
<p>Click on the <b>Go</b> button to generate the report. Note that the report results will open in a
separate window. Click on the <b>Cancel</b>
button to return to the Standard Reports listing page.</p>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b><span runat='server' id='spnReportName'/></b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>	
<tr>
	<td>
	<Core:cUserCtlLoader CtlID='ctlStdReportOpen' 
		Src='Implementation/Modules/Staff/Controls/PageSection/StandardReports_Open.ascx'
		Properties='GoMethod=OpenReport'
		runat='server'/>
			<span runat='server' id='spnCancel'/>
	</td>
</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Report' DataObjectDefinitionKey='Report' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReportID'
					PropertyKey='ReportID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReportName'>
					<Control ID='spnReportName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty>
					<Control ID='ctlStdReportOpen'
						Type='cUserCtlLoader'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
