<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Reviewers.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Reviews.cReviewers" %>
<%@ register Tagprefix='Core' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIABLE CONTENT AREA -->
The Reviews section allows you to administer all activities related to the application review process.
These activities include:
<ul>
	<li>Searching for Reviewer contacts,</li>
	<li>Managing committees,</li>
	<li>Configuring application review stages, and</li>
	<li>Managing review stage applicant outcomes.</li>
</ul>
To search for a reviewer:
<ul>
	<li>Enter or select search criteria into the Easylist Search section and click on the <b>Find</b> button.</li>
	<li>To view and manage information on the contact, select an option from the Action drop-down list and
	click <b>Go</b>.</li>
</ul>
To perform a new search, click the arrow next to the Easylist.  (Only contacts checked as a reviewer in their
contact record will be displayed in the results set.)
<p></p>

<Core:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='Reviewers' LinkTitle='Reviewers Easylist' runat='server' />

<table width='100%' runat='server'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			 <span runat='server' id='spnHide' visible='true'/><span runat='server' id='spnShow' visible='true'/>Easylist Search
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
		<td>
			Last Name
		</td>
		<td>
			<span runat='server' id='spnLastName'/>
		</td>
	</tr>
	<tr>
		<td>
			First Name
		</td>
		<td>
			<span runat='server' id='spnFirstName'/>
		</td>
	</tr>
	<tr>
		<td>
			E-mail
		</td>
		<td>
			<span runat='server' id='spnEmail'/>
		</td>
	</tr>
	<tr>
		<td>
			Committee
		</td>
		<td>
			<span runat='server' id='spnCommittee'/>
		</td>
	</tr>
	<tr>
		<td>
			<%=GetLabel("Organization")%>
		</td>
		<td>
			<span runat='server' id='spnInstitution'/>
		</td>
	</tr>
	<tr>
		<td>
			Status
		</td>
		<td>
			<span runat='server' id='spnReviewerStatus'/>
		</td>
	</tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnFind'/>
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
			<ResultList Key='ReviewerList'>Reviewer</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlLastName'
						Type='cTextBox'
						Container='spnLastName'
						FilterKey='LastName'>
							<FilterList List='ReviewerList' Property='Person.LastName'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlFirstName'
						Type='cTextBox'
						Container='spnFirstName'
						FilterKey='FirstName'>
							<FilterList List='ReviewerList' Property='Person.FirstName'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEmail'
						Type='cTextBox'
						Container='spnEmail'
						FilterKey='Email'>
							<FilterList List='ReviewerList' Property='Person.Email.ContactValue1'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCommittee'
						Type='cDropDown'
						Container='spnCommittee'
						DataObjectDefinitionKey='ReviewCommittee'
						StoredValue='ReviewCommitteeID'
						DisplayValue='ReviewCommitteeDescription'
						FilterKey='ReviewCommitteeID'>
							<FilterList List='ReviewerList' Property='ReviewCommitteeID'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlInstitution'
						Type='cTextBox'
						Container='spnInstitution'
						FilterKey='Organization'
						Size='40'>
							<FilterList List='ReviewerList' Property='Person.PersonPrimaryAffiliations.Organization.CommonOrganizationName'/>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewerStatus'
						Type='cDropDown'
						Container='spnReviewerStatus'
						DataObjectDefinitionKey='ReviewerStatus'
						StoredValue='ReviewerStatusID'
						DisplayValue='Abbr'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='ReviewerStatus'>
							<FilterList List='ReviewerList' Property='Person.PersonReviewer.ReviewerStatusID'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnShow'
						Type='cButton'
						Container='spnShow'
						Image='Show'>
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
						Image='Hide'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='HideSearchParameters'/>
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
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewerList' DataObjectDefinitionKey='ReviewCommitteeMember' Updatable='False' GetData='False'>
			<Filters>
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName'>
					<RelatedProperty PropertyKey='Person' Alias='sort_Person'/>
				</Argument>
				<Argument PropertyKey='FirstName'>
					<RelatedProperty PropertyKey='Person' Alias='sort_Person' Join='None'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						DataObjectDefinitionKey='Person'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Reviewers Search Results
						</HeaderHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='ReviewCommitteeMember'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
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
										<Argument Type='DataObject' TypeKey='ReviewCommitteeMemberID' AttributeName='ReviewCommitteeMemberID' />
										<ActionParameters>
											<Argument Type='DataObject' TypeKey='ReviewCommitteeID' AttributeName='ReviewCommitteeID'/>
											<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID'/>
										</ActionParameters>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Name'/>
						<DisplayProperty PropertyKey='ReviewCommittee.ReviewCommitteeDescription' ColumnHeader='Committee'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
