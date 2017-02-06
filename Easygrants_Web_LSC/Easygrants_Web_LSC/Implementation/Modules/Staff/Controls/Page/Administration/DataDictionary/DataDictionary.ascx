<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class='SeparatorHdg'>Data Dictionary</div>
<br />
<div class='MinorSeparatorHdg'>Tables</div>
<br />
<span runat='server' id='spnTablesToAdd'/>&nbsp;<span runat='server' id='spnAddTable' />
<br /><br />
<span runat='server' id='spnTables' />
<div class='MinorSeparatorHdg'>Views</div>
<br />
<span runat='server' id='spnViewsToAdd'/>&nbsp;<span runat='server' id='spnAddView' />
<br /><br />
<span runat='server' id='spnViews' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Tables' DataObjectDefinitionKey='LscDataDictionaryObject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument PropertyKey='Type' Value='U'>
					<RelatedProperty PropertyKey='SysObject' />
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='Name'>
					<RelatedProperty PropertyKey='SysObject' />
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlTables'
						Container='spnTables'
						Type='cDataListCtl'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SysObject.Name' ColumnHeader='Table Name' Width='300'/>	
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='DataDictionaryTableViewEditor' />
										<Argument AttributeName='ObjectID' Type='DataObject' TypeKey='ObjectID' BaseValue='ObjectID=' />
									</Parameters>	
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTablesToAdd'
						Type='cDropDown'
						Container='spnTablesToAdd'
						DataObjectDefinitionKey='SysObjects'
						StoredValue='ObjectID'
						DisplayValue='Name'>
						<Filters>
							<Argument PropertyKey='LscDataDictionaryObjectID' Value=''>
								<RelatedProperty PropertyKey='LscDataDictionaryObject' />
							</Argument>
							<Argument PropertyKey='Type' Value='U'/>
						</Filters>	
						<Sort>
							<Argument PropertyKey='Name' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddTable'
						Type='cButton'
						Container='spnAddTable'
						Caption='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='DataDictionaryTableViewEditor' />
								<Argument Type='Control' TypeKey='ctlTablesToAdd' ControlPropertyKey='SelectedValue' BaseValue='ObjectID='  />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Views' DataObjectDefinitionKey='LscDataDictionaryObject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument PropertyKey='Type' Value='V'>
					<RelatedProperty PropertyKey='SysObject' />
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='Name'>
					<RelatedProperty PropertyKey='SysObject' />
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlViews'
						Container='spnViews'
						Type='cDataListCtl'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SysObject.Name' ColumnHeader='View Name' Width='300'/>	
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='DataDictionaryTableViewEditor' />
										<Argument AttributeName='ObjectID' Type='DataObject' TypeKey='ObjectID' BaseValue='ObjectID=' />
									</Parameters>	
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlViewsToAdd'
						Type='cDropDown'
						Container='spnViewsToAdd'
						DataObjectDefinitionKey='SysObjects'
						StoredValue='ObjectID'
						DisplayValue='Name'>
						<Filters>
							<Argument PropertyKey='LscDataDictionaryObjectID' Value=''>
								<RelatedProperty PropertyKey='LscDataDictionaryObject' />
							</Argument>
							<Argument PropertyKey='Type' Value='V'/>
						</Filters>	
						<Sort>
							<Argument PropertyKey='Name' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAddView'
						Type='cButton'
						Container='spnAddView'
						Caption='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='DataDictionaryTableViewEditor' />
								<Argument Type='Control' TypeKey='ctlViewsToAdd' ControlPropertyKey='SelectedValue' BaseValue='ObjectID='  />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
