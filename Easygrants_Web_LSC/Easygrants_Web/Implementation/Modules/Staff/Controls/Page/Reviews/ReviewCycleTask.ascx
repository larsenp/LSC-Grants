<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b><span runat='server' id='spnName' visible='true'></span></b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Participant Pool</b></td>
	</tr>	
</table>

  
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' Width='100%'>	
	<tr>
		<td align='center'>
			<span runat='server' id='spnClose'/>
		</td>
	</tr>	
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='ReviewCycle' DataObjectDefinitionKey='ReviewCycle'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='spnName' Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewCycleProjectTaskList' DataObjectDefinitionKey='ReviewCycleProjectTask'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Description'>	
					<RelatedProperty PropertyKey='ProjectTask'/>
				</Argument>
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
									<Argument AttributeName='PageKey' Value='ApplicantPoolEditor'/>
									<Argument Type='' TypeKey='' Value='ReviewCycleProjectTaskID=0'/>
									<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
									<Argument Type='QueryString' TypeKey='CmptType' BaseValue='CmptType='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='ProjectTask.WfProject.WfCompetition.CompetitionDisplayName' ColumnHeader='ProgramName' Width='25%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='CompetitionDisplayName'>
									<RelatedProperty PropertyKey='ProjectTask.WfProject.WfCompetition'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ProjectTask.WfProject.WfProjectName' ColumnHeader='FundingOpportunity' Width='25%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='WfProjectName'>
									<RelatedProperty PropertyKey='ProjectTask.WfProject'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ProjectTask.Description' ColumnHeader='Task' Width='25%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='ProjectTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCycleProjectTaskOutcome' List='True' ColumnHeader='Outcomes' Width='25%'>
							<DisplayProperties>
								<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'/>
							</DisplayProperties>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Right' DataAlign='Right' Width='5%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									AutoSave='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ApplicantPoolEditor'/>
										<Argument Type='DataObject' TypeKey='ReviewCycleProjectTaskID' AttributeName='ReviewCycleProjectTaskID' BaseValue='ReviewCycleProjectTaskID='/>
										<Argument Type='QueryString' TypeKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='QueryString' TypeKey='CmptType' BaseValue='CmptType='/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskID' AttributeName='WfProjectTaskID' BaseValue='ProjectTaskID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' DataAlign='Left'>
							<Parameters>
						        <Argument Value='' ValueKey='ReviewCycleStages.WfTaskAssignmentsActive.WfTaskID' DisplayValue='Control'>
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
											<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='ReviewCycleProjectTaskID' AttributeName='ReviewCycleProjectTaskID'/>
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='ReviewCycleProjectTaskOutcome'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='ReviewCycleProjectTaskID' childProperty='ReviewCycleProjectTaskID' />
														</RelationshipProperties>
													</RelatedDataObject>
												</RelatedDataObjects>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
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
