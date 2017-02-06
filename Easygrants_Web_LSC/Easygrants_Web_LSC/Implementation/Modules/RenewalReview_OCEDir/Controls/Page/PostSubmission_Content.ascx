<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class='SeparatorHdg'>Review Submitted</td>
  </tr>
  <tr>
    <td>
		<p>Thank you for submitting your Renewal application review.</p>
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
	Src='Implementation/Modules/RenewalReview_OCEDir/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<br />	
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview_OCEDir/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>
	OCE Director Review Information
</div>
<br />
<table width='100%' >
   <tr>
      <td width='30%'><b> Significant Compliance Issues that affect the Funding Term Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='70%' align="left"><span runat='server' id='spnComplianceIssues' /></td>
   </tr>
</table>
<table>
   <tr>
      <td><b> If yes, identify and concisely describe significant compliance issues and the recommended funding term below:</b> </td>
   </tr>
   <tr>
      <td align="left"><span runat='server' id='spnComplianceIssuesComment' /></td>
   </tr>
</table>
<br />
<table width='100%' >
   <tr>
      <td width='30%'><b> Significant Fiscal Issues that affect the Funding Term Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='70%' align="left"><span runat='server' id='spnAuditIssues' /></td>
   </tr>
</table>
<table>
   <tr>
      <td><b> If yes, identify and concisely describe significant fiscal issues and the recommended funding term below:</b> </td>
   </tr>
   <tr>
      <td align="left"><span runat='server' id='spnAuditIssuesComment' /></td>
   </tr>
</table>
<br />
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
	OCE Renewal Funding Recommendation
</div>
<br />
<table width='100%' >
   <tr>
      <td width='20%'><b> OCE Renewal Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='80%' align="left"><span runat='server' id='spnOutcome' /></td>
   </tr>
</table>
<p>This document certifies that the OCE director (or designee) has received input from OCE staff and reviewed the following (if applicable):  OCE oversight reports, Special Grant Conditions reports, OCE follow up activities with the Applicant, complaints received against the Applicant, Applicant audit reports, OIG referrals, fund balance and PAI waiver requests, and other relevant documents.  The OCE funding recommendation is based on Applicant’s overall compliance with the LSC Act, LSC regulations, and information provided 
throughout the year from the OIG.</p>
<table width='100%'>
    <tr>
      <td width='20%' align=left><b> OCE Director (or designee):<%=kDenoteRequiredField %></b></td>
      <td width='30%' align=left><span runat='server' id='spnOCEDirName' /></td>
      <td width='20%'><b>Date of Meeting:<%=kDenoteRequiredField %></b> </td>
      <td width='30%'><span runat='server' id='spnDate' /></td>
    </tr>
</table>	
<br />
<br />
<br />
<span runat='server' id='spnReturn' />


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	   <DataObject Key='LscRenewalRec' DataObjectDefinitionKey='LscRenewalRec' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
			     <DisplayProperty PropertyKey='ComplianceIssues' Format='YesNo'>
					<Control ID='spnComplianceIssues'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='ComplianceIssuesComment'>
					<Control ID='spnComplianceIssuesComment'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='AuditIssues' Format='YesNo'>
					<Control ID='spnAuditIssues'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='AuditIssuesComment'>
					<Control ID='spnAuditIssuesComment'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
				 
				 
				 <DisplayProperty PropertyKey='YesNoSpecialGrantCond' Format='YesNo'>
					<Control ID='spnSpecialGrant'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
	             <DisplayProperty PropertyKey='SpecialGrantConditions'>
					<Control ID='spnSpecialGrantComment'
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
	             <DisplayProperty PropertyKey='LscRenewalRecommendation.Description'>
					<Control ID='spnOutcome'
						Type='HtmlGenericControl'/>
	             </DisplayProperty>
				 <DisplayProperty PropertyKey='PrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnOCEDirName' 
						Type='HtmlGenericControl'/>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='PrimaryReaderDate' Format='MM/dd/yyyy'>
					<Control ID='spnDate' 
						Type='HtmlGenericControl'/>
				 </DisplayProperty>	
	         </DisplayProperties>
	    </DataObject>
	    
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
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
								<Argument Value='RenewalAppReview_OCEDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	         
	   
		
		    
</ModuleSection>
</span>	         
	         