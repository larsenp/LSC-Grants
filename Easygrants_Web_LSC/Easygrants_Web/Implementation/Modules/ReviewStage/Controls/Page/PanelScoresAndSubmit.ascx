<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PanelScoresAndSubmit.ascx.vb" Inherits="Implementation.Modules.ReviewStage.Controls.Page.cPanelScoresAndSubmitImpl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Controls -->
<br>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td class="SeparatorHdg"><b>Instructions</b></td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td><span id='spnPageContent' runat='server' /></td>
</tr>
</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td class="SeparatorHdg"><b>Review Assignments (No Conflicts)</b></td>
</tr>

</table>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />
		<DataObject Key='ExternalReviewApplicationsList' DataObjectDefinitionKey='ExternalReviewApplicationsList'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='ReviewerID' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='RevWfTaskID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='ApplicantName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ExternalReviewApplicationsList'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						IsSaveOnSort='True'
						ShowSubColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='10%'>	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID' />
							</Sortable>
							<Control ID='ctlLinkGrantID' Type='cLink' >
								<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='ViewParticipantSummary'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ParticipantSummary'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader=' ' Width='7%'>
							<Control ID='btnView'
								Type='cButton'
								Caption='View PDF'
								Image='view_pdf'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewPDF'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='WfTaskAssignmentID='/>
									</Parameters>
								</Action>
							</Control>										
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader=' ' Width='8%'>
							<Control ID='btnViewScores'
								Type='cButton'
								Image='View Preliminary Scores and Comments'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='RedirectToModule'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PreviousStageScoresAndDetailedComments'/>
										<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='AppWftaID' BaseValue='AppWftaID='/>										
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>										
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName' ColumnHeader='Funding Opportunity' Width='20%'>
							<Sortable>
								<Argument PropertyKey='CompetitionDisplayName'>
									<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact/PI' Width='18%'>
							<Sortable>	
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>								
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='17%'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Reviewer Role' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
								</Argument>
							</Sortable>									
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewRating' ColumnHeader='Score' HeaderAlign='Center' DataAlign='Center' Width='5%'>
							<Parameters>
								<Argument Value='2' ValueKey='RevWfTaskStatusID' Operator='Equal' DisplayValue='' PropertyKey='ReviewRating'/>
								<Argument Value='1' ValueKey='RevWfTaskStatusID' Operator='Equal' DisplayValue='Control' PropertyKey='ReviewRating'>
									<Control ID='ctlRating'
										Type='cTextBox'
										Size='3'
										MaxLength='3'
										RequiredField='True'
										ErrorMessage='Score is required.'>
										<Validation Type='RegularExpression'
											ValidationExpression='^([12345]{1})|(([12345]{1}).[0-9])$'
											ErrorMessage='Score is a whole number between 1-5.' />
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader=' ' HeaderAlign='Center' DataAlign='Center' Width='5%'>
							<Parameters>
								<Argument Value='1' ValueKey='RevWfTaskStatusID' Operator='Equal' DisplayValue='Control'>
									<Control ID='btnSubmit'
										Type='cButton'
										Image='Submit'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='SubmitOneReviewTaskAssignment'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='RevWftaID' BaseValue=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>