<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantsEL.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Grants.cGrantsEL" %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader1" />
<!-- USER MODIFIABLE CONTENT AREA -->

<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' AutoVDateType='Root' Key='Grants'
	LinkTitle='Grants Easylist' runat='server' />
<table id="Table1" width='100%' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
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
		<td><b>Funding Source</b></td>
		<td>
			<span runat='server' id='spnProgram' />
		</td>
	</tr>
	<tr>
		<td><b>Recipient ID</b></td>
		<td>
			<span runat='server' id='spnRecipientID' />
		</td>
	</tr>
	<tr>
		<td><b>Grantee Organization</b></td>
		<td>
			<span runat='server' id='spnOrg' />
		</td>
	</tr>
	<tr>
		<td><b>State</b></td>
		<td>
			<span runat='server' id='spnstate' />
		</td>
	</tr>
	<tr>
		<td><b>TIG/PBIF Number</b></td>
		<td>
			<span runat='server' id='spnTIGNumber' />
		</td>
	</tr>
	<tr>
		<td><b>Initial Award Year</b></td>
		<td>
			<span runat='server' id='spnAwardYear' />
		</td>
	</tr>
	<tr>
		<td><b>Service Area</b></td>
		<td>
			<span runat='server' id='spnServiceArea' />
		</td>
	</tr>
	<tr>
		<td><b>Grant Status</b></td>
		<td>
			<span runat='server' id='spnGrantsStatus' />
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnPurpose' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnFind' />&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnClear' />
		</td>
	</tr>
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
	<tr class='SeparatorHdg'>
		<td >
			Add Grant Record
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align='left'>
			<span runat='server' id='spnAdd' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table width="100%">
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnGrantList' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnNoResult' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<ResultLists>
			<ResultList Key='GrantList'>Grant</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtGrantNumber' Type='cTextBox' MaxLength='6' Container='spnRecipientID' AllowNumbersOnly='True' FilterKey='RecipientID'>
						<FilterList List='GrantList' Property='RecipientID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantsStatus' Type='cDropDown' Container='spnGrantsStatus' DataObjectDefinitionKey='GrantStatus'
						StoredValue='GrantStatusID' DisplayValue='Abbr' DisplayNone='False' DisplayText='All'
						FilterKey='GrantStatus.GrantStatusID'>
						<FilterList List='GrantList' Property='GrantStatusID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram' Type='cDropDown' Container='spnProgram' DataObjectDefinitionKey='Program'
						StoredValue='ProgramID' DisplayValue='ProgramDisplayName' DisplayNone='False' DisplayText='All'
						FilterKey='ProgramID'>
						<FilterList List='GrantList' Property='ProgramID' />
						<Sort>
							<Argument PropertyKey='ProgramDisplayName' Direction='Ascending'>
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrg' Type='cTextBox' Container='spnOrg' FilterKey='OrganizationName'>
						<FilterList List='GrantList' Property='OrganizationName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtTIG' Type='cTextBox' Container='spnTIGNumber' FilterKey='LegacyGrantID'>
						<FilterList List='GrantList' Property='LegacyGrantID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAwardYear' Type='cDropDown' Container='spnAwardYear' DataObjectDefinitionKey='TimePeriod' 
						StoredValue='TimePeriodID' DisplayValue='SortOrder' DisplayNone='False' DisplayText='All'
						FilterKey='TimePeriodID'>
						<FilterList List='GrantList' Property='TimePeriodID' />
						<Sort>
							<Argument PropertyKey='SortOrder' Direction='Descending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtServiceArea' Type='cDropDown' Container='spnServiceArea' DataObjectDefinitionKey='Competition' 
						StoredValue='CompetitionID' DisplayValue='CompetitionName' DisplayNone='False' DisplayText='All'
						FilterKey='CompetitionID'>
						<FilterList List='GrantList' Property='CompetitionID' />
						<Sort>
							<Argument PropertyKey='CompetitionName' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtState' Type='cDropDown' Container='spnstate' DataObjectDefinitionKey='State' 
						StoredValue='StateID' DisplayValue='Description' DisplayNone='False' DisplayText='All'
						FilterKey='StateID'>
						<FilterList List='GrantList' Property='StateID' />
						<Filters>
			                <Argument  TypeKey='StateID' PropertyKey='CountryID' Value='280' />
		                </Filters>
						<Sort>
							<Argument PropertyKey='Description' Direction='Ascending' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnShow' Type='cButtonImage' Container='spnShow' Image='Show.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkShow' Type='cLink' Container='spnShowLink' Caption='Grants Quick Search'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHide' Type='cButtonImage' Container='spnHide' Image='Hide.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHide' Type='cLink' Container='spnHideLink' Caption='Grants Quick Search'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind' Type='cButton' Container='spnFind' Image='Find'>
						<Action PostBack='True' Object='ModulePageContent' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear' Container='spnClear' Type='cButton' Image='Clear'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Staff' />
								<Argument Type='' TypeKey='' Value='ModuleConfig' />
								<Argument Type='' TypeKey='' Value='GrantsEL' />
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
								<Argument Value='AdvancedGrantsEL'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
                <DisplayProperty PropertyKey=''>
                   <Control ID='ctlAdd' Container='spnAdd' Type='cButton' Caption='Add Grant'>
                       <Action PostBack='True' Object='EventController'  Method='EventController_NavigateToModulePageKey'>
                            <Parameters>
                                <Argument AttributeName='PageKey' Value='AddGrants'/>
                                <Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=0'/>  
                                <Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/> 
                           </Parameters>
                       </Action>
                   </Control>
                </DisplayProperty> <!----> 				
				<!--<DisplayProperty PropertyKey=''>
					<Control ID='txtFirstName' Type='cTextBox' Container='spnFirstName' FilterKey='FirstName'>
						<FilterList List='GrantList' Property='FirstName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtMiddleName' Type='cTextBox' Container='spnMiddleName' FilterKey='MiddleName'>
						<FilterList List='GrantList' Property='MiddleName' />
					</Control>
				</DisplayProperty>-->
				<!--<DisplayProperty PropertyKey=''>
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
							Method='FilterListDataPresenter_Find'/>
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey=''>
					<Control ID='txtInstitutionalComponent' Type='cTextBox' Container='spnInstitutionalComponent'
						FilterKey='InstitutionalComponent'>
						<FilterList List='GrantList' Property='InstitutionalComponent' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtEmail' Type='cTextBox' Container='spnEmail' FilterKey='PrimaryEmail'>
						<FilterList List='GrantList' Property='PrimaryEmailAddress' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCompetition' Type='cDropDown' Container='spnCompetition' DataObjectDefinitionKey='Competition'
						StoredValue='CompetitionID' DisplayValue='CompetitionDisplayName' DisplayNone='False'
						DisplayText='All' FilterKey='CompetitionID'>
						<FilterList List='GrantList' Property='CompetitionID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProject' Type='cDropDown' Container='spnProject' DataObjectDefinitionKey='WfProject'
						StoredValue='WfProjectID' DisplayValue='WfProjectName' DisplayNone='False' DisplayText='All'
						FilterKey='WfProjectID'>
						<FilterList List='GrantList' Property='WfProjectID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTask' Type='cDropDown' Container='spnTask' DataObjectDefinitionKey='WfTask'
						StoredValue='WfTaskID' DisplayValue='WfTaskAbbr' DisplayNone='False' DisplayText='All'
						FilterKey='WfProjectTask.WfTaskID'>
						<Filters>
							<Argument PropertyKey='WfTaskTypeID' Value='1' />
						</Filters>
						<FilterList List='GrantList' Property='WfTaskID' />
					</Control>
				</DisplayProperty>-->
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantsStatus' Type='cDropDown' Container='spnGrantsStatus' DataObjectDefinitionKey='GrantStatus'
						StoredValue='GrantStatusID' DisplayValue='Abbr' DisplayNone='False' DisplayText='All'
						FilterKey='GrantStatus.GrantStatusID'>
						<FilterList List='GrantList' Property='GrantStatusID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind' Type='cButton' Container='spnFind' Image='Find' EnterKey='True'>
						<Action PostBack='True' Object='ModulePageContent' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear' Container='spnClear' Type='cButton' Image='Clear'>
						<Action PostBack='True' Object='WebSession' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Staff' />
								<Argument Type='' TypeKey='' Value='ModuleConfig' />
								<Argument Type='' TypeKey='' Value='GrantsEL' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GrantList' DataObjectDefinitionKey='LscGrantsEasylist' Updatable='False' GetData='False'>
			<Filters>
				<%--<Argument Group='(' />
				<Argument Type='' TypeKey='' PropertyKey='WfProjectOutcomeID' Value='2' Bool='' />
				<!--
				<Argument Type='' TypeKey='' PropertyKey='WfProjectOutcomeID' Value='2' Bool='Or'>
					<RelatedProperty PropertyKey='AppGranteeProject'/>
				</Argument>-->
				<Argument Group=')' Bool='' />--%>
			</Filters>
			<Sort>
			    <Argument Type='' TypeKey='' PropertyKey='OrganizationName' Direction='Ascending'>
			    </Argument>
			    <Argument Type='' TypeKey='' PropertyKey='ServiceArea' Direction='Ascending'>
			    </Argument>
			    <Argument Type='' TypeKey='' PropertyKey='LegacyGrantID' Direction='Ascending'>
			    </Argument>
				<Argument Type='' TypeKey='' PropertyKey='PrimaryContactLast' Direction='Ascending'>
				<!--	<RelatedProperty PropertyKey='PrimaryPerson' /> -->
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='PrimaryContactFirst' Direction='Ascending'>
				<!--	<RelatedProperty PropertyKey='PrimaryPerson' /> -->
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGrantList' Type='cDataListCtl' Container='spnGrantList' DataObjectDefinitionKey='EasylistGrantsView'
						SeparatorWidth='2' MaxPerPage='10'>
						<HeaderHtml>
							Grant Search Results
						</HeaderHtml>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='200'>
							<Control ID='ctlGrantActions' Type='cDropDown' DataObjectDefinitionKey='EasylistAction' StoredValue='EasylistActionID'
								DisplayValue='EasylistAction' DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='Grants'>
										<RelatedProperty PropertyKey='EasylistActionType' />
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey='SortOrder' Direction='Ascending'>
										<RelatedProperty PropertyKey='EasylistActionType' />
									</Argument>
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGrantGo' Type='cButton' Image='Go'>
								<Action PostBack='True' Object='DataPresenter' Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl' />
										<Argument Type='Object' ObjectType='EventSource' />
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' />
										<Argument Value='ctlGrantList' />
										<Argument Value='ctlGrantActions' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RecipientID' ColumnHeader='Recipient ID'>	
							<Sortable>
								<Argument PropertyKey='RecipientID'></Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Grantee Organization'  >
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
								<Argument PropertyKey='OrganizationName'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ServiceArea' ColumnHeader='Service Area'>
							<Sortable>
								<Argument PropertyKey='ServiceArea'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TIGOrSubgranteeName' ColumnHeader='TIG/PBIF No./Subgrantee Name'>	
							<Sortable>
								<Argument PropertyKey='TIGOrSubgranteeName'></Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundingSource' ColumnHeader='Funding Source'>
							<Sortable>
								<Argument PropertyKey='FundingSource'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StateAbbr' ColumnHeader='ST'>
							<Sortable>
								<Argument PropertyKey='StateAbbr'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GrantYear' ColumnHeader='Initial Award Year'>
							<Sortable>
								<Argument PropertyKey='GrantYear'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Purpose' ColumnHeader='Purpose (TIG Only)'>
							<Sortable>
								<Argument PropertyKey='Purpose'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GrantStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='GrantStatus'>
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
