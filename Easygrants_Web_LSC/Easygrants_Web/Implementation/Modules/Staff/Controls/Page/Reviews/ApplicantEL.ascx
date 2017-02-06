<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reviews.cApplicantsEL" CodeBehind="ApplicantEL.ascx.vb" %>

<!-- USER MODIFIABLE CONTENT AREA -->
<p>The Applicants Easylist allows you to quickly find and enter staff comments for all
applicants who are assigned review tasks.<br>
<br>
<b>Step 1:</b> Enter or select search criteria into the Easylist Search fields and click on
the <b>Find</b> button.<br>
<b>Step 2:</b> To view and and manage related information, select the required action from
the <b>Action</b> drop down list and click <b>Go</b>.<br>
<br>
When the search results are displayed, the Easylist search section will be hidden. To
display the Easylist Search section to perform a new search, click the <b>Easylist Search</b>
link. To print this page, click the <b>printer icon</b> in the upper right-hand corner of
the page.
</p>

<p></p>

<table width='100%' runat='server'>
	<tr class='SeparatorHdg'>
		<td colspan='2'>
			<span runat='server' id='spnHide' visible='true'/><span runat='server' id='spnHideLink' visible='true'/>
			<span runat='server' id='spnShow' visible='true'/><span runat='server' id='spnShowLink' visible='true'/>
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

<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
	<tr>
		<td>Last Name</td>
		<td><span runat='server' id='spnLastName'/></td>
	</tr>
	<tr>
		<td>First Name</td>
		<td><span runat='server' id='spnFirstName'/></td>
	</tr>
	<tr>
		<td>E-mail</td>
		<td><span runat='server' id='spnEmail'/></td>
	</tr>
	<tr>
		<td>Review Stage</td>
		<td><span runat='server' id='spnReviewStage'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='3' align='center'>
			<span runat='server' id='spnFind'/>&nbsp;&nbsp;
			<span runat='server' id='spnClear'/>
		</td>
	</tr>
</table>

<table width='100%' runat='server'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnList'/>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnNoResult'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
        <ResultLists>
			<ResultList Key='GPRList'>Applicants</ResultList>
        </ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLastName'
						Type='cTextBox'
						Container='spnLastName'
						FilterKey='LastName'>
						<FilterList List='GPRList' Property='LastName'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtFirstName'
						Type='cTextBox'
						Container='spnFirstName'
						FilterKey='FirstName'>
						<FilterList List='GPRList' Property='FirstName'/>
					</Control>
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='txtEmail'
						Type='cTextBox'
						Container='spnEmail'
						FilterKey='PrimaryEMail'>
						<FilterList List='GPRList' Property='PersonPrimaryEMail.ContactValue1'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewStage'
						Type='cDropDown'
						Container='spnReviewStage'
						DataObjectDefinitionKey='ReviewCycleStage'
						StoredValue='ReviewCycleStageID'
						DisplayValue='Name'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='ReviewCycleStageID'>
						<FilterList List='GPRList' Property='ReviewCycleStageID'/>
						<Filters>
						</Filters>
						<Sort>
							<Argument PropertyKey='Name' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnShow'
						Type='cButton'
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
						Type='cButton'
						Container='spnHide'
						Image='hide.gif'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='HideSearchParameters'/>
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
					<Control ID='btnFind'
						Type='cButton'
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
								<Argument Value='Applicants'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GPRList' DataObjectDefinitionKey='vReviewApplicants' Updatable='False' GetData='False'>
			<Filters>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'/>
				<Argument PropertyKey='FirstName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						DataObjectDefinitionKey='vReviewApplicants'
						MaxPerPage='25'
						SeparatorWidth='2'>
						<HeaderHtml>
							Search Results
						</HeaderHtml>
						<InstructionHtml>
						The results of your search are listed below. To view and manage 
						information on an applicant, select an option from the Action 
						drop-down list and click on the <b>Go</b> button.
						</InstructionHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' Width='200'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'
								Load='Static'>
								<Filters>
									<Argument PropertyKey='DataObjectDefinitionKey' Value='Applicants'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
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
										<Argument Type='DataObject' TypeKey='GranteeProjectReviewStageID' AttributeName='GranteeProjectReviewStageID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LastNameFirstNameMiddleName' ColumnHeader='Applicant Name' >
							<Sortable>
								<Argument PropertyKey='LastName'/>
								<Argument PropertyKey='FirstName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' >
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewCycleStage.Name' ColumnHeader='Review Stage' >
							<Sortable>
								<Argument PropertyKey='Name'>
									<RelatedProperty PropertyKey='ReviewCycleStage'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AverageRating' ColumnHeader='Average Rating' Format='#.0###' >
							<Sortable>
								<Argument PropertyKey='AverageRating'/>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
