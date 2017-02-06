<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div class='SeparatorHdg'>
	Main Office
</div>
<span runat='server' id='spnOffices' />
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
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlOfficesList' 
						Type='cDataPresenterList'
						Container='spnOffices'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/GAR/ActualOfficeInfo/Controls/PageSection/ActualOfficeItemReadOnly.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
