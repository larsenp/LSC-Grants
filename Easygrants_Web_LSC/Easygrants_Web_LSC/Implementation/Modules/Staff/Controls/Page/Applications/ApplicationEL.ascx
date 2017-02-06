<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Applications.cApplicationEL" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ register Tagprefix='Core' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!--<p>The Applications Easylist provides access to information on all individuals who are assigned application-related tasks in the system. 
To search for an individual or group of individuals, enter or select search criteria into the Easylist Search section below and click on the Find button. 
<p>
The results of your search will appear in the Search Results section at the bottom of the page. To view and manage information on an individual, 
select an option from the appropriate Action drop-down list and click on the <b>Go</b> button.
<P>
To expand the Easylist search section to perform a new search, click the arrow icon next to Easylist Search.
<p>-->
<Core:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='Applications' LinkTitle='Applications Easylist' runat='server' />
<table id="Table1" width='100%' runat='server' visible='true'>
	<tr class='SeparatorHdg'>
		<td colspan='2'>
			<span runat='server' id='spnHide' visible='true'/><span runat='server' id='spnHideLink' visible='true'/>
			<span runat='server' id='spnShow' visible='true'/><span runat='server' id='spnShowLink' visible='true'/>
			(clicking on this link will display Easylist search criteria if it is hidden)
		</td>
	</tr>
	<tr id='trNoResults' visible='false'>
		<td colspan='2'>
			<font color='red'><b>
				No results were found matching your search criteria.
			</font></b>
			<br><br>
		</td>
	</tr>
</table>
<table id='tbSearchParameters' width='100%' runat='server' visible='true' border='0'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>Recipient ID</b></td>
		<td>
			<span runat='server' id='spnRNO'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Organization</b></td>
		<td>
			<span runat='server' id='spnOrg'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Funding Opportunity</b></td>
		<td>
			<span runat='server' id='spnProgram'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Service Area</b></td>
		<td>
			<span runat='server' id='spnCompetition'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Funding Cycle</b></td>
		<td>
			<span runat='server' id='spnProject'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Grant Year</b></td>
		<td>
			<span runat='server' id='spnWfTAYear'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Task</b></td>
		<td>
			<span runat='server' id='spnTask'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Status</b></td>
		<td>
			<span runat='server' id='spnStatus'/>
		</td>
	</tr>
	<tr><td colspan='2' >&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnFind'/>&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClear'/>
			<br><br>
		</td>
	</tr>
</table>
	<table id="Table2" width='100%' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnList'/>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnNoResult'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<ResultLists>
			<ResultList Key='WfTAList'>Tasks</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtRNO'
						Type='cTextBox' MaxLength='6'
						Container='spnRNO' AllowNumbersOnly='True'
						FilterKey='LegacyOrganizationID'>
							<FilterList List='WfTAList' Property='LegacyOrganizationID'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkShow'
						Type='cLink'
						Container='spnShowLink'
						Caption='Easylist Search'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ShowSearchParameters'/>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='btnHide'
						Type='cButtonImage'
						Container='spnHide'
						Image='hide.gif'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='FilterListDataPresenter_Find'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHide'
						Type='cLink'
						Container='spnHideLink'
						Caption='Easylist Search'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='FilterListDataPresenter_Find'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrg'
						Type='cTextBox'
						Container='spnOrg'
						FilterKey='OrganizationName'>
						<FilterList List='WfTAList' Property='OrganizationName'/>
					</Control>
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Type='cDropDown'
						Container='spnProgram'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='ProgramID'>
							<FilterList List='WfTAList' Property='ProgramID'/>
							<Sort>
								<Argument PropertyKey='ProgramDisplayName'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCompetition'
						Type='cDropDown'
						Container='spnCompetition'
						DataObjectDefinitionKey='Competition'
						StoredValue='CompetitionID'
						DisplayValue='CompetitionDisplayName'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='CompetitionID'>
							<FilterList List='WfTAList' Property='CompetitionID'/>
							<Sort>
								<Argument PropertyKey='CompetitionDisplayName'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProject'
						Type='cDropDown'
						Container='spnProject'
						DataObjectDefinitionKey='WfProject'
						StoredValue='WfProjectID'
						DisplayValue='WfProjectName'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfProjectID'>
							<FilterList List='WfTAList' Property='WfProjectID'/>
							<Sort>
								<Argument PropertyKey='WfProjectName'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlWfTAYear'
						Type='cDropDown'
						Container='spnWfTAYear'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayValue='Abbr'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTATimePeriodID'>
							<FilterList List='WfTAList' Property='WfTATimePeriodID'/>
							<Sort>
								<Argument PropertyKey='Abbr' Direction='Descending'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTask'
						Type='cDropDown'
						Container='spnTask'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTaskID'>
							<FilterList List='WfTAList' Property='WfTaskID'/>
							<Sort>
								<Argument PropertyKey='WfTask'/>
							</Sort>
							<Filters>
							    <Argument PropertyKey='WfTaskTypeID' Value='1'/>
							</Filters>
							
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStatus'
						Type='cDropDown'
						Container='spnStatus'
						DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatusAbbr'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTaskStatusID'>
							<FilterList List='WfTAList' Property='WfTaskStatusID'/>
							<Sort>
								<Argument PropertyKey='WfTaskStatusAbbr'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind'
						Type='cButton'  EnterKey='True'
						Container='spnFind'
						Image='Find'>
						<Action
							PostBack='True'
							Object='ModulePageContent'
							Method='FilterListDataPresenter_Find'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear'
						Type='cButton'
						Container='spnClear'
						Image='Clear'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Applications'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTAList' DataObjectDefinitionKey='LscAppsEasylist' Updatable='False' GetData='False'>
			<Filters/>
			<Sort>
				<Argument PropertyKey='PrimaryContactLastFirst'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						DataObjectDefinitionKey='LscAppsEasylist'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Applications Search Results
						</HeaderHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='210'>
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
										<ActionParameters>
											<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='PdfWftaID'/>											
										</ActionParameters>
									</Parameters>
								</Action>
							</Control>  
						</DisplayProperty>
						<DisplayProperty PropertyKey='LegacyOrganizationID' ColumnHeader='Recipient ID'>	
							<Control ID='ctlOrg'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='LegacyOrganizationID'></Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Organization'>
							<Sortable>
								<Argument PropertyKey='OrganizationName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PrimaryContactLastFirst' ColumnHeader='Primary Contact'  >
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='PrimaryContactLastFirst'/>
							</Sortable>
						</DisplayProperty> 
						<DisplayProperty PropertyKey='SubgranteeName' ColumnHeader='Subgrantee'>
							<Sortable>
								<Argument PropertyKey='SubgranteeName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundingCycle' ColumnHeader='Funding Cycle'>
							<Sortable>
								<Argument PropertyKey='FundingCycle'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTAYear' ColumnHeader='Grant Year'>
							<Sortable>
								<Argument PropertyKey='WfTAYear'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
