<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class='SeparatorHdg'>Add/Edit Data Dictionary Column</div>
<br />
<table>
	<tr>
		<td>
			<b>Column Name</b>
		</td>
		<td>
			<span runat='server' id='spnSysColumnName' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Data Type</b>
		</td>
		<td>
			<span runat='server' id='spnDataType' /><span runat='server' id='spnColumnSize' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Data Object Property Key</b>
		</td>
		<td>
			<span runat='server' id='spnDataObjectPropertyKey' />
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
	<br /><br />
	<span runat='server' id='spnDelete'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscDataDictionaryObject' DataObjectDefinitionKey='LscDataDictionaryObject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='QueryString' TypeKey='ObjectID' PropertyKey="ObjectID"/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscDataDictionaryColumn' DataObjectDefinitionKey='LscDataDictionaryColumn' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='QueryString' TypeKey='ObjectID' PropertyKey="ObjectID"/>
				<Argument Type='QueryString' TypeKey='ColumnID' PropertyKey="ColumnID"/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='ObjectID' PropertyKey="ObjectID"/>
				<Argument Type='QueryString' TypeKey='ColumnID' PropertyKey='ColumnID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscSysColumns.Name'>
					<Control ID='spnSysColumnName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscSysColumns.SystemType'>
					<Control ID='spnDataType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscSysColumns.ColumnSize'>
					<Control ID='spnColumnSize'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectPropertyKey'>
					<Control ID='txtDataObjectPropertyKey'
						Type='cTextBox'
						Container='spnDataObjectPropertyKey'
						Size='30'
						MaxLength='100'/>
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
							AutoSave='True' />	
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
								<Argument Value='DataDictionaryTableViewEditor' />
								<Argument Type='DataObjectCollection' TypeKey='LscDataDictionaryObject' DataObjectPropertyKey='ObjectID' BaseValue='ObjectID='/>
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
								<Argument Value='DataDictionaryTableViewEditor' />
								<Argument Type='DataObjectCollection' TypeKey='LscDataDictionaryObject' DataObjectPropertyKey='ObjectID' BaseValue='ObjectID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Type='cButton'
						Container='spnDelete'
						Caption='Delete'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_Delete'>	
							<Parameters>
								<Argument Value='LscDataDictionaryColumn' />
								<Argument Type='DataObjectCollection' TypeKey='LscDataDictionaryColumn' DataObjectPropertyKey='LscDataDictionaryColumnID' />
								<Argument Value='False' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='LscSysColumns' DataObjectDefinitionKey='LscSysColumns' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscDataDictionaryObject' DataObjectPropertyKey='ObjectID' PropertyKey='ObjectID' />
				<Argument Type='QueryString' TypeKey='ColumnID' PropertyKey='ColumnID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='spnSysColumnName'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SystemType'>
					<Control ID='spnDataType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ColumnSize'>
					<Control ID='spnColumnSize'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
