<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cProjectDescription" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<P>
The project description should be <b><u>no more than 7 pages</u></b> and contain the following information:
<ol>
	<li>a statement of the general objectives, specific aims, and milestones of the project;
	<li>the previous research experience and accomplishments in the project area by the PI;
	<li>a concise review of recent research in the field;
	<li>a statement of the unmet or underserved clinical need that the project addresses, and how it addresses it;
	<li>a statement of why the project is translational;
	<li>a detailed research plan including procedures;
	<li>a timeline indicating key milestones (specific aims) and when they are expected to be achieved;
	<li>an intellectual property summary and a strategic plan for protecting proprietary project outcomes;
	<li>a summary of the envisioned product(s) that might result from successful completion of the project and a general strategic plan for how commercialization might be achieved; and
	<li>a summary of the approach that will be undertaken to attract follow-on funding after the Coulter Foundation award funding expires.
</ol>
The file should be in Microsoft Word for Windows (.doc), Adobe PDF (.pdf) or Rich Text Format (.rtf).  The format should be single spacing, 12 point type, double space between paragraphs and all margins should be 1 inch or greater.
</P>
<p>
<ul>
	<li>Click on the <b>Save and Continue</b> button to save the information.</li>
	<li>Click on the <b>Close</b> button to close the <b>Project Description</b> page and return to the <b>Application Main</b> page.</li>
</ul>
</p>
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aProjectDescription'></a>
			<span runat='server' id='spnProjectDescription'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ProjectDescription' DataObjectDefinitionKey=''>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProjectDescription'
						Type='cUpload'
						Container='spnProjectDescription'>
						<InstructionHtml>
							<p>
							<b>Upload files must be not larger than 7 MB and must not exceed 7 pages. 
							Easygrants&reg; uses pop-up functionality. This functionality must be enabled. (i.e., turn off pop-up blockers.)</b>
							</p>
							<p>
								Click on the <b>Browse…</b> button to find the file on your computer to upload.  Use the dialog box that pops up to find the file and click Open.  Once the filename is in the field below, click the <b>Upload</b> button.</p>
							<p>
								<font color='red'>IMPORTANT:</font> After you have uploaded the file, you must click the View button to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.</p>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='26'
								Bool='and'
								Anchor='aProjectDescription'/>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Value=''
								Bool='and'/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,PDF,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>