<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span runat='server' id='spnChangeList'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='GranteeProjectHistory' DataObjectDefinitionKey='GranteeProjectHistory'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='CreateDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlChangeList'
						Type='cDataListCtl'
						Container='spnChangeList'
						SeparatorWidth='2'>
						<HeaderHtml>
							History
						</HeaderHtml>
						<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy' ColumnHeader='Change Date'/>
						<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName' ColumnHeader='Primary Person'/>
						<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName' ColumnHeader='Primary ~~Organization~~'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
