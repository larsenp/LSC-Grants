<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cAssignedApplication" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for Additional information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>General Instructions</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
Before beginning the review of the assigned applications, read the Reviewer Guidelines 
available on the Left Navigation.  Please note, once reviews are submitted, you will not be able to modify your review.   
<p>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Assigned Applications</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
Listed below are all of the applicants for whom you will be submitting scores and 
comments. To rate an applicant, click on the applicant's name. When you are finished 
entering your ratings for all applications, click the <b>Submit</b> button.
<p>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Applications for Review</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnSubmit' visible='true'/>
		</td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'><span runat='server' id='spnToDoListReviewer'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='UserTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskRoleID'  Value='9'/>
				<Argument Type='DataObjectCollection' TypeKey='UserTaskAssignment' DataObjectPropertyKey='WfTaskID' PropertyKey='WfTaskID'/>
				<Argument Type='DataObjectCollection' TypeKey='UserTaskAssignment' DataObjectPropertyKey='GranteeProject.WfProjectID' PropertyKey='WfProjectID'>
					<RelatedProperty PropertyKey='GranteeProject'/>
				</Argument>
				<!--
				<Argument Group='('/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskID' Value='6'  Bool=''/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskID' Value='9' Bool='Or' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskID' Value='5' Bool='Or' />
				<Argument Type='' TypeKey='' PropertyKey='WfTaskID' Value='10' Bool='Or' />
				<Argument Group=')' Bool=''/>-->
			</Filters>
			<Sort>
				<Argument PropertyKey='Name'>	
					<RelatedProperty PropertyKey='ReviewRatingName'/>
				</Argument>
			</Sort>	
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListReviewer'
						Container='spnToDoListReviewer'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						MaxPerPage='10'>
						<InstructionHtml>
							
						</InstructionHtml>
						<DisplayProperty PropertyKey='ReviewRatingName.Name' ColumnHeader='Rating'/>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Applicant'>
							<Parameters>
								<Argument Value='2' ValueKey='WfTaskStatusID' PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' />															
								<Argument Value='1' ValueKey='WfTaskStatusID' PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' DisplayValue='Control'>
									<Control 
										ID='ctlReferenceLink'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='PublicRating'/>
												<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
												<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL' BaseValue='ReturnURL='/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' ConfigurableHeader='True'/>
						<DisplayProperty PropertyKey='GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' ConfigurableHeader='True' />
						<DisplayProperty PropertyKey='' ColumnHeader='Conflict?'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Yes'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReviewerConflict'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
										
										<!--
										<Argument Type='DataObject' TypeKey='BudgetID' AttributeName='BudgetID' BaseValue='BudgetID='/>
										<Argument Type='DataObjectCollection' TypeKey='Budget' 
											DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataPresenter' TypeKey='BudgetID' 
											PropertyKey='BudgetID' BaseValue='BudgetID='/>
										-->
										
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						AutoSave='False'
						Type='cButton'
						Image='Submit'
						Confirmation='Submitting will submit all reviews.  You will not be able to edit any of the assigned applications after you have submitted.'>						
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SubmissionContent_Submit'/>
						<Visible>
						</Visible>						
				</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
