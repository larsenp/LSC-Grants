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
<td><EasyGrants:cReportOutputLink id='ctlApplicantReportLink1' runat='server'/></td>
</tr>
</table>

<span runat='server' id='spnReturn' />
<br /><br />
<div class='SeparatorHdg'>Comments from OPP Director Review</div>
<br />
<div class='MinorSeparatorHdg'>Review Summary</div>
<br />
<span runat='server' id='spnOverallCommentOther' />
<br />
<%--<div class='SeparatorHdg'>Comments from Vice President Review</div>
<br />
<div class='MinorSeparatorHdg'>Review Summary</div>
<br />
<span runat='server' id='spnOverallCommentOtherVP' />
<br />--%>
<div class='SeparatorHdg'>Funding Decision and Comments</div>
<br />
<table cellpadding='1'>
	<tr>
		<td>
			<b>Funding Decision</b>
		</td>
		<td>
			<span runat='server' id='spnWfTaskOutcomeID' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Funding Amount</b> 
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
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcomeID'>
					<Control ID='ctlWfTaskOutcomeID'
						Type='cDropDown'
						Container='spnWfTaskOutcomeID'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'>
						<Filters>
							<Argument PropertyKey='WfTaskID' Value='51' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='2'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='RevOPPDirWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='45' />
			</Filters>
		</DataObject>
		
		<DataObject Key='RevVPWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='46' />
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
								<Argument Value='TIGAppReview_O_R_WI_Pres' />
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


		<DataObject Key='LscTigReviewOpenRepWebImprOPPDir' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument PropertyKey='WfTaskID' Value='45'>
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOverallCommentOther'
						Type='cDataListCtl'
						Container='spnOverallCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='LscTigFundingRecommendation.Description' ColumnHeader='Funding Recommendation' />
						<DisplayProperty PropertyKey='RecommendedFundingAmount' ColumnHeader='Recommended Funding Amount' Format='$#,0'/>
						<DisplayProperty PropertyKey='OverallComment' ColumnHeader='Comment' >
							<Control ID='lblOverallComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImprVP' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument PropertyKey='WfTaskID' Value='46'>
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<%--<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOverallCommentOtherVP'
						Type='cDataListCtl'
						Container='spnOverallCommentOtherVP'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='LscTigFundingRecommendation.Description' ColumnHeader='Funding Recommendation' />
						<DisplayProperty PropertyKey='RecommendedFundingAmount' ColumnHeader='Recommended Funding Amount' Format='$#,0'/>
						<DisplayProperty PropertyKey='OverallComment' ColumnHeader='Comment' >
							<Control ID='lblOverallCommentVP'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink1'
						Type='cReportOutputLink'
						DisplayText='~View VP Review PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='RevVPWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='RevVPWfTA'
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
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='txtOverallComment'
						Type='cTextArea'
						Container='spnOverallComment'
						Rows='15'
						Cols='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendedFundingAmount'>
					<Control ID='txtRecommendedFundingAmount'
						Container='spnRecommendedFundingAmount'
						Type='cMoneyTextBox'
						AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='Recommended Funding Amount must be a whole number.'
					    RegExErrorMessage='Recommended Funding Amount is required.'
					    Size='10'
					    MaxLength='9'/>
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
				<DisplayProperty PropertyKey='DataEntryCompleted'>
					<Control ID='chkDataEntryCompleted'
						Type='cCheckBox'
						Container='spnDataEntryCompleted' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
