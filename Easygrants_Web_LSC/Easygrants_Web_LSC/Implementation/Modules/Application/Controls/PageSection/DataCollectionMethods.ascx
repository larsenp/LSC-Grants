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
	<td>
		<p>Use the RFP Chart to identify the method(s) used to obtain input from each constituency. </p>
		<p style="color:red">For those applying to multiple service areas: This RFP Chart is <i>not</i> linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
		<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return.</p>
		<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>
	</td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/>
    </td>
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
		<td width='13%'><span runat='server' id='spnOtherDataCollectionMethodsDesc' /></td>
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
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveCloseStd' />
			<span runat='server' id='spnSaveClosePPQV' />
		</td>
	</tr>
</table>







<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    	         
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
			 <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToCriterion'
						Type='cLabel'
						Container='spnReturnToCriterion'
						LabelText='Save and Return to Criterion Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToPA'
						Type='cLabel'
						Container='spnReturnToPA'
						LabelText='Save and Return to Performance Area Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveCloseStd'
						Type='cButton'
						Container='spnSaveCloseStd'
						Caption='Save and Return to Criterion Page'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="AppFormByCriterion"/>
								<Argument Type='QueryString' TypeKey='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClosePPQV'
						Type='cButton'
						Container='spnSaveClosePPQV'
						Caption='Save and Return to Performance Area Page'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="PostPQVPA1"/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	     <DataObject Key='LscDataCollectionMethods' DataObjectDefinitionKey='LscDataCollectionMethods' Updatable='True' CreateNew='True' >
			 <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='LowIncomePersonInterview'> 
					<Control ID='ctlLowIncomePersonInterview'
						Container='spnLowIncomePersonInterview'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
						<%--<Parameters>
						     <Argument Type ='Data' PropertyKey='LscYesNoNAID' Value='3'  >
						</Parameters>--%>
						<Sort> 
						    <Argument PropertyKey='SortOrder'/> 
						</Sort> 
					</Control> 
			    </DisplayProperty>
			     <DisplayProperty PropertyKey='LowIncomePersonSurveys'> 
					<Control ID='ctlLowIncomePersonSurveys'
						Container='spnLowIncomePersonSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			     <DisplayProperty PropertyKey='LowIncomePersonFocus'> 
					<Control ID='ctlLowIncomePersonFocus'
						Container='spnLowIncomePersonFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			     <DisplayProperty PropertyKey='LowIncomePersonMeetings'> 
					<Control ID='ctlLowIncomePersonMeetings'
						Container='spnLowIncomePersonMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='LowIncomePersonOther'> 
					<Control ID='ctlLowIncomePersonOther'
						Container='spnLowIncomePersonOther'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    
			    <DisplayProperty PropertyKey='CommunityOrgInterviews'> 
					<Control ID='ctlCommunityOrgInterviews'
						Container='spnCommunityOrgInterviews'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='CommunityOrgSurveys'> 
					<Control ID='ctlCommunityOrgSurveys'
						Container='spnCommunityOrgSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='CommunityOrgFocus'> 
					<Control ID='ctlCommunityOrgFocus'
						Container='spnCommunityOrgFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='CommunityOrgMeetings'> 
					<Control ID='ctlCommunityOrgMeetings'
						Container='spnCommunityOrgMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='CommunityOrgOther'> 
					<Control ID='ctlCommunityOrgOther'
						Container='spnCommunityOrgOther'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    
			    <DisplayProperty PropertyKey='SocialServiceOrgInterviews'> 
					<Control ID='ctlSocialServiceOrgInterviews'
						Container='spnSocialServiceOrgInterviews'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='SocialServiceOrgSurveys'> 
					<Control ID='ctlSocialServiceOrgSurveys'
						Container='spnSocialServiceOrgSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='SocialServiceOrgFocus'> 
					<Control ID='ctlSocialServiceOrgFocus'
						Container='spnSocialServiceOrgFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='SocialServiceOrgMeetings'> 
					<Control ID='ctlSocialServiceOrgMeetings'
						Container='spnSocialServiceOrgMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='SocialServiceOrgOther'> 
					<Control ID='ctlSocialServiceOrgOther'
						Container='spnSocialServiceOrgOther'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    
			     <DisplayProperty PropertyKey='CourtsInterviews'> 
					<Control ID='ctlCourtsInterviews'
						Container='spnCourtsInterviews'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='CourtsSurveys'> 
					<Control ID='ctlCourtsSurveys'
						Container='spnCourtsSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='CourtsFocus'> 
					<Control ID='ctlCourtsFocus'
						Container='spnCourtsFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='CourtsMeetings'> 
					<Control ID='ctlCourtsMeetings'
						Container='spnCourtsMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='CourtsOther'> 
					<Control ID='ctlCourtsOther'
						Container='spnCourtsOther'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    
			    
			     <DisplayProperty PropertyKey='OtherProvidersInterviews'> 
					<Control ID='ctlOtherProvidersInterviews'
						Container='spnOtherProvidersInterviews'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='OtherProvidersSurveys'> 
					<Control ID='ctlOtherProvidersSurveys'
						Container='spnOtherProvidersSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='OtherProvidersFocus'> 
					<Control ID='ctlOtherProvidersFocus'
						Container='spnOtherProvidersFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='OtherProvidersMeetings'> 
					<Control ID='ctlOtherProvidersMeetings'
						Container='spnOtherProvidersMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='OtherProvidersOther'> 
					<Control ID='ctlOtherProvidersOther'
						Container='spnOtherProvidersOther'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    
			    
			    <DisplayProperty PropertyKey='PrivateBarInterviews'> 
					<Control ID='ctlPrivateBarInterviews'
						Container='spnPrivateBarInterviews'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='PrivateBarSurveys'> 
					<Control ID='ctlPrivateBarSurveys'
						Container='spnPrivateBarSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='PrivateBarFocus'> 
					<Control ID='ctlPrivateBarFocus'
						Container='spnPrivateBarFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='PrivateBarMeetings'> 
					<Control ID='ctlPrivateBarMeetings'
						Container='spnPrivateBarMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='PrivateBarOther'> 
					<Control ID='ctlPrivateBarOther'
						Container='spnPrivateBarOther'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    
			     <DisplayProperty PropertyKey='ProgramStaffInterviews'> 
					<Control ID='ctlProgramStaffInterviews'
						Container='spnProgramStaffInterviews'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='ProgramStaffSurveys'> 
					<Control ID='ctlProgramStaffSurveys'
						Container='spnProgramStaffSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='ProgramStaffFocus'> 
					<Control ID='ctlProgramStaffFocus'
						Container='spnProgramStaffFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='ProgramStaffMeetings'> 
					<Control ID='ctlProgramStaffMeetings'
						Container='spnProgramStaffMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='ProgramStaffOther'> 
					<Control ID='ctlProgramStaffOther'
						Container='spnProgramStaffOther'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    
			     <DisplayProperty PropertyKey='ProgramBoardInterviews'> 
					<Control ID='ctlProgramBoardInterviews'
						Container='spnProgramBoardInterviews'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='ProgramBoardSurveys'> 
					<Control ID='ctlProgramBoardSurveys'
						Container='spnProgramBoardSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='ProgramBoardFocus'> 
					<Control ID='ctlProgramBoardFocus'
						Container='spnProgramBoardFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='ProgramBoardMeetings'> 
					<Control ID='ctlProgramBoardMeetings'
						Container='spnProgramBoardMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='ProgramBoardOther'> 
					<Control ID='ctlProgramBoardOther'
						Container='spnProgramBoardOther'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    
			     <DisplayProperty PropertyKey='OtherAssessmentInterview'> 
					<Control ID='ctlOtherAssessmentInterview'
						Container='spnOtherAssessmentInterview'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='OtherAssessmentSurveys'> 
					<Control ID='ctlOtherAssessmentSurveys'
						Container='spnOtherAssessmentSurveys'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='OtherAssessmentFocus'> 
					<Control ID='ctlOtherAssessmentFocus'
						Container='spnOtherAssessmentFocus'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='OtherAssessmentMeetings'> 
					<Control ID='ctlOtherAssessmentMeetings'
						Container='spnOtherAssessmentMeetings'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			      <DisplayProperty PropertyKey='OtherAssessmentMethods'> 
					<Control ID='ctlOtherAssessmentMethods'
						Container='spnOtherAssessmentMethods'
						Type='cDropDown'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayText='Select'
						DisplayValue='Abbr'> 
					</Control> 
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='OtherAssessmentDesc'>
					<Control ID='txtOtherAssessmentDesc'
						Type='cTextBox'
						Container='spnOtherAssessmentDesc'
						MaxLength='50'
						Size='30' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='OtherDataCollectionMethodDesc'>
					<Control ID='txtOtherDataCollectionMethodsDesc'
						Type='cTextBox'
						Container='spnOtherDataCollectionMethodsDesc'
						MaxLength='60'
						Size='20' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>
	
	
	</ModuleSection>
</span>