<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<div style='width:800px'>
	<br />
	<div class="SeparatorHdg">
		Client language editor
	</div>
	<br />
	<table width='100%'>
		<tr>
			<td>
				<b>Language:</b>
			</td>
			<td>
				<span runat='server' id='spnLscClientLanguageID'/>
			</td>
			<td>
				<b>Client Count:</b>
			</td>
			<td>
				<span runat='server' id='spnCount'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='4' style="text-align:center">
				<span runat='server' id='spnSave'/>&nbsp;
				<span runat='server' id='spnSaveClose'/>&nbsp;
				<span runat='server' id='spnClose'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan='4' style="text-align:center">
				<span runat='server' id='spnDelete'/>
			</td>
		</tr>
	</table>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscClientLanguage' DataObjectDefinitionKey='LscClientLanguage' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscClientLanguageID' PropertyKey='LscClientLanguageID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscLangCodeID'>
					<Control ID='ctlLscClientLanguageID'
						Type='cDropDown'
						Container='spnLscClientLanguageID'
						DataObjectDefinitionKey='LscLangCode'
						StoredValue='LscLangCodeID'
						DisplayValue='Description'
						DisplayText='Select' 
						HideInactiveItems='True'
						RequiredField='True'
						ErrorMessage='Language is required.'>
						<Filters>
							<Argument PropertyKey='EndDate' Value='' />
							<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='EndDate' Value='' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Count'>
					<Control ID='txtCount'
						Type='cTextBox'
						Container='spnCount'
						MaxLength='5'
						Size='5'
						RequiredField='True'
						ErrorMessage='Count is required.'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Client count must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				</DisplayProperties>
				</DataObject>
				
				
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'/>
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
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close without Saving'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Type='cButton'
						Container='spnDelete'
						Caption='Delete This Record'
						Confirmation='Are you sure you want to delete this language record?'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_Delete'>	
							<Parameters>
								<Argument Value='LscClientLanguage' />
								<Argument Type='DataObjectCollection' TypeKey='LscClientLanguage' DataObjectPropertyKey='LscClientLanguageID' />
								<Argument Value='False' />
							</Parameters>
						</Action>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>	
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
