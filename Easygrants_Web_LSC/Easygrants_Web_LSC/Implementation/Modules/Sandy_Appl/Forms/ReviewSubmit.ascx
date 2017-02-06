<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<table width='600' border="0" cellpadding='0' cellspacing='0' >
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Review and Submit </h1></td>
  </tr>
	<tr>
	  <td colspan="2" class="SeparatorHdg">Instructions</td>
	</tr>
	<tr>
	  <td colspan="2" >&nbsp;</td>
	</tr>
	<tr>
	  <td valign="top" >
	  	<p>The <strong>Submission</strong> section below indicates whether you are able to submit your application. If all pages in the application have been completed, click <strong>Submit</strong>. </p>
			<p>The <strong>Validation Status </strong> section below displays the status of your submission, indicating whether each section is validated (complete). Click the section links below or use the links on the left to navigate through the sections of the application.</p>
		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td colspan='2'>
		<Core:cUserCtlLoader CtlID='ctlValidationContent' Src='Implementation/Modules/LOI/Controls/PageSection/ValidateContent.ascx' runat='server' />
	</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	  <td >&nbsp;</td>
  </tr>
  <tr>
  	<td colspan="2">
		  <Core:cUserCtlLoader ID="CUserCtlLoader2" 
			CtlID='ctlSubmissionButton' 
			Src='Easygrants/Controls/Base/Submission_Button.ascx' 
			Properties='ForceGen=False' 
			runat='server' />
		</td>
	</tr>
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
						DisplayText='~View&nbsp;PDF~'>
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
