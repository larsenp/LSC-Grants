<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br/>
<table width='600' border="0" cellpadding='0' cellspacing='0'>
  <tr>
    <td><h1>Review and Submit </h1></td>
  </tr>
  <tr>
    <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
      <tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
      </tr>
      <tr>
        <td colspan="4" >&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" ><p>The <strong>Submission</strong> section below indicates whether you are able to submit your application. If all pages in the application have been completed, click <strong>Submit</strong>. </p>
            <p>In the <strong>View Full Submission</strong> section below, click <strong>View PDF</strong> to view a PDF of your application.</p>
            <p>The <strong>Validation Summary</strong> section below displays the status of your submission, indicating whether each section is validated (complete). Click the section links below or use the links on the left to navigate through the sections of the application.</p></td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
        <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
      </tr>
      <tr>
        <td valign="top" >&nbsp;</td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
        <td valign="top" >&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <span id='spnSubmitButton' runat='server'/>
</table>

<table width='600'>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlSubmission' Src='Implementation/Modules/Application/Controls/PageSection/Appl_SubmissionContent.ascx'	runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />

		</td>
	</tr>

	
	<tr>
		<td>
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/></p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlValidationContent' Src='Implementation/Modules/LOI/Controls/PageSection/ValidateContent.ascx' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
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