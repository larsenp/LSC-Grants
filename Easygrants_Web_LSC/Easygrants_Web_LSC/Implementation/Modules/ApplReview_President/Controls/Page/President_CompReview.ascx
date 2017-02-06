<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlNewWindowOpener'/>

<br />
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
      <td width='20%'><b> LSC Grant</b> </td>
      <td width='30%' align="left"><span runat='server' id='spnLSCGrant' /></td>
      <td width='20%'><b> Non-LSC Funding</b> </td>
      <td width='30%' align="left"><span runat='server' id='spnNonLSCFunding' /></td>
   </tr>
</table>
<br />
<div width='100%' class='SeparatorHdg'>
	Staff Review
</div>
<br />
<span runat='server' id='spnReview' />
<br />
<div width='100%' class='SeparatorHdg'>
	OPP Director Review
</div>
<table width='100%' cellpadding='1'>
    <tr>
       <td width='30%'><b>OPP Management Funding Term Recommendation:</b></td> 
       <td width='30%' align="left"> <span runat='server' id='spnOPPDirFundingterm' /></td> 
       <td width='40%'><EasyGrants:cReportOutputLink id='ctlApplicantReportLink2' runat='server'/></td>
    </tr>
    <tr>
       <td width='30%'><b>Special Grant Conditions:</b></td> 
       <td width='30%' align="left"> <span runat='server' id='spnOPPDirSGC' /></td>
       <td width='40%'>&nbsp;</td>  
    </tr>
</table>
<br />
<table width='100%' cellpadding='1'>
    <tr>
       <td><b>Comment from OPP Director</b></td>
    </tr>
    <tr>
       <td><span runat='server' id='spnOPPDirComment' /></td>
    </tr>
</table>
<br />
<div width='100%' class='SeparatorHdg'>
	OCE Director Review
</div>
<table width='100%' >
   <tr>
      <td width='30%'><b> Significant Compliance Issues:</b> </td>
      <td width='30%' align="left"><span runat='server' id='spnComplianceIssues' /></td>
      <td width='40%'><EasyGrants:cReportOutputLink id='ctlApplicantReportLink1' runat='server'/></td>
   </tr>
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
      <td><b> OCE Director Funding Recommendation:</b> </td>
      <td align="left"><span runat='server' id='spnFundRec' /></td>
      <td>&nbsp;</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
    <tr>
      <td><b> OCE Director review status:</b> </td>
      <td align="left"><span runat='server' id='spnStatus' /></td>
      <td>&nbsp;</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
    <tr>
      <td><b> OCE fiscal application score:</b> </td>
      <td align="left"><span runat='server' id='spnOCEFiscalAppScore' /></td>
      <td>&nbsp;</td>
   </tr>
</table>
<br />
<div width='100%' class='SeparatorHdg'>
	Vice President Review
</div>
<table width='100%' cellpadding='1'>
    <tr>
       <td width='30%'><b>Review Status:</b></td> 
       <td width='30%' align="left"> <span runat='server' id='spnVPReviewStatus' /></td>
       <td width='40%'><EasyGrants:cReportOutputLink id='ctlApplicantReportLink3' runat='server'/></td>
    </tr>
    <tr>
       <td width='30%'><b>LSC Vice President for Grant Management Grant Award recommendation:</b></td> 
       <td width='30%' align="left"> <span runat='server' id='spnVPRecom' /></td>
       <td>&nbsp;</td> 
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td width='30%'><b>LSC Vice President for Grant Management Funding Term recommendation:</b></td> 
       <td width='30%' align="left"> <span runat='server' id='spnVPFundingTerm' /></td> 
       <td>&nbsp;</td> 
    </tr>
     <tr><td>&nbsp;</td></tr>
    <tr>
       <td width='30%'><b>Special grant conditions (SGCs):</b></td> 
       <td width='30%' align="left"> <span runat='server' id='spnVPSGC' /></td> 
       <td>&nbsp;</td> 
    </tr>
 </table>
<br />
<div width='100%' class='SeparatorHdg'>
	President Review
</div>
<br />
<table width='100%' cellpadding='1'>
    <tr>
       <td width='30%'><b>LSC President Grant Award Decision<%=kDenoteRequiredField %></b></td> 
       <td width='70%' align="left"> <span runat='server' id='spnOutcome' /></td> 
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td width='30%'><b>LSC President Funding Term Decision<%=kDenoteRequiredField %></b></td> 
       <td width='70%' align="left"> <span runat='server' id='spnPresidentFundingTerm' /></td> 
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
      <td width='30%'><b> Special grant conditions (SGCs)<%=kDenoteRequiredField %></b> </td>
      <td width='70%' align="left"><span runat='server' id='spnSpecialGrant' /></td>
   </tr>
</table>
<br />
<table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td> Optional comment from the LSC President:</td>
    </tr>
    <tr>
       <td><span runat='server' id='spnComment' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
       <td><p>This document certifies that the LSC President met with OPP and OCE management and discussed: (1) grant application, (2) application evaluation, (3) program planning and assessment instrument (PPA), (4) special grant conditions (if applicable), (5) significant compliance and/or fiscal issues (if applicable), (6) significant audit issues (if applicable), (7) TIG status reports (if applicable), (8) PBIF status reports (if applicable), (9) PAI waiver request status reports (if applicable), (10) fund balance waiver requests status reports (if applicable), (11) follow-up activity with Applicant (if applicable), and (12) the funding recommendation. The grant application evaluation is based on the ABA Standards for the Provision of Civil Legal Aid, the LSC Performance Criteria, LSC regulations and the RFP. The funding recommendation is based on overall programmatic quality as determined by LSC's review of the grant application, fiscal and compliance reviews conducted by the Office of Compliance and Enforcement, input from the Office of the Inspector General, and other pertinent factors.</p></td>      
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
</table>
<table>
    <tr>
      <td width='20%' align=left><b> LSC President:<%=kDenoteRequiredField %></b></td>
      <td width='80%' align=left><span runat='server' id='spnLSCPresident' /></td>
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
              <td><p><b>Note</b></p>
                 <ul>
                      <li>The PPA is available from Box</li>
                      <li>Special grant conditions (if applicable) are available from Box</li>
                      <li>The OPP application evaluation is available from LSC Grants.</li>
                      <li>The OCE fiscal application evaluation is available from LSC Grants.</li>
                      <li>The grant application review process comprises the following documents:</li>
                      <ul>
                          <li>Grant application proposal narrative (LSC Grants)</li>
                          <li>Resumes of key staff and the board chair (LSC Grants)</li>
                          <li>Listing of disciplinary complaints if any (LSC Grants)</li>
                          <li>Listing of malpractice lawsuits if any (LSC Grants)</li>
                          <li>Revenue, Expense, CSR, Board, Staffing, PAI, and Technology data (Salesforce/LSC Grants)</li>
                          <li>Program Profile and Trend Analysis (Salesforce)</li>
                          <li>Other Services Report (LSC Grants)</li>
                          <li>Final OCE CMS/CSR Reports if any (Box)</li>
                          <li>Special grant conditions or letters of concern, if any (Box)</li>
                          <li>Audit reports (for new Applicants only) (LSC Grants)</li>
                          <li>Performance evaluations and monitoring reports by non-LSC funders if any (LSC Grants)</li>
                          <li>OPP program quality and/or program engagement visit reports (Box)</li>
                          <li>TIG status reports, if applicable (LSC Grants)</li>
                          <li>PBIF status reports, if applicable (Box)</li>
                          <li>PAI Waiver Request status reports, if applicable (Box)</li>
						  <li>Fund Balance Waiver Request status reports, if applicable (Box)</li>
                      </ul>     
                 </ul></td>
         </tr>
</table>
<br />
<span runat='server' id='spnReturn' />
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



<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	     <DataObject Key='StaffReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='5' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReviewerID'
						Type='cDataListCtl'
						Container='spnReview'>
						<DisplayProperty PropertyKey='LscOA1.StaffReaderPerson.FirstNameLastName' ColumnHeader='Staff Reviewer Name' />
						<DisplayProperty PropertyKey='ReviewTotalScore.TotalScore' ColumnHeader='Grant Application Score' Format='#0.0'/>
						<DisplayProperty PropertyKey='LscReviewApplication.LscFundingTermDesc.Description' ColumnHeader='Staff Funding Term Recommendation' />
			       </Control>
			       </DisplayProperty>
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

		
       
	     <DataObject Key='OPPDirReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='47' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewApplication.LscFundingTermDesc.Description' >
					<Control ID='spnOPPDirFundingterm'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
                 <DisplayProperty PropertyKey='LscReviewApplication.SpecialGrant' Format='YesNo'>
					<Control ID='spnOPPDirSGC'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='LscReviewApplication.SpecialGrantComment'>
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
				<Argument PropertyKey='WfTaskID' Value='74' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='LscReviewApplication.ComplianceIssues' Format='YesNo'>
					<Control ID='spnComplianceIssues' Type='HtmlGenericControl' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='LscReviewApplication.AuditIssues' Format='YesNo'>
					<Control ID='spnAuditIssues' Type='HtmlGenericControl' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='LscReviewApplication.SpecialGrant' Format='YesNo'>
					<Control ID='spnOCESpecialGrant' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr' >
					<Control ID='spnStatus' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' >
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
	  
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		 
		<DataObject Key='FiscalAppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='OrganizationID' PropertyKey='OrganizationID' >
					<RelatedProperty PropertyKey='vLSCCompWftaOrgServareaYear'/>
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' >
					<RelatedProperty PropertyKey='vLSCCompWftaOrgServareaYear'/>
				</Argument>
				<Argument PropertyKey='WfTaskID' Value='83' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscCompAppFiscalScoreTotal' DataObjectDefinitionKey='LscCompAppFiscalScoreTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='FiscalAppWfTA' DataObjectPropertyKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
		     <DisplayProperties>
				<DisplayProperty PropertyKey='TotalScore'>
					<Control ID='spnOCEFiscalAppScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
		     </DisplayProperties>
		</DataObject>
		

		<DataObject Key='VPReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='87' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewApplication.LscFundingTermDesc.Description' >
					<Control ID='spnVPFundingterm'
						Type='HtmlGenericControl' />
				 </DisplayProperty>
                 <DisplayProperty PropertyKey='LscReviewApplication.SpecialGrant' Format='YesNo'>
					<Control ID='spnVPSGC' Type='HtmlGenericControl' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr' >
					<Control ID='spnVPReviewStatus' Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' >
					<Control ID='spnVPRecom' Type='HtmlGenericControl' />
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
		 

	    <DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
	              <DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='rdoGrant'
						Type='cRadioButtonList'
						Container='spnOutcome'
						RepeatDirection='Horizontal'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'>
					    <Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
					  </Control>
	               	</DisplayProperty>
	        </DisplayProperties>
	    </DataObject>
	    
	       
	    <DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
	      <DisplayProperties>
			    <DisplayProperty PropertyKey='LscFundingTermID'>
					<Control ID='ctlFundingTerm'
						Type='cDropDown'
						Container='spnPresidentFundingTerm'
						DataObjectDefinitionKey='LscFundingTerm'
						StoredValue='LscFundingTermID'
						DisplayValue='Description' />
				</DisplayProperty>
			    <DisplayProperty PropertyKey='SpecialGrant'>
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
			    <DisplayProperty PropertyKey='SpecialGrantComment'>
					<Control ID='txtComment'
						Type='cTextArea'
						Container='spnComment'
						Rows='10'
						Cols='80' />
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
			    <DisplayProperty PropertyKey='StaffReaderPersonID'>
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
			    <DisplayProperty PropertyKey='StaffReaderDate'>
					<Control ID='ctlStaffReaderDate' 
						Type='cDateTextBox' 
						Container='spnDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='LSC Staff Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='LSC Staff Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
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