<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ViewMyGrants.ascx.vb" Inherits="Implementation.Modules.Home.Controls.Page.cViewMyGrants"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table width="100%">
	
	<tr>
		<td >To view grant details click the <B>View Grant</B> button under each Grant section.</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
		<td>
			<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
			AutoVDateType='Relative' Key='MyGrants' LinkTitle='My Grants' runat='server'/>
		</td>
	</tr>
	<tr>
		<td >
			<span runat='server' id='spnMyGrantsList' />
		</td>
	</tr>
	<tr>
		<td >
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
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<ResultLists>
			<ResultList Key='GrantPortfolioList'>My Grants</ResultList>
		</ResultLists>
		<DataObject Key='Close' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
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
		<DataObject Key='MyGrantsList' DataObjectDefinitionKey='MyGrantsView' Updatable='False' GetData='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='' TypeKey='' PropertyKey='GrantStatusID' Value='1' />	
			</Filters>
			<Sort>
				<Argument Type='' TypeKey='' PropertyKey='GranteeProjectID' Direction='Descending'></Argument>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlMyGrantList' Container='spnMyGrantsList' Type='cDataPresenterList' DataPresenterID='DPL' DataPresenterURL='Implementation/Modules/Home/Controls/Page/ViewMyGrantsList.ascx' />
				</DisplayProperty>
			</DisplayProperties>
	    </DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->
