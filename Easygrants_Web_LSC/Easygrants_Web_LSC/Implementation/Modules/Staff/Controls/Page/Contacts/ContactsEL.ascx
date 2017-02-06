<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ContactsEL.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Contacts.cContactsEL" EnableViewState="false" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader1" />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' AutoVDateType='Root' Key='ContactsEasylist'
	LinkTitle='Contacts Easylist' runat='server' />
	

<table id='tbAddContact' width='100%' border='0' cellspacing='0' cellpadding='2' runat='server' visible='true'>
	<tr class='SeparatorHdg'>
		<td  colspan='2'><b>Add Contact Record</b></td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
	</tr>	
	<tr>		
		<td width='12%'><span runat='server' id='spnPersonOrg'></span></td>
		<td><span runat='server' id='spnAdd'></span></td>
	</tr>	
	<tr>
		<td colspan='2'>&nbsp;</td>
	</tr>	
</table>
<table id="Table1" width='100%' runat='server' visible='true' cellspacing='0' cellpadding='2'>
	<tr class='SeparatorHdg'>
		<td colspan='2'>
			<span runat='server' id='spnHide' visible='true' /><span runat='server' id='spnHideLink' visible='true' />
			<span runat='server' id='spnShow' visible='true' /><span runat='server' id='spnShowLink' visible='true' />
		</td>
	</tr>
</table>
<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width='20%'>
			Last Name
		</td>
		<td>
			<span runat='server' id='spnLastName' />
		</td>
	</tr>
	<tr>
		<td width='20%'>
			First Name
		</td>
		<td>
			<span runat='server' id='spnFirstName' />
		</td>
	</tr>
	<tr>
		<td width='20%'>
			<%=GetLabel("Organization")%>
		</td>
		<td>
			<span runat='server' id='spnCommonOrgName' />
		</td>
	</tr>
	<tr>
		<td width='20%'>
			Recipient ID
		</td>
		<td>
			<span runat='server' id='spnRecipientID' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align='left'>
			&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnFind' />
			&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClear' />
		</td>
	</tr>
</table>
<table id='tbAdvSearch' width='100%' runat='server' visible='true'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width='20%'>
			<span runat='server' id='spnAdvancedSearch' />
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width='100%'>
	<span runat='server' id='spnPerContent' visible='false'>
		<tr class='SeparatorHdg'>
			<td colspan='2'>
				Person Results
			</td>
		</tr>
	</span>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnPerList' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnNoResult' />
		</td>
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
			<ResultList Key='PerList'>People</ResultList>
			<ResultList Key='OrgList' noresultspan='spnOrgNoResults'>~~Organization~~</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<Filters></Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtCommonOrgName' Type='cTextBox' Size='25' Container='spnCommonOrgName' FilterKey='CommonOrganizationName' MaxLength='100'>
						<FilterList List='PerList' Property='PersonOrganizationAffiliations.Organization.CommonOrganizationName' />
						<FilterList List='OrgList' Property='CommonOrganizationName' />
						<FilterList List='OrgList' Property='OrganizationName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtRecipientID' Type='cTextBox' Size='25' Container='spnRecipientID' FilterKey='LegacyOrganizationID' MaxLength='100'>
						<FilterList List='PerList' Property='PersonOrganizationAffiliations.Organization.LegacyOrganizationID' />
						<FilterList List='OrgList' Property='LegacyOrganizationID' />
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
					<Control ID='btnFind' Type='cButton' Container='spnFind' Image='Find' EnterKey='True'>
						<Action PostBack='True' Object='ModulePageContent' Method='FilterDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear' Type='cButton' Container='spnClear' Image='Clear'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Contacts' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPersonOrg' Container='spnPersonOrg' Type='cDropDown' ParamList='AddPerson|Person~AddOrganization|Organization'
						Separator='~' SubSeparator='|' DisplayValue='ActionName' DisplayNone='False'>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='Page' PropertyKey='PageKey' />
						</SelectedValue>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' Type='cButton' Image='Add' Container='spnAdd'>
						<Action PostBack='True' Object='DataPresenter' Method='AddContact_Click'>
							<Parameters>
								<Argument Type='Control' TypeKey='ctlPersonOrg' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty>
					<Control ID='ctlAdvancedSearch'
						Container='spnAdvancedSearch'
						Type='cLink'
						Caption='Advanced Search...'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='AdvancedContactsEL'/>
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
					<Control ID='lnkShow' Type='cLink' Container='spnShowLink' Caption='Contacts Quick Search'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHide' Type='cButtonImage' Container='spnHide' Image='Hide.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHide' Type='cLink' Container='spnHideLink' Caption='Contacts Quick Search'>
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
						<DisplayProperty PropertyKey='' ColumnHeader='' NoWrap='True' Width='21%'>
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
						<DisplayProperty PropertyKey='PersonPrimaryAffiliation.Organization.LegacyOrganizationID' ColumnHeader='Recipient ID' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LegacyOrganizationID' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PersonID' ColumnHeader='Person ID' Width='20%'>
							<Sortable>
								<Argument PropertyKey='PersonID' />
							</Sortable>
						</DisplayProperty>
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
                         <DisplayProperty PropertyKey='CommonOrganizationName' ColumnHeader='Common ~~Organization~~ Name' width='30%'>
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
						<DisplayProperty PropertyKey='OrganizationID' ColumnHeader='~~Organization~~ ID' Width='10%'>
							<Sortable>
								<Argument PropertyKey='OrganizationID' />
							</Sortable>
						</DisplayProperty>
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left'>
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

