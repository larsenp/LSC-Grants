<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIABLE CONTENT AREA -->
<br><br>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Upload Attachment
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnUploadPubs'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUpload'
						NoFileMessage='Select a file to upload.'						
						Container='spnUploadPubs'>
						<Parameters>
							<Argument Type='QueryString' 
								TypeKey='FileTypeID'
								PropertyKey='FileTypeID'
								Bool=''/>
							<Argument Type='DataPresenter' 
								TypeKey='EntityID'
								PropertyKey='EntityAssocID'
								Bool=''/>
							<Argument Type='QueryString' 
								TypeKey='SubmittedFileID'
								PropertyKey='SubmittedFileID'
								Bool=''/>
							<Argument Type='QueryString' 
								TypeKey='Description'
								PropertyKey='Description'
								Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,xls,rtf,txt,pdf,ppt,docx,xlsx,pptx'
								IsHiddenFileTypeName='True'
								ErrorMessage='Error : Only files with extension .doc, .xls, .rtf, .txt, .pdf, .ppt, .docx, .xlsx or .pptx are allowed.'
								Bool='and'/>
							<Argument PropertyKey='Description' Value='True'/>
						</Parameters>
						<InstructionHtml>
							Click <b>Browse…</b> to find the file on your computer to upload.  Use the dialog 
							box that pops up to find the file and click <b>Open</b>.  Once the filename is in the field below, click 
							<b>Upload</b>.
							<br/><br/>
							IMPORTANT: After you have uploaded the file, you must click the <b>File/Document Name</b> to view the document as it has been converted.  
							If there were any conversion errors, you will view a screen with those details.
						</InstructionHtml>
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
