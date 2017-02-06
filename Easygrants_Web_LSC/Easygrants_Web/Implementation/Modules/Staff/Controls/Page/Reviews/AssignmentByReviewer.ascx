<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="AssignmentByReviewer.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cAssignmentByReviewer" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStagePages.ascx'
	runat='server'/>
<br>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ByReviewer' LinkTitle='Assignments By Reviewer' runat='server'/>
<br><br>
<Core:cUserCtlLoader CtlID='ReviewStageInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewStageInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Review Assignments by Reviewer</b></td>
	</tr>	
	<%--<tr>
		<td colspan='4'>
			This page lists all review assignments by reviewer. Click <b>Add</b> to manually add an
			assignment for a reviewer. Click <b>Delete</b> to remove an assignment from a reviewer.
			To change an Assignment Type, select primary or secondary from the dropdown list.
			Click on the <b>Edit All Assignments</b> link to make multiple changes to the assignments
			for this reviewer.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			Note that the Request/Conflict information shown on this page is for informational purposes only.
		</td>
	</tr>--%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span runat='server' id='spnEditAll' visible='true'></span></td>
		<td><span runat='server' id='spnDeleteAll' visible='true'></span></td>
		<td colspan='2' align='right'>
			<b>Assignments:</b> <span runat='server' id='spnCount' visible='true'></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
</table>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr align='center'>
		<td colspan='2'>
			<span runat='server' id='spnCancel' visible='true'></span>
		</td>
	</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleStageID' PropertyKey='ReviewCycleStageID' />
				<Argument Type='QueryString' TypeKey='ReviewerID' PropertyKey='PersonID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AddAssignmentByReviewer'/>
								<Argument Type='' TypeKey='' BaseValue='WfTaskAssignmentID=0'/>
								<Argument Type='QueryString' TypeKey='ReviewerID' BaseValue='ReviewerID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEditAll'
						Container='spnEditAll'
						Type='cLink'
						Caption='Edit All Assignments'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AssignmentsEditorByReviewer'/>
								<Argument Type='QueryString' TypeKey='ReviewerID' BaseValue='ReviewerID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlDeleteAll'
						Container='spnDeleteAll'
						Type='cLink'
						Caption='Delete All Assignments'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='DeleteAll'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReviewerID' BaseValue='ReviewerID='/>
								<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Reviewer' Width='10%'>
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
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName' ColumnHeader='Participant' Width='10%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryPerson'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectTask.Description' ColumnHeader='Task' Width='15%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='WfProjectTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='10%'>
							<Control ID='ctlLinkGrantID'
								ToolTipPropertyKey='GranteeProject.GrantTitle'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantsEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.CommonOrganizationName' ColumnHeader='Participant ~~Organization~~' Width='15%'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='GranteeProject.PrimaryOrganization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestConflict.Description' ColumnHeader='Conflict/Preference' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='RequestConflict'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewAssignmentType.Description' ColumnHeader='Assignment Type' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewAssignmentType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center' Width='20%'> 
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='AssignmentsEditorByReviewerOne'/>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID='/>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='ReviewerID='/>
										<Argument Type='QueryString' TypeKey='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
										<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
										<RelatedDataObjects>
											<RelatedDataObject DataObjectDefinitionKey='WfTaskAssignmentReview'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='WfTaskAssignmentID' childProperty='WfTaskAssignmentID' />
												</RelationshipProperties>
											</RelatedDataObject>
										</RelatedDataObjects>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
