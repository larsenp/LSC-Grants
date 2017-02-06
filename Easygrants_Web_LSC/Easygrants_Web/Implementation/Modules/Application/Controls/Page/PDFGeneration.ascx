<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<span id='spnPageContent' runat='server'/>
<p>

<table width='100%'>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlApplicantReportLink' Type='cReportOutputLink' runat='server'/>
		</td>
	</tr>
</table>
<center>
<table>	
	<tr>
		<td>
			<span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;
		</td>
	</tr>
</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText=''>
						<Parameters>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID' Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfTask.WfTaskModule.ReportOutputDefinitionID'
								PropertyKey='DefinitionID' Value=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Save='False'
						Type='cButton' GoToNextPage='True' >
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
