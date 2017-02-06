<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %><Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />

<div class='SeparatorHdg'>Application</div>	
<table cellpadding='1' width='600px'>
	<tr>
		<td>
			<b>Applicant</b>&nbsp;
			<span runat='server' id='spnApplicant' /> (<span runat='server' id='spnRNO' />)
		</td>
		<td>
			<b>TIG</b>&nbsp;
			<span runat='server' id='spnTIG' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Category</b>&nbsp;
			<span runat='server' id='spnTigGrantType' />
		</td>
		<td>
			<b>Grant Term</b>&nbsp;
			<span runat='server' id='spnGrantTermMonths' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Total Grant Request</b>&nbsp;
			<span runat='server' id='spnGrantRequest' />
		</td>
		<td>
			<b>Total Project Budget</b>&nbsp;
			<span runat='server' id='spnProjectBudget' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<b>Brief Description of Proposed Project</b><br />
			<span runat='server' id='spnBriefDescription' />
		</td>
	</tr>
</table>
<table>
  <tr>
    <td><EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><EasyGrants:cReportOutputLink id='ctlStaffReviewLink' runat='server'/></td>
  </tr>
</table>
<span runat='server' id='spnReturn' />
<br /><br />
<div class='SeparatorHdg'>Comments from Stage 1 Reviewers</div>
<br />
<div class='MinorSeparatorHdg'>Budget</div>
<br />
<span runat='server' id='spnBudgetComments' />
<br />
<div class='MinorSeparatorHdg'>Contracts</div>
<br />
<span runat='server' id='spnContractsComments' />
<br />
<div class='MinorSeparatorHdg'>Project Narrative - Need for the Project</div>
<br />
<span runat='server' id='spnPNNeedComment' />
<br />
<div class='MinorSeparatorHdg'>Project Narrative - Goals and Objectives</div>
<br />
<span runat='server' id='spnPNGoalsComment' />
<br />
<div class='MinorSeparatorHdg'>Project Narrative - Justice Community Partnerships</div>
<br />
<span runat='server' id='spnPNJustPartComment' />
<br />
<div class='MinorSeparatorHdg'>Project Narrative - Replication</div>
<br />
<span runat='server' id='spnPNProjRepComment' />
<br />
<div class='MinorSeparatorHdg'>Project Narrative - Program Capacity and Project Staffing</div>
<br />
<span runat='server' id='spnPNCapStaffComment' />
<br />
<div class='MinorSeparatorHdg'>Project Narrative - Past Performance</div>
<br />
<span runat='server' id='spnPNPastPerformanceComment' />
<br />
<div class='MinorSeparatorHdg'>Project Narrative - Sustainability</div>
<br />
<span runat='server' id='spnPNSustainabilityComment' />
<br />
<div class='MinorSeparatorHdg'>Project Narrative - Overall</div>
<br />
<span runat='server' id='spnPNOverallComment' />
<br />
<div class='MinorSeparatorHdg'>Uploaded Files</div>
<br />
<span runat='server' id='spnUploadedFilesComment' />
<br />
<%--<div class='MinorSeparatorHdg'>Prior TIG Awards</div>
<br />
<span runat='server' id='spnPriorTigGrantsComment' />
<br />--%>
<div class='MinorSeparatorHdg'>Other Projects</div>
<br />
<span runat='server' id='spnOtherProjectsComment' />
<br />
<div class='MinorSeparatorHdg'>Proposed Payment Schedule</div>
<br />
<span runat='server' id='spnProposedPaymentScheduleComment' />
<br />
<div class='MinorSeparatorHdg'>Statement of Additional Funds</div>
<br />
<span runat='server' id='spnStmtAdditionalFundsComment' />
<br />
<div class='MinorSeparatorHdg'>Review Summary</div>
<br />
<span runat='server' id='spnOverallCommentOther' />
<br />
<div class='SeparatorHdg'>Your Recommendations</div>
<br />
<table cellpadding='1'>
	<tr>
		<td>
			<b>Funding Recommendation</b>
		</td>
		<td>
			<span runat='server' id='spnLscTigFundingRecommendationID' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Recommended Funding Amount</b> 
		</td>
		<td>
			<span runat='server' id='spnRecommendedFundingAmount' />
		</td>
	</tr>
</table>
 <br />

<b>Overall Comments</b><br />
<span runat='server' id='spnOverallComment' />
<br /><br />
<p><span runat='server' id='spnDataEntryCompleted' /><b>  Completed Data Entry</b></p>
<br />
<br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual' />
			</Filters>
		</DataObject>
		
		<DataObject Key='RevStage1WfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='43' />
			</Filters>
		</DataObject>

		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantRequest' Format='$#,0'>
					<Control ID='spnGrantRequest'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantTermMonths'>
					<Control ID='spnGrantTermMonths'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectBudget' Format='$#,0'>
					<Control ID='spnProjectBudget'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='BriefDescription'>
					<Control ID='spnBriefDescription'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Application PDF~'>
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
								<Argument Value='TIGAppReview_O_R_WI_OPPDir' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscTigGrantType.Description'>
					<Control ID='spnTigGrantType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.OrganizationName'>
					<Control ID='spnApplicant'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnRNO'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		<DataObject Key='LscTigReviewOpenRepWebImprStage1' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument PropertyKey='WfTaskID' Value='43'>
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='ReviewAssignmentTypeID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='WfTaskAssignment.Person' />
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='WfTaskAssignment.Person' />
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlBudgetComments'
						Type='cDataListCtl'
						Container='spnBudgetComments'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='BudgetComment' ColumnHeader='Comment' >
							<Control ID='lblBudgetComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlContractsComments'
						Type='cDataListCtl'
						Container='spnContractsComments'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='ContractsComment' ColumnHeader='Comment' >
							<Control ID='lblContractsComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNNeedComment'
						Type='cDataListCtl'
						Container='spnPNNeedComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PNNeedComment' ColumnHeader='Comment' >
							<Control ID='lblPNNeedComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNGoalsComment'
						Type='cDataListCtl'
						Container='spnPNGoalsComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PNGoalsComment' ColumnHeader='Comment' >
							<Control ID='lblPNGoalsComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNJustPartComment'
						Type='cDataListCtl'
						Container='spnPNJustPartComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PNJustPartComment' ColumnHeader='Comment' >
							<Control ID='lblPNJustPartComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNProjRepComment'
						Type='cDataListCtl'
						Container='spnPNProjRepComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PNProjRepComment' ColumnHeader='Comment' >
							<Control ID='lblPNProjRepComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNCapStaffComment'
						Type='cDataListCtl'
						Container='spnPNCapStaffComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PNCapStaffComment' ColumnHeader='Comment' >
							<Control ID='lblPNCapStaffComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNPastPerformanceComment'
						Type='cDataListCtl'
						Container='spnPNPastPerformanceComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PNPastPerformanceComment' ColumnHeader='Comment' >
							<Control ID='lblPNPastPerformanceComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNSustainabilityComment'
						Type='cDataListCtl'
						Container='spnPNSustainabilityComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PNSustainabilityComment' ColumnHeader='Comment' >
							<Control ID='lblPNSustainabilityComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPNOverallComment'
						Type='cDataListCtl'
						Container='spnPNOverallComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PNOverallComment' ColumnHeader='Comment' >
							<Control ID='lblPNOverallComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlUploadedFilesComment'
						Type='cDataListCtl'
						Container='spnUploadedFilesComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='UploadedFilesComment' ColumnHeader='Comment' >
							<Control ID='lblUploadedFilesComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPriorTigGrantsComment'
						Type='cDataListCtl'
						Container='spnPriorTigGrantsComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='PriorTigGrantsComment' ColumnHeader='Comment' >
							<Control ID='lblPriorTigGrantsComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOtherProjectsComment'
						Type='cDataListCtl'
						Container='spnOtherProjectsComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='OtherProjectsComment' ColumnHeader='Comment' >
							<Control ID='lblOtherProjectsComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlProposedPaymentScheduleComment'
						Type='cDataListCtl'
						Container='spnProposedPaymentScheduleComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='ProposedPaymentScheduleComment' ColumnHeader='Comment' >
							<Control ID='lblProposedPaymentScheduleComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlStmtAdditionalFundsComment'
						Type='cDataListCtl'
						Container='spnStmtAdditionalFundsComment'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='StmtAdditionalFundsComment' ColumnHeader='Comment' >
							<Control ID='lblStmtAdditionalFundsComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOverallCommentOther'
						Type='cDataListCtl'
						Container='spnOverallCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='LscTigFundingRecommendation.Description' ColumnHeader='Funding Recommendation' />
						<DisplayProperty PropertyKey='RecommendedFundingAmount' ColumnHeader='Recommended Funding Amount' Format='$#,0'/>
						<DisplayProperty PropertyKey='WfTaskAssignment.ReviewAssignmentType.Description' ColumnHeader='Assignment Type'/>
						<DisplayProperty PropertyKey='OverallComment' ColumnHeader='Comment' >
							<Control ID='lblOverallComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewWfta' DataObjectDefinitionKey='WfTaskAssignment' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='RevStage1WfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
					<Control ID='ctlStaffReviewLink'
						Type='cReportOutputLink'
						DisplayText='~View Staff Review PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='RevStage1WfTA'
								DataObjectPropertyKey='GranteeProjectID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='RevStage1WfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		
		<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscTigFundingRecommendationID'>
					<Control ID='ctlLscTigFundingRecommendationID'
						Type='cDropDown'
						Container='spnLscTigFundingRecommendationID'
						DataObjectDefinitionKey='LscTigFundingRecommendation'
						StoredValue='LscTigFundingRecommendationID'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='txtOverallComment'
						Type='cTextArea'
						Container='spnOverallComment'
						Rows='5'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendedFundingAmount'>
					<Control ID='txtRecommendedFundingAmount'
						Container='spnRecommendedFundingAmount'
						Type='cMoneyTextBox'
						AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='Recommended Funding Amount must be a whole number.'
					    RegExErrorMessage='Recommended Funding Amount must be a whole number with no decimal points, dollar signs, or other non-numeric characters.'
					    Size='10'
					    MaxLength='9'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataEntryCompleted'>
					<Control ID='chkDataEntryCompleted'
						Type='cCheckBox'
						Container='spnDataEntryCompleted' />
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
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
