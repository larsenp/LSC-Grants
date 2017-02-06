<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cDocument_Upload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Document_Upload.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValSumm' Type='cValidationSummary' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Control Label (for Publication upload) -->
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Word Merge Document Description</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td><b>Description</b></td>
		<td>
			<span runat='server' id='spnUploadTitle'/>
		</td>
	</tr>	
	<tr>
		<td>
			<b>Field Group</b>
		</td>
		<td>
			<span runat='server' id='spnQueryGroup'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Template Type</b>
		</td>
		<td>	
			<span runat='server' id='spnTemplateType'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			<span runat='server' id='spnUploadPubs'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<asp:Panel runat="server" ID="DMSysIntegrationPanel" visible='false'>
				<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblDMSystemIntegration'>
				</table>
			</asp:Panel>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='Data' TypeKey='' PropertyKey='ConversionStatus' Value='-1' Update='True'/>
				<Argument Type='Data' TypeKey='' PropertyKey='SharepointConversionStatus' Value='-2' Update='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='UploadTitle'>
					<Control ID='ctlUploadTitle'
						Container='spnUploadTitle'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QueryBaseTypeID'>
					<Control ID='ctlQueryGroup'
						Container='spnQueryGroup'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='WordMergeTemplateType.Description'>
					<Control ID='ctlTemplateType'
						Container='spnTemplateType'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUpload'
						Container='spnUploadPubs'>
						<InstructionHtml>
						</InstructionHtml>
						<Parameters>
							<Argument Type='QueryString' TypeKey='FileTypeID' PropertyKey='FileTypeID' Bool='' DisplayDeleteButton='False'/>
							<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='EntityAssocID' Bool=''/>
							<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' Bool=''/>
							<Argument Type='QueryString' TypeKey='Description' PropertyKey='Description' Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,dot,docx,dotx'
								ErrorMessage='Error : Only files with extension .doc, .dot, .docx or .dotx are allowed.'
								Bool='and'/>
							<Argument PropertyKey='ViewOriginalFileFormat' Value='True' />
						</Parameters>
					</Control>
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
						Image='Save and Continue'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WordTemplate'/>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WordTemplate'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>