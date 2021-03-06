<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="PublicationUploadEditor.ascx.vb" Inherits="Easygrants_Web.Modules.ProgressReport.PageContent.cPublicationUploadEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' 
	Src='Core/Controls/Base/ValidationSummary.ascx'	
	runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4">
			<span runat='server' id='spnUpload'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" align='center'>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
<tr><td>&nbsp;</td></tr>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>History</b></td>
</tr>
<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td><b>Created by</b>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span runat='server' id='SpnUploadedBy'/>
	</td>
</tr>
<tr>
	<td><b>Created on</b>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span runat='server' id='SpnSubmitDate'/>
	</td>
</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='EntityID' />
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='UploadedByID' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUploadSaveAll'
						Container='spnUpload'
						NoFileMessage='Select a file to upload.'>
						<InstructionHtml>
							<p>Click <b>Browse�</b> to find the file on your computer to upload. Use the dialog box that pops up to find the file and click <b>Open</b>. Once the filename is in the field below, click <b>Upload</b>.</p>
							<p><b>IMPORTANT:</b> After you have uploaded the file, you must click <b>File/Document Name</b> to view the document as it has been converted. If there were any conversion errors, you will view a screen with those details.</p>
						</InstructionHtml>
						<Parameters>
							<Argument Type='QueryString' TypeKey='FileTypeID' PropertyKey='FileTypeID' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='EntityAssocID' Bool=''/>
							<Argument Type='QueryString' TypeKey='SubmittedFileID' PropertyKey='SubmittedFileID' Bool=''/>
							<Argument Type='QueryString' TypeKey='Description' PropertyKey='Description' Bool=''/>
							<Argument PropertyKey='FileExtensionList' Value='doc,xls,rtf,txt,pdf,ppt,docx,xlsx,pptx' ErrorMessage='Error: Only files with extension .doc, .xls, .rtf, .txt, .pdf, .ppt, .docx, .xlsx or .pptx are allowed.'/>
							<Argument PropertyKey='Description' Value='True'/>
							<Argument PropertyKey='DisplayErrorInValidationSummary' Value='True'/>
							<Argument PropertyKey='ViewOriginalFileFormat' Value='True'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='UploadedBy.LastNameFirstName'>
					<Control ID='SpnUploadedBy' Type='HtmlGenericControl'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='SubmitDate' Format='M/d/yyyy'>
					<Control ID='SpnSubmitDate' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProjectPublications' DataObjectDefinitionKey='GranteeProjectPublications' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectPublicationsID' PropertyKey='GranteeProjectPublicationsID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
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