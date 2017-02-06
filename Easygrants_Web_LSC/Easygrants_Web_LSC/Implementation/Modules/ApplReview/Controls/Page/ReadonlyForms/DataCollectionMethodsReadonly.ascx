<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />


<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Legal Needs Assessment Data Collection Methods</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area 1, Criterion 1 - <i>Periodic comprehensive assessment and ongoing consideration of the most pressing legal needs</i></b> </td>
	</tr>
</table>
<br />
<div style='width:600' class='SeparatorHdg'>
	Instructions
</div>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
 <tr>
        <td colspan="4" >&nbsp;</td>
 </tr>
 <tr>
	<td><p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p>
	<p>Use the web form below to identify the method(s) used to obtain input from each constituency. Complete this form by selecting the appropriate choice. Each inquiry in the form must be answered before the form can be submitted. Click the save button below once the form is completed and return to the proposal narrative.</p></td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/>
    </td>
 </tr>
 <tr> <td >&nbsp;</td></tr>
 <tr>	
	<td><p><strong><u>Do not paste this form into the proposal narrative</u></strong>. Email questions pertaining to this form to the competition service desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a></p></td>
    <td >&nbsp;</td>
 </tr>  
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<div style='width:100%' class='SeparatorHdg'>
	Legal Needs Assessment Data Collection Methods
</div>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr >
        <td width='20%'><b>&nbsp;</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center"><b>Phone and/or in-person interviews</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center"><b>Surveys</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center"><b>Focus groups</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center"><b>Meetings</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center"><b>Other (Specify)</b></td>
    </tr>
    <tr>
		<td width='20%'>&nbsp;</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>&nbsp;</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>&nbsp;</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>&nbsp;</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%'>&nbsp;</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align='center'><span runat='server' id='spnOtherDataCollectionMethodsDesc' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
<!--</table>
<br />
<br />
<table width='900'> -->
	<tr>
		<td width='20%'><b>Low-income persons <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnLowIncomePersonInterview' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnLowIncomePersonSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnLowIncomePersonFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnLowIncomePersonMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnLowIncomePersonOther'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Community Organizations <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCommunityOrgInterviews' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCommunityOrgSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCommunityOrgFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCommunityOrgMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCommunityOrgOther'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Social Services Organizations <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnSocialServiceOrgInterviews' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnSocialServiceOrgSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnSocialServiceOrgFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnSocialServiceOrgMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnSocialServiceOrgOther'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Courts <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCourtsInterviews' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCourtsSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCourtsFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCourtsMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnCourtsOther'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Other legal services providers <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherProvidersInterviews' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherProvidersSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherProvidersFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherProvidersMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherProvidersOther'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Private Bar <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnPrivateBarInterviews' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnPrivateBarSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnPrivateBarFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnPrivateBarMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnPrivateBarOther'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Program Staff <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramStaffInterviews' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramStaffSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramStaffFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramStaffMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramStaffOther'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='20%'><b>Program Board <%=kDenoteRequiredField%></b></td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramBoardInterviews' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramBoardSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramBoardFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramBoardMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnProgramBoardOther'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Other (Specify) <%=kDenoteRequiredField%></b></td>
	</tr>
	<tr>
	    <td width='20%'><span runat='server' id='spnOtherAssessmentDesc' /></td>	
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherAssessmentInterview' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherAssessmentSurveys' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherAssessmentFocus' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherAssessmentMeetings' />
		</td>
		<td width='1%'>&nbsp;</td>
		<td width='13%' align="center">
			<span runat='server' id='spnOtherAssessmentMethods'  />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br />
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	      
	     <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='66' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject>
	         
	     <DataObject Key='LscDataCollectionMethods' DataObjectDefinitionKey='LscDataCollectionMethods' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
			     <DisplayProperty PropertyKey='LowIncomePersonInterDesc.Description'> 
					<Control ID='spnLowIncomePersonInterview'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='LowIncomePersonSurveysDesc.Description'> 
					<Control ID='spnLowIncomePersonSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='LowIncomePersonFocusDesc.Description'> 
					<Control ID='spnLowIncomePersonFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='LowIncomePersonMeetingsDesc.Description'> 
					<Control ID='spnLowIncomePersonMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='LowIncomePersonOtherDesc.Description'> 
					<Control ID='spnLowIncomePersonOther'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='CommunityOrgInterviewsDesc.Description'> 
					<Control ID='spnCommunityOrgInterviews'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='CommunityOrgSurveysDesc.Description'> 
					<Control ID='spnCommunityOrgSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='CommunityOrgFocusDesc.Description'> 
					<Control ID='spnCommunityOrgFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='CommunityOrgMeetingsDesc.Description'> 
					<Control ID='spnCommunityOrgMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='CommunityOrgOtherDesc.Description'> 
					<Control ID='spnCommunityOrgOther'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='SocialServiceOrgInterviewsDesc.Description'> 
					<Control ID='spnSocialServiceOrgInterviews'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='SocialServiceOrgSurveysDesc.Description'> 
					<Control ID='spnSocialServiceOrgSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='SocialServiceOrgFocusDesc.Description'> 
					<Control ID='spnSocialServiceOrgFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='SocialServiceOrgMeetingsDesc.Description'> 
					<Control ID='spnSocialServiceOrgMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='SocialServiceOrgOtherDesc.Description'> 
					<Control ID='spnSocialServiceOrgOther'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='CourtsInterviewsDesc.Description'> 
					<Control ID='spnCourtsInterviews'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='CourtsSurveysDesc.Description'> 
					<Control ID='spnCourtsSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='CourtsFocusDesc.Description'> 
					<Control ID='spnCourtsFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='CourtsMeetingsDesc.Description'> 
					<Control ID='spnCourtsMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='CourtsOtherDesc.Description'> 
					<Control ID='spnCourtsOther'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='OtherProvidersInterviewsDesc.Description'> 
					<Control ID='spnOtherProvidersInterviews'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherProvidersSurveysDesc.Description'> 
					<Control ID='spnOtherProvidersSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherProvidersFocusDesc.Description'> 
					<Control ID='spnOtherProvidersFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherProvidersMeetingsDesc.Description'> 
					<Control ID='spnOtherProvidersMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherProvidersOtherDesc.Description'> 
					<Control ID='spnOtherProvidersOther'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='PrivateBarInterviewsDesc.Description'> 
					<Control ID='spnPrivateBarInterviews'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='PrivateBarSurveysDesc.Description'> 
					<Control ID='spnPrivateBarSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='PrivateBarFocusDesc.Description'> 
					<Control ID='spnPrivateBarFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='PrivateBarMeetingsDesc.Description'> 
					<Control ID='spnPrivateBarMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='PrivateBarOtherDesc.Description'> 
					<Control ID='spnPrivateBarOther'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='ProgramStaffInterviewsDesc.Description'> 
					<Control ID='spnProgramStaffInterviews'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='ProgramStaffSurveysDesc.Description'> 
					<Control ID='spnProgramStaffSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='ProgramStaffFocusDesc.Description'> 
					<Control ID='spnProgramStaffFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='ProgramStaffMeetingsDesc.Description'> 
					<Control ID='spnProgramStaffMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='ProgramStaffOtherDesc.Description'> 
					<Control ID='spnProgramStaffOther'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			   
			    <DisplayProperty PropertyKey='ProgramBoardInterviewsDesc.Description'> 
					<Control ID='spnProgramBoardInterviews'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='ProgramBoardSurveysDesc.Description'> 
					<Control ID='spnProgramBoardSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='ProgramBoardFocusDesc.Description'> 
					<Control ID='spnProgramBoardFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='ProgramBoardMeetingsDesc.Description'> 
					<Control ID='spnProgramBoardMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='ProgramBoardOtherDesc.Description'> 
					<Control ID='spnProgramBoardOther'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='OtherAssessmentInterviewDesc.Description'> 
					<Control ID='spnOtherAssessmentInterview'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherAssessmentSurveysDesc.Description'> 
					<Control ID='spnOtherAssessmentSurveys'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherAssessmentFocusDesc.Description'> 
					<Control ID='spnOtherAssessmentFocus'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherAssessmentMeetingsDesc.Description'> 
					<Control ID='spnOtherAssessmentMeetings'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherAssessmentMethodsDesc.Description'> 
					<Control ID='spnOtherAssessmentMethods'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     
			     <DisplayProperty PropertyKey='OtherAssessmentDesc'> 
					<Control ID='spnOtherAssessmentDesc'
						Type='HtmlGenericControl' />
			     </DisplayProperty>
			     <DisplayProperty PropertyKey='OtherDataCollectionMethodDesc'> 
					<Control ID='spnOtherDataCollectionMethodsDesc'
						Type='HtmlGenericControl' />
			     </DisplayProperty>

			</DisplayProperties>
		</DataObject>
	
	
		
	
	</ModuleSection>
</span>