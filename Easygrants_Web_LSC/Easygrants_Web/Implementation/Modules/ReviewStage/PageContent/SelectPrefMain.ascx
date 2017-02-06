<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ReviewStage.PageContent.cSelectPrefMain" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
				
<asp:CustomValidator 
				id='valConflictType'
				runat='server'
				OnServerValidate='ValidateConflictType'
				ErrorMessage=''
				Display='None'/>
				
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- "Content Manager" tags -->    
<br>
     <span id='spnPageContent' runat='server' />
<p>

<!-- Control Label (for Publication upload) -->

<span id='spnHelp' runat='server'/>

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

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>
	<tr>
		<td>
			<span runat='server' id='spnSave' />
		</td>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnClose' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnSubmit' />
		</td>
	</tr>
</table>

<span id='spnEditComment' runat='server' visible='false'/><span id='spnEditComment2' runat='server' visible='false'/>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
      <PageContent />

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
	
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID' Bool=''/>	
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' Bool='And' />
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value='' Bool='And' />
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
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName' ColumnHeader='Applicant Name' NoWrap='true' Width='15%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
								<Argument PropertyKey='MiddleName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						
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
						
						<DisplayProperty PropertyKey='GranteeProjectInfo.ProjectTitle' ColumnHeader='Proposal Title' NoWrap='true' />
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='~~Organization~~'>
						<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectInfo.ScienceClassification.Description' ColumnHeader='Primary Science' NoWrap='True'>
						<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GranteeProjectInfo.ScienceClassification'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewPreferenceTypeID' HeaderAlign='Center' SubColumnHeader='Request | None | Conflict' ColumnHeader='Options' NoWrap='True'>
							<Control ID='ctlOptions'
								Type='cRadioButtonList'
								LoadParam='True'
								RepeatDirection='Horizontal'
								RepeatColumns='0'
								RequiredField='True'
								ErrorMessage='Rating is required.'>
								<Parameters>
									<Parameter StoredValue='1' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
									<Parameter StoredValue='2' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
									<Parameter StoredValue='3' DisplayValue='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'/>
								</Parameters>
							</Control>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='ReviewConflictTypeID' ColumnHeader='Conflict Type'>
							<Control ID='ctlConflictType'
								Type='cDropDown'
								DataObjectDefinitionKey='ConflictType'
								StoredValue='ConflictTypeID'
								DisplayValue='Description'>
								<Sort>
									<Argument PropertyKey='Description' />
								</Sort>
							</Control>
						</DisplayProperty>
						
						
						
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Home' />
								<Argument Value='HomeModuleConfig' />
								<Argument Value='Home' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes to your Preferences.'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='Submit'>
							<Parameters>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>							
			</DisplayProperties>
		</DataObject>
	
	
	</ModuleSection>
</span>


