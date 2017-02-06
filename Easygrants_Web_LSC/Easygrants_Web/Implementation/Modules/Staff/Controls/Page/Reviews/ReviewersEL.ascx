<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Reviews.cReviewersEL" %>
<%@ register Tagprefix='Core' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>

<Core:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='' visible='true'
	AutoVDateType='Root' Key='Reviewers' LinkTitle='Reviewers Easylist' runat='server' />


<table width='100%' runat='server' cellpadding='2' cellspacing='0'>
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
<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
	<tr>
		<td colspan='3'>&nbsp;</td>
	</tr>
	<tr>
		<td width='25'>&nbsp;</td>
		<td width='15%' > 
			<b>Last Name</b>
		</td>
		<td>
			<span runat='server' id='spnLastName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>First Name</b>
		</td>
		<td>
			<span runat='server' id='spnFirstName'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b><%=GetLabel("Organization")%></b>
		</td>
		<td>
			<span runat='server' id='spnInstitution'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>E-mail</b>
		</td>
		<td>
			<span runat='server' id='spnEmail'/>
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
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Reviewer Status</b>
		</td>
		<td>
			<span runat='server' id='spnReviewerStatus'/>
		</td>
	</tr>
	<tr>
		<td colspan='3'>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='3'>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='3' align='center'>
			<span runat='server' id='spnFind'/>&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClear'/>
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
						FilterKey='LastName' 
						MaxLength='100'>
							<FilterList List='ReviewerList' Property='LastName'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlFirstName'
						Type='cTextBox'
						Container='spnFirstName'
						FilterKey='FirstName'
						MaxLength='100'>
							<FilterList List='ReviewerList' Property='FirstName'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEmail'
						Type='cTextBox'
						Container='spnEmail'
						FilterKey='Email'
						MaxLength='100'>
							<FilterList List='ReviewerList' Property='PrimaryEmailAddress'/>
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
							<FilterList List='ReviewerList' Property='ReviewCommitteeID'/>
						<Sort>
							<Argument PropertyKey='ReviewCommitteeDescription' Direction='Ascending'>
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlInstitution'
						Type='cTextBox'
						Container='spnInstitution'
						FilterKey='Organization'
						MaxLength='100'
						Size='40'>
							<FilterList List='ReviewerList' Property='Organization.CommonOrganizationName'/>
							
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
							<FilterList List='ReviewerList' Property='ReviewerStatusID'/>
						<Sort>
							<Argument PropertyKey='Abbr' Direction='Ascending'>
							</Argument>
						</Sort>
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
						Container='spnFind' EnterKey='True'
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
								<Argument Value='Reviewers'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ReviewerList' DataObjectDefinitionKey='EasylistReviewsReviewersView' Updatable='False' GetData='False'>
			<Filters>
			</Filters> 
			<Sort>
				<Argument PropertyKey='LastNameFirstNameMiddleName'> </Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						DataObjectDefinitionKey='Reviewers'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml>
							Reviewers Search Results
						</HeaderHtml>
						<!--<InstructionHtml>
							Select from the <b>Action</b> options list and click <b>Go</b> to view/edit
							the person contact information, login as or send this person an e-mail.
							Click on any blue column name link to sort the results alphabetically by that column.
							<br />
						</InstructionHtml>-->
						<DisplayProperty PropertyKey='' ColumnHeader='Action' Width='15%'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='Reviewers'>
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
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' />
										<Argument Value='ctlList'/>
										<Argument Value='ctlActions'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LastNameFirstNameMiddleName' ColumnHeader='Reviewer' Width='20%' >
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
								<Argument PropertyKey='LastNameFirstNameMiddleName'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='Reviewer ~~Organization~~' Width='30%' >
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
						<DisplayProperty PropertyKey='ReviewCommitteeDescription' ColumnHeader='Committee' Width='10%'>
							<Sortable>
								<Argument PropertyKey='ReviewCommitteeDescription'/>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
