<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ScoresAndDetailedCommentsList.ascx.vb" Inherits="Implementation.Modules.ReviewStage.Controls.Page.cScoresAndDetailedCommentsList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Controls -->
<br>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
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
<table id="Table2" border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td class="SeparatorHdg"><b>Review Assignments</b></td>
</tr>

</table>
<br>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<table id="Table4"  border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>	
	<tr>
		<td align='Center'>
			<span runat='server' id='spnSave_and_Continue'/>
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
						MaxPerPage='50'
						IsSaveOnSort='True'
						ShowSubColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='7%'>
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
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='8%'>
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
						<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.CompetitionDisplayName' ColumnHeader='Funding Opportunity' Width='20%'>
							<Sortable>
								<Argument PropertyKey='CompetitionDisplayName'>
									<RelatedProperty PropertyKey='GranteeProject.WfProject.WfCompetition'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact/PI' Width='10%'>
							<Sortable>	
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>								
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='15%'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevWfta.Rating.Name' ColumnHeader='Score' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Name'>
									<RelatedProperty PropertyKey='RevWfta.Rating'/>
								</Argument>
							</Sortable>									
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Scores and Comments' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='10%'>
							<Parameters>
								<Argument Value='' ValueKey='RevWfta.ReviewRatingID' Operator='Equal' DisplayValue='Control'>
									<Control ID='btnAddScore'
										Type='cButton'
										Image='Add'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='ScoresAndDetailedCommentsEditor'/>
												<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='RevWftaID' BaseValue='RevWftaID='/>
												<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='AppWftaID' BaseValue='AppWftaID='/>
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='' ValueKey='RevWfta.ReviewRatingID' Operator='NotEqual' DisplayValue='Control'>
									<Control ID='btnEditScore'
										Type='cButton'
										Image='Edit'>
										<Action
											 PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='ScoresAndDetailedCommentsEditor'/>
												<Argument Type='DataObject' TypeKey='RevWftaID' AttributeName='RevWftaID' BaseValue='RevWftaID='/>
												<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='AppWftaID' BaseValue='AppWftaID='/>
												<Argument Type='DataObjectRelated' TypeKey='RevWfta.ReviewRatingID' AttributeName='RevWfta.ReviewRatingID' BaseValue='RatingID='/>
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' Image='Continue' GoToNextPage='True' >
						</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>		
	</ModuleSection>
</span>