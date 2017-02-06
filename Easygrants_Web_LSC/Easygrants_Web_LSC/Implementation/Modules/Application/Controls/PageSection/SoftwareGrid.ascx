<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cSoftwareGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='100%' runat='server' id='tblGrid' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscSoftwareType' DataObjectDefinitionKey='LscSoftwareType'>
			<Filters>
				<Argument Group='(' Bool='' />
				<Argument PropertyKey='LscSoftwareTypeID' Value='1' Bool=''/>
				<Argument PropertyKey='LscSoftwareTypeID' Value='2' Bool='Or'/>
				<Argument PropertyKey='LscSoftwareTypeID' Value='3' Bool='Or'/>
				<Argument PropertyKey='LscSoftwareTypeID' Value='4' Bool='Or'/>
				<Argument PropertyKey='LscSoftwareTypeID' Value='5' Bool='Or'/>
				<Argument PropertyKey='LscSoftwareTypeID' Value='6' Bool='Or'/>
				<Argument PropertyKey='LscSoftwareTypeID' Value='7' Bool='Or'/>
				<Argument PropertyKey='LscSoftwareTypeID' Value='8' Bool='Or'/>
				<Argument PropertyKey='LscSoftwareTypeID' Value='19' Bool='Or'/>
				<Argument Group=')' Bool='' />
				<Argument Group='(' Bool='And' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='EndDate' Operator='GreaterThan' Bool=''/>
				<Argument PropertyKey='EndDate' Value='' Bool='Or' />
				<Argument Group=')' Bool='' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties />
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	
		
		<DataObject Key='LscSoftware' DataObjectDefinitionKey='LscSoftware'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DisplayProperties />
		</DataObject>
		
		<GridConfig >
			<SubheadRows DataObjectKey='SoftwareCategory' DisplayNameProperty='Description' />
			<DetailRows DataObjectDefinitionKey='SoftwareProduct' SubheadRelatedPropertyKey='SoftwareCategory' />
			<Columns>
				<Column Header='' PropertyKey='InUse' Width='50'>
					<Control Type='cCheckBox' />
				</Column>
				
			</Columns>
		</GridConfig>
	</ModuleSection>
</span>
<!-- End Embedded XML -->