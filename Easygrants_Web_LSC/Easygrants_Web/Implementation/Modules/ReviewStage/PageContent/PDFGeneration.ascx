<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
The final PDF combines all data and uploads from your application into one pdf file.  Viewing this pdf is a required
step prior to submission.  Please review the PDF of your application in its entirety and make sure no additional changes
are needed.  After submission, you will no longer be able to edit your report.
<br>
<li>Click <b>View PDF</b> to view your application in PDF format.  Pop-up functionality must be enabled.  (i.e., turn off pop-up blockers.)</li>
<li>Click <b>Save and Continue</b> to proceed to the <b>Validate and Submit</b> page, where you can review the status of each field required for submission.</li>
<br>
<br>
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
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'>
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
						Type='cButton' GoToNextPage='True'  />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
