<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<b><span runat='server' id='spnOffType' /> <span runat='server' id='spnOffID' /> - <span runat='server' id='spnOffName' /></b>
<br /><br />

<span runat='server' id='spnStaff' />

<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscOffice' Key='LscOffice' DataObjectDefinitionKey='LscOffice' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='OfficeType.Description'>
					<Control ID='spnOffType'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OffName'>
					<Control ID='spnOffName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OffID'>
					<Control ID='spnOffID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
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
										<Argument Type='QueryString' TypeKey='Page' BaseValue='ReturnPageKey=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LscStaffJobCodeID' ColumnHeader='Job Code' Width='10'/>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.AttorneyYN' ColumnHeader='Attorney' Width='10'/>
						<DisplayProperty PropertyKey='Ethnicity.SortOrder' ColumnHeader='Ethnicity' Width='10'/>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.Age40PlusYN' ColumnHeader='Age 40 +' Width='10'/>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.GenderAbbr' ColumnHeader='Gender' Width='10'/>
						<DisplayProperty PropertyKey='LscLangCodeID' ColumnHeader='Language' Width='10'/>
						<DisplayProperty PropertyKey='LscStaffDetailTotals.DisabledYN' ColumnHeader='Disabled' Width='10'/>
						<DisplayProperty PropertyKey='StartDte' ColumnHeader='Employment Start Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='YrsExpCurr' ColumnHeader='Yrs. Exp. On This Job' Width='50' />
						<DisplayProperty PropertyKey='YrsExpWLsc' ColumnHeader='Yrs. Exp. With LSC Grantee' Width='50' />
						<DisplayProperty PropertyKey='YrsExpProf' ColumnHeader='Yrs. Exp. in Profession' Width='50' />
						<DisplayProperty PropertyKey='Termination' ColumnHeader='Employment Termination Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='AnnlSalary' ColumnHeader='Annual Salary' />
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
						<DisplayProperty PropertyKey='LscStaffDetailTotals.LastFirst' ColumnHeader='Name' Width='80'>
							<Control ID='lnkStaffMember2'
								Type='cLink'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='StaffMemberEditor' />
										<Argument Type='DataObject' TypeKey='LscStaffDetailID' AttributeName='LscStaffDetailID' BaseValue='LscStaffDetailID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
