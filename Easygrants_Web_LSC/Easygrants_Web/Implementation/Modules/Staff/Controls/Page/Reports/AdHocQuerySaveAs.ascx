<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.Reports.cAdHocQuerySaveAs" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>
<br>
To save the selected query as a new query, enter the new Query Name, Description if desired,
select the Query Type, and if desired mark the query as Private by checking the associated
checkbox.  Click <b>Save</b> to save your changes and return to the Query Editor page under
the new query.<br>
<br>
To return to the Query Editor page without saving as a new query, click on the <b>Close</b>
button.  <b>IMPORTANT:</b> If you close or navigate off this page before you save, you will
lose unsaved information.
<table width='100%' cellpadding='2'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>
			Save As New Query
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Query Name&nbsp;<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnQueryName'/>
			<asp:RequiredFieldValidator
				runat='server'
				id='valReqQueryName'
				ControlToValidate='txtQueryName'
				ErrorMessage='Query name is required.'
				Display='None'/>
			<asp:CustomValidator
				runat='server'
				id='valCusSave'
				Display='None'
				OnServerValidate='ValidateUniqueNameSave'
				ErrorMessage='The query name you have chosen already exists in the system. Please choose a different name.'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td class='FieldLabel'>
			Enter the name for your query of up to 50 characters.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Query Description</b>
		</td>
		<td>
			<span runat='server' id='spnQueryDesc'/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td class='FieldLabel'>
			Enter a description for your query of up to 100 characters.
		</td>
	</tr>
	<tr>
		<td>
			<b>Query Type</b>
		</td>
		<td>
			<span runat='server' id='spnQueryType'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Private</b>
		</td>
		<td>
			<span runat='server' id='spnAccessType'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>
<span id='spnConfigXML' runat='server' visible='false'>
	<ModuleSection>
		<DataObject Key='SavedQuery' DataObjectDefinitionKey='SavedQuery' Updatable='True' CreateNew='False'>
			<!--The SavedQuery data object is retrieved from the session using code in the code-behind to this control.-->
			<DisplayProperties>
				<DisplayProperty PropertyKey='Name'>
					<Control ID='txtQueryName'
						Type='cTextBox'
						Container='spnQueryName'
						MaxLength='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtQueryDesc'
						Type='cTextArea'
						Container='spnQueryDesc'
						Cols='40'
						Rows='3'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccessTypeID'>
					<Control ID='ctlAccessType'
						Container='spnAccessType'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='AccessTypeID'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='QueryTypeID'>
					<Control ID='ctlQueryType'
						Type='cDropDown'
						Container='spnQueryType'
						DataObjectDefinitionKey='QueryType'
						StoredValue='QueryTypeID'
						DisplayValue='Description'
						DisplayNone='False'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='SavedQuery' DataObjectPropertyKey='SavedQueryID' BaseValue='PreviousSavedQueryID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Type='cButton'
						Container='spnSaveAndClose'
						Image='Save and Close'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='AdHocQueryTool'/>
								<Argument Value='QueryType=User'/>
								<Argument Type='DataObjectCollection' TypeKey='SavedQuery' DataObjectPropertyKey='SavedQueryID' BaseValue='PreviousSavedQueryID='/>
								<Argument Value='Display=0'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Image='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='AdHocQueryTool'/>
								<Argument Value='QueryType=User'/>
								<Argument Type='QueryString' TypeKey='PreviousSavedQueryID' DataObjectPropertyKey='SavedQueryID' BaseValue='SavedQueryID='/>
								<Argument Value='Display=0'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>