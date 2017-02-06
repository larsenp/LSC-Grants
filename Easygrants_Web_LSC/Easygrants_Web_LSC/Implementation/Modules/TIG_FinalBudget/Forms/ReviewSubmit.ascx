<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>Instructions</div>
<br />
<p>Click <strong>View PDF</strong> to view a PDF of your budget submission.

<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/></p>

<p>The <strong>Validation Summary</strong> section below displays the status of your submission, indicating whether each section is validated (complete). 
<b>PLEASE NOTE</b>: Some areas in the Validation Summary may be checked as complete even though you may need or wish to provide additional information. </p>

<p>If all the validation rules have been met, you will see a <b>Submit</b> button below. Once your budget information is complete, click the <strong>Submit</strong> button to submit the budget.
You will receive a confirmation email that your application was received. Please save this confirmation email. </p>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />
<br />
<div class='SeparatorHdg' width='100%'>Validation Summary</div>
<br />
<Core:cValidate id='ctlValidate' DisplayFormat='Detail' 
	runat='server'/>

  
  
  
  
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