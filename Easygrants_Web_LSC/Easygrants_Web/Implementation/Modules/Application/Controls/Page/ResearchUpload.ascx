<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cResearchUpload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ResearchUpload.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<span id='spnPageContent' runat='server'/>
<p>

<br><span id='spnMoreText' runat='server'/>
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
			<span runat='server' id='spnSave_and_Continue'/> &nbsp;&nbsp;
			<span runat='server' id='spnClose' visible='false'/>
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
							Height='550'
							Width='750'>
							<InstructionHtml>
								Observe the following formatting requirements for each uploaded document:
								<br></br>
								All files must be in one of the following formats:
									<ul>
										<li>Microsoft Word for Windows, with a filename extension of .doc</li>
										<li>Rich Text Format (available from File|Save As menu item in most word processors) with a filename extension  
										of .rtf Macintosh, Linuz, and other computers word processors will support saving the file in RTF format.</li>
										<li>Adobe Portable Document Format, with a filename of extension of .pdf</li>
									</ul>
											
								For all uploaded documents:
									<ul>
										<li>Ensure that your file does not exceed specified size limitations expressed under the upload in terms of characters, words or pages</li>
										<li>Ensure that uploaded files do not have password security.  If you upload a file without removing its password, you may be able to view it, but the uploaded file will be missing from the Full Application PDF.</li>
										<li>All submissions must be prepared separately using a word processing program in a standard typeface font, minimum 1 inch margins all around, 8/5 x 11 inch paper format, and a file size no larger than 5 MB.</li>
										<li>Graphics, charts and pictures must be part of the respective files to upload.</li>
										<li>Do not include your full name at the top of each page.  This will be done by the proposal generation system.</li>
										<li>Do not number the pages in the body of the document.  This will be done by the proposal generation system.</li>
										<li>Do not include headers or footers in your document.</li>
									</ul>
							
								After you upload each file, click on the <b>View</b> button that will be displayed in order to view the file to 
								ensure that it has been successfully uploaded and validated.  If there were any problems, clicking the <b>View</b> 
								button will display the error message.  If the file is uploaded and validated properly, it will be displayed 
								in PDF format.  
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
								<p>Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, .pdf or .docx. </p>
									<b>IMPORTANT:</b> After you have uploaded the file, <b>you must</b> click the <b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.
							</InstructionHtml>
							<Parameters>
								<Argument PropertyKey='FileTypeID' 
									Value='34'
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
							<Action
								PostBack='True'
								AutoSave='True'/>
						</Control>	
					</DisplayProperty>
					<DisplayProperty PropertyKey=''>
						<Control ID='btnClose'
							Container='spnClose'
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