<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Reviews.cReviews" %>
<%@ register Tagprefix='Core' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>

<Core:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='Reviews' LinkTitle='Reviews Easylist' runat='server' />

<table width='100%' runat='server' visible='true' cellpadding='2' cellspacing='0'>
	<tr class='SeparatorHdg'>
		<td colspan='2'>
			<span runat='server' id='spnHide' visible='true'/><span runat='server' id='spnHideLink' visible='true'/>
			<span runat='server' id='spnShow' visible='true'/><span runat='server' id='spnShowLink' visible='true'/>
			(clicking on this link will display Easylist search criteria if it is hidden)
		</td>
	</tr>
</table>

<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25'>&nbsp;</td>
		<td width='20%'><b><%=GetLabel("GrantId")%></b></td>
		<td>
			<span runat='server' id='spnGrantsID'/>
		</td>
	</tr>
	<tr>
		<td width='25'>&nbsp;</td>
		<td>
			<b>Reviewer Last Name</b>
		</td>
		<td>
			<span runat='server' id='spnRevLastName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Reviewer First Name	</b></td>
		<td>
			<span runat='server' id='spnRevFirstName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
			<td><b>Reviewer <%=GetLabel("Organization")%></b>
		</td>
		<td>
			<span runat='server' id='spnRevOrg'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Participant Last Name</b>
		</td>
		<td>
			<span runat='server' id='spnLastName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Participant First Name</b>
		</td>
		<td>
			<span runat='server' id='spnFirstName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Participant <%=GetLabel("Organization")%></b>
		</td>
		<td>
			<span runat='server' id='spnOrg'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Committee</b>
		</td>
		<td>
			<span runat='server' id='spnCommittee'/>
		</td>
	</tr>
	<tr visible='false' runat='server'>
		<td>&nbsp;</td>
		<td>
			<b>Committee Status</b>
		</td>
		<td>
			<span runat='server' id='spnCommitteeStatus'/>
		</td>
	</tr>
	<tr visible='false' runat='server'>
		<td>&nbsp;</td>
		<td>
			<b>Competition Type</b>
		</td>
		<td>
			<span runat='server' id='spnCompetitionType'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b><%=GetLabel("ProgramName")%></b>
		</td>
		<td>
			<span runat='server' id='spnProgram'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b><%=GetLabel("FundingOpportunity")%></b>
		</td>
		<td>
			<span runat='server' id='spnCompetition'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b><%=GetLabel("FundingCycleName")%></b>
		</td>
		<td>
			<span runat='server' id='spnProject'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Task</b>
		</td>
		<td>
			<span runat='server' id='spnProjectTask'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Task Status</b>
		</td>
		<td>
			<span runat='server' id='spnTaskStatus'/>
		</td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Time Period/Award Cycle</b>
		</td>
		<td>
			<span runat='server' id='spnTimePeriod'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' align='center'>
			<span runat='server' id='spnFind'/>&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClear'/>
			<br><br>
		</td>
	</tr>
</table>
<table width='100%'>
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
			<ResultList Key='WfTAList'>Review Task</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>			
				<DisplayProperty PropertyKey=''>
					<Control ID='txtGrantsID'
						Type='cTextBox' MaxLength='10'
						Container='spnGrantsID' AllowNumbersOnly='True'
						FilterKey='PersonID'>
							<FilterList List='WfTAList' Property='PersonID'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtRevLastName'
						Type='cTextBox'
						Container='spnRevLastName'
						MaxLength='100' 
						FilterKey='RevLastName'>
							<FilterList List='WfTAList' Property='LastName'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLastName'
						Type='cTextBox'
						Container='spnLastName'
						MaxLength='100'
						FilterKey='LastName'>
							<FilterList List='WfTAList' Property='AppLastName'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnShow'
						Type='cButtonImage'
						Container='spnShow'
						Image='show.gif'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ShowSearchParameters'/>
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
					<Control ID='txtRevFirstName'
						Type='cTextBox'
						Container='spnRevFirstName'
						MaxLength='100'
						FilterKey='RevFirstName'>
							<FilterList List='WfTAList' Property='FirstName'/>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='txtFirstName'
						Type='cTextBox'
						Container='spnFirstName'
						MaxLength='100'
						FilterKey='FirstName'>
							<FilterList List='WfTAList' Property='AppFirstName'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtRevOrg'
						Type='cTextBox'
						Container='spnRevOrg'
						MaxLength='100'
						FilterKey='RevOrganizationName'>
						<FilterList List='WfTAList' Property='RevCommonOrganizationName'/>
					</Control>
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrg'
						Type='cTextBox'
						Container='spnOrg'
						MaxLength='100'
						FilterKey='OrganizationName'>
						<FilterList List='WfTAList' Property='AppCommonOrganizationName'/>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCommittee'
						Type='cDropDown'
						Container='spnCommittee'
						DataObjectDefinitionKey='ReviewCommittee'
						StoredValue='ReviewCommitteeID'
						DisplayValue='ReviewCommitteeDescription'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='ReviewCommitteeID'>
							<FilterList List='WfTAList' Property='ReviewCommitteeID'/>
							<Sort>
								<Argument PropertyKey='ReviewCommitteeDescription'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCommitteeStatus'
						Type='cDropDown'
						Container='spnCommitteeStatus'
						DataObjectDefinitionKey='ReviewCommittee'
						StoredValue='Inactive'
						DisplayValue='Inactive'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='Inactive'>
							<FilterList List='WfTAList' Property='Inactive'/>
							<Sort>
								<Argument PropertyKey='Inactive'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCompetitionType'
						Type='cDropDown'
						Container='spnCompetitionType'
						DataObjectDefinitionKey='CompetitionType'
						StoredValue='CompetitionTypeID'
						DisplayValue='Abbr'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='CompetitionTypeID'>
							<FilterList List='WfTAList' Property='CompetitionTypeID'/>
							<Sort>
								<Argument PropertyKey='Abbr'/>
							</Sort>
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
							<FilterList List='WfTAList' Property='ProjectID'/>
							<Sort>
								<Argument PropertyKey='WfProjectName'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProjectTask'
						Type='cDropDown'
						Container='spnProjectTask'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTaskID'>
							<FilterList List='WfTAList' Property='WfTaskID'/>
							<Filters>
								<Argument Group='('/>
									<Argument PropertyKey='WfTaskTypeID' Value='2' Bool='' />
									<Argument PropertyKey='WfTaskTypeID' Value='4' Bool='Or' />
								<Argument Group=')' Bool=''/>
							</Filters>
							<Sort>
								<Argument PropertyKey='WfTask'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTaskStatus'
						Type='cDropDown'
						Container='spnTaskStatus'
						DataObjectDefinitionKey='WfTaskStatus'
						StoredValue='WfTaskStatusID'
						DisplayValue='WfTaskStatus'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTaskStatusID'>
							<FilterList List='WfTAList' Property='TaskStatusID'/>
							<Sort>
								<Argument PropertyKey='WfTaskStatus'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTimePeriod'
						Type='cDropDown'
						Container='spnTimePeriod'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='TimePeriodID'>
							<FilterList List='WfTAList' Property='TimePeriodID'/>
							<Sort>
								<Argument PropertyKey='Description'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind'
						Type='cButton' EnterKey='True'
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
								<Argument Value='Reviews'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTAList' DataObjectDefinitionKey='EasylistReviewsReviewView' Updatable='False' GetData='False'>
			<Filters>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastNameFirstName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Reviews Search Results
						</HeaderHtml>
						<!--<InstructionHtml>
							<p>Select from the <b>Action</b> options list and click <b>Go</b> to view/edit
							the person contact information, login as or send this person an e-mail.
							Click on any hyperlinked column name link to sort the results alphabetically by that column.
							</p>
						</InstructionHtml>-->
						
						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='230'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='Reviews'>
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
											<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID'/>
											<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID'/>
										</ActionParameters>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<!--
						<DisplayProperty PropertyKey='PersonID' ColumnHeader='Easygrants ID'>	
							<Sortable>
								<Argument PropertyKey='PersonID'></Argument>
							</Sortable>
						</DisplayProperty>
						-->
    						<!--
							<DisplayProperty PropertyKey='WfTaskAssignmentID' ColumnHeader='WfTA'/>
						-->
											
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Reviewer'  Width='20%'>
							<Control ID='ctlLinkLastNameFirstName'
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
						<DisplayProperty PropertyKey='AppLastNameFirstName' ColumnHeader='Participant'   Width='20%'>
							<Control ID='ctlLinkAppLastNameFirstName'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObject' TypeKey='AppPersonID' AttributeName='PersonID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='AppLastNameFirstName'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='WfProjectTask.WfTask.WfTask' ColumnHeader='Task'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
								    <RelatedProperty PropertyKey='WfProjectTask.WfTask' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<!-- 
						<DisplayProperty PropertyKey='Inactive' Format='ActiveInactive' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='Inactive'/>
							</Sortable>
						</DisplayProperty>
						-->
						<DisplayProperty PropertyKey='TaskStatusDescription' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='TaskStatusDescription'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCommitteeDescription' ColumnHeader='Committee'>
							<Sortable>
								<Argument PropertyKey='ReviewCommitteeDescription'/>
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
