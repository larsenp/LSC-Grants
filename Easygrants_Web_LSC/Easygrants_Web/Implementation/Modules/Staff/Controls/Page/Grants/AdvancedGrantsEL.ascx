<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="AdvancedGrantsEL.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Grants.cAdvancedGrantsEL"  EnableViewState="false" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader1" />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' AutoVDateType='Root' Key='Grants'
	LinkTitle='Grants Easylist' runat='server' />
<table id="Table1" width='100%' runat='server' visible='true'>
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
		<td  nowrap='nowrap'><b><%=GetLabel("GrantId")%></b></td>
		<td>
			<span runat='server' id='spnGrantNumber' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b><%=GetLabel("LegacyGrantId")%></b></td>
		<td>
			<span runat='server' id='spnLegacyGrantNumber' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b>Grant Status</b></td>
		<td>
			<span runat='server' id='spnGrantsStatus' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b>Grant Outcome</b></td>
		<td>
			<span runat='server' id='spnGrantsOutcome' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b>Grantee <%=GetLabel("Organization")%></b></td>
		<td>
			<span runat='server' id='spnOrg' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b>Last Name - Primary Contact/PI</b></td>
		<td>
			<span runat='server' id='spnLastName' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b>First Name - Primary Contact/PI</b></td>
		<td>
			<span runat='server' id='spnFirstName' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b>E-mail - Primary Contact/PI</b></td>
		<td>
			<span runat='server' id='spnEmail' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b><%=GetLabel("ProjectTitle")%></b></td>
		<td>
			<span runat='server' id='spnProjectTitle' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b>Time Period/Award Cycle</b></td>
		<td>
			<span runat='server' id='spnCycle' />
		</td>
	</tr>
	<tr >
		<td  nowrap='nowrap'><b>Primary Staff Last Name</b></td>
		<td>
			<span runat='server' id='spnPrimaryLast' />
		</td>
	</tr>
	<tr >
		<td  nowrap='nowrap'><b>Primary Staff First Name</b></td>
		<td>
			<span runat='server' id='spnPrimaryFirst' />
		</td>
	</tr>
	
	<tr>
		<td  nowrap='nowrap'><b><%=GetLabel("ProgramName")%></b></td>
		<td>
			<span runat='server' id='spnProgram' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td>
			<span runat='server' id='spnCompetition' />
		</td>
	</tr>
	<tr>
		<td  nowrap='nowrap'><b><%=GetLabel("FundingCycleName")%></b></td>
		<td>
			<span runat='server' id='spnProject' />
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
			<span runat='server' id='spnQuickSearch' />
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
					<Control ID='txtGrantNumber' Type='cTextBox' Container='spnGrantNumber' AllowNumbersOnly='True' FilterKey='GrantNumber'>
						<FilterList List='GrantList' Property='GranteeProjectID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLegacyGrantNumber' Type='cTextBox' Container='spnLegacyGrantNumber'  FilterKey='LegacyProjectID'>
						<FilterList List='GrantList' Property='LegacyProjectID' />
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
					<Control ID='ctlGrantsOutcome' Type='cDropDown' Container='spnGrantsOutcome' DataObjectDefinitionKey='GrantOutcome'
						StoredValue='GrantOutcomeID' DisplayValue='Description' DisplayNone='False' DisplayText='All'
						FilterKey='GrantOutcome.GrantOutcomeID'>
						<FilterList List='GrantList' Property='WfProjectOutcomeID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtOrg' Type='cTextBox' Container='spnOrg' FilterKey='CommonOrganizationName'>
						<FilterList List='GrantList' Property='CommonOrganizationName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtLastName' Type='cTextBox' Container='spnLastName' FilterKey='LastName'>
						<FilterList List='GrantList' Property='LastName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtFirstName' Type='cTextBox' Container='spnFirstName' FilterKey='FirstName'>
						<FilterList List='GrantList' Property='FirstName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtEmail' Type='cTextBox' Container='spnEmail' FilterKey='PrimaryEmail'>
						<FilterList List='GrantList' Property='PrimaryEmailAddress' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtProjectTitle' Type='cTextBox' Container='spnProjectTitle' FilterKey='ProjectTitle'>
						<FilterList List='GrantList' Property='ProjectTitle' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantsCycle' Type='cDropDown' Container='spnCycle' DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID' DisplayValue='Abbr' DisplayNone='False' DisplayText='All'
						FilterKey='TimePeriod.TimePeriodID'>
						<FilterList List='GrantList' Property='TimePeriodID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtPrimaryLast' Type='cTextBox' Container='spnPrimaryLast' FilterKey='PrimaryLastName'>
						<FilterList List='GrantList' Property='PrimaryLastName' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtPrimaryFirst' Type='cTextBox' Container='spnPrimaryFirst' FilterKey='PrimaryFirstName'>
						<FilterList List='GrantList' Property='PrimaryFirstName' />
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
					<Control ID='ctlCompetition' Type='cDropDown' Container='spnCompetition' DataObjectDefinitionKey='Competition'
						StoredValue='CompetitionID' DisplayValue='CompetitionDisplayName' DisplayNone='False'
						DisplayText='All' FilterKey='CompetitionID'>
						<FilterList List='GrantList' Property='CompetitionID' />
						<Sort>
							<Argument PropertyKey='CompetitionDisplayName' Direction='Ascending'>
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProject' Type='cDropDown' Container='spnProject' DataObjectDefinitionKey='WfProject'
						StoredValue='WfProjectID' DisplayValue='WfProjectName' DisplayNone='False' DisplayText='All'
						FilterKey='WfProjectID'>
						<FilterList List='GrantList' Property='WfProjectID' />
						<Sort>
							<Argument PropertyKey='WfProjectName' Direction='Ascending'>
							</Argument>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnShow' Type='cButtonImage' Container='spnShow' Image='Show.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkShow' Type='cLink' Container='spnShowLink' Caption='Grants Advanced Search Criteria'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHide' Type='cButtonImage' Container='spnHide' Image='Hide.gif'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHide' Type='cLink' Container='spnHideLink' Caption='Grants Advanced Search Criteria'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
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
								<Argument Type='' TypeKey='' Value='AdvancedGrantsEL' />
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
								<Argument Value='GrantsEL'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
                <DisplayProperty PropertyKey=''>
                   <Control ID='ctlAdd' Container='spnAdd' Type='cButton' Caption='Add Grant'>
                       <Action PostBack='True' Object='EventController'  Method='EventController_NavigateToModulePageKey'>
                            <Parameters>
                                <Argument AttributeName='PageKey' Value='AddGrants'/>
                                 <Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>  
                                <Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=0'/>                                                                                                  
                           </Parameters>
                       </Action>
                   </Control>
                </DisplayProperty>  				
			</DisplayProperties><!--<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>-->

		</DataObject>
		<DataObject Key='GrantList' DataObjectDefinitionKey='EasylistGrantsView' Updatable='False' GetData='False'>
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
				<Argument Type='' TypeKey='' PropertyKey='LastName' Direction='Ascending'>
				<!--	<RelatedProperty PropertyKey='PrimaryPerson' /> -->
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='FirstName' Direction='Ascending'>
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
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True'>
							<Control ID='ctlGrantID'
								ToolTipPropertyKey='ProjectTitle'
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
						<!--<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='Easysgrants ID'>	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'></Argument>
							</Sortable>
						</DisplayProperty>-->
						<DisplayProperty PropertyKey='CommonOrganizationName' ColumnHeader='Grantee ~~Organization~~'  >
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
								</Argument>
							</Sortable>
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='ProgramName' ColumnHeader='ProgramName' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='ProgramName'>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectName' ColumnHeader='FundingCycleName' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='WfProjectName'>
								<!--	<RelatedProperty PropertyKey='WfProject' /> -->
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LastNameFirstName' ColumnHeader='Primary Contact/PI'  >
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
						<DisplayProperty PropertyKey='GrantStatus' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='GrantStatus'>
								<!--	<RelatedProperty PropertyKey='GrantStatus' /> -->
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LegacyProjectID' ColumnHeader='LegacyGrantId' ConfigurableHeader='True'>	
							<Sortable>
								<Argument PropertyKey='LegacyProjectID'></Argument>
							</Sortable>
						</DisplayProperty>
						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
