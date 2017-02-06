<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page.cSubmittedContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->



<table width='100%' cellpadding='2' cellspacing='0'>
	<tr>
		<td>
			Thank you for submitting your reviews to the National Fish and Wildlife Foundation.  Shown below is the list of proposals with your final scores for each.  Click <b>View Scores & Critiques</b> to view the scores and critiques of other reviewers, anonymously, who have submitted their reviews.  Click <b>View PDF</b> to view the PDF for the reviewed proposal.  You can click <b>View All Applications</b> in the left side navigation bar to view all of the applications being reviewed by all reviewers for this session.  
		</td>
	</tr>	
</table>
<br>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td class="SeparatorHdg"><b>Review</b></td>
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

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	 	
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
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						IsSaveOnSort='True'
						ShowSubColumnHeaderRow='False'>		
						<DisplayProperty PropertyKey='' ColumnHeader=' '  Width='10%'>
							<Control ID='btnView'
								Type='cButton'
								Container='spnViewApp'
								Caption='View PDF'
								Image='view_pdf'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewReviewerPDF'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='WfTaskAssignmentID='/>
										<Argument Type='DataObject' TypeKey='RevPDFDefinitionID' AttributeName='DefinitionID='/>
									</Parameters>
								</Action>
							</Control>											
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='10%'>	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'>
									<RelatedProperty PropertyKey='AppWfta.GranteeProject' />
								</Argument>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' Width='20%' ConfigurableHeader='True'>
							<Sortable>
									<Argument PropertyKey='GrantTitle'>	
										<RelatedProperty PropertyKey='AppWfta.GranteeProject'/>
									</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='10%'>
							<Sortable>
									<Argument PropertyKey='CommonOrganizationName'>	
										<RelatedProperty PropertyKey='AppWfta.GranteeProject.PrimaryOrganization'/>
									</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantName' ColumnHeader='Primary Contact' Width='14%'>
							<Sortable>	
								<Argument PropertyKey='ApplicantName'/>
							</Sortable>								
						</DisplayProperty>	
						<DisplayProperty PropertyKey='RevWfta.ReviewAssignmentType.Description' ColumnHeader='Reviewer Role' Width='10%'>
							<Sortable>
									<Argument PropertyKey='Description'>	
										<RelatedProperty PropertyKey='RevWfta.ReviewAssignmentType'/>
									</Argument>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='ReviewRating' ColumnHeader='Scores' Width='6%'>
							<Sortable PropertyKey='ReviewRating'/>									
						</DisplayProperty>							
						<DisplayProperty PropertyKey='' ColumnHeader=' ' HeaderAlign='Center' DataAlign='Center' Width='20%'>
							<Control ID='btnAddComment'
								Type='cButton' Caption='View Scores and Critiques'
								Image='Add'>
								<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
									<Parameters>										
										<Argument AttributeName='PageKey' Value='ViewOtherScoresCritiques'/>
										<Argument Type='DataObject' TypeKey='AppWftaID' AttributeName='AppWftaID' BaseValue='AppWftaID='/>										
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>														
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>