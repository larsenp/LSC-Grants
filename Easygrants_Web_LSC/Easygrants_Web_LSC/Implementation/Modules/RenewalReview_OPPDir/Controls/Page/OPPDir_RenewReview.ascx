<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br />
<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview_OPPDir/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<br />	
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview_OPPDir/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>
	Staff Review
</div>
<span runat='server' id='spnStaffReview' />
<br />
<div class='SeparatorHdg' width='100%'>
	OCE Director Review
</div>
<table width='100%' >
   <tr>
      <td width='20%'><b> Significant compliance issues:</b> </td>
      <td width='30%' align="left"><span runat='server' id='spnComplianceIssues' /></td>
      <td width='50%'><EasyGrants:cReportOutputLink id='ctlApplicantReportLink1' runat='server'/></td>
   </tr>
   <tr>
      <td><b> Significant audit issues:</b> </td>
      <td><span runat='server' id='spnAuditIssues' /></td>
      <td>&nbsp;</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> Special grant conditions (SGCs):</b> </td>
      <td align="left"><span runat='server' id='spnOCESpecialGrant' /></td>
      <td>&nbsp;</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> OCE Director funding recommendation:</b> </td>
      <td align="left"><span runat='server' id='spnFundRec' /></td>
      <td>&nbsp;</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
    <tr>
      <td><b> OCE Director review status:</b> </td>
      <td align="left"><span runat='server' id='spnStatus' /></td>
      <td>&nbsp;</td>
   </tr>
</table>
<br />
<div class='SeparatorHdg' width='100%'>
	OPP Director Review
</div>
<br />
<table width='100%' cellpadding='1'>
    <tr>
       <td width='20%'><b>Years Remaining in Grant Term:</b></td>  
       <td width='80%' align="left"><span runat='server' id='spnYrsRemain' /> years </td> 
    </tr>
</table>
<br />
<table width='100%' >
    <tr>
      <td width='20%'><b> OPP Grant Renewal Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='80%' align="left"><span runat='server' id='spnOutcome' /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> Special grant conditions (SGCs):<%=kDenoteRequiredField %></b> </td>
      <td align="left"><span runat='server' id='spnSpecialGrant' /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
</table>
<table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td> Enter an optional comment in the comment box below:</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnComment' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td><p>LSC uses the grant renewal process to be informed of any fundamental changes or developments in the grantee's delivery system since the submission of the most recent competitive grant application. This document certifies that the OPP Director (or designee) has reviewed and/or discussed with staff the: grant renewal evaluation and recommendation, special grant conditions (if applicable), TIG status reports (if applicable), PBIF status reports (if applicable), PAI waiver request status reports (if applicable), fund balance waiver requests status reports (if applicable), and follow-up activity with Applicant (if applicable). The renewal recommendation also takes into consideration fiscal and compliance considerations from the Office of Compliance and Enforcement and input from the Office of the Inspector General.</p></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
</table>
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

<table width='100%'>
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan=3 align=center>
	        <span runat="server" id='spnSave' />&nbsp;&nbsp;&nbsp;
		    <span runat='server' id='spnSaveAndClose'/>
		    <span runat='server' id='spnSaveAndContinue'/>
		</td>
	</tr>
</table>
<br />
<br />
<br />
<span runat='server' id='spnReturn' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	   <DataObject Key='LscRenewalRec' DataObjectDefinitionKey='LscRenewalRec' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
	              <DisplayProperty PropertyKey='LscRenewalRecommendationID'>
					<Control ID='rdoGrant'
						Type='cRadioButtonList'
						Container='spnOutcome'
						RepeatDirection='Horizontal'
						DataObjectDefinitionKey='LscRenewalRecommendation'
						StoredValue='LscRenewalRecommendationID'
						DisplayValue='Description'>
					    <Filters>
							<Argument PropertyKey='LscRenewalRecommendationID' Value='2'  Operator='NotEqual' />
						</Filters>
					  </Control>
	               	</DisplayProperty>
	               <DisplayProperty PropertyKey='YesNoSpecialGrantCond'>
					<Control ID='rdoSpecialGrant'
						Type='cRadioButtonList'
						Container='spnSpecialGrant'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SpecialGrantConditions'>
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='10'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderPersonID'>
					<Control ID='ctlOPPDirName' 
						Type='cDropDown' 
						Container='spnOPPDir'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='ReviewCommitteeMember'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='3' />
						</Filters>
					</Control>
			    </DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderDate'>
					<Control ID='ctlPrimaryReaderDate' 
						Type='cDateTextBox' 
						Container='spnDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='PrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnReviewerName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRecommendation.Description'>
					<Control ID='spnRenewRecom'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
	        </DisplayProperties>
	    </DataObject>
	    
	    <DataObject Key='WfTACompetitionYearReview' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
	   
		<DataObject Key='StaffReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			    <Argument PropertyKey='WfTaskID' Value='6' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYearReview' DataObjectPropertyKey='WfTAYear' PropertyKey='WfTAYear' >
				   <RelatedProperty PropertyKey='WfTACompetitionYear' ></RelatedProperty>
				</Argument>
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReviewerID'
						Type='cDataListCtl'
						Container='spnStaffReview'>
						<DisplayProperty PropertyKey='LscRenewalRec.PrimaryReaderPerson.FirstNameLastName' ColumnHeader='Staff Reviewer Name' />
						<DisplayProperty PropertyKey='LscRenewalRec.LscRenewalRecommendation.Description' ColumnHeader='Staff Renewal Recommendation' />
				     </Control>
				</DisplayProperty>	
		    </DisplayProperties>
		</DataObject>
		
		
          <DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			    <Argument PropertyKey='WfTaskID' Value='4' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='vYearsRemainingInGrantTerm.YearsRemain'>
					<Control ID='spnYrsRemain'
						Type='HtmlGenericControl' />
				</DisplayProperty>
		    </DisplayProperties>
		</DataObject>
	
	<DataObject Key='RenewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='4' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Renewal Application PDF~'>
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
		
		<DataObject Key='OCEReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='75' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='LscRenewalRec.ComplianceIssues' Format='YesNo'>
					<Control ID='spnComplianceIssues' Type='HtmlGenericControl' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='LscRenewalRec.AuditIssues' Format='YesNo'>
					<Control ID='spnAuditIssues' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRec.YesNoSpecialGrantCond' Format='YesNo'>
					<Control ID='spnOCESpecialGrant' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr' >
					<Control ID='spnStatus' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRec.LscRenewalRecommendation.Description' >
					<Control ID='spnFundRec' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink1'
						Type='cReportOutputLink'
						DisplayText='~View OCE Director Review PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='OCEReviewWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='OCEReviewWfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		 
				
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False' >
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
		
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnSaveAndContinue'
						Save='True'
						GoToNextPage='True'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
	</ModuleSection>
</span>
