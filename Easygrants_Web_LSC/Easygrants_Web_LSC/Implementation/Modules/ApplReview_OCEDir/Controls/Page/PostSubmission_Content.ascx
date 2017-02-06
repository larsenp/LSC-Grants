<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>


<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class='SeparatorHdg'>Review Submitted</td>
  </tr>
  <tr>
    <td>
		<p>Thank you for submitting your competitive application review.</p>
		<ul>
			<li>To return to your home page, click the <b>Home</b> link in the left-hand navigation.</li>
			<li>To leave LSC Grants, use the <b>Log Out</b> link in the left-hand navigation.</li>
			<li>To view the data you submitted in PDF format, click the <b>View Review PDF</b> button.</li>
		</ul>
	</td>
  </tr>
  <tr>
  	<td>
		<EasyGrants:cReportOutputLink id='ctlReviewReportLink' runat='server'/>
	</td>
  </tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview_OCEDir/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/ApplReview_OCEDir/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg'>OCE Director Review Information</div>
<br />
<table>
   <tr>
      <td width='50%'><b> Significant Compliance Issues that affect the Funding Term Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='50%' align="left"><span runat='server' id='spnComplianceIssues' /></td>
   </tr>
</table>
<table>
   <tr>
      <td><b> If yes, identify and concisely describe significant compliance issues below:</b> </td>
   </tr>
   <tr>
      <td align="left"><span runat='server' id='spnComplianceIssuesComment' /></td>
   </tr>
</table>
<br />
<table>
   <tr>
      <td width='50%'><b> Significant Fiscal Issues that affect the Funding Term Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='50%' align="left"><span runat='server' id='spnAuditIssues' /></td>
   </tr>
</table>
<table>
   <tr>
      <td><b> If yes, identify and concisely describe significant fiscal issues below:</b> </td>
   </tr>
   <tr>
      <td align="left"><span runat='server' id='spnAuditIssuesComment' /></td>
   </tr>
</table>
<table>
   <tr>
      <td width='50%'><b> Special Grant Conditions Proposed:<%=kDenoteRequiredField %></b> </td>
      <td width='50%' align="left"><span runat='server' id='spnSpecialGrant' /></td>
   </tr>
</table>
<table>
   <tr>
      <td><b> If yes, enter the proposed special grant conditions below:</b> </td>
   </tr>
   <tr>
      <td align="left"><span runat='server' id='spnSpecialGrantComment' /></td>
   </tr>
</table>
<br />
<div class='SeparatorHdg' width='100%'>
	OCE Funding Recommendation
</div>
<br />
<table width='100%' >
   <tr>
      <td width='20%'><b> OCE Funding Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='80%' align="left"><span runat='server' id='spnOutcome' /></td>
   </tr>
</table>
<p>This document certifies that the OCE director (or designee) has received input from OCE staff and reviewed the following (if applicable):  OCE oversight reports, Special Grant Conditions reports, OCE follow up activities with the Applicant, complaints received against the Applicant, Applicant audit reports, OIG referrals, and other relevant documents.  The OCE funding recommendation is based on fiscal and compliance reviews conducted by the Office of Compliance and Enforcement, information provided throughout the year from the Office of the Inspector General, and other pertinent factors.</p>
<table width='100%'>
    <tr>
      <td width='10%' align=left><b> OCE Director (or designee):<%=kDenoteRequiredField %></b></td>
      <td width='20%' align=left><span runat='server' id='spnOCEDirName' /></td>
      <td width='10%'></td>
      <td width='10%'><b>Date of Meeting:<%=kDenoteRequiredField %></b> </td>
      <td width='20%'><span runat='server' id='spnDate' /></td>
    </tr>
</table>

<table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
         <tr>
              <td><p><b>Note</b></p>
                 <ul>
                      <li>The PPA is available from Box. </li>
                      <li>Special grant conditions (if applicable) are available from Box.</li>
                      <li>The OPP application evaluation is available from LSC Grants.</li>
                      <li>The OCE fiscal application evaluation is available from LSC Grants.</li>
                      <li>The grant application review process comprises the following documents:</li>
                      <ul>
                          <li>Competitive grant proposal narrative (LSC Grants)</li>
                          <li>Resumes of key staff and the board chair (LSC Grants)</li>
                          <li>Listing of disciplinary complaints if any (LSC Grants)</li>
                          <li>Listing of malpractice lawsuits if any (LSC Grants)</li>
                          <li>Revenue, Expense, CSR, Board, Staffing, PAI, and Technology data (LSC Grants)</li>
                          <li>Program Profile (LSC Grants)</li>
                          <li>Other Services Report (LSC Grants)</li>
                          <li>Final OCE Oversight Reports if any (Box)</li>
                          <li>Special grant conditions or letters of concern, if any (Box)</li>
                          <li>Audit reports (LSC Grants)</li>
                          <li>Performance evaluations and monitoring reports by non-LSC funders if any (LSC Grants)</li>
                          <li>OPP program quality visit reports, if any (Box)</li>
                          <li>OCE fiscal application</li>
                      </ul>     
                 </ul></td>
         </tr>
</table>
<br />
<br />
<br />
<br />
<span runat='server' id='spnReturn' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'>
					<Control ID='spnOutcome'
						Type='HtmlGenericControl'/>
			   </DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Review PDF~'>
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

	 <DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	      <DisplayProperties>
	            <DisplayProperty PropertyKey='ComplianceIssues' Format='YesNo'>
					<Control ID='spnComplianceIssues'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='ComplianceIssuesComment'>
					<Control ID='lblComplianceIssuesComment'
						Type='cLabel'
						Container='spnComplianceIssuesComment'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AuditIssues' Format='YesNo'>
					<Control ID='spnAuditIssues'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='AuditIssuesComment'>
					<Control ID='lblAuditIssueComment'
						Type='cLabel'
						Container='spnAuditIssuesComment'/>
				</DisplayProperty>
				
				
				<DisplayProperty PropertyKey='SpecialGrant' Format='YesNo'>
					<Control ID='spnSpecialGrant'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecialGrantComment'>
					<Control ID='lblSpecialGrantComment'
						Type='cLabel'
						Container='spnSpecialGrantComment'/>
				</DisplayProperty>
		  </DisplayProperties>
	  </DataObject>

	   <DataObject Key='LscOA1' DataObjectDefinitionKey='LscOA1' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='StaffReaderPerson.FirstNameLastName'>
					<Control ID='spnOCEDirName' 
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='StaffReaderDate' Format='MM/dd/yyyy'>
					<Control ID='spnDate' 
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False' >
			<DisplayProperties>
			   <DisplayProperty PropertyKey=''>
					<Control ID='lnkReturn'
						Type='cLink'
						Container='spnReturn'
						Caption='Return to Review Assignment List'>
						<Action PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff' />
								<Argument Value='ModuleConfig' />
								<Argument Value='AppReview_OCEDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>



