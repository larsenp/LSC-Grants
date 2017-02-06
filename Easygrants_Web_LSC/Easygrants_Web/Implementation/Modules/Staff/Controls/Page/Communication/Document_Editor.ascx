<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cDocument_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Document_Editor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Word Merge Document Description</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='25%'><b>Description</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;</td>
		<td>
			<span runat='server' id='spnUploadTitle'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class='FieldLabel'>
			Enter a description of up to 50 characters.
		</td>
	</tr>
	<tr>
		<td width='25%'>
			<b>Field Group</b>
		</td>
		<td>
			<span runat='server' id='spnQueryGroup'/>
		</td>
	</tr>
	<tr>
		<td width='25%'>
			<b>Template Type</b>
		</td>
		<td>	
			<span runat='server' id='spnTemplateType'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'>
			<asp:Panel runat="server" ID="DMSysIntegrationPanel" visible='false'>
				<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblDMSystemIntegration'>
					<tr>
						<td  class="SeparatorHdg" colspan='2'><b>Document Management System Integration</b></td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td width='25%'><b>File Name Prefix</b>&nbsp;<%=kDenoteRequiredField%></td>
						<td><span id='spnFileNamePrefix' runat='server'></span></td>
					</tr>
					<tr>
						<td width='25%'>&nbsp</td>
						<td class='FieldLabel'>Limit: 50 Characters</td>
					</tr>
				</table>
			</asp:Panel>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveContinue'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='EntityID'/>
				<Argument Type='QueryString' TypeKey='FileTypeID' PropertyKey='FileTypeID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='UploadTitle'>
					<Control ID='ctlUploadTitle'
						Type='cTextBox'
						Container='spnUploadTitle'
						Size='50'
						RequiredField='True'
						ErrorMessage='Description is required.'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QueryBaseTypeID'>
					<Control ID='ctlQueryGroup'
						Container='spnQueryGroup'
						Type='cDropDown'
						DataObjectDefinitionKey='SavedQueryBaseType'
						StoredValue='SavedQueryBaseTypeID'
						DisplayValue='BaseType'
						RequiredField='False'>
						<Sort>
							<Argument PropertyKey='BaseType'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WordMergeTemplateTypeID'>
					<Control ID='ctlTemplateType'
						Container='spnTemplateType'
						Type='cDropDown'
						DataObjectDefinitionKey='WordMergeTemplateType'
						StoredValue='WordMergeTemplateTypeID'
						DisplayValue='Description'
						RequiredField='False'>
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FileNamePrefix'>
						<Control ID='ctlFileNamePrefix' Type='cTextBox' Container='spnFileNamePrefix' Size='30' MaxLength='50'
						RequiredField='True' ErrorMessage='File Name Prefix is required.'></Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='SubmittedFile' DataObjectPropertyKey='SubmittedFileID' PropertyKey='SubmittedFileID' BaseValue='SubmittedFileID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Container='spnSaveContinue'
						Type='cButton'
						Image='Save and Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='DataPresenter_Save_And_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='DocumentUpload'/>
								<Argument Type='DataObjectCollection' TypeKey='SubmittedFile' DataObjectPropertyKey='SubmittedFileID' PropertyKey='SubmittedFileID' BaseValue='SubmittedFileID='/>
								<Argument Type='QueryString' TypeKey='FileTypeID' BaseValue='FileTypeID='/>
								<Argument Type='QueryString' TypeKey='EntityID' BaseValue='EntityID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
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