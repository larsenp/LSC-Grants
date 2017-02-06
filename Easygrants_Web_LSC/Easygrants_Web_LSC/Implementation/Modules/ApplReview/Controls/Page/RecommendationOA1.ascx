<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>
NOTE: This form should be used for single applicant service areas, where further review of the application is recommended. 
If no further review is recommended and the reviewer recommends full funding, complete the Final Recommendation Form (OA-2).
</p>

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	PART I. RECOMMENDED FURTHER REVIEW
</div>
<p>Note: Reviewers may recommend further review for a variety of reasons. Any application with a numerical rating of 
55 or below must have further review. </p>

<span runat='server' id='spnChkIA' /> A On-Site Capabilities Assessment<br />
<span runat='server' id='spnChkIB' /> B LSC Staff formal communications with Applicant to obtain additional information or clarification<br />
<br />

<div class='SeparatorHdg' width='100%'>
	PART II. RATIONALE FOR FURTHER REVIEW
</div>

<p>To view scores of 2.0 and below AND 4.0 and above, click <b>Score Report</b> below.</p>
<span runat='server' id='spnScoreReport' />
<p>Identify why further review is recommended.</p>
<br />
<%--<span runat='server' id='spnChkIIC1' /> 1) additional information or clarification from the applicant is required<br />
<span runat='server' id='spnChkIIC2' /> 2) proposed grant conditions<br />
<span runat='server' id='spnChkIIC3' /> 3) the proposal narrative does not show the applicant's capacity to implement the proposed service delivery model<br />
<span runat='server' id='spnChkIIC4' /> 4) the applicant's grant proposal is not responsive to the information requirements of the RFP<br />
<span runat='server' id='spnChkIIC5' /> 5) the grant proposal (and other materials reviewed) does not demonstrate the applicant's ability to respond to the legal needs of the client community<br />
<span runat='server' id='spnChkIIC6' /> 6) the grant proposal does not demonstrate the program's capacity to comply with the selection criteria of 45 C.F.R. 1634.9<br />
<span runat='server' id='spnChkIIC7' /> 7) the need for a closer examination of the capabilities of the applicant<br />
<span runat='server' id='spnChkIIC8' /> 8) the overall rating of the applicant's grant proposal is below average (55 or below)<br />
<span runat='server' id='spnChkIIC9' /> 9) possible violation of the LSC Act, LSC regulations, rules and requirements<br />
<span runat='server' id='spnChkIIC10' /> 10) findings from disciplinary complaints<br />
 --%>
<p>Use the comment box below to concisely explain the 'reasons for further review' and what further revisions was conducted.</p>
<span runat='server' id='spnCommentIIC' /><br />
<%--<asp:CustomValidator id='valCusIIC' 
	runat='server' 
	OnServerValidate='ValidateOA1PartII' 
	ErrorMessage='An item in Questions 1 - 10 has been selected.  Comment is required.' 
	Display="none"/>--%>
	
<%--<span runat='server' id='spnChkIIC11' /> 11) other reasons for further review that at are not captured in items 1 through 10 above.<br />
<p>(Please provide a brief explanation in the comment box below.) </p>
<span runat='server' id='spnCommentIIC11' /><br />
<asp:CustomValidator id='valCusIIC11'
	runat='server'
	OnServerValidate='ValidateOA1Question11'
	ErrorMessage='Question 11 has been selected. Comment is required.' 
	Display="none"/>
--%>

<%--<div class='SeparatorHdg' width='100%'>
	PART III. PROPOSED FURTHER REVIEW ACTIVITIES
</div>
<p>Describe the proposed follow-up activities below. </p>
<span runat='server' id='spnCommentIII' />

<div class='SeparatorHdg' width='100%'>
	REVIEWER(S) AND OTHER PERSONNEL
</div>--%>
<br />
<table width='100%'>
	<%--<tr>
		<td>
			<b>LSC Staff Reader</b>
		</td>
		<td>
			<span runat='server' id='spnStaffReaderPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnStaffReaderDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>OPP Management</b>
		</td>
		<td>
			<span runat='server' id='spnOPPMgmtPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnOPPMgmtDate' />
		</td>
	</tr>--%>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnScoreReport'
						Type='cButton'
						Container='spnScoreReport'
						Caption='Score Report'>
						<Action PostBack='False'
							URL='/Easygrants_Web_LSC/Implementation/Modules/ApplReview/ModuleContent.aspx?Config=ApplReviewModuleConfig&amp;amp;Page=ScoreReport&amp;amp;PageFrame=Print'
							Target='_blank'/>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='ChkIIC1'>
					<Control ID='chkIIC1'
						Type='cCheckBox'
						Container='spnChkIIC1' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC2'>
					<Control ID='chkIIC2'
						Type='cCheckBox'
						Container='spnChkIIC2' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC3'>
					<Control ID='chkIIC3'
						Type='cCheckBox'
						Container='spnChkIIC3' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC4'>
					<Control ID='chkIIC4'
						Type='cCheckBox'
						Container='spnChkIIC4' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC5'>
					<Control ID='chkIIC5'
						Type='cCheckBox'
						Container='spnChkIIC5' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC6'>
					<Control ID='chkIIC6'
						Type='cCheckBox'
						Container='spnChkIIC6' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC7'>
					<Control ID='chkIIC7'
						Type='cCheckBox'
						Container='spnChkIIC7' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC8'>
					<Control ID='chkIIC8'
						Type='cCheckBox'
						Container='spnChkIIC8' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC9'>
					<Control ID='chkIIC9'
						Type='cCheckBox'
						Container='spnChkIIC9' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC10'>
					<Control ID='chkIIC10'
						Type='cCheckBox'
						Container='spnChkIIC10' />
				</DisplayProperty> --%>
				<DisplayProperty PropertyKey='CommentIIC'>
					<Control ID='txtCommentIIC'
						Type='cTextArea'
						Container='spnCommentIIC'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='ChkIIC11'>
					<Control ID='chkIIC11'
						Type='cCheckBox'
						Container='spnChkIIC11' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommentIIC11'>
					<Control ID='txtCommentIIC11'
						Type='cTextArea'
						Container='spnCommentIIC11'
						Rows='5'
						Cols='80' >
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommentIII'>
					<Control ID='txtCommentIII'
						Type='cTextArea'
						Container='spnCommentIII'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderPersonID'>
					<Control ID='ctlStaffReaderPerson' 
						Type='cDropDown' 
						Container='spnStaffReaderPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='PersonReviewer'>
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
				<DisplayProperty PropertyKey='OPPMgmtPersonID'>
					<Control ID='ctlOPPMgmtPersonID' 
						Type='cDropDown' 
						Container='spnOPPMgmtPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='EntityID'
						DataObjectDefinitionKey='ContactCategoryMember'>
						<Filters>
							<Argument PropertyKey='ContactCategoryID' Value='1' />
							<Argument PropertyKey='EntityTypeID' Value='1' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtDate'>
					<Control ID='ctlOPPMgmtDate' 
						Type='cDateTextBox' 
						Container='spnOPPMgmtDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='OPP Management Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='OPP Management Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>--%>
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

