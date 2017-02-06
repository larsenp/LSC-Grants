<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<div class='SeparatorHdg' width='100%'>
	PART I. RECOMMENDED FURTHER REVIEW
</div>
<p>Note: Reviewers may recommend further review for a variety of reasons. Any application with a numerical rating of 
55 or below must have further review. </p>

<span runat='server' id='spnChkIA' /> A On-Site Capabilities Assessment<br />
<span runat='server' id='spnChkIB' /> B LSC Staff Follow-Up (through formal communications, but not an on-site assessment )<br /><br />

<div class='SeparatorHdg' width='100%'>
	PART II. RATIONALE FOR FURTHER REVIEW
</div>

<p>To view Section A and B (scores of 2.0 and below AND 4.0 and above), click <b>Score Report</b> below.</p>
<span runat='server' id='spnScoreReport' />
<p>C. Identify why further review is recommended using the list of reasons below. </p>
<p>Check all that apply</p>
<br />
<span runat='server' id='spnChkIIC1' /> 1) additional information or clarification from the applicant is required<br />
<span runat='server' id='spnChkIIC2' /> 2) proposed grant conditions<br />
<span runat='server' id='spnChkIIC3' /> 3) the proposal narrative does not show the applicant's capacity to implement the proposed service delivery model<br />
<span runat='server' id='spnChkIIC4' /> 4) the applicant's grant proposal is not responsive to the information requirements of the RFP<br />
<span runat='server' id='spnChkIIC5' /> 5) the grant proposal (and other materials reviewed) does not demonstrate the applicant's ability to respond to the legal needs of the client community<br />
<span runat='server' id='spnChkIIC6' /> 6) the grant proposal does not demonstrate the program's capacity to comply with the selection criteria of 45 C.F.R. 1634.9<br />
<span runat='server' id='spnChkIIC7' /> 7) the need for a closer examination of the capabilities of the applicant<br />
<span runat='server' id='spnChkIIC8' /> 8) the overall rating of the applicant's grant proposal is below average (55 or below)<br />
<span runat='server' id='spnChkIIC9' /> 9) possible violation of the LSC Act, LSC regulations<br />
<span runat='server' id='spnChkIIC10' /> 10) findings from disciplinary complaints<br />

<p>Use the comment box below to concisely explain the 'reasons for further review' checked above. </p>
<span runat='server' id='spnCommentIIC' /><br />
	
<span runat='server' id='spnChkIIC11' /> 11) other reasons for further review that at are not captured in items 1 through 10 above.<br />
<p>(Please provide a brief explanation in the comment below.) </p>
<span runat='server' id='spnCommentIIC11' /><br />

<div class='SeparatorHdg' width='100%'>
	PART III. PROPOSED FURTHER REVIEW ACTIVITIES
</div>
<p>Describe the proposed follow-up activities below. </p>
<span runat='server' id='spnCommentIII' />

<div class='SeparatorHdg' width='100%'>
	REVIEWER(S) AND OTHER PERSONNEL
</div>
<br />
<table width='100%'>
	<tr>
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
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscOA1' DataObjectDefinitionKey='LscOA1' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
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
						<Action PostBack='True' 
							Object='EventController'
							Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
							<Parameters>			
								<Argument Type='' TypeKey='' Value='Page=ScoreReport'/>
								<Argument Type='' TypeKey='' Value='PageFrame=Print'/>					
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC1'>
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
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChkIIC11'>
					<Control ID='chkIIC11'
						Type='cCheckBox'
						Container='spnChkIIC11' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderPerson.FirstNameLastName'>
					<Control ID='spnStaffReaderPersonID' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffReaderDate' Format='MM/dd/yyyy'>
					<Control ID='spnStaffReaderDate' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtPerson.FirstNameLastName'>
					<Control ID='spnOPPMgmtPersonID' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OPPMgmtDate' Format='MM/dd/yyyy'>
					<Control ID='spnOPPMgmtDate' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscOA1Html' DataObjectDefinitionKey='LscOA1Html' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscOA1' DataObjectPropertyKey='LscOA1ID' PropertyKey='LscOA1ID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommentIIC' HtmlEncode='False'>
					<Control ID='spnCommentIIC'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommentIIC11' HtmlEncode='False'>
					<Control ID='spnCommentIIC11'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CommentIII' HtmlEncode='False'>
					<Control ID='spnCommentIII'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>

