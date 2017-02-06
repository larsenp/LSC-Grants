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
	Src='Implementation/Modules/RenewalReview_OCEDir/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>
<br />	
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview_OCEDir/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
<br />
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
      <td><b> If yes, identify and concisely describe significant compliance issues below:</b> </td>
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
      <td><b> If yes, identify and concisely describe significant fiscal issues below:</b> </td>
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
	OCE Renewal Recommendation
</div>
<br />
<table width='100%' >
   <tr>
      <td width='20%'><b> OCE Renewal Recommendation:<%=kDenoteRequiredField %></b> </td>
      <td width='80%' align="left"><span runat='server' id='spnOutcome' /></td>
   </tr>
</table>
<p>This document certifies that the OCE director (or designee) has received input from OCE staff and reviewed the following (if applicable):  OCE Oversight reports, Special Grant Conditions reports, OCE follow up activities with the Applicant, complaints received against the Applicant, Applicant audit reports, OIG referrals, fund balance and PAI waiver requests, and other relevant documents.  The OCE funding recommendation is based on Applicant’s overall compliance with the LSC Act, LSC regulations, and information provided throughout the year from the OIG.</p>
<table width='100%'>
    <tr>
      <td width='20%' align=left><b> OCE Director (or designee):<%=kDenoteRequiredField %></b></td>
      <td width='30%' align=left><span runat='server' id='spnOCEDirName' /></td>
      <td width='20%'><b>Review Date:<%=kDenoteRequiredField %></b> </td>
      <td width='30%'><span runat='server' id='spnDate' /></td>
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
						Container='spnSpecialGrantComment'
						Rows='6'
						Cols='80' />
				</DisplayProperty>
	            <DisplayProperty PropertyKey='LscRenewalRecommendationID'>
					<Control ID='ctlLscRenewalRecommendationID'
						Type='cDropDown'
						Container='spnOutcome'
						DataObjectDefinitionKey='LscRenewalRecommendation'
						StoredValue='LscRenewalRecommendationID'
						DisplayValue='Description' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryReaderPersonID'>
					<Control ID='ctlOCEDirName' 
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
								<Argument Value='RenewalAppReview_OCEDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
	</ModuleSection>
</span>
