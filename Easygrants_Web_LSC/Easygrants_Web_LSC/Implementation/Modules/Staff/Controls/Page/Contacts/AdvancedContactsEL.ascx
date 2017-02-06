<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="AdvancedContactsEL.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Contacts.cAdvancedContactsEL" EnableViewState="false" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader1" />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' AutoVDateType='Root' Key='ContactsEasylist'
	LinkTitle='Contacts Easylist' runat='server' />
<table id="Table1" width='100%' runat='server' visible='true'>
	<tr class='SeparatorHdg'>
		<td colspan='2'>
			<span runat='server' id='spnHide' visible='true' /><span runat='server' id='spnHideLink' visible='true' />
			<span runat='server' id='spnShow' visible='true' /><span runat='server' id='spnShowLink' visible='true' />
		</td>
	</tr>
</table>
<table id='tbSearchParameters' width='100%' runat='server' visible='true' >
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width='20%'><b>Search Type</b></td>
		<td>
			<asp:DropDownList runat='server' id='drpSearchType'>
				<asp:ListItem text='Person and ~~Organization~~' value='Both' />
				<asp:ListItem text='Person Only' value='OrgList' />
				<asp:ListItem text='~~Organization~~ Only' value='PerList' />
			</asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td width='30%'><b>Last Name</b></td>
		<td><span runat='server' id='spnLastName' /></td>
	</tr>
	<tr>
		<td width='30%'><b>First Name</b></td>
		<td><span runat='server' id='spnFirstName' /></td>
	</tr>
	<tr>
	    <td width='30%'><b>E-mail</b></td>
		<td><span runat='server' id='spnEmail' /></td>
	</tr>
	<tr>
		<td width='30%'><b>Person ID</b></td>
		<td><span runat='server' id='spnPersonID' /></td>
	</tr>
	<tr>
		<td width='30%'><b><%=GetLabel("Organization")%> ID</b></td>
		<td><span runat='server' id='spnOrgID' /></td>
	</tr>
	<tr>
		<td width='30%'><b>Legal <%=GetLabel("Organization")%> Name</b></td>
		<td><span runat='server' id='spnOrg' /></td>
	</tr>
	<tr>
		<td width='30%'><b>Recipient ID</b></td>
		<td><span runat='server' id='spnRecipientID' /></td>
	</tr>
	<tr>
		<td width='30%'><b>Common <%=GetLabel("Organization")%> Name</b></td>
		<td><span runat='server' id='spnCommonOrgName' /></td>
	</tr>
	<tr>
		<td width='30%'><b>Employer Identification Number (EIN)</b></td>
		<td><span runat='server' id='spnEIN' /></td>
	</tr>
	<tr>
		<td width='30%'><b>City</b></td>
		<td><span runat='server' id='spnCity' /></td>
	</tr>
	<tr>
		<td width='30%'><b>State</b></td>
		<td><span runat='server' id='spnState' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td >
			<span runat='server' id='spnFind' />&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnClear' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td ><span runat='server' id='spnQuickSearch' /></td>
	</tr>
</table>
<table width='100%'>
	<span runat='server' id='spnPerContent' visible='false'>
		<tr class='SeparatorHdg'>
			<td colspan='2'>Person Results</td>
		</tr>
	</span>
	<tr>
		<td colspan='2'><span runat='server' id='spnPerList' /></td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnNoResult' /></td>
	</tr>
	<span runat='server' id='spnOrgContent' visible='false'>
			<tr class='SeparatorHdg'>
				<td colspan='2'>
					<%=GetLabel("Organization")%> Results
				</td>
			</tr>
	</span>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnOrgList' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnOrgNoResults' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<ResultLists>
			<ResultList Key='PerList' >People</ResultList>
			<ResultList Key='OrgList' noresultspan='spnOrgNoResults'>~~Organization~~</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<Filters></Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrgID' Type='cTextBox' Size='5' Container='spnOrgID' AllowNumbersOnly='True' FilterKey='OrganizationID'>
						<FilterList List='PerList' Property='PersonOrganizationAffiliations.Organization.OrganizationID' />
						<FilterList List='OrgList' Property='OrganizationID' />
						<Validation Type='RegularExpression' ValidationExpression='^\d+$' ErrorMessage='The ~~Organization~~ ID must be a numeric value with no commas, dollar signs, or decimal places.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrg' Type='cTextBox' Container='spnOrg' Size='25' FilterKey='OrganizationName' MaxLength='100'>
						<FilterList List='PerList' Property='PersonOrganizationAffiliations.Organization.OrganizationName' />
						<FilterList List='OrgList' Property='OrganizationName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtCommonOrgName' Type='cTextBox' Size='25' Container='spnCommonOrgName' FilterKey='CommonOrganizationName' MaxLength='100'>
						<FilterList List='PerList' Property='PersonOrganizationAffiliations.Organization.CommonOrganizationName' />
						<FilterList List='OrgList' Property='CommonOrganizationName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtRecipientID' Type='cTextBox' Size='25' Container='spnRecipientID' FilterKey='LegacyOrganizationID' MaxLength='100'>
						<FilterList List='PerList' Property='PersonOrganizationAffiliations.Organization.LegacyOrganizationID' />
						<FilterList List='OrgList' Property='LegacyOrganizationID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtEIN' Type='cTextBox' Container='spnEIN' Size='15' FilterKey='EIN'>
						<FilterList List='PerList' Property='PersonOrganizationAffiliations.Organization.EIN' />
						<FilterList List='OrgList' Property='EIN' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtCity' Type='cTextBox' Container='spnCity' Size='20' FilterKey='City'>
						<FilterList List='PerList' Property='PrimaryAddress.City' />
						<FilterList List='OrgList' Property='PrimaryAddress.City' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlState' Type='cDropDown' Container='spnState' DataObjectDefinitionKey='State'
						StoredValue='StateID' DisplayValue='Description' DisplayNone='False' DisplayText='All'
						FilterKey='StateID'>
						<FilterList List='PerList' Property='PrimaryAddress.State.StateID' />
						<FilterList List='OrgList' Property='PrimaryAddress.State.StateID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtPersonID' Type='cTextBox' Size='5' Container='spnPersonID'  AllowNumbersOnly='True' FilterKey='PersonID'>
						<FilterList List='PerList' Property='PersonID' />
						<FilterList List='OrgList' Property='PersonOrganizationAffiliations.Person.PersonID' />
						<Validation Type='RegularExpression' ValidationExpression='^\d+$' ErrorMessage='The Person Contact ID must be a numeric value with no commas, dollar signs, or decimal places.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLastName' Type='cTextBox' Size='20' Container='spnLastName' FilterKey='LastName'>
						<FilterList List='PerList' Property='LastName' />
						<FilterList List='OrgList' Property='PersonOrganizationAffiliations.Person.LastName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtFirstName' Type='cTextBox' Size='20' Container='spnFirstName' FilterKey='FirstName'>
						<FilterList List='PerList' Property='FirstName' />
						<FilterList List='OrgList' Property='PersonOrganizationAffiliations.Person.FirstName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtEmail' Type='cTextBox' Size='25' Container='spnEmail' FilterKey='PrimaryEmail'>
						<FilterList List='PerList' Property='PersonPrimaryEMail.ContactValue1' />
						<FilterList List='OrgList' Property='PrimaryEmail.ContactValue1' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind' Type='cButton' Container='spnFind' Image='Find' EnterKey='True'>
						<Action PostBack='True' Object='ModulePageContent' Method='FilterDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear' Type='cButton' Container='spnClear' Image='Clear'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='AdvancedContactsEL' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty>
					<Control ID='ctlQuickSearch'
						Container='spnQuickSearch'
						Type='cLink'
						Caption='Quick Search...'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Contacts'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnShow' Type='cButtonImage' Container='spnShow' Image='Show.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkShow' Type='cLink' Container='spnShowLink' Caption='Advanced Search Criteria'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHide' Type='cButtonImage' Container='spnHide' Image='Hide.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHide' Type='cLink' Container='spnHideLink' Caption='Advanced Search Criteria'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='PerList' DataObjectDefinitionKey='Person' Updatable='False' GetData='False'>
			<Filters></Filters>
			<Sort>
				<Argument PropertyKey='LastName' />
				<Argument PropertyKey='FirstName' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlPerList' Type='cDataListCtl' Container='spnPerList' DataObjectDefinitionKey='Person'
						SeparatorWidth='2' MaxPerPage='10'>
						<HeaderHtml></HeaderHtml>
						<InstructionHtml></InstructionHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='' NoWrap='True' Width='20%'>
							<Control ID='ctlPerActions' Type='cDropDown' DataObjectDefinitionKey='EasylistAction' StoredValue='EasylistActionID'
								DisplayValue='EasylistAction' DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='Person'>
										<RelatedProperty PropertyKey='EasylistActionType' />
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnPerGo' Type='cButton' Image='Go'>
								<Action PostBack='True' Object='DataPresenter' Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl' />
										<Argument Type='Object' ObjectType='EventSource' />
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' />
										<Argument Value='ctlPerList' />
										<Argument Value='ctlPerActions' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Name' Width='29%'>
							<Control ID='ctlLink' Type='cLink'>
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
								<Argument PropertyKey='LastName' />
								<Argument PropertyKey='FirstName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.CommonOrganizationName' ColumnHeader='Primary ~~Organization~~'  Width='30%'>
							<Control ID='ctlLinkOrganizationName'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObjectRelated' TypeKey='PersonPrimaryAffiliation.OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='PersonPrimaryAffiliation.Organization' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.LegacyOrganizationID' ColumnHeader='Recipient ID' Width='30%'>
							<Sortable>
								<Argument PropertyKey='LegacyOrganizationID' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PersonID' ColumnHeader='Person ID' Width='30%'>
							<Sortable>
								<Argument PropertyKey='PersonID' />
							</Sortable>
						</DisplayProperty>
						<!--
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left'>
							<Parameters>
								<Argument Value='1' ValueKey='WfTaskAssignmentsIncomplete.WfTaskStatusID' DisplayValue='' />
								<Argument Value='2' ValueKey='WfTaskAssignmentsCompleted.WfTaskStatusID' DisplayValue='' />
								<Argument Value='' ValueKey='WfTaskAssignment.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this item?'>
										<Action PostBack='True' Object='EventController' Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' Value='' />
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='User'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='Email'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='Phone'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='Address'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='WebAddress'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='PersonOrganizationAffiliation'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='ContactCategoryMember'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='Notes'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='WfTaskAssignment'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
														</RelationshipProperties>
													</RelatedDataObject>
												</RelatedDataObjects>
											</Parameters>
										</Action>
									</Control>
								</Argument>
								<Argument Value='3' ValueKey='WfTaskAssignmentsNotActive.WfTaskStatusID' DisplayValue='Control'>
									<Control ID='btnDelete2' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this item?'>
										<Action PostBack='True' Object='EventController' Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' Value='' />
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='User'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='Email'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='Phone'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='Address'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='WebAddress'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='PersonOrganizationAffiliation'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='ContactCategoryMember'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='Notes'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='EntityID' />
															<RelationshipProperty aValue='1' childProperty='EntityTypeID' />
														</RelationshipProperties>
													</RelatedDataObject>
													<RelatedDataObject DataObjectDefinitionKey='WfTaskAssignment'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonID' childProperty='PersonID' />
														</RelationshipProperties>
													</RelatedDataObject>
												</RelatedDataObjects>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						-->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='OrgList' DataObjectDefinitionKey='Organization' Updatable='False' GetData='False'>
			<Filters></Filters>
			<Sort>
				<Argument PropertyKey='CommonOrganizationName' Direction='Ascending' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOrgList' Type='cDataListCtl' Container='spnOrgList' DataObjectDefinitionKey='Organization'
						SeparatorWidth='2' MaxPerPage='10'>
						<HeaderHtml></HeaderHtml>
						<InstructionHtml></InstructionHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='' NoWrap='True' Width='20%'>
							<Control ID='ctlOrgActions' Type='cDropDown' DataObjectDefinitionKey='EasylistAction' StoredValue='EasylistActionID'
								DisplayValue='EasylistAction' DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='Organization'>
										<RelatedProperty PropertyKey='EasylistActionType' />
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnOrgGo' Type='cButton' Image='Go'>
								<Action PostBack='True' Object='DataPresenter' Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl' />
										<Argument Type='Object' ObjectType='EventSource' />
										<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' />
										<Argument Value='ctlOrgList' />
										<Argument Value='ctlOrgActions' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
                         <DisplayProperty PropertyKey='CommonOrganizationName' ColumnHeader='Common ~~Organization~~ Name' Width='30%'>
                            <Control ID='ctlLinkCommonOrganizationName' Type='cLink'>
                               <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                                    <Parameters>
                                        <Argument AttributeName='PageKey' Value='OrganizationContact'/>
                                        <Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
                                    </Parameters>
                                </Action>
							</Control>
                            <Sortable>
                                <Argument PropertyKey='CommonOrganizationName' />
                            </Sortable>
                        </DisplayProperty>
					    <DisplayProperty PropertyKey='LegacyOrganizationID' ColumnHeader='Recipient ID' Width='12%'>
							<Sortable>
								<Argument PropertyKey='LegacyOrganizationID' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EIN' ColumnHeader='EIN' Width='12%'>
							<Sortable>
								<Argument PropertyKey='EIN' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PrimaryAddress.City' ColumnHeader='City' Width='13%'>
							<Sortable>
								<Argument PropertyKey='City'>
									<RelatedProperty PropertyKey='PrimaryAddress' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PrimaryAddress.State.Description' ColumnHeader='State' Width='15%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='PrimaryAddress.State' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationID' ColumnHeader='Org ID' Width='10%'>
							<Sortable>
								<Argument PropertyKey='OrganizationID' />
							</Sortable>
						</DisplayProperty>
						<!--<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left'>
							<Control ID='btnDelete' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this item?'>
								<Action PostBack='True' Object='EventController' Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' Value='' />
										<RelatedDataObjects>
											<RelatedDataObject DataObjectDefinitionKey='Email'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
													<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='Phone'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
													<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='Address'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
													<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
												</RelationshipProperties>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='PersonOrganizationAffiliation'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='OrganizationID' childProperty='OrganizationID' />
												</RelationshipProperties>
												<RelatedDataObjects>
													<RelatedDataObject DataObjectDefinitionKey='PersonOrganizationAffiliationEMF'>
														<RelationshipProperties>
															<RelationshipProperty parentProperty='PersonOrganizationAffiliationID' childProperty='PersonOrganizationAffiliationID' />
														</RelationshipProperties>
													</RelatedDataObject>
												</RelatedDataObjects>
											</RelatedDataObject>
											<RelatedDataObject DataObjectDefinitionKey='Notes'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='OrganizationID' childProperty='EntityID' />
													<RelationshipProperty aValue='2' childProperty='EntityTypeID' />
												</RelationshipProperties>
											</RelatedDataObject>
										</RelatedDataObjects>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>-->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

