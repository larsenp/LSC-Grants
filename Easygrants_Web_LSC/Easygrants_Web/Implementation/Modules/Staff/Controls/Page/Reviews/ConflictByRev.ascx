<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
This page lists all requests and conflicts results by reviewer. To manually add and remove results for the selected 
reviewer, click on the <b>View</b> button in the list below. To return to the Requests and Conflicts page, click on the 
<b>Close</b> button.<p>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewPages.ascx'
	runat='server'/>
<p>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ResultsByReviewer' LinkTitle='Results By Reviewer' runat='server'/>

<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Conflicts and Preferences Details by Reviewer</b></td>
</tr>	
</table>
<br>Click on the <b>View</b> button to manually edit results for that reviewer. 
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>	
	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>

</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
	
		<DataObject Key='ConflictResultsByRev' DataObjectDefinitionKey='ConflictResultsByRev'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID'
					PropertyKey='ReviewCycleID' Value='' bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='RevLastFirstMiddle' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='RevLastFirstMiddle' ColumnHeader='Reviewer'>
							<Sortable>
								<Argument PropertyKey='RevLastFirstMiddle'/>		
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevOrgName' ColumnHeader='Reviewer ~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='RevOrgName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CommitteeName' ColumnHeader='Committee'>
							<Sortable>
								<Argument PropertyKey='CommitteeName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ConflictRequestPersons' List='True' ColumnHeader='Requests/Conflicts'>
							<DisplayProperties>
								<DisplayProperty PropertyKey='ConflictRequestAppPerson'/>
							</DisplayProperties>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Left'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ConflictDetailByRev'/>
										<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID' BaseValue='ReviewCycleID='/>
										<Argument Type='DataObject' TypeKey='AppPersonID' AttributeName='AppPersonID' BaseValue='AppPersonID='/>
										<Argument Type='DataObject' TypeKey='RevPersonID' AttributeName='RevPersonID' BaseValue='RevPersonID='/>
										<Argument Type='DataObject' TypeKey='RevCommID' AttributeName='RevCommID' BaseValue='CommitteeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
