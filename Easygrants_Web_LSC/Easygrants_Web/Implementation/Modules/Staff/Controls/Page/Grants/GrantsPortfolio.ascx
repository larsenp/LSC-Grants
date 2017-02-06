<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantsPortfolio.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Grants.cGrantsPortfolio"  EnableViewState="false" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader1" />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='GrantsPortfolio' LinkTitle='My Grants Porftolio' runat='server'/>
<table id="Table1" width='100%' runat='server' visible='true'>
	<tr class='SeparatorHdg'>
		<td colspan='2'>Filter My Grants</td>
	</tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td><b>Grant Status</b></td>
		<td>
			<span runat='server' id='spnGrantsStatus' />
		</td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td>
			<span runat='server' id='spnCompetition' />
		</td>
	</tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnFind' />&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnClear' />
		</td>
	</tr>
</table>
<table width="100%">
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnGrantPortfolioList' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnNoResult' />
		</td>
	</tr>
</table>
<table width="100%">
	<tr><td >&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnClose' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   
		<ResultLists>
			<ResultList Key='GrantPortfolioList'>My Grants Portfolio</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantsStatus' Type='cDropDown' Container='spnGrantsStatus' DataObjectDefinitionKey='GrantStatus'
						StoredValue='GrantStatusID' DisplayValue='Abbr' DisplayNone='False' DisplayText='All'
						FilterKey='GrantStatus.GrantStatusID'>
						<FilterList List='GrantPortfolioList' Property='GrantStatusID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCompetition' Type='cDropDown' Container='spnCompetition' DataObjectDefinitionKey='Competition'
						StoredValue='CompetitionID' DisplayValue='CompetitionDisplayName' DisplayNone='False'
						DisplayText='All' FilterKey='CompetitionID'>
						<FilterList List='GrantPortfolioList' Property='CompetitionID' />
					</Control>
				</DisplayProperty>
			    <DisplayProperty PropertyKey=''>
				    <Control ID='btnFind' Type='cButton' Container='spnFind' Image='Find'>
					    <Action PostBack='True' Object='ModulePageContent' Method='FilterListDataPresenter_Find' />
				    </Control>
			    </DisplayProperty>
			    <DisplayProperty PropertyKey=''>
				    <Control ID='btnClear' Container='spnClear' Type='cButton' Image='Clear'>
					    <Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantsPortfolio'/>
								<Argument Type='DataObjectCollection' TypeKey='GrantPortfolioList' DataObjectPropertyKey='StaffID' BaseValue='PersonID='/>
								<Argument Type='QueryString' TypeKey='' AttributeName='' BaseValue='Find=True'/>
							</Parameters>
						</Action>
				    </Control>
			    </DisplayProperty>
				<DisplayProperty>
					<Control ID='ctlClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Home'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GrantPortfolioList' DataObjectDefinitionKey='MyPortfolioGrantsView' Updatable='False' GetData='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='StaffID' />
			</Filters>
			<Sort>
				<Argument Type='' TypeKey='' PropertyKey='GranteeProjectID' Direction='Descending'></Argument>
			</Sort>
			<DisplayProperties>			
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlGrantPortfolioList' Container='spnGrantPortfolioList' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Implementation/Modules/Staff/Controls/Page/Grants/GrantsPortfolioDetails.ascx' />
				</DisplayProperty>
			</DisplayProperties>
	    </DataObject>	
	</ModuleSection>
</span>
