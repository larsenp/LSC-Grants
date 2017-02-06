<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.PageContent.cSelectPref_SubmittedContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>


<!-- USER MODIFIABLE CONTENT AREA -->
<br>    
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td>
			Thank you for your submission of preferences!  Shown below are the preferences that you submitted - in read-only mode.     
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Note:</b>&nbsp;&nbsp;For the purposes of creating an equal distribution of applications among reviewers, all applications listed 
			below are marked as "Able" and will be eligible for your review unless you indicate a conflict.  Every effort 
			will be made to assign you those applications for which you have select the "Qualified" option.
		</td>
	</tr> 
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span id='spnHelp' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="2" class="SeparatorHdg"><b>Preferences</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='90%'>
	<tr><td width=1%></td>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	 
		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Group='('/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='1' 
						Bool=''/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='2' 
						Bool='Or'/>
					<Argument Type='Data' 
						TypeKey='ReviewAssignmentTypeID' 
						PropertyKey='ReviewAssignmentTypeID' 
						Value='3' 
						Bool='Or'/>
				<Argument Group=')' Bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' 
					Value='' 
					Bool='And'/>				
			</Filters>
		</DataObject>	
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewCommittee' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>			
			</Filters>
		</DataObject>
	
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>	
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' />
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						NoRecordMessage='No reviewer tasks.'
						SeparatorWidth='2'
						MaxPerPage='25'
						ShowSubColumnHeaderRow='True'>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Applicant Name' />
	
						<DisplayProperty PropertyKey='' ColumnHeader='Project Summary' width='10%' NoWrap='True'>
							<Control ID='btnProjSum'
								Type='cLink'
								Caption='Project Summary'>
									<Action
										PostBack='True'
										Object='DataPresenter'
										Method='ViewProjectSummary'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue=''/>
											<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue=''/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
						
						<!-- <DisplayProperty PropertyKey='' ColumnHeader='Application'>
							<Control ID='btnView'
								Type='cButton'
								Image='view_pdf'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewAppPDF'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='EntityID='/>
											<Argument Type='DataObjectCollection'
												TypeKey='WfTaskAssignmentList'
												DataObjectPropertyKey='WfTask.WfTaskModule.ReportOutputDefinitionID'
												PropertyKey='DefinitionID'
												BaseValue=''/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty> -->
						
						<DisplayProperty PropertyKey='GranteeProjectInfo.ProjectTitle' ColumnHeader='Proposal Title' />
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~'>
						
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectInfo.ScienceClassification.Description' ColumnHeader='Primary Science' NoWrap='True'>
						
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestConflict.Description' HeaderAlign='Center' ColumnHeader='Options' NoWrap='True'>
							
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='ConflictType.Description' ColumnHeader='Conflict Type' />
							
						
						<!-- <DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WFTAID' /> -->
						
						<!-- <DisplayProperty PropertyKey='' ColumnHeader='Critque'>
							<Control ID='btnEditComment2'
								Container='spnEditComment2'
								Type='cButton'
								Image='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='PeerReviewCritique'/>
										<Argument Type='DataObjectRelated' TypeKey='WfTaskAssignmentReview.WfTaskAssignmentReviewID' AttributeName='WfTaskAssignmentReview.WfTaskAssignmentReviewID' BaseValue='WfTaskAssignmentReviewID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataObjectRelated' TypeKey='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' AttributeName='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID' BaseValue='AppWfTaskAssignmentID='/>
										
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>  -->
						
						<!-- <DisplayProperty PropertyKey='' NoWrap='True'  Width='200' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='WfTaskAssignment'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey='EasylistAction' Direction='Ascending'/>
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl'/>
										<Argument Type='Object' ObjectType='EventSource'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
										<Argument Value='ctlList'/>
										<Argument Value='ctlActions'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.FirstNameMiddleNameLastName' ColumnHeader='Reviewer'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty> -->
						
						
						<!-- <DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Review Task'/>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
									<RelatedProperty PropertyKey='WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome' ColumnHeader='Outcome'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
									<RelatedProperty PropertyKey='WfTaskOutcome'/>
								</Argument>
							</Sortable>
						</DisplayProperty> -->
						<!--
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatusAbbr' ColumnHeader='Status'/>
						-->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control Container='spnHelp' 
						ID='ctlHelp'
						Type='cLink'
						Caption='Click here to view Guidelines for Review.'>
						<Action
							PostBack='False'
							Target='_blank'
							URL='/Easygrants_v4_AHA_r1/Implementation/Modules/Application/Help/Guidelines Placeholder Page.pdf'> 
						</Action>		
					</Control>
				</DisplayProperty>
							
			</DisplayProperties>
		</DataObject>	
	
	
	</ModuleSection>
</span>


