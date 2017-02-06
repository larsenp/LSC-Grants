<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<p>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewPages.ascx'
	runat='server'/>
<p>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='ResultsByComm' LinkTitle='Results By Committee' runat='server'/>

<Core:cUserCtlLoader CtlID='ReviewCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/PageSection/ReviewCycleInfo.ascx'
	runat='server'/>
	
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Conflicts and Preferences Details By Committee</b></td>
	</tr>	
</table>
<br><!--This page lists all pre-review results by committee.  Click on the <b>View</b> button to manually edit results for that reviewer.
<br><br>-->
<b>Committee:</b> <span id='spnCommittee' runat='server'/>
<br><br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td><span runat='server' id='spnDataList'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td align='center'><span runat='server' id='spnCancel'/></td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReviewCommittee' DataObjectDefinitionKey='ReviewCommittee'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ReviewCommitteeDescription'>
					<Control ID='ctlCommittee' Container='spnCommittee' Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ConflictResultsByComm' DataObjectDefinitionKey='ConflictResultsByComm'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ReviewCycleID' PropertyKey='ReviewCycleID'/>
				<Argument Type='QueryString' TypeKey='ReviewCommitteeID' PropertyKey='ReviewCommitteeID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='RevLastFirstMiddle' />	
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='RevLastFirstMiddle' ColumnHeader='Reviewer'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RevOrgName' ColumnHeader='Reviewer ~~Organization~~'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CommitteeName' ColumnHeader='Committee'>
						</DisplayProperty>
						<%--
						<DisplayProperty PropertyKey='ConflictRequestPersons' List='True' ColumnHeader='Conflicts/Preferences'>
							<DisplayProperties>
								<DisplayProperty PropertyKey='ConflictRequestAppPerson'/>
							</DisplayProperties>
						</DisplayProperty>
						--%>
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
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>	
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
								<Argument Type='QueryString' TypeKey='ReturnURL' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
