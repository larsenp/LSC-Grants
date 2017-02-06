<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cLookupTableEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<table width='100%' id='tblFilter' runat='server' visible='false'>
	<tr><td class='SeparatorHdg' colspan='2'>Filter</td></tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td width='25%'><b><span runat='server' id='spnFilterLabel'/>&nbsp;<font color='red'>*</font></b></td>
		<td>
			<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFilterDD' Type='cDropDown' visible='true' runat='server'/>
			<span runat='server' id='spnEditFilterDD' visible='false' />
			<asp:CustomValidator id="CtlValFilterDD" runat="server"
				OnServerValidate="ValFilter"
				Display="None"
				ErrorMessage="Filter is required."/>
		</td>
	</tr>
</table>
<br>

<table width='100%'>
	<tr><td class='SeparatorHdg'>Add or Edit Lookup Table Value</td></tr>
</table>
<br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlLookupTableSummary' 
	Src='EasyGrants/Controls/PageSection/LookupTableSummary.ascx'
	runat='server'/>
<br><br>

<table width='100%'>
	<tr>
		<td>
			<b>Abbreviation&nbsp;<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnAbbr'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Limit: 20 characters
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Description&nbsp;<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnDescription'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Limit: 255 characters
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Sort Order</b>
		</td>
		<td>
			<span runat='server' id='spnSortOrder'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Default sort order for lookup tables is alpha-numeric.  System must be configured to use sort order, if desired.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Status</b>
		</td>
		<td>
			<asp:CheckBox runat='server' id='chkStatus'/>   Checked if Active.  Uncheck this field to de-activate this value.  Inactive table list items do not appear in lookup tables.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnSaveAndClose'/>&nbsp;&nbsp;
			<span runat='server' id='spnClose'/>
		</td>
	</tr>
</table>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='LookupTable' DataObjectDefinitionKey='set_in_code' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ID' PropertyKey='set_in_code'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='txtAbbr'
						Type='cTextBox'
						Container='spnAbbr'
						Size='20'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Abbreviation is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='txtDescription'
						Type='cTextBox'
						Container='spnDescription'
						Size='50'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Description is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SortOrder'>
					<Control ID='txtSortOrder'
						Type='cTextBox'
						Container='spnSortOrder'
						AllowNumbersOnly='True'
						Size='4'
						MaxLength='4'>
						<Validation Type='Compare'
							DataType='Integer'
							Operator='DataTypeCheck'
							ErrorMessage='The sort order must be a whole number (no fractions, decimals, or non-numeric characters).'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						EnterKey='True'
						Image='Save'>
						<Action 
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='DataPresenter_Save_And_Reload'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Type='cButton'
						Container='spnSaveAndClose'
						Image='Save and Close'>
						<Action 
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
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
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<!--The checkbox is configured in a separate data object to isolate the custom functionality (i.e., so that the
		other items can be saved using the standard EG AutoSave configuration.)-->
		<DataObject Key='Checkbox' DataObjectDefinitionKey='set_in_code' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ID' PropertyKey='set_in_code'/>
			</Filters>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>