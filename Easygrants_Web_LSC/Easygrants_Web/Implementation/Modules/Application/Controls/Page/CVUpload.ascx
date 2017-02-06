<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cCVUpload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<span id='spnPageContent' runat='server'/>
<p>
<span id='spnMoreText' runat='server'/>
<p>
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td colspan='2'>
			<a name='aPICVUpload'></a>
			<span runat='server' id='spnPICVUpload'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave_and_Continue'/>
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
			<DataObject Key='CVUpload' DataObjectDefinitionKey=''>
				<DisplayProperties>				
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlMoreText'
							Container='spnMoreText'
							Type='cTextPopUp'
							PopUpCloseImage='Close'
							Height='500'
							Width='700'>
							<InstructionHtml>
															Observe the following formatting requirements for each uploaded document:
	<p>
	All files must be in one of the following two formats:
	<br>&nbsp;&nbsp;&nbsp;    * Microsoft Word for Windows, with a filename extension of .doc
	</br>&nbsp;&nbsp;&nbsp;    * Rich Text Format (available from File|Save As menu item in most word processors) with a filename extension  
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;of .rtf Macintosh, Linuz, and other computers word processors will support saving the file in RTF format.</br>
	</p><p>
	For Word (.doc) or Rich Text Format (.rtf) documents
	<br>&nbsp;&nbsp;&nbsp;    * Ensure that your file does not exceed specified size limitations expressed under the upload in terms of 
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;characters, words or pages.
	</br>&nbsp;&nbsp;&nbsp;    * Ensure that uploaded files do not have password security.  If you upload a file without removing its password,
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;you may be able to view it, but the uploaded file will be missing from the full Application PDF.
	</br>&nbsp;&nbsp;&nbsp;    * All submission must be prepared separately using a word processing program in a standard typeface font, 
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;minimum 1 inch margins all around, 8/5/11 inch paper format, and a file size no larger than 5MB.
	</br>&nbsp;&nbsp;&nbsp;    * Graphics, charts and pictures must be part of the respective files to upload.  
	<br>&nbsp;&nbsp;&nbsp;    * Do not include your full name at the top of each page.  This will be done by the proposal generation system.
	</br>&nbsp;&nbsp;&nbsp;    * Do not number the pages in the body of the document.  This will be done by the proposal generation system.
	<br>&nbsp;&nbsp;&nbsp;    * Do not include headers or footers in your document.</br></br>
	</p><p>
	After you upload each file, click on the View button that will be displayed in order to view the file to ensure that it has been successfully uploaded and validated.  If there were any problems, clicking the View button will display the error message.  If the file is uploaded and validated properly, it will be displayed in PDF format.  
	</p>
							</InstructionHtml>
							<Action PostBack='False'>
							</Action>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlPICVUpload'
							Type='cUpload'
							Container='spnPICVUpload'>
							<InstructionHtml>
								<p>
								Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, or .pdf. </p>
									<font color='red'>IMPORTANT:</font> After you have uploaded the file, <b>you must</b> click the <<b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.
							</InstructionHtml>
							<Parameters>
								<Argument PropertyKey='FileTypeID' 
									Value='35'
									Bool='and'
									Anchor='aProjectDescription'/>
								<Argument Type='ModuleUser'
									TypeKey='WfTaskAssignmentID'
									PropertyKey='EntityAssocID'
									Value=''
									Bool='and'/>
								<Argument PropertyKey='FileExtensionList' 
									Value='doc,pdf,rtf,docx'
									ErrorMessage='Error : Only files with extension .doc, .pdf, .rtf or .docx are allowed.'
									Bool='and'/>
							</Parameters>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' GoToNextPage='True' >
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
									<Argument AttributeName='PageKey' Value='Main'/>
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>		
					
				</DisplayProperties>
			</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>