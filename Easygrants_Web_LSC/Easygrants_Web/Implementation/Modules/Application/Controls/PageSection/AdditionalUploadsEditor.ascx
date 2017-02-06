<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cAdditionalUploadsEditor" CodeBehind="AdditionalUploadsEditor.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<br>
<!-- USER MODIFIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Instructions</b>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4">
			Before uploading your document, please select the upload type and click on the <b>Go</b> button. 
			To save and return to the Additional Uploads page, click on the <b>Save and Continue</b> button. 
			To return to the Additional Uploads page without saving, click on the <b>Cancel</b> button.						
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Upload Information</b>
		</td>
	</tr>	
</table>
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td width='15%'><b>Upload Type</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span runat='server' id='spnUploadType'/>&nbsp;<span id='spnGo' runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr runat='server' id='trUploadPubs' >
		<td colspan="2">
			<span runat='server' id='spnUploadPubs'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave_and_Continue'/>
			<span runat='server' id='spnContinue'/>&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='FileType' DataObjectDefinitionKey='FileType' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='FileTypeID' PropertyKey='FileTypeID' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FileTypeID'>
					<Control ID='ctlUploadType'
						Container='spnUploadType'
						Type='cDropDown'
						DataObjectDefinitionKey='FileType'
						StoredValue='FileTypeID'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='Upload Type is required.'>
						<Filters>
							<Argument Type='Data' TypeKey='' PropertyKey='FileTypeID' Value='44' Bool=''/>
							<Argument Type='Data' TypeKey='' PropertyKey='FileTypeID' Value='45' Bool='Or'/>
							<Argument Type='Data' TypeKey='' PropertyKey='FileTypeID' Value='46' Bool='Or'/>
							<Argument Type='Data' TypeKey='' PropertyKey='FileTypeID' Value='47' Bool='Or'/>
							<Argument Type='Data' TypeKey='' PropertyKey='FileTypeID' Value='48' Bool='Or'/>
							<Argument Type='Data' TypeKey='' PropertyKey='FileTypeID' Value='49' Bool='Or'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID'/>
				<Argument Type='QueryString' TypeKey='FileTypeID' PropertyKey='FileTypeID'/>
			</Filters>
			<DefaultValues>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUpload'
						Container='spnUploadPubs'>
						<InstructionHtml>
							Click on the <b>Browse…</b> button to find the file on your computer to upload.  Use the dialog box 
							that pops up to find the file and click <b>Open</b>.  Once the filename is in the field below, click the 
							<b>Upload</b> button.  To add another file, click on the <b>Cancel</b> button at the bottom of the screen to 
							return to the Additional Uploads page and click the <b>Add</b> button.						
						</InstructionHtml>						
						<Parameters>
							<Argument Type='QueryString' TypeKey='FileTypeID' PropertyKey='FileTypeID' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityAssocID' Bool=''/>	
							<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' Bool=''/>
							<Argument Type='QueryString' TypeKey='Description' PropertyKey='Description' Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool=''/>
							<!-- <Argument Type='' TypeKey='' PropertyKey='SaveBeforeUpload' Value='True' Bool=''/> -->
							<Argument IsHiddenFileTypeName='True'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnGo'
						Container='spnGo'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='GoClick'>
							<Parameters>
								<Argument Type='Control' TypeKey='ctlUploadType' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AdditionalUploads'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AdditionalUploads'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='AdditionalUploads'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>