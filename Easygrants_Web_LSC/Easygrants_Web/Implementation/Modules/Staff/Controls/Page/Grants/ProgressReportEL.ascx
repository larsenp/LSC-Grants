<%@ register Tagprefix='Core' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProgressReportEL.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Grants.cProgressReportEL" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br>
<br>
<span id='spnHideText' runat='server' visible='true'>
	<Easygrants:ValSumm id='ctlValSumm' runat='server' />
	<!-- USER MODIFIABLE CONTENT AREA -->
<!--	<br>
	<p>The Grantee Reports Easylist provides easy access to individuals 
	(such as applicants, referees, or mentors) who are assigned grantee report tasks in the system. 
	To locate an individual or a group of individuals, enter criteria into the fields below and click <b>Find</b>. 

	</p>	-->
	<Core:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true' AutoVDateType='Root' Key='ProgressReportEL'
		LinkTitle='Grantee Reports Easylist' runat='server' />
		<table width='100%' runat='server'>
		<tr class='SeparatorHdg'>
			<td colspan='2'>
				<span runat='server' id='spnHide' visible='true' /><span runat='server' id='spnHideLink' visible='false' />
				<span runat='server' id='spnShow' visible='true' /><span runat='server' id='spnShowLink' visible='true' />
				(clicking on this link will display Easylist search criteria if it is hidden)
			</td>
		</tr>
		<tr id='trNoResults' visible='false'>
			<td colspan='2'>
				<font color='red'><b>No results were found matching your search criteria. </font>
				</B>
				<br>
				<br>
			</td>
		</tr>
	</table>
	<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><b><%=GetLabel("GrantId")%></b></td>
			<td>
				<span runat='server' id='spnGrantNumber' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Last Name</b>
			</td>
			<td>
				<span runat='server' id='spnLastName' />
			</td>
		</tr>
		<tr>
			<td>
				<b>First Name</b>
			</td>
			<td>
				<span runat='server' id='spnFirstName' />
			</td>
		</tr>
		<tr>
			<td>
				<b><%=GetLabel("Organization")%></b>
			</td>
			<td>
				<span runat='server' id='spnOrganization' />
			</td>
		</tr>
		<tr>
			<td>
				<b>E-mail</b>
			</td>
			<td>
				<span runat='server' id='spnEmail' />
			</td>
		</tr>
		<tr>
			<td>
				<b><%=GetLabel("ProgramName")%></b>
			</td>
			<td>
				<span runat='server' id='spnProgram'/>
			</td>
		</tr>
		<tr>
			<td>
				<b><%=GetLabel("FundingOpportunity")%></b>
			</td>
			<td>
				<span runat='server' id='spnCompetition'/>
			</td>
		</tr>
		<tr>
			<td><b><%=GetLabel("FundingCycleName")%></b></td>
			<td>
				<span runat='server' id='spnProject'/>
			</td>
		</tr>
		<tr>
			<td>
				<b>Task</b>
			</td>
			<td>
				<span runat='server' id='spnTask' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Status</b>
			</td>
			<td>
				<span runat='server' id='spnStatus' />
			</td>
		</tr>
		<tr>
			<td>
				<b>Outcome</b>
			</td>
			<td>
				<span runat='server' id='spnOutcome' />
			</td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
		<td colspan='3' align='center'>
			<span runat='server' id='spnFind'/>&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClear'/>
			<br><br>
		</td>
	</tr>
	</table>
	<table width='100%' runat='server'>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnList' />
			</td>
		</tr>
		<tr>
			<td colspan='2'>
				<span runat='server' id='spnNoResult' />
			</td>
		</tr>
	</table>
</span>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<ResultLists>
			<ResultList Key='WfTAList'>Tasks</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<Filters></Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtGrantNumber' Type='cTextBox' MaxLength='9' Container='spnGrantNumber' AllowNumbersOnly='True' FilterKey='GrantNumber'>
						<FilterList List='WfTAList' Property='GranteeProjectID' />
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
					<Control ID='ctlProject'
						Type='cDropDown'
						Container='spnProject'
						DataObjectDefinitionKey='WfProject'
						StoredValue='WfProjectID'
						DisplayValue='WfProjectName'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfProjectID'>
							<FilterList List='WfTAList' Property='ProjectID'/>
							<Sort>
								<Argument PropertyKey='WfProjectName'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnShow' Type='cButtonImage' Container='spnShow' Image='Show.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkShow' Type='cLink' Container='spnShowLink' Caption='Easylist Search'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHide' Type='cButtonImage' Container='spnHide' Image='Hide.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHide' Type='cLink' Container='spnHideLink' Caption='Easylist Search'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLastName' Type='cTextBox' Container='spnLastName' FilterKey='LastName'>
						<FilterList List='WfTAList' Property='LastName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtFirstName' Type='cTextBox' Container='spnFirstName' FilterKey='FirstName'>
						<FilterList List='WfTAList' Property='FirstName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtEmail' Type='cTextBox' Container='spnEmail' FilterKey='PrimaryEMail'>
						<FilterList List='WfTAList' Property='PrimaryEmailAddress' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTask' Type='cDropDown' Container='spnTask' DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID' DisplayValue='WfTask' DisplayNone='False'
						DisplayText='All' FilterKey='WfTaskID'>
						<FilterList List='WfTAList' Property='WfTaskID' />
						<Filters>
							<Argument PropertyKey='WfTaskTypeID' Value='3' />
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStatus' Type='cDropDown' Container='spnStatus' DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID' DisplayValue='WfTaskStatusAbbr' DisplayNone='False'
						DisplayText='All' FilterKey='WfTaskStatusID'>
						<FilterList List='WfTAList' Property='WfTaskStatusID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOutcome' Type='cDropDown' Container='spnOutcome' DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID' DisplayValue='WfTaskOutcome' DisplayNone='False'
						DisplayText='All' FilterKey='WfTaskOutcomeID'>
						<FilterList List='WfTAList' Property='WfTaskOutcomeID' />
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3'>
								<RelatedProperty PropertyKey='WfTask' />
							</Argument>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCompetition' Type='cDropDown' Container='spnCompetition' DataObjectDefinitionKey='Competition'
						StoredValue='CompetitionID' DisplayValue='CompetitionDisplayName' DisplayNone='False'
						DisplayText='All' FilterKey='CompetitionID'>
						<FilterList List='WfTAList' Property='CompetitionID' />
						<Sort>
							<Argument PropertyKey='CompetitionDisplayName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrganization' Type='cTextBox' Container='spnOrganization' FilterKey='Organization'
						Size='40' MaxLength='100'>
						<FilterList List='WfTAList' Property='CommonOrganizationName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind' Type='cButton' Container='spnFind' Image='Find'>
						<Action PostBack='True' Object='ModulePageContent' Method='FilterListDataPresenter_Find' />
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
								<Argument Value='ProgressReportEL'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTAList' DataObjectDefinitionKey='EasylistGranteeReportsView' Updatable='False' GetData='False'>
			<Filters>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastNameFirstName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList' Type='cDataListCtl' Container='spnList' DataObjectDefinitionKey='EasylistGranteeReportsView'
						SeparatorWidth='2' MaxPerPage='10'>
						<HeaderHtml>
							Grantee Reports Search Results
						</HeaderHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='200'>
							<Control ID='ctlActions' Type='cDropDown' DataObjectDefinitionKey='EasylistAction' StoredValue='EasylistActionID'
								DisplayValue='EasylistAction' DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='WfTaskAssignment'>
										<RelatedProperty PropertyKey='EasylistActionType' />
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo' Type='cButton' Image='Go'>
								<Action PostBack='True' Object='DataPresenter' Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl' />
										<Argument Type='Object' ObjectType='EventSource' />
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID' />
										<ActionParameters>
											<Argument Type='DataObject' TypeKey='PdfWftaID' AttributeName='PdfWftaID'/>											
										</ActionParameters>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True'>
							<Control ID='ctlGrantID'
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
								<Argument PropertyKey='GranteeProjectID'></Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Person'  >
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
								<Argument PropertyKey='LastNameFirstName'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~'  >
							<Control ID='ctlLinkOrganizationName'
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
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Task'>
							<Sortable>
								<Argument PropertyKey='WfTask'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome' ColumnHeader='Outcome'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'/>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
