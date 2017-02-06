<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ApplicationEL.ascx.vb"  Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Applications.cApplicationEL" %>
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
<table width='100%' runat='server' visible='true'>
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
		<td width='15%'><b><%=GetLabel("GrantId")%></b></td>
		<td>
			<span runat='server' id='spnGrantsID'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Last Name</b></td>
		<td>
			<span runat='server' id='spnLastName'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>First Name</b></td>
		<td>
			<span runat='server' id='spnFirstName'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b><%=GetLabel("Organization")%></b></td>
		<td>
			<span runat='server' id='spnOrg'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>E-mail</b></td>
		<td>
			<span runat='server' id='spnEmail'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b><%=GetLabel("ProgramName")%></b></td>
		<td>
			<span runat='server' id='spnProgram'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td>
			<span runat='server' id='spnCompetition'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b><%=GetLabel("FundingCycleName")%></b></td>
		<td>
			<span runat='server' id='spnProject'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Task</b></td>
		<td>
			<span runat='server' id='spnTask'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Role</b></td>
		<td>
			<span runat='server' id='spnRole'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Status</b></td>
		<td>
			<span runat='server' id='spnStatus'/>
		</td>
	</tr>
	<tr>
		<td width='15%'><b>Outcome</b></td>
		<td>
			<span runat='server' id='spnOutcome'/>
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
	<table width='100%' runat='server'>
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
					<Control ID='txtGrantsID'
						Type='cTextBox' MaxLength='9'
						Container='spnGrantsID' AllowNumbersOnly='True'
						FilterKey='GranteeProjectID'>
							<FilterList List='WfTAList' Property='GranteeProjectID'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLastName'
						Type='cTextBox'
						Container='spnLastName'
						FilterKey='LastName'>
							<FilterList List='WfTAList' Property='LastName'/>
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
					<Control ID='txtFirstName'
						Type='cTextBox'
						Container='spnFirstName'
						FilterKey='FirstName'>
							<FilterList List='WfTAList' Property='FirstName'/>
					</Control>
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrg'
						Type='cTextBox'
						Container='spnOrg'
						MaxLength='100'
						FilterKey='CommonOrganizationName'>
						<FilterList List='WfTAList' Property='CommonOrganizationName'/>
					</Control>
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='txtEmail'
						Type='cTextBox'
						Container='spnEmail'
						FilterKey='PrimaryEMail'>
							<FilterList List='WfTAList' Property='PrimaryEmailAddress'/>
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
					<Control ID='ctlRole'
						Type='cDropDown'
						Container='spnRole'
						DataObjectDefinitionKey='WfTaskRole'
						StoredValue='WfTaskRoleID'
						DisplayValue='WfTaskRole'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTaskRoleID'>
							<FilterList List='WfTAList' Property='WfTaskRoleID'/>
							<Sort>
								<Argument PropertyKey='WfTaskRole'/>
							</Sort>
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
					<Control ID='ctlOutcome'
						Type='cDropDown'
						Container='spnOutcome'
						DataObjectDefinitionKey='WfTaskOutcome'
						StoredValue='WfTaskOutcomeID'
						DisplayValue='WfTaskOutcome'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTaskOutcomeID'>
							<FilterList List='WfTAList' Property='WfTaskOutcomeID'/>
							<Filters>
							</Filters>
							<Sort>
								<Argument PropertyKey='WfTaskOutcome'/>
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
		<DataObject Key='WfTAList' DataObjectDefinitionKey='EasylistApplicationsView' Updatable='False' GetData='False'>
			<Filters>
			    <Argument PropertyKey='WfTaskTypeID' Value='1'/>
			</Filters>
			<Sort>`
				<Argument PropertyKey='LastNameFirstName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						DataObjectDefinitionKey='EasylistApplicationsView'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Applications Search Results
						</HeaderHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='230'>
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
						<!--
						<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WfTA'/>
						-->
						<!--<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Applicant'>	
							<Sortable>
								<Argument PropertyKey='LastNameFirstName'></Argument>
							</Sortable>
						</DisplayProperty>-->
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Applicant'  >
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
						<DisplayProperty PropertyKey='ProjectTaskDesc' ColumnHeader='Task'>
							<Sortable>
								<Argument PropertyKey='ProjectTaskDesc'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskOutcome' ColumnHeader='Outcome'>
							<Sortable>
								<Argument PropertyKey='WfTaskOutcome'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskRole' ColumnHeader='Role'>
							<Sortable>
								<Argument PropertyKey='WfTaskRole'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<!--
						<DisplayProperty PropertyKey='GranteeProject.WfProject.WfCompetition.WfProgram.ProgramDisplayName' ColumnHeader='Program'/>
						<DisplayProperty PropertyKey='GranteeProject.GrantTitle' ColumnHeader='Grant Title'/>
						-->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
