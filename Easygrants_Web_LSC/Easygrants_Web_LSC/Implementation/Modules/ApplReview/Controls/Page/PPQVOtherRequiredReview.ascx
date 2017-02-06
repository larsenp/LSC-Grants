<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>  Include Instructions.</p>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/PPQVApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
	
<div class='SeparatorHdg' width='100%'>
	Other Required Review
</div>
<br />	
<p><b>A. Claims against the Applicant and/or Conflicts of Interest</b></p>

<table  width='100%'>
     <tr>
        <td >1. Review the Conflicts, Complaints and Performance Evaluations form for a listing of claims made against the Applicant or any of its attorneys during the past thirty-six months. Does the Applicant list any claims?<%=kDenoteRequiredField %></td>
        <td >
			<span runat="server" id='spnrequisiteattachments' />
		</td>
     </tr>
     <tr><td>&nbsp;</td></tr>
     <tr>
		<td>2. Review the Conflicts, Complaints and Performance Evaluations form for a description of any actual or potential conflicts of interest. Does the Applicant disclose any actual or potential conflicts of interest? <%=kDenoteRequiredField %></b>
		</td>
		<td>
			<span runat="server" id='spnotherrequirements' />
		</td>
	</tr>
</table>

<p><b>B. Follow-up activity proposed for applicants with potential weaknesses or issues</b></p>

<p><i>Note: A Score of 55 or below suggests that there may be potential program weaknesses or issues, and that further review or an onsite assessment may be required. 
      A funding recommendation for an applicant with a score of 55 or below shall not be presented to the Executive Office until appropriate staff follow up is completed. 
      Additionally, follow up is required for Applicants with potential quality and/or performance issues even if the application score is greater than 55.</i></p>

<p>Check the appropriate box below to indicate the type of follow-up activity proposed for Applicants with potential weaknesses or issues.
 <u>If there are no potential weaknesses or issues that require follow up, check the last box.</u><%=kDenoteRequiredField %></p>
<span runat='server' id='spnChkIA' /> A On-Site Capabilities Assessment<br />
<br />
<span runat='server' id='spnChkIB' /> B LSC Staff formal communications with Applicant to obtain additional information or clarification<br />
<br />
<span runat='server' id='spnChkIC' /> C Application score is greater than 55 and further review is not required<br />
<br />
<br />
<b>Funding Term<%=kDenoteRequiredField %></b>&nbsp;&nbsp;
<span runat='server' id='spnFundingTerm' />
<br />
<br />
<p>The Grant Application evaluation and Funding term recommendation is based on a review of the documents contained in the grant
 file and identified in the "Competitive Grant Documents Reviewed" listing.</p>
<table width='100%'>
	<tr>
		<td><b>LSC Staff Reader<%=kDenoteRequiredField %></b></td>
		<td>
			<span runat='server' id='spnStaffReaderPersonID' />
		</td>
		<td>
			<b>Date<%=kDenoteRequiredField %></b> 
			<span runat='server' id='spnStaffReaderDate' />
		</td>
	</tr>
</table>
<br />
<br />
<table  width='100%'>
	<tr>
		<td><b>Evaluation Comments</b></td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnEvaluationComments' />
		</td>
	</tr>
</table>


<table width='100%'>
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan=3 align=center>
			<span runat="server" id='spnSave' />&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
		         <DisplayProperty PropertyKey='Claims'>
					<Control ID='rdorequisiteattachments'
						Type='cRadioButtonList'
						Container='spnrequisiteattachments'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Conflicts1'>
					<Control ID='rdootherrequirements'
						Type='cRadioButtonList'
						Container='spnotherrequirements'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFundingTermID'>
					<Control ID='ctlFundingTerm'
						Type='cDropDown'
						Container='spnFundingTerm'
						DataObjectDefinitionKey='LscFundingTerm'
						StoredValue='LscFundingTermID'
						DisplayValue='Description' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='EvaluationComments'>
					<Control ID='txtEvaluationComments'
						Type='cTextArea'
						Container='spnEvaluationComments'
						Rows='5'
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
				<DisplayProperty PropertyKey='ChkIA'>
					<Control ID='chkIA'
						Type='cCheckBox'
						Container='spnChkIA' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIB'>
					<Control ID='chkIB'
						Type='cCheckBox'
						Container='spnChkIB' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIC'>
					<Control ID='chkIC'
						Type='cCheckBox'
						Container='spnChkIC' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderPersonID'>
				 	<Control ID='ctlStaffReaderPersonID' 
						Type='cDropDown' 
						Container='spnStaffReaderPersonID'
						DisplayValue='LastNameFirstName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='EasylistReviewsReviewersView'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='1' />
						</Filters>
						<Sort>
							<Argument PropertyKey='LastNameFirstNameMiddleName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderDate'>
					<Control ID='ctlStaffReaderDate' 
						Type='cDateTextBox' 
						Container='spnStaffReaderDate'
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
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'
						Enter='False'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
        	
    </ModuleSection>
</span>        			