<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="LookupTableList.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cLookupTableList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span runat='server' id='spnCodeTableList'/>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='CodeTableList' DataObjectDefinitionKey='LookupTableList' Updatable='False'>
			<Sort>
				<Argument PropertyKey='TableName'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCodeTableList'
						Type='cDataListCtl'
						SeparatorWidth='1'
						Container='spnCodeTableList'
						DataObjectDefinitionKey='CodeTableList'>
						<DisplayProperty PropertyKey='Description'>
							<Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TableName' ColumnHeader='Table'>
							<Sortable>
								<Argument PropertyKey='TableName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='NumRows' ColumnHeader='Number of Rows'>
							<Sortable>
								<Argument PropertyKey='NumRows'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LookupTableType.Description' ColumnHeader='Type'>
							<Sortable>
								<Argument PropertyKey='Description'>	
									<RelatedProperty PropertyKey='LookupTableType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='LookupTableViewer'/>
										<Argument Type='DataObject' TypeKey='TableName' AttributeName='TableName' BaseValue='TableName='/>
										<Argument Type='' TypeKey='' AttributeName='' Value='FilterID=0'/>
										<Argument Type='DataObject' TypeKey='LookupTableTypeID' AttributeName='LookupTableTypeID' BaseValue='LookupTableTypeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
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