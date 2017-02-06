<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />

<div style="width:100%" class='SeparatorHdg'>
	Review and Submit
</div>

<p>
Click <strong>View PDF</strong> to view a PDF of your Letter of Intent to Apply. Save a local copy of the PDF of your completed application for your records before submitting. 
</p>

<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>

<p>The <strong>Validation Summary</strong> section below displays the status of your submission, indicating whether each section is validated (complete). <strong>PLEASE NOTE</strong>: Some areas in the Validation Summary may be checked as complete even though you may need or wish to provide additional information.</p>

<p>To make changes to the application before submitting, click the name of the form you want to change under <strong>Page Name</strong> below.</p>

<p>If all the validation rules have been met, you will see a <strong>Submit</strong> button below. <strong>Once your Letter of Intent to Apply is complete, click the Submit button to submit your application. You will receive a confirmation email that your application was received. Please save this confirmation email. If you do not receive a confirmation email, contact us at <a href='mailto:Techgrants@lsc.gov'>Techgrants@lsc.gov</a></strong></p>


<p>To return to your full list of grant applications please click on “Home” in the left navigation bar.</p>

<div class='SeparatorHdg' width='100%'>Validation Summary</div>

<br />
<Core:cValidate id='ctlValidate' DisplayFormat='Detail' 
	runat='server'/>
	
<br/>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />
  
  
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>				
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
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

    </ModuleSection>
  </span>