<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br />
<div style='width:800px'>
	<table style="width:100%">
		<tr>
			<td colspan='2' class="SeparatorHdg">
				Letter of Intent to Apply
			</td>
		</tr>
		<tr>
			<td>
				<strong>Organization</strong>&nbsp;
				<span runat='server' id='spnOrganizationName'/>
			</td>
			<td>
				<strong>PBIF Number</strong>&nbsp;
				<span runat='server' id='spnLegacyGrantID'/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>Grant Term</strong>&nbsp;
				<span runat='server' id='spnGrantTermMonths'/>&nbsp;months
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<strong>Total Estimated Grant Request</strong>&nbsp;
				<span runat='server' id='spnLscPBIFBudgetTotal'/>
			</td>
			<td>
				<strong>Total Estimated Project Budget</strong>&nbsp;
				<span runat='server' id='spnLscPBIFBudgetByFundingTypeColumnA'/>
			</td>
		</tr>
		<tr>
			<td style='vertical-align:top'>
				<EasyGrants:cReportOutputLink id='ctlLOIPDF' runat='server'/>
			</td>
			<td>
				<span runat='server' id='spnPrimaryReviewPDF'/>
			</td>
		</tr>
	</table>
	<div style="width:100%" class="SeparatorHdg">
		Staff Review Scores
	</div>
	<span runat='server' id='spnPrimaryReviewScores'/>
	<br />
	<div style="width:100%" class="MinorSeparatorHdg">
		Staff Review Total Score
	</div>
	<strong>Total Score:</strong> <span runat='server' id='spnLOIScore'/>%
	<br /><br />
	(<strong>Total Score Guidelines</strong>: 0-50% Unlikely to be Invited; 51-100% Potential for Invitation)
	
	<div class="SeparatorHdg" style="width:100%">
		Management Recommendations
	</div>
	<br /><br />
	<strong>LOI Recommendation</strong>&nbsp;<span runat='server' id='spnWfTaskOutcomeID'/>
	<br /><br />
	<strong>Overall Comments</strong><br />
	<span runat='server' id='spnOverallComment'/>
	<br /><br />
	<strong>Name</strong>&nbsp;<span runat='server' id='spnStaffReaderPersonID'/>
	<br /><br />
	<strong>Date</strong>&nbsp;<span runat='server' id='spnDate'/>
	<br /><br />
	<div style="width:100%;text-align:center"
	<span runat='server' id='spnSave'/>&nbsp;&nbsp;<span runat='server' id='spnSaveContinue'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTALOI' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='WfTaskID' Value='123'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganizationName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.LegacyGrantID'>
					<Control ID='spnLegacyGrantID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPbifApp.GrantTermMonths'>
					<Control ID='spnGrantTermMonths'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlLOIPDF'
						Type='cReportOutputLink'
						DisplayText='~View LOI PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='WfTALOI'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='WfTALOI'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscPBIFBudget' DataObjectDefinitionKey='LscPBIFBudget' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey="WfTALOI" DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscPBIFBudgetTotal.BudgetTotal' Format='$#,0'>
					<Control ID='spnLscPBIFBudgetTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscPBIFBudgetByFundingTypeColumnA.FundingTypeTotal' Format='$#,0'>
					<Control ID='spnLscPBIFBudgetByFundingTypeColumnA'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='PrimaryReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='124' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='Person'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPrimaryReviewPDF'
						Type='cDataListCtl'
						Container='spnPrimaryReviewPDF'>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnPrimaryReviewPDF'
								Type='cButton'
								Caption='View Staff Review PDF'>
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
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader=' '/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPrimaryReviewScores'
						Type='cDataPresenterList'
						Container='spnPrimaryReviewScores'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/PBIF_LOIReview_OPP_Mgmt/PageSection/PrimaryReviewScores.ascx' >
						 
					</Control>
						
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscProBonoScoreByLoi' DataObjectDefinitionKey='LscProBonoScoreByLoi' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WeightedScore' Format='0'>
					<Control ID='spnLOIScore'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	    <DataObject Key='WfTAOPPMgmtReview' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='False'>
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
						DisplayValue='WfTaskOutcome' >
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='WfTAOPPMgmtReview' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID' />
							<Argument PropertyKey='WfTaskOutcome' Value='In Process' Operator='NotEqual' />
						</Filters>
					</Control>
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		  <DataObject Key='LscOA1' DataObjectDefinitionKey='LscOA1' Updatable='True' CreateNew='True'>
		    <Filters>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
		   </Filters>
		   <DefaultValues>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
		    </DefaultValues>
		    <DisplayProperties>
		       <DisplayProperty PropertyKey='StaffReaderPersonID'>
					<Control ID='ctlStaffReaderPersonID' 
						Type='cDropDown' 
						Container='spnStaffReaderPersonID'
						DataObjectDefinitionKey='ReviewCommitteeMember'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'>
						<Filters>
							<Argument PropertyKey='ReviewCommitteeID' Value='3' />
						</Filters>
					</Control>
			    </DisplayProperty>
			    <DisplayProperty PropertyKey='StaffReaderDate'>
					<Control ID='ctlStaffReaderDate' 
						Type='cDateTextBox' 
						Container='spnDate'
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

		<DataObject Key='LscPbifProgReview' DataObjectDefinitionKey='LscPbifProgReview' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type="ModuleUser" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='txtOverallComment'
						Type='cTextArea'
						Container='spnOverallComment'
						Rows='10'
						Cols='80'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Save and Continue'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
