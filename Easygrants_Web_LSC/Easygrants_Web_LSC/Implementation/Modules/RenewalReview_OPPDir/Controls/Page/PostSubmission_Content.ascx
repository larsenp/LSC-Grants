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
	Src='Implementation/Modules/RenewalReview_OPPDir/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<br />	
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview_OPPDir/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
	
<div class='SeparatorHdg'>Your Review Information</div>

<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
<table width='100%' >
    <tr><td>&nbsp;</td></tr>
    <tr>
      <td width='20%'><b> OPP Grant Renewal Recommendation:</b> </td>
      <td width='80%' align="left"><span runat='server' id='spnOutcome' /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> Special grant conditions (SGCs):</b> </td>
      <td align="left"><span runat='server' id='spnSpecialGrant' /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
</table>
<table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td><b>Special grant condition comment</b></td>
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td><span runat='server' id='spnComment' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td style="border-bottom:1px solid gray">&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td><p>LSC uses the grant renewal process to be informed of any fundamental changes or developments in the grantee's delivery system since the submission of the most recent competitive grant application. This document certifies that the OPP Director (or designee) has reviewed and/or discussed with staff the: grant renewal evaluation and recommendation, special grant conditions (if applicable), TIG status reports (if applicable), PBIF status reports (if applicable), PAI waiver request status reports (if applicable), fund balance waiver requests status reports (if applicable), and follow-up activity with Applicant (if applicable). The renewal recommendation also takes into consideration fiscal and compliance considerations from the Office of Compliance and Enforcement and input from the Office of the Inspector General.</p></td>
    </tr>
</table>
<br />
<table>
    <tr>
      <td width='20%' align=left><b> OPP Director (or designee):<%=kDenoteRequiredField %></b></td>
      <td width='80%' align=left><span runat='server' id='spnOPPDir' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
      <td><b>Date of review and/or discussion:<%=kDenoteRequiredField %></b> </td>
      <td><span runat='server' id='spnDate' /></td>
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

	   <DataObject Key='LscRenewalRec' DataObjectDefinitionKey='LscRenewalRec' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
	              <DisplayProperty PropertyKey='LscRenewalRecommendation.Description'>
					<Control ID='spnOutcome'
						Type='HtmlGenericControl'/>
	              </DisplayProperty>
	             <DisplayProperty PropertyKey='YesNoSpecialGrantCond' Format='YesNo'>
					<Control ID='spnSpecialGrant'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
	              <DisplayProperty PropertyKey='SpecialGrantConditions'>
					<Control ID='spnComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnOPPDir' 
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderDate' Format='MM/dd/yyyy'>
					<Control ID='spnDate' 
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
	         </DisplayProperties>
	    </DataObject>
	         
	    <DataObject Key='RenewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Group='(' />
				<Argument PropertyKey='WfTaskID' Value='4' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='67' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Application PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='RenewWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='RenewWfTA'
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
								<Argument Value='RenewalAppReview_OPPDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		    
</ModuleSection>
</span>	         
	         