<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview_President/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<br />	
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview_President/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
<div class='SeparatorHdg' width='100%'>
	Staff and OPP Director Review
</div>
<table width='100%' cellspacing="0" >
    <tr>
       <td width='30%'><b>Years Remaining in Grant Term:</b></td> 
       <td width='30%' align="left"> <span runat='server' id='spnYrsRemain' /></td> 
       <td width='40%'><EasyGrants:cReportOutputLink id='ctlApplicantReportLink2' runat='server'/></td>
    </tr>
    <tr>
       <td width='30%'><b>Staff Grant Renewal Recommendation:</b></td> 
       <td align="left"> <span runat='server' id='spnStaffReviewerName' /></td>
       <td align="left"> <span runat='server' id='spnStaffReviewerRecom' /></td>  
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td width='30%'><b>OPP Management Grant Renewal Recommendation:</b></td> 
       <td align="left"> <span runat='server' id='spnOPPDirReviewerName' /></td>
       <td align="left"> <span runat='server' id='spnOPPDirReviewerRecom' /></td>
    </tr>
</table>
<br>
<table width='100%' cellpadding='0'>
    <tr>
       <td><b>Comment from OPP Director</b></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnOPPDirComment' /></td>
    </tr>
</table>
<br />
<div class='SeparatorHdg' width='100%'>
	OCE Director Review
</div>
<table width='100%' >
<tr>
      <td width='30%'><b>OCE Director:</b> </td>
      <td width='30%' align="left"><span runat='server' id='spnOCEDirName' /></td>
      <td width='40%'><EasyGrants:cReportOutputLink id='ctlApplicantReportLink1' runat='server'/></td>
   </tr>
   <tr>
      <td width='30%'><b> Significant Compliance Issues:</b> </td>
      <td width='30%' align="left"><span runat='server' id='spnComplianceIssues' /></td>
      <td>&nbsp;</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> Significant Audit Issues:</b> </td>
      <td align="left"><span runat='server' id='spnAuditIssues' /></td>
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
	Vice President Review
</div>
<table width='100%' >
   <tr>
      <td width='30%'><b>Review status:</b> </td>
      <td width='30%' align="left"><span runat='server' id='spnVPReviewStatus' /></td>
      <td width='40%'><EasyGrants:cReportOutputLink id='ctlApplicantReportLink3' runat='server'/></td>
   </tr>
   <tr>
      <td><b>LSC Vice President for Grant Management Renewal recommendation:</b> </td>
      <td align="left"><span runat='server' id='spnVPFundRec' /></td>
      <td>&nbsp;</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> Special grant conditions (SGCs):</b> </td>
      <td align="left"><span runat='server' id='spnVPSGC' /></td>
      <td>&nbsp;</td>
   </tr>
</table>
<br />
<div class='SeparatorHdg' width='100%'>
	President Review
</div>
<br />
<table width='100%' >
    <tr>
      <td width='30%'><b> LSC President Grant Renewal Decision:<%=kDenoteRequiredField %></b> </td>
      <td width='30%'><span runat='server' id='spnPresidentOutcome' /></td>
      <td width='40%'>&nbsp;</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> Special grant conditions (SGCs):<%=kDenoteRequiredField %></b> </td>
      <td><span runat='server' id='spnSpecialGrant' /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
</table>
<br />
<table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td> Optional comment from the LSC President</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnComment' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td><p>LSC uses the grant renewal process to be informed of any fundamental changes or developments in the grantee's delivery system, since the submission of the most recent competitive grant application.   This document certifies that the LSC President met with OPP and OCE management and discussed the grant renewal evaluation and recommendation, special grant conditions (if applicable), TIG status reports (if applicable), PBIF status reports (if applicable), PAI waiver request status reports (if applicable), fund balance waiver requests status reports (if applicable), and follow-up activity with Applicant (if applicable).  The renewal recommendation also takes into consideration fiscal and compliance considerations from the Office of Compliance and Enforcement and input from the Office of the Inspector General.</p></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
</table>
<table>
    <tr>
      <td width='30%' align=left><b> LSC President:<%=kDenoteRequiredField %></b></td>
      <td width='30%' align=left><span runat='server' id='spnLSCPresident' /></td>
      <td width='40%'>&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
      <td><b>Date of Meeting:<%=kDenoteRequiredField %></b> </td>
      <td><span runat='server' id='spnDate' /></td>
    </tr>
</table>
<br />
<table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
         <tr>
              <td><p><b>Note:</b> The grant renewal review process comprises the following documents:</p>
                      <ul>
                          <li>Grant renewal narrative (LSC Grants)</li>
                          <li>Grant renewal evaluation and recommendation (LSC Grants)</li>
                          <li>Revenue, Expense, CSR, Board, Staffing, PAI, and Technology data (Salesforce)</li>
                          <li>Program Profile (Salesforce)</li>
                          <li>Other Services Report (LSC Grants)</li>
                          <li>Final OCE CMS/CSR Reports, if any (Box)</li>
                          <li>Special grant conditions or letters of concern, if any (Box)</li>
                          <li>OPP program quality visit reports, if any (Box)</li>
                          <li>TIG status reports, if applicable (LSC Grants/Grants File)</li>
                          <li>PBIF status reports, if applicable (Box)</li>
                          <li>PAI Waiver Request status reports, if applicable (Box)</li>
                          <li>Fund Balance Waiver Request status reports, if applicable (Box)</li>
                      </ul>     
                 </td>
         </tr>
</table>
<br />
<table width='100%'>
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan=3 align=center>
	        <span runat="server" id='spnSave' />&nbsp;&nbsp;&nbsp;
		    <span runat='server' id='spnSaveAndContinue'/>
		</td>
	</tr>
</table>
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
						Container='spnPresidentOutcome'
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
						Container='spnLSCPresident'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='ReviewCommitteeMember'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='4' />
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
	         </DisplayProperties>
	      </DataObject>
	    
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
	    
	    <DataObject Key='StaffReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='6' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='WFTAYear' PropertyKey='WFTAYear'>
					<RelatedProperty PropertyKey='vLSCCompWftaOrgServareaYear'/>
				</Argument>
			</Filters>
			<DisplayProperties>
		<%--	    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReviewerID'
						Type='cDataListCtl'
						Container='spnStaffReview'>
						<DisplayProperty PropertyKey='LscRenewalRec.PrimaryReaderPerson.FirstNameLastName' ColumnHeader=' '/>
						<DisplayProperty PropertyKey='LscRenewalRec.LscRenewalRecommendation.Description' ColumnHeader=' '/>
				     </Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='LscRenewalRec.PrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnStaffReviewerName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRec.LscRenewalRecommendation.Description'>
					<Control ID='spnStaffReviewerRecom'
						Type='HtmlGenericControl' />
				</DisplayProperty>		
		    </DisplayProperties>
		</DataObject>
		
		
		
		<DataObject Key='OPPDirReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='52' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='WFTAYear' PropertyKey='WFTAYear'>
					<RelatedProperty PropertyKey='vLSCCompWftaOrgServareaYear'/>
				</Argument>
			</Filters>
			<DisplayProperties>
			    <%--<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOPPDirReviewerID'
						Type='cDataListCtl'
						Container='spnOPPDirReview'>
						<DisplayProperty PropertyKey='LscRenewalRec.PrimaryReaderPerson.FirstNameLastName' ColumnHeader=' '  />
						<DisplayProperty PropertyKey='LscRenewalRec.LscRenewalRecommendation.Description' ColumnHeader=' ' />
				     </Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='LscRenewalRec.PrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnOPPDirReviewerName'
						Type='HtmlGenericControl' />
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LscRenewalRec.LscRenewalRecommendation.Description'>
					<Control ID='spnOPPDirReviewerRecom'
						Type='HtmlGenericControl' />
				</DisplayProperty>	
				<DisplayProperty PropertyKey='LscRenewalRec.SpecialGrantConditions'>
					<Control ID='lblComment'
						Type='cLabel'
						Container='spnOPPDirComment'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink2'
						Type='cReportOutputLink'
						DisplayText='~View OPP Director Review PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='OPPDirReviewWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='OPPDirReviewWfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
		    </DisplayProperties>
		</DataObject>
		
		<DataObject Key='OCEReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='75' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='WFTAYear' PropertyKey='WFTAYear'>
					<RelatedProperty PropertyKey='vLSCCompWftaOrgServareaYear'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscRenewalRec.PrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnOCEDirName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
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
				<%--<DisplayProperty PropertyKey='LscRenewalRec.ComplianceAuditIssueComment'>
					<Control ID='lbl2Comment'
						Type='cLabel'
						Container='spnOCEDirComplianceComment'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRec.SpecialGrantConditions'>
					<Control ID='lbl3Comment'
						Type='cLabel'
						Container='spnOCEDirSGCComment'/>
				</DisplayProperty>--%>
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
		
		
		
		<DataObject Key='VPReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='88' />
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='WFTAYear' PropertyKey='WFTAYear'>
					<RelatedProperty PropertyKey='vLSCCompWftaOrgServareaYear'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr' >
					<Control ID='spnVPReviewStatus' Type='HtmlGenericControl' />
				</DisplayProperty> 
				<DisplayProperty PropertyKey='LscRenewalRec.LscRenewalRecommendation.Description' >
					<Control ID='spnVPFundRec' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalRec.YesNoSpecialGrantCond' Format='YesNo'>
					<Control ID='spnVPSGC' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink3'
						Type='cReportOutputLink'
						DisplayText='~View Vice President Review PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='VPReviewWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='VPReviewWfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
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