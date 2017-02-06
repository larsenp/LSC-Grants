<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlNewWindowOpener'/>
<br />
<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview_OPPDir/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/ApplReview_OPPDir/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>
	Staff Review
</div>
<br />
<span runat='server' id='spnReview' />
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
   <tr><td>&nbsp;</td></tr>
    <tr>
      <td><b> OCE fiscal application score:</b> </td>
      <td align="left"><span runat='server' id='spnOCEFiscalAppScore' /></td>
      <td>&nbsp;</td>
   </tr>
</table>
<br />
<div class='SeparatorHdg' width='100%'>
	OPP Director Review
</div>
<br />
<table width='100%' >
   <tr>
      <td width='20%'><b> OPP Grant Award Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='80%' align="left"><span runat='server' id='spnOutcome' /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td><b> OPP Funding Term Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td align="left"><span runat='server' id='spnFundingTerm' /></td>
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
      <td><b>Date of Meeting:<%=kDenoteRequiredField %></b> </td>
      <td><span runat='server' id='spnDate' /></td>
    </tr>
</table>

<table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
         <tr>
				<td>
				  	<p><b>Note</b></p>
				  	<ul>
						<li>The PPA is available from Box. </li>
						<li>Special grant conditions (if applicable) are available from Box.</li>
						<li>The application evaluation is available from LSC Grants </li>
						<li>The OCE fiscal application is available from LSC Grants </li>
						<li>The grant application comprises the following documents:</li>
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
							<li>OPP program quality and/or program engagement visit reports, if any (Box)</li>
							<li>TIG status reports, if applicable (LSC Grants)</li>
							<li>PBIF status reports (Box)</li>
							<li>PAI Waiver Request status reports (Box)</li>
							<li>Fund Balance Waiver Request status reports (Box)</li>
						</ul>
					</ul>
				</td>
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
						<DisplayProperty PropertyKey='LscReviewApplication.LscFundingTermDesc.Description' ColumnHeader='Staff Funding Recommendation' />
						<DisplayProperty PropertyKey=''>
							<Control ID='btnCSRAnalysisButton'
								Type='cButton'
								Caption='View CSR Analysis'>
								<Action PostBack='True' 
									Object='DataPresenter'
									Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
									<Parameters>	
										<Argument Value='CSRAnalysis' /> 
										<Argument Type='DataObjectCollection' TypeKey='StaffReviewWfTA' DataObjectPropertyKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
										<Argument Value='PageFrame=Print' />
									</Parameters>
								</Action>	
							</Control>
						</DisplayProperty>
						<DisplayProperty>
							 <Control ID='btnScoreReport'
									  Type='cButton'
									  Caption='View Score Report'>
									 <Action PostBack='True' 
											Object='DataPresenter'
											Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
											<Parameters>	
											  <Argument Value='ScoreReport' /> 
											  <Argument Value='PageFrame=Print' /> 
											</Parameters>
									 </Action>	
							</Control>
						</DisplayProperty>
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
						Container='spnFundingTerm'
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
	  
	  
	  <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='2' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Application~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
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
						Container='spnOPPDirName'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='ReviewCommitteeMember'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='3' />
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
