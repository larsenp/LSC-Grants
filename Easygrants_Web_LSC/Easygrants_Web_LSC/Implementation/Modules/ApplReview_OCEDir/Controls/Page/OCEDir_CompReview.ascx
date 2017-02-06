<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br />
<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview_OCEDir/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
	
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/ApplReview_OCEDir/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	OCE Director Review
</div>
<br />
<table width='100%' >
   <tr>
      <td width='40%'><b> Significant Compliance Issues that affect the Funding Term Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='60%' align="left"><span runat='server' id='spnComplianceIssues' /></td>
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
      <td width='40%'><b> Significant Fiscal Issues that affect the Funding Term Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='60%' align="left"><span runat='server' id='spnAuditIssues' /></td>
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
<table width='100%' >
   <tr>
      <td width='40%'><b>Special Grant Conditions Proposed:<%=kDenoteRequiredField %></b> </td>
      <td width='60%' align="left"><span runat='server' id='spnSpecialGrant' /></td>
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
	OCE Staff Review - Fiscal Issues
</div>
<p>
	<b>Fiscal Compliance Specialist Review</b>: <span runat='server' id='spnOverallComment'/>
</p>
<p>
	<b>Recommended Fiscal Special Grant Conditions</b>: <span runat='server' id='spnRecommendedFiscalSGC'/>
</p>
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
      <td width='20%' align=left><b> OCE Director (or designee):<%=kDenoteRequiredField %></b></td>
      <td width='30%' align=left><span runat='server' id='spnOCEDirName' /></td>
      <td width='20%'><b>Review Date:<%=kDenoteRequiredField %></b> </td>
      <td width='30%'><span runat='server' id='spnDate' /></td>
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
	    
	     <DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
	        <DisplayProperties>
	           <DisplayProperty PropertyKey='ComplianceIssues'>
					<Control ID='rdoComplianceIssues'
						Type='cRadioButtonList'
						Container='spnComplianceIssues'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='ComplianceIssuesComment'>
					<Control ID='txtComplianceIssuesComment'
						Type='cTextArea'
						Container='spnComplianceIssuesComment'
						Rows='6'
						Cols='80' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='AuditIssues'>
					<Control ID='rdoAuditIssues'
						Type='cRadioButtonList'
						Container='spnAuditIssues'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey='AuditIssuesComment'>
					<Control ID='txtAuditIssuesComment'
						Type='cTextArea'
						Container='spnAuditIssuesComment'
						Rows='6'
						Cols='80' />
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
						Container='spnSpecialGrantComment'
						Rows='6'
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
						Container='spnOCEDirName'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='ReviewCommitteeMember'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='5' />
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
		
		<DataObject Key='CwosyOCEStaffReview' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='vLSCCompWftaOrgServareaYear.OrganizationID' PropertyKey='OrganizationID'/>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='vLSCCompWftaOrgServareaYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument PropertyKey="WfTaskID" Value='83'/>
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'>
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
			</Filters>
		</DataObject>
	
		<DataObject Key='LscReviewCompApplOCEStaff' DataObjectDefinitionKey='LscReviewCompApplOCEStaff' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='CwosyOCEStaffReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='spnOverallComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendedFiscalSGC'>
					<Control ID='spnRecommendedFiscalSGC'
						Type='HtmlGenericControl'/>
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
								<Argument Value='AppReview_OCEDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
        	
		
	</ModuleSection>
</span>
