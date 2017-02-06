<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<div class="SeparatorHdg" style="width:100%">
	Application Info
</div>
<table style="width:100%">
	<tr>
		<td>
			<b>Organization</b>
		</td>
		<td>
			<span runat='server' id='spnOrganizationName'/>
		</td>
		<td>
			<b>Grant Number</b>
		</td>
		<td>
			<span runat='server' id='spnLegacyGrantID'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Category</b>
		</td>
		<td>
			<span runat='server' id='spnProjectCategory'/>
		</td>
		<td>
			<b>Grant Term (months)</b>
		</td>
		<td>
			<span runat='server' id='spnGrantTermMonths'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Total Grant Request</b>
		</td>
		<td>
			<span runat='server' id='spnAmountRequested'/>
		</td>
		<td>
			<b>Total Project Budget</b>
		</td>
		<td>
			<span runat='server' id='spnBudgetTotal'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Due Diligence Flag</b>
		</td>
		<td>
			<span runat='server' id='spnDueDiligenceFlagYes'/><span runat='server' id='spnDueDiligenceFlagNo'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Executive Summary</b>
		</td>
	</tr>
	<tr>
		<td colspan='4'>
			<span runat='server' id='spnExecSummary'/>
		</td>
	</tr>
</table>
<table style="width:100%">
	<tr>
		<td>
			<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/><br />
			<span runat='server' id='spnBudgetUpload'/>
		</td>
		<td>
			<EasyGrants:cReportOutputLink id='ctlPrimaryReportLink' runat='server'/>
		</td>
		<td>
			<span runat='server' id='spnSecondaryReviewPDF'/>
		</td>
		<td>
			<EasyGrants:cReportOutputLink id='ctlOPPDirReportLink' runat='server'/>
		</td>
		<td>
			<EasyGrants:cReportOutputLink id='ctlVPReportLink' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnReturn'/>
		</td>
	</tr>
</table>
<br />
	
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AppWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='100' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscPBIFBudget.LscPBIFBudgetTotal.BudgetTotal' Format='$0,0'>
					<Control ID='spnBudgetTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View&nbsp;Application&nbsp;PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTaskAssignment'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTaskAssignment'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='BudgetUpload' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTaskAssignment' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='73'>
					<RelatedProperty PropertyKey='TaskUploadType'/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnBudgetUpload'
						Type='cButton'
						Container='spnBudgetUpload'
						Caption='View&nbsp;Application&nbsp;Budget'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
								<Parameters>
									<Argument Value='../../../Core/Controls/Base/pgUploadSrcReader.aspx'/>
									<Argument Type='DataObjectCollection'
										TypeKey='BudgetUpload'
										DataObjectPropertyKey='SubmittedFileID'
										BaseValue='SubmittedFileID='/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="GranteeProjectID" PropertyKey="GranteeProjectID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganizationName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'/>
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
								<Argument Value='ProBonoReviewPresident' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='EligibilityReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='103' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscProBonoEligibilityReview' DataObjectDefinitionKey='LscProBonoEligibilityReview' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey="EligibilityReviewWfTA" DataObjectPropertyKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectCategory'>
					<Control ID='spnProjectCategory'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscPbifApp' DataObjectDefinitionKey='LscPbifApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey="AppWfTaskAssignment" DataObjectPropertyKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantTermMonths'>
					<Control ID='spnGrantTermMonths'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AmountRequested' Format='$0,0'>
					<Control ID='spnAmountRequested'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExecSummary'>
					<Control ID='spnExecSummary'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscProBonoRiskAssessmentFlag' DataObjectDefinitionKey='LscProBonoRiskAssessmentFlag' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkDueDiligenceFlagYes'
						Type='cLink'
						Caption='Issue'
						Container='spnDueDiligenceFlagYes'>
						<Visible>
							<Argument PropertyKey='DueDiligenceFlag' Value='True' NullDataObject='False'/>
						</Visible>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
								<Parameters>
									<Argument Value='../../../Core/Controls/Base/pgReportOutputReader.aspx'/>
									<Argument Type='DataObjectCollection'
										TypeKey='LscProBonoRiskAssessmentFlag'
										DataObjectPropertyKey='WfTaskAssignmentID'
										PropertyKey='EntityID'
										BaseValue='EntityID='/>
									<Argument Type='DataObjectCollection'
										TypeKey='LscProBonoRiskAssessmentFlag'
										DataObjectPropertyKey='WfTaskAssignment.WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
										PropertyKey='DefinitionID'
										BaseValue='DefinitionID='/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkDueDiligenceFlagNo'
						Type='cLink'
						Caption='No Issue'
						Container='spnDueDiligenceFlagNo'>
						<Visible>
							<Argument PropertyKey='DueDiligenceFlag' Value='False' NullDataObject='False'/>
						</Visible>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
								<Parameters>
									<Argument Value='../../../Core/Controls/Base/pgReportOutputReader.aspx'/>
									<Argument Type='DataObjectCollection'
										TypeKey='LscProBonoRiskAssessmentFlag'
										DataObjectPropertyKey='WfTaskAssignmentID'
										PropertyKey='EntityID'
										BaseValue='EntityID='/>
									<Argument Type='DataObjectCollection'
										TypeKey='LscProBonoRiskAssessmentFlag'
										DataObjectPropertyKey='WfTaskAssignment.WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
										PropertyKey='DefinitionID'
										BaseValue='DefinitionID='/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='PrimaryReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='106' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPrimaryReportLink'
						Type='cReportOutputLink'
						DisplayText='~View&nbsp;Primary&nbsp;Review&nbsp;PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='PrimaryReviewWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='PrimaryReviewWfTA'
								DataObjectPropertyKey='WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SecondaryReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='107' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSecondaryReviewPDF'
						Type='cDataListCtl'
						Container='spnSecondaryReviewPDF'>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnSecondaryReviewPDF'
								Type='cButton'
								Caption='View&nbsp;Secondary&nbsp;Review&nbsp;PDF'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
										<Parameters>
											<Argument Value='../../../Core/Controls/Base/pgReportOutputReader.aspx'/>
											<Argument Type='DataObject'
												TypeKey='WfTaskAssignmentID'
												PropertyKey='EntityID'
												AttributeName='EntityID'
												BaseValue='EntityID='/>
											<Argument Type='DataObjectRelated'
												TypeKey='WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
												AttributeName='DefinitionID'
												PropertyKey='DefinitionID'
												BaseValue='DefinitionID='/>
										</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='OPPDirReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='111' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOPPDirReportLink'
						Type='cReportOutputLink'
						DisplayText='~View&nbsp;OPP&nbsp;Management&nbsp;PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='OPPDirReviewWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='OPPDirReviewWfTA'
								DataObjectPropertyKey='WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='VPReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='112' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlVPReportLink'
						Type='cReportOutputLink'
						DisplayText='~View&nbsp;Vice&nbsp;President&nbsp;PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='VPReviewWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='VPReviewWfTA'
								DataObjectPropertyKey='WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
