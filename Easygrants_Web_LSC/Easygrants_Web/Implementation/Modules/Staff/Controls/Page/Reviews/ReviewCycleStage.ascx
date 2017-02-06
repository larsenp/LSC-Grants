<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewPages.ascx'
	runat='server'/>
<br>

<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ReviewStage' LinkTitle='Review Stages' runat='server' />
	
<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Review Stages</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Shown below are the stages currently created for this Review Cycle. Click the <B>Manage</B> button 
			to manage assignments, scores and comments, and outcomes for a Review Stage.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span runat='server' id='spnAdd'/></td>
	</tr>
	<tr>
		<td><span runat='server' id='spnDataList'/></td>
	</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCycleStageList' DataObjectDefinitionKey='ReviewCycleStage'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='ListOrder'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewCycleStageEditor'/>
								<Argument Type='' TypeKey='' Value='ReviewCycleStageID=0'/>
								<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
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
						<DisplayProperty PropertyKey='Name' ColumnHeader='Review Stage' width='50%'>
							<Sortable>
								<Argument PropertyKey='Name'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ListOrder' ColumnHeader='Stage List Order' width='47%'>
							<Sortable>
								<Argument PropertyKey='ListOrder'/>
							</Sortable>
						</DisplayProperty>
						<!--
						<DisplayProperty PropertyKey='ReviewCycle.TimePeriod.Description' ColumnHeader='Time Period/Award Cycle'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewCycle.TimePeriod'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCycle.CompetitionType.Description' ColumnHeader='Competition Type'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ReviewCycle.CompetitonType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>-->
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Right' DataAlign='Right' Width='2%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ReviewCycleStageEditor'/>
										<Argument Type='DataObject' TypeKey='ReviewCycleStageID' AttributeName='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
										<Argument Type='DataObject' TypeKey='ReviewCycleID' AttributeName='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Parameters>
						        <Argument Value='' ValueKey='WfTaskAssignmentsActive.WfTaskID' DisplayValue='Control'>
							        <Control ID='btnDelete'
								        Type='cButton'
								        Image='Delete'
								        Confirmation='Are you sure you want to delete this item?'>
								        <Action
									        PostBack='True'
									        Object='EventController'
									        Method='EventController_Delete'>
									        <Parameters>
										        <Argument Type='DataObject' TypeKey='ReviewCycleStageID' AttributeName='ReviewCycleStageID'/>
										        <RelatedDataObjects>
											        <RelatedDataObject DataObjectDefinitionKey='WfTaskAssignment'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='ReviewCycleStageID' childProperty='ReviewCycleStageID' />
												        </RelationshipProperties>
												        <RelatedDataObjects>
													        <RelatedDataObject DataObjectDefinitionKey='WfTaskAssignmentReview'>
														        <RelationshipProperties>
															        <RelationshipProperty parentProperty='WfTaskAssignmentID' childProperty='WfTaskAssignmentID' />
														        </RelationshipProperties>
													        </RelatedDataObject>
												        </RelatedDataObjects>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='GranteeProjectReviewStage'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='ReviewCycleStageID' childProperty='ReviewCycleStageID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
											        <RelatedDataObject DataObjectDefinitionKey='ReviewCycleStageCommittee'>
												        <RelationshipProperties>
													        <RelationshipProperty parentProperty='ReviewCycleStageID' childProperty='ReviewCycleStageID' />
												        </RelationshipProperties>
											        </RelatedDataObject>
										        </RelatedDataObjects>
									        </Parameters>
								        </Action>
							        </Control>
							    </Argument>
							</Parameters>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' HeaderAlign='Left' DataAlign='Left'>
							<Control ID='btnManage'
								Type='cButton'
								Image='Manage'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='RevProcAssign'/>
										<Argument Type='DataObject' TypeKey='ReviewCycleStageID' AttributeName='ReviewCycleStageID' BaseValue='ReviewCycleStageID='/>
										<Argument Type='DataObject' TypeKey='ReviewCycleID' AttributeName='ReviewCycleID' BaseValue='ReviewCycleID='/>
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
<!-- End Embedded XML -->
