<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.Controls.Page.cSubmission" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<table width='600' border="0" cellpadding='0' cellspacing='0' >
  <tr>
    <td>&nbsp;</td>
  </tr>
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
            <!--disabled 2/20/09 until View submission feature is available<p>In the <strong>View Full Submission</strong> section below, click <strong>View PDF</strong> to view a PDF of your application.</p>-->
            <p>The <strong>Validation Status </strong> section below displays the status of your submission, indicating whether each section is validated (complete). Click the section links below or use the links on the left to navigate through the sections of the application.</p>
            <p id='parPVInstr' runat='server' >Click the <b>View PDF</b> button below for a printable, read-only view of the information you have provided for this form. The PDF will appear in a new browser tab or window.</p>
         </td>
            
        <td >&nbsp;</td>
        <td >&nbsp;</td>
        <td width="160" valign="top" >
			<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
				Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
				runat='server'/>
		</td>
      </tr>
      <tr>
        <td colspan="4" >&nbsp;</td>
      </tr>
	<tr id='trPrintableView' runat='server' visible='false'>
		<td>
			<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlPrintableView' 
				Src='Implementation/Modules/GAR/Controls/PageSection/GARPrintableViewButton.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr><td><Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='btnViewPDF' 
				Src='Implementation/Modules/GAR/Controls/PageSection/SubmissionViewPDF.ascx'
				runat='server'/></td></tr>
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
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<table width='600' border="0" cellpadding='0' cellspacing='0'>
	<tr>
		<td class='SeparatorHdg'>
			Submission
		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td>
			<span id='spnInvalidText' runat='server' visible='false'>
				<b>ATTENTION:</b>  Your report cannot be submitted at this time because it is not complete.  Review the Validation status of each item below to determine the outstanding requirements.  Validated or complete requirements are marked with a green check mark. Invalid or incomplete requirements are marked with a red X.  Once all requirements are validated, the
				<b>Submit</b> button will be displayed and you can submit your application.  
			</span>
		</td>
	</tr>
	<tr>
		<td>
			<span id='spnSubmitText' runat='server' visible='false'>
				<b>Your report is complete.</b>
				<br></br>
				Your report is complete and may be submitted.  Click <b>Submit</b> (below) to submit your report.  Once you submit, you will receive an email confirmation that the submission was successfully received, and 
				<b>you will no longer be able to access any of the pages.</b>  From your Main page, you will be able to access a copy of your final PDF along with program guidelines.
				If you submit and later discover an error, you must contact LSC to have your form unsubmitted.
			</span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlValidationContent' Src='Implementation/Modules/LOI/Controls/PageSection/ValidateContent.ascx' runat='server' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlSubmissionButton' 
				Src='Easygrants/Controls/Base/Submission_Button.ascx' 
				Properties='ForceGen=False' 
				runat='server' />
		</td>
	</tr>
</table>

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
					bool='' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewPDF'
						Type='cUserCtlLoader'>
						<Visible>
							<Argument PropertyKey='ReportOutputDefinitionID' Value='' Operator='NotEqual'>
								<RelatedProperty PropertyKey="WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink"/>
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPrintableView' Type='cUserCtlLoader'>
						<Visible>
							<Argument PropertyKey='PrintViewPageKey' Value='' Operator='NotEqual'>
								<RelatedProperty PropertyKey='WfTask.LscWfTask'/>
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
