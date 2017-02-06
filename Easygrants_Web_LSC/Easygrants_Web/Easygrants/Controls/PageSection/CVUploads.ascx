<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cCVUploads" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
<!-- USER MODIFIABLE CONTENT AREA -->
<P>
Upload your current CV and the current CV for primary co-investigator entered in the Co-Investigator Contact 
Information section of the application.  All CVs uploaded should be in Microsoft Word for Windows (.doc), Adobe PDF (.pdf),
or Rich Text Format (.rtf).  The CVs must include degrees awarded and the date they were awarded, employment
history, and research funding history.  The CVs should be in NIH format and must not exceed 2 pages.
</P>
<p>
<ul>
	<li> Click on the <b>Save and Continue</b> button to save the information.</li>
	<li>Click on the <b>Close</b> button to close the <b>CV Uploads</b> page and return to the <b>Application Main</b> page.</li>
</ul>
</p>
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aPICVUpload'></a>
			<span runat='server' id='spnPICVUpload'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aCoPICVUpload'></a>
			<span runat='server' id='spnCoPICVUpload'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='CVUpload' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPICVUpload'
						Type='cUpload'
						Container='spnPICVUpload'>
						<InstructionHtml>
							<p>
							<b>Upload files must be not larger than 7 MB and <b><u>must not exceed 2 pages</u></b>. 
							Easygrants uses pop-up functionality. This functionality must be enabled. (i.e., turn off pop-up blockers.)</b>
							</p>
							<p>
								Click on the <b>Browse…</b> button to find the file on your computer to upload.  Use the dialog box that pops up to find the file and click Open.  Once the filename is in the field below, click the <b>Upload</b> button.</p>
							<p>
								<font color='red'>IMPORTANT:</font> After you have uploaded the file, you must click the <b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.</p>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='15'
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
					<Control ID='ctlCoPICVUpload'
						Type='cUpload'
						Container='spnCoPICVUpload'>
						<InstructionHtml>
							<p>
							<b>Upload files must be not larger than 7 MB and <b><u>must not exceed 2 pages</u></b>. 
							Easygrants&reg; uses pop-up functionality. This functionality must be enabled. (i.e., turn off pop-up blockers.)</b>
							</p>
							<p>
								Click on the <b>Browse…</b> button to find the file on your computer to upload.  Use the dialog box that pops up to find the file and click Open.  Once the filename is in the field below, click the <b>Upload</b> button.</p>
							<p>
								<font color='red'>IMPORTANT:</font> After you have uploaded the file, you must click the <b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.</p>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='22'
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>