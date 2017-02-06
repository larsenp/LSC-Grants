<%@ Control Language="vb" AutoEventWireup="true" Codebehind="" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<table  border="0" cellspacing="0" cellpadding="0" WIDTH="100%">
   <tr>
        <td>&nbsp;</td>
   </tr>
   <tr>
       <td><h1>Review and Submit </h1></td>
   </tr>
   <tr>
       <td class="SeparatorHdg">Instructions</td>
   </tr>
   <tr>
        <td>&nbsp;</td>
   </tr>
   <tr>
        <td valign="top" > 
            <p>The <strong>Validation Summary</strong> section below displays the status of your submission, indicating whether each section is validated (complete). </p>
            <p>To make changes to the application before submitting, click the LOI link under Page Name below.</p> 
				<p>Before submitting, applicants should click <strong>View PDF</strong> to view their LOI and ensure that responses to each section are complete. Applicants should also save a copy of the PDF.</p>
            <p>If all the validation rules have been met, you will see a <b>Submit</b> button below. Once your LOI is complete, click the <strong>Submit</strong> button to submit the LOI.</p>
            <p>You will receive an email confirmation acknowledging submission of the LOI. Please save a copy of that email.</p>
         </td>  
   </tr>
</table>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationContent' Src='Implementation/Modules/LOI/Controls/PageSection/ValidateContent.ascx' runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
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
