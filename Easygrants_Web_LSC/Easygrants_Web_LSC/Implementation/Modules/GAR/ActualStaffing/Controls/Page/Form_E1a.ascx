f<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualStaffing.Controls.Page.cForm_E1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	              AutoVDateType='Last' Key='Form_E1a' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form E-1(a): Actual Staffing - Main Office</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormE1' 
	Src='Implementation/Modules/GAR/ActualStaffing/Controls/PageSection/FormE1_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlFormD1F' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>

<div class='SeparatorHdg'>
	Workforce Analysis
</div>
<br />
<span runat='server' id='spnAdd' />
<br />
<span runat='server' id='spnStaff' />

<div style="text-align: center">
	<span runat='server' id='spnContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscOffice' DataObjectDefinitionKey='LscOffice' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
				<Argument PropertyKey='OffTypeID' Value='1' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscStaffDetail' DataObjectDefinitionKey='LscStaffDetail' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='LscOfficeID' PropertyKey='LscOfficeID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='LastName' />
				<Argument PropertyKey='FirstName' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='' >
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add New Staff Member' >
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='StaffMemberEditor' />
								<Argument Value='LscStaffDetailID=0' />
								<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='LscOfficeID' PropertyKey='LscOfficeID' BaseValue='LscOfficeID=' />
								<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
							<%--	<Argument Value='ReturnPageKey=Form_E1a' />--%>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlStaff'
						Type='cDataListCtl'
						Container='spnStaff'
						DataObjectDefinitionKey='LscStaffDetail'>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.LastFirst' ColumnHeader='Name' Width='80'>
							<Control ID='lnkStaffMember'
								Type='cLink'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='StaffMemberEditor' />
										<Argument Type='DataObject' TypeKey='LscStaffDetailID' AttributeName='LscStaffDetailID' BaseValue='LscStaffDetailID=' />
										<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='LscOfficeID' PropertyKey='LscOfficeID' BaseValue='LscOfficeID=' />
										<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
										<%--<Argument Type='QueryString' TypeKey='Page' BaseValue='ReturnPageKey=' />--%>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LscStaffJobCodeID' ColumnHeader='Job Code' Width='10'/>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.AttorneyYN' ColumnHeader='Attorney' Width='10'/>
						<DisplayProperty PropertyKey='Ethnicity.SortOrder' ColumnHeader='Ethnicity' Width='10'/>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.Age40PlusYN' ColumnHeader='Age 40 +' Width='10'/>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.GenderAbbr' ColumnHeader='Gender' Width='10'/>
						<DisplayProperty PropertyKey='LscLangCode.Abbr' ColumnHeader='Language' Width='10'/>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.DisabledYN' ColumnHeader='Disabled' Width='10'/>
						<DisplayProperty PropertyKey='StartDte' ColumnHeader='Employment Start Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='YrsExpCurr' ColumnHeader='Yrs. Exp. On This Job' Width='50' />
						<DisplayProperty PropertyKey='YrsExpWLsc' ColumnHeader='Yrs. Exp. With LSC Grantee' Width='50' />
						<DisplayProperty PropertyKey='YrsExpProf' ColumnHeader='Yrs. Exp. in Profession' Width='50' />
						<DisplayProperty PropertyKey='Termination' ColumnHeader='Employment Termination Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='AnnlSalary' ColumnHeader='Annual Salary' />
						<DisplayProperty PropertyKey='AnnlOtherCompensation' ColumnHeader='Amount of Other Compensation' />
						<DisplayProperty PropertyKey='HoursPerWeek' ColumnHeader='Hours per Work Week' />
						<DisplayProperty PropertyKey='LscStaffDetailTotals.PctFullTime' ColumnHeader='% Full Time' />
						<DisplayProperty PropertyKey='ServArea1' ColumnHeader='Service Area 1' />
						<DisplayProperty PropertyKey='PctTime1' ColumnHeader='% Time For #1' />
						<DisplayProperty PropertyKey='ServArea2' ColumnHeader='Service Area 2' />
						<DisplayProperty PropertyKey='PctTime2' ColumnHeader='% Time For #2' />
						<DisplayProperty PropertyKey='ServArea3' ColumnHeader='Service Area 3' />
						<DisplayProperty PropertyKey='PctTime3' ColumnHeader='% Time For #3' />
						<DisplayProperty PropertyKey='ServArea4' ColumnHeader='Service Area 4' />
						<DisplayProperty PropertyKey='PctTime4' ColumnHeader='% Time For #4' />
						<DisplayProperty PropertyKey='ServArea5' ColumnHeader='Service Area 5' />
						<DisplayProperty PropertyKey='PctTime5' ColumnHeader='% Time For #5' />
						<DisplayProperty PropertyKey='EmailAddr' ColumnHeader='Email' />
						<DisplayProperty PropertyKey='LscStaffDetailTotals.LastFirst' ColumnHeader='Name' Width='80'>
							<Control ID='lnkStaffMember2'
								Type='cLink'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='StaffMemberEditor' />
										<Argument Type='DataObject' TypeKey='LscStaffDetailID' AttributeName='LscStaffDetailID' BaseValue='LscStaffDetailID=' />
										<Argument Type='DataObjectCollection' TypeKey='LscOffice' DataObjectPropertyKey='LscOfficeID' PropertyKey='LscOfficeID' BaseValue='LscOfficeID=' />
										<Argument Type='QueryString' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
										<%--<Argument Type='QueryString' TypeKey='Page' BaseValue='ReturnPageKey=' />--%>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Submission' />
							</Parameters>
						</Action>
					</Control>
				
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>--%>
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='User' DataObjectDefinitionKey='User' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Type='cButton'
						GoToNextPage='True'>
						<Visible>
						      <Argument PropertyKey='UserTypeID' Value='1' />
					    </Visible>
                     </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
				
				
		<!--Added DataCommand while trying to manage a problem with timeouts. Problem was eventually solved by other means, but DataCommand was left in place.-->
		<DataCommand Key='LscCopyOfficeInfoCmd' DataCommandDefinitionKey='LscCopyOfficeInfoCmd' CommandTimeout='120' >
			<Parameters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' ParameterKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' ParameterKey='TimePeriodID'/>
			</Parameters>
		</DataCommand>
		
	</ModuleSection>
</span>
