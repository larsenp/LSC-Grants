<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class='SeparatorHdg'>Add/Edit Data Dictionary Object</div>
<br />
<table>
	<tr>
		<td>
			<b>Object Name</b>
		</td>
		<td>
			<span runat='server' id='spnSysObjectName' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Object Type</b>
		</td>
		<td>
			<span runat='server' id='spnSysObjectType' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Baseline?</b>
		</td>
		<td>
			<span runat='server' id='spnIsBaseline' />
		</td>
	</tr>
	<tr>
		<td style="vertical-align:top">
			<b>Description</b>
		</td>
		<td>
			<span runat='server' id='spnDescription' />
		</td>
	</tr>
</table>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSave' />&nbsp;
	<span runat='server' id='spnSaveClose' />&nbsp;
	<span runat='server' id='spnClose' />
</div>
<br /><br />
<div class='SeparatorHdg'>Columns</div>
<br />
<span runat='server' id='spnColumnsToAdd'/>&nbsp;<span runat='server' id='spnAddColumn' />
<br /><br />
<span runat='server' id='spnLscDataDictionaryColumns'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<!--
		This is an unusual configuration in that both data objects have display properties that populate the same
		two spans, spnSysObjectName and spnSysObjectType.
		
		If an item is being edited, then a DataDictionaryObjectID query string is provided and an ObjectID is 
		not provided. spnSysObjectName and spnSysObjectType are populated by the DataDictionaryObject data object 
		and are not affected by the SysObjects data object.
		
		If a new item is being added, then a DataDictionaryObjectID query string is provided and an ObjectID is not 
		provided. spnSysObjectName and spnSysObjectType are not populated by the DataDictionaryObject data object 
		and are not affected by the SysObjects data object.
		-->

		<DataObject Key='LscDataDictionaryObject' DataObjectDefinitionKey='LscDataDictionaryObject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='QueryString' TypeKey='ObjectID' PropertyKey='ObjectID' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ObjectID' PropertyKey='ObjectID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SysObject.Name'>
					<Control ID='spnSysObjectName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SysObject.TypeDesc'>
					<Control ID='spnSysObjectType'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsBaseline'>
					<Control ID='ctlIsBaseline'
						Type='cRadioButtonList'
						Container='spnIsBaseline'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtDescription'
						Type='cTextArea'
						Container='spnDescription'
						Rows='5'
						Cols='80' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='DataDictionaryTableViewEditor'/>
								<Argument Type='QueryString' TypeKey='ObjectID' BaseValue='ObjectID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Container='spnSaveClose'
						Caption='Save and Close'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='DataDictionary' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='DataDictionary' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAddColumn'
						Caption='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='DataDictionaryColumnEditor' />
								<Argument Type='DataObjectCollection' TypeKey='LscDataDictionaryObject' DataObjectPropertyKey='ObjectID' BaseValue='ObjectID='  />
								<Argument Type='Control' TypeKey='ctlColumnsToAdd' ControlPropertyKey='SelectedValue' BaseValue='ColumnID='  />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SysObjects' DataObjectDefinitionKey='SysObjects' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ObjectID' PropertyKey='ObjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='spnSysObjectName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TypeDesc'>
					<Control ID='spnSysObjectType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlColumnsToAdd'
						Type='cDropDown'
						Container='spnColumnsToAdd'
						DataObjectDefinitionKey='SysColumns'
						StoredValue='ColumnID'
						DisplayValue='Name'>
						<Filters>
							<Argument PropertyKey='LscDataDictionaryColumnID' Value=''>
								<RelatedProperty PropertyKey='LscDataDictionaryColumn' />
							</Argument>
							<Argument Type='DataObjectCollection' TypeKey='LscDataDictionaryObject' DataObjectPropertyKey='ObjectID' PropertyKey='ObjectID' />
						</Filters>	
						<Sort>
							<Argument PropertyKey='ColumnID' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscDataDictionaryColumn' DataObjectDefinitionKey='LscDataDictionaryColumn' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscDataDictionaryObject' DataObjectPropertyKey='ObjectID' PropertyKey='ObjectID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ColumnID'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlLscDataDictionaryColumns'
						Type='cDataListCtl'
						Container='spnLscDataDictionaryColumns'>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='DataDictionaryColumnEditor' />
										<Argument AttributeName='ObjectID' Type='DataObject' TypeKey='ObjectID' BaseValue='ObjectID='  />
										<Argument AttributeName='ColumnID' Type='DataObject' TypeKey='ColumnID' BaseValue='ColumnID='  />
									</Parameters>	
								</Action>
									
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SysColumn.ColumnID' ColumnHeader='Order'>
							<Sortable>
								<Argument PropertyKey='ColumnID'>
									<RelatedProperty PropertyKey='SysColumn'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SysColumn.Name' ColumnHeader='Name'>
							<Sortable>
								<Argument PropertyKey='Name'>
									<RelatedProperty PropertyKey='SysColumn'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DataObjectPropertyKey' ColumnHeader='Data Object Property Key'>
							<Sortable>
								<Argument PropertyKey='DataObjectPropertyKey'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Description'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
