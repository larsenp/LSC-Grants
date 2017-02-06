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
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
		</td>
	</tr>
</table>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview_OPPDir/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/ApplReview_OPPDir/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg'>Your Review Information</div>
<table width='100%' >
   <tr>
      <td width='20%'><b> OPP Grant Award Recommendation:</b> </td>
      <td width='80%' align="left"><span runat='server' id='spnOutcome' /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> OPP Funding Term Recommendation:</b> </td>
      <td align="left"><span runat='server' id='spnFundingTerm' /></td>
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
    <tr>
       <td><span runat='server' id='spnComment' /></td>
    </tr>
    <tr><td style="border-bottom:1px solid gray">&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td><p>This document certifies that the OPP Director (or designee) has met with staff and discussed the:  grant application, application evaluation, program planning and assessment instrument (PPA), special grant conditions (if applicable), TIG status reports (if applicable), PBIF status reports (if applicable), PAI waiver request status reports (if applicable), fund balance waiver requests status reports (if applicable), follow - up activity with Applicant (if applicable), and funding recommendation. The grant application evaluation is based on the ABA Standards for Providers of Civil Legal Aid, the LSC Performance Criteria, LSC regulations and the RFP. The funding recommendation is based on overall programmatic quality as determined by LSC's review of the grant application and other pertinent factors, including fiscal and compliance reviews conducted by OCE and input from OIG.</p></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
</table>
<table width='100%'>
    <tr>
      <td width='20%' align=left><b> OPP Director (or designee):<%=kDenoteRequiredField %></b></td>
      <td width='80%' align=left><span runat='server' id='spnOPPDirName' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
      <td><b>Date of Meeting:<%=kDenoteRequiredField %></b></td>
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
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'>
					<Control ID='spnOutcome'
						Type='HtmlGenericControl'/>
			   </DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
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
			    <DisplayProperty PropertyKey='LscFundingTermDesc.Description'>
					<Control ID='spnFundingTerm'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='SpecialGrant' Format='YesNo'>
					<Control ID='spnSpecialGrant'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='SpecialGrantComment'>
					<Control ID='lblComment'
						Type='cLabel'
						Container='spnComment'/>
				</DisplayProperty>
		  </DisplayProperties>
	  </DataObject>

	   <DataObject Key='LscOA1' DataObjectDefinitionKey='LscOA1' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='StaffReaderPerson.FirstNameLastName'>
					<Control ID='spnOPPDirName' 
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
								<Argument Value='AppReview_OPPDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>



