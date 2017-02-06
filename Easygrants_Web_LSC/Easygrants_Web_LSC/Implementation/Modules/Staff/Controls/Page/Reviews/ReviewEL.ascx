<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Reviews.cReviews" %>
<%@ register Tagprefix='Core' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>

<Core:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='Reviews' LinkTitle='Reviews Easylist' runat='server' />

<table id="Table1" width='100%' runat='server' visible='true' cellpadding='2' cellspacing='0'>
	<tr class='SeparatorHdg'>
		<td colspan='2'>
			<span runat='server' id='spnHide' visible='true'/><span runat='server' id='spnHideLink' visible='true'/>
			<span runat='server' id='spnShow' visible='true'/><span runat='server' id='spnShowLink' visible='true'/>
			(clicking on this link will display Easylist search criteria if it is hidden)
		</td>
	</tr>
</table>

<table id='tbSearchParameters' runat='server' visible='true'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25'>&nbsp;</td>
		<td>
			<b>Review Task</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnReviewTask'/>
		</td>
	</tr>
	<tr>
		<td width='25'>&nbsp;</td>
		<td>
			<b>Reviewer Last Name</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnRevLastName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Reviewer First Name	</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnRevFirstName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Applicant ID</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnAppID'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Applicant Organization</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnOrg'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>App Primary Contact Last Name</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnLastName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>App Primary Contact First Name</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnFirstName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Program</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnProgram'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Service Area</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnCompetition'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Review Year</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnReviewYear'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Task Status</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td>
			<span runat='server' id='spnTaskStatus'/>
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
					<Control ID='ctlReviewTask'
						Type='cDropDown'
						Container='spnReviewTask'
						DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID'
						DisplayValue='WfTask'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTaskID'>
							<FilterList List='WfTAList' Property='WfTaskID'/>
							<Filters>
								<Argument PropertyKey='WfTaskTypeID' Value='4' />
							</Filters>
							<Sort>
								<Argument PropertyKey='WfTask'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtRevLastName'
						Type='cTextBox'
						Container='spnRevLastName'
						FilterKey='RevLastName'>
							<FilterList List='WfTAList' Property='ReviewerLast'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLastName'
						Type='cTextBox'
						Container='spnLastName'
						FilterKey='LastName'>
							<FilterList List='WfTAList' Property='ApplicantLast'/>
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
						FilterKey='RevFirstName'>
							<FilterList List='WfTAList' Property='ReviewerFirst'/>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='txtFirstName'
						Type='cTextBox'
						Container='spnFirstName'
						FilterKey='FirstName'>
							<FilterList List='WfTAList' Property='ApplicantFirst'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrgID'
						Type='cTextBox'
						Container='spnAppID'
						FilterKey='RecipientID'>
						<FilterList List='WfTAList' Property='RecipientID'/>
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
						DisplayValue='CompetitionName'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='CompetitionID'>
							<FilterList List='WfTAList' Property='CompetitionID'/>
							<Sort>
								<Argument PropertyKey='CompetitionName'/>
							</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewYear'
						Type='cDropDown'
						Container='spnReviewYear'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayValue='Abbr'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='WfTATimePeriodID'>
							<FilterList List='WfTAList' Property='TimePeriodID'/>
							<Sort>
								<Argument PropertyKey='SortOrder' Direction='Descending'/>
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
							<FilterList List='WfTAList' Property='WfTaskStatusID'/>
							<Sort>
								<Argument PropertyKey='WfTaskStatus'/>
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
		<DataObject Key='WfTAList' DataObjectDefinitionKey='LscReviewsEasylist' Updatable='False' GetData='False'>
			<Filters>
			</Filters>
			<Sort>
				<Argument PropertyKey='RecipientID'/>
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
											<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
										</ActionParameters>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTask' ColumnHeader='Review Task'>
							<Sortable>
								<Argument PropertyKey='WfTask'/>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='ReviewerOrWorkGroup' ColumnHeader='Reviewer/Workgroup'  >
							<Parameters>
								<Argument Value='' ValueKey='ReviewerPersonID' Operator='Equal' DisplayValue='' PropertyKey='ReviewerOrWorkGroup' />
								<Argument Value='' ValueKey='ReviewerPersonID' Operator='NotEqual' DisplayValue='Control' PropertyKey='ReviewerOrWorkGroup' >
									<Control ID='ctlLinkLastNameFirstName'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_NavigateToModulePageKey'>
											<Parameters>
												<Argument AttributeName='PageKey' Value='PersonContact'/>
												<Argument Type='DataObject' TypeKey='ReviewerPersonID' AttributeName='PersonID' BaseValue='PersonID='/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
							<Sortable>
								<Argument PropertyKey='ReviewerOrWorkGroup'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RecipientID' ColumnHeader='Applicant ID'  >
							<Control ID='ctlLinkRecipientID'
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
								<Argument PropertyKey='RecipientID'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Applicant'>
							<Sortable>
								<Argument PropertyKey='OrganizationName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ServArea' ColumnHeader='Service Area'>
							<Sortable>
								<Argument PropertyKey='ServArea'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTAYear' ColumnHeader='Year'>
							<Sortable>
								<Argument PropertyKey='WfTAYear'/>
							</Sortable>
						</DisplayProperty>

						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'/>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
