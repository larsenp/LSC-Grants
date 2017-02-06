<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>
TBD
</p>

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<%--<div class='SeparatorHdg' width='100%'>
	PART IV. SPECIAL GRANT CONDITIONS AND OTHER IDENTIFIED ISSUES
</div>--%>
<%--<p>A. Proposed special grant conditions should be identified and explained here. Click the buttons below to add or delete special grant conditions. </p>
<p><span runat='server' id='spnNoGrantConditions' /> No Grant Conditions to Add</p>
--%>
<%--<span runat='server' id='spnAdd' /><br />
<span runat='server' id='spnGrantConditions' />--%>

<p> The application was rated 2.0 or lower in the following specific RFP topics:</p>
<span runat='server' id='spnLowScores' /><br /><br />

<%--<p>C. Other issues identified during the grant proposal review process. Please list and provide an explanation of the identified issues below:</p>
<span runat='server' id='spnPart4Comment' /><br />
<span runat='server' id='spnNoOtherIssues' /> No issues<br /><br />
--%>
<div class='SeparatorHdg' width='100%'>
	 GRANT TERMS 
</div>
<p>If the staff Reviewer's Funding term recommendation is less than one year because of program performance, quality or compliance reasons, 
note the reasons for this restriction in the comment box below. </p>
<span runat='server' id='spnPart5Comment' /><br /><br />

<p>Please identitfy a grant term for this applicant from the drop down box (i.e. month-to-month; 3 months; 4 months; 1 year; 2 years or 3 years).</p>
Select Funding Term <span runat='server' id='spnLscFundingTermID' />

<%--<p>If there are any special grant conditions for this applicant that you want to include in its Grant Award Package, check Yes below.</p>
<span runat='server' id='spnSpecialGrantConditions' /> Yes--%>

<%--<p>Enter the special grant condition language that you want to include in its Grant Award Package.</p>
<span runat='server' id='spnSpecialGrantConditionLanguage' />--%>
<br /><br />
<table width='100%'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;
			<span runat='server' id='spnSaveContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='ReviewedWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCycleStage.LscReviewCycleStage.TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='WfTACompetitionYear' />
				</Argument>
				<Argument Group='(' Bool='And' />
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='4' Bool='Or'/>
				<Argument Group=')' Bool='' />
			</Filters>
		</DataObject>

		<DataObject Key='LscOA2' DataObjectDefinitionKey='LscOA2' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
				<%--<DisplayProperty PropertyKey='NoGrantConditions'>
					<Control ID='chkNoGrantConditions'
						Type='cCheckBox'
						Container='spnNoGrantConditions' />
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='GrantTermsAndConditionsEditor' />
								<Argument Value='GrantConditionID=0' />
								<Argument Type='DataObjectCollection' TypeKey='ReviewedWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' BaseValue='ReviewedWfTaskAssignmentID=' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey='Part4Comment'>
					<Control ID='txtPart4Comment'
						Type='cTextArea'
						Container='spnPart4Comment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='NoOtherIssues'>
					<Control ID='chkNoOtherIssues'
						Type='cCheckBox'
						Container='spnNoOtherIssues' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='Part5Comment'>
					<Control ID='txtPart5Comment'
						Type='cTextArea'
						Container='spnPart5Comment'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscFundingTermID'>
					<Control ID='ctlLscFundingTermID'
						Type='cDropDown'
						Container='spnLscFundingTermID'
						DataObjectDefinitionKey='LscFundingTerm'
						StoredValue='LscFundingTermID'
						DisplayValue='Description' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='SpecialGrantConditions'>
					<Control ID='chkSpecialGrantConditions'
						Type='cCheckBox'
						Container='spnSpecialGrantConditions' />
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey='SpecialGrantConditionLanguage'>
					<Control ID='txtSpecialGrantConditionLanguage'
						Type='cTextArea'
						Container='spnSpecialGrantConditionLanguage'
						Rows='5'
						Cols='80' />
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
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Caption='Save and Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Submission'/>
							</Parameters>							
						</Action>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'
						Enter='False'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<%--<DataObject Key='LscGrantCondition' DataObjectDefinitionKey='LscGrantCondition' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewedWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='ReviewedWfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGrantConditions'
						Type='cDataListCtl'
						Container='spnGrantConditions'
						SeparatorWidth='2'
						DataObjectDefinitionKey='LscGrantCondition'>
						<DisplayProperty PropertyKey='LscGrantConditionType.Description' ColumnHeader='Condition' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantTermsAndConditionsEditor'/>
										<Argument Type='DataObject' TypeKey='LscGrantConditionID' AttributeName='GrantConditionID' BaseValue='GrantConditionID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='LscGrantConditionID' AttributeName='LscGrantConditionID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>--%>
		
		<DataObject Key='LscReviewAssignmentInquiry' DataObjectDefinitionKey='LscReviewAssignmentInquiry' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
				<Argument PropertyKey='Value' Value='2.0' Operator='LessThanEqual' >
					<RelatedProperty PropertyKey='LscReviewInquiryScore' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlLowScores'
						Type='cDataListCtl'
						Container='spnLowScores'
						DataObjectDefinitionKey='LscReviewAssignmentInquiry'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer Name' />
						<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProject.WfProject.WfCompetition.CompetitionDisplayName' ColumnHeader='Service Area' />
						<DisplayProperty PropertyKey='LscReviewInquiryScore.Value' ColumnHeader='Score' />
						<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewInquiryView.InquiryFullSpec' ColumnHeader='Category' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

