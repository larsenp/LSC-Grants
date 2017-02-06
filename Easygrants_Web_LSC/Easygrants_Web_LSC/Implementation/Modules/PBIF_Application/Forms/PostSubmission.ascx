<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />

<div class='SeparatorHdg' style="width:100%" >
	Application Submitted
</div>
<p>
	Thank you for submitting your PBIF application. You will receive a confirmation email that your application was received. Please save this confirmation email. 
</p>
<ul>
	<li>To view the data you submitted in PDF format, click the <b>View PDF</b> button below.</li>
	<li>To return to your home page, click the Home link in the left-hand navigation.</li>
	<li>To submit another PBIF application, return to the Home page.</li>
	<li>To leave LSC Grants, use the Log Out  link in the left-hand navigation.</li>
	<li>If you have submitted in error, or if you need to make a correction to your submission, contact <a href='mailto:probonoinnovation@lsc.gov'>probonoinnovation@lsc.gov</a></li>
</ul>  
<b>Submission Date: </b>  <span runat='server' id='spnSubmittedDate'/>
<br />
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/></p>

  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubmittedDate' Format='MMMM dd, yyyy, h:mm tt'>
					<Control ID='spnSubmittedDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View PDF~'>
						<Parameters>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='WfTaskAssignment'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
    </ModuleSection>
  </span>