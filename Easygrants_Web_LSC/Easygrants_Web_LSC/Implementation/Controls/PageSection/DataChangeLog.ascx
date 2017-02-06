<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Controls.PageSection.cDataChangeLog" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscDatabaseLog' DataObjectDefinitionKey='LscDatabaseLog' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='TableName' PropertyKey='TableName' />
			</Filters>
		</DataObject>
	</ModuleSection>
</span>
