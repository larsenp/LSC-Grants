<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cBioUpload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr><td>Use this page to upload your Biographical Sketch. Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, or .pdf.<span id='spnMoreText' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellpadding='0'  visible='false'cellspacing='0' width='100%'>
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
			<span runat='server' id='spnClose'/> 
		</td>
	</tr>	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='CVUpload' DataObjectDefinitionKey=''>
				<DisplayProperties>
					<DisplayProperty PropertyKey=''>
						<Control ID='ctlMoreText'
							Container='spnMoreText'
							Type='cTextPopUp'
							PopUpCloseImage='Close'
							Height='550'
							Width='750'
							Caption='Click here for more information on formatting requirements.'>
							<InstructionHtml>
								<b>Observe the following formatting requirements for each uploaded document:</b>
								<br></br>
								All files must be in one of the two following formats:
									<ul>
										<li>Microsoft Word for Windows, with a filename extension of .doc</li>
										<li>Rich Text Format (available from File->Save As menu item in most word processors) with a filename extension  
										of .rtf (Macintosh, Linux, and other platforms&rsquo; word processors will support saving the file in RTF format.)</li>
									</ul>
											
								For Word (.doc) or Rich Text Format (.rtf) documents
									<ul>
										<li>Ensure that your file does not exceed specified size limitations expressed under the upload in terms of characters, words or pages.</li>
										<li>Ensure that uploaded files do not have password security.  If you upload a file without removing password, you may be able to view it, but the uploaded file will be missing from the full Application PDF.</li>
										<li>All submissions must be prepared separately using a word processing program in a standard typeface font, minimum 1&uml; margins all around, 8/5/11&uml; paper format, and a file size no larger than 5MB.</li>
										<li>Graphics, charts and pictures must be part of the respective files to upload.</li>
										<li>Do not include your full name at the top of each page.  This will be done by the proposal generation system.</li>
										<li>Do not number the pages in the body of the document.  This will be done by the proposal generation system.</li>
										<li>Do not include headers or footers in your document.</li>
									</ul>
							
								After you upload each file, click the <b>View</b> button in order to ensure that the file has been successfully uploaded and validated.  If the file has uploaded and validated properly, it will be displayed in PDF format.  If there were any problems, the error message(s) will display. 
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
								<b>IMPORTANT:</b> After you have uploaded the file, <b>you must</b> click the <b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will see a screen with those details.
							</InstructionHtml>
							<Parameters>
								<Argument PropertyKey='FileTypeID' 
									Value='33'
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