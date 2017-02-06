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
		<p>Thank you for submitting your Application review.</p>
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
	Src='Implementation/Modules/ApplReview_President/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<br />	
<div width='100%' class='SeparatorHdg'>
	Grant Information
</div>
<br />
<table width='100%' >
   <tr>
      <td width='10%'><b> LSC Grant</b> </td>
      <td width='40%' align="left"><span runat='server' id='spnLSCGrant' /></td>
      <td width='10%'><b> Non-LSC Funding</b> </td>
      <td width='40%' align="left"><span runat='server' id='spnNonLSCFunding' /></td>
   </tr>
</table>
<br />	
<div class='SeparatorHdg'>Your Review Information</div>

<table width='100%' >
    <tr><td>&nbsp;</td></tr>
    <tr>
      <td width='20%'><b> LSC President Grant Award Decision:</b> </td>
      <td width='80%' align="left"><span runat='server' id='spnPresidentGrantAward' /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr><td>&nbsp;</td></tr>
    <tr>
      <td width='20%'><b> LSC President Funding Term Decision:</b> </td>
      <td width='80%' align="left"><span runat='server' id='spnPresFundingTerm' /></td>
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
        <td><b>Optional comment from the LSC President:</b></td>
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td><span runat='server' id='spnComment' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td style="border-bottom:1px solid gray">&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td><p>This document certifies that the LSC President met with OPP and OCE management and discussed: (1) grant application, (2) application evaluation, (3) program planning and assessment instrument (PPA), (4) special grant conditions (if applicable), (5) significant compliance issues (if applicable), (6) significant audit issues (if applicable), (7) follow-up activity with Applicant (if applicable), and (8) the funding recommendation. The grant application evaluation is based on the ABA Standards for the Provision of Civil Legal Aid, the LSC Performance Criteria, LSC regulations and the RFP.  The funding recommendation is based on overall programmatic quality as determined by LSC's review of the grant application, input from the Office of Compliance and Enforcement and the Office of the Inspector General, and other pertinent factors.</p></td>
    </tr>
</table>
<br />
<table>
    <tr>
      <td width='20%' align=left><b> LSC President:<%=kDenoteRequiredField %></b></td>
      <td width='80%' align=left><span runat='server' id='spnPresident' /></td>
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
	     
	     <DataObject Key='StaffReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='5' />
			</Filters>
			<DisplayProperties>
			       <DisplayProperty PropertyKey='GranteeProject.WfProject.Fund.FundAmount' Format='$#,0'>
					<Control ID='spnLSCGrant'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
			 </DisplayProperties>
	     </DataObject>
	     
	     <DataObject Key='WfTaskAssignment1' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='2' />
			</Filters>
		</DataObject>
	     <DataObject Key='WfTAMidLevelBudgetItems' DataObjectDefinitionKey='WfTAMidLevelBudgetItems' Updatable='False' CreateNew='False'>
				<Filters>
					<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment1' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
					<Argument Type='Data' PropertyKey='CategoryTypeID' Value='2'/>
					<Argument Type='Data' PropertyKey='SortOrder' Value='19'/>
				</Filters>
				<DisplayProperties>
						<DisplayProperty PropertyKey='Amount' Format='$#,0'>
						      <Control ID='spnNonLSCFunding'
						              Type='HtmlGenericControl' />
						</DisplayProperty>
				</DisplayProperties>
		</DataObject>
        
         <DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'>
					<Control ID='spnPresidentGrantAward'
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
					<Control ID='spnPresFundingTerm'
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
					<Control ID='spnPresident' 
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='StaffReaderDate' Format='MM/dd/yyyy'>
					<Control ID='spnDate' 
						Type='HtmlGenericControl' />
			    </DisplayProperty>
			</DisplayProperties>
		</DataObject>

		  
	    <DataObject Key='ReturnWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkReturn'
						Type='cLink'
						Container='spnReturn'
						Caption='Return to Review Assignment List'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ReviewList' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		    
</ModuleSection>
</span>	         
	         