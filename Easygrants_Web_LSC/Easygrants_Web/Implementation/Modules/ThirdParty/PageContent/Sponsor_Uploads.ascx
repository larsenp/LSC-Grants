<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.ThirdParty.PageContent.cSponsor_Uploads" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<span id='spnPageContent' runat='server'/>
<p>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

	
<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<!--
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Follow the instructions below to upload the following documents in support 
			of your sponsorship of this applicant (<font color='red'>all are required</font>):<br><br>
			1) Letter of Support for this applicant; <br>
			2) Your CV; <br>
			3) Training Plan Description; and <br>
			4) Other Funding Description <br><br>
		</td>
	</tr>
	<tr>
		<td>
			To view instructions on how to use this page, click on the <b>Help</b> link in the left 
			navigation.  For details on document upload formatting requirements, click the <b>More…</b> 
			link below. <br><br>
		</td>
	</tr>
	<tr>
		<td>
			<b>IMPORTANT:</b> When you are finished uploading your files, click the <b>Save & Continue</b> button 
			at the bottom of this page to proceed to the Validate/Submit page to complete your submission. <br><br>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>-->
	<tr><td><span id='spnMoreText' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' visible='false'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Application Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='4'>Click on the <b>View PDF</b> button to view the applicants pdf.  If the application is in progress, you may see an incomplete application.</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>Applicant Name</b></td>
		<td><span id='spnApplicantName' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>Competition</b></td>
		<td><span id='spnCompetition' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'><td colspan='4'><span id='spnViewApp' runat='server'/></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>


<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aLetterSupportUpload'></a>
			<span runat='server' id='spnLetterSupportUpload'/>
		</td>
	</tr>
	<tr>
		<td>
			<a name='aCVUpload'></a>
			<span runat='server' id='spnCVUpload'/>
		</td>
	</tr>
	<tr>
		<td>
			<a name='aTrainingPlanUpload'></a>
			<span runat='server' id='spnTrainingPlanUpload'/>
		</td>
	</tr>
	<tr>
		<td>
			<a name='aOtherFundUpload'></a>
			<span runat='server' id='spnOtherFundUpload'/>
		</td>
	</tr>
</table>


<!-- Buttons -->
<center>
	<table border='0'>	
		<tr>
			<td><span runat='server' id='spnSave_and_Continue'/>&nbsp;&nbsp;</td>
		</tr>
	</table>
</center>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' 
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryPerson.LastNameFirstName'>
					<Control ID='spnApplicantName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.WfProject.WfProjectName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>		
		</DataObject>
		
		<DataObject Key='ViewAppPDF' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnView'
						Type='cButton'
						Container='spnViewApp'
						Image='view_pdf'>
							<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ViewAppPDF'>
								<Parameters>
									<Argument Type='DataObjectCollection'
										TypeKey='ViewAppPDF'
										DataObjectPropertyKey='GranteeProject.ApplWfTaskAssignments.WfTaskAssignmentID'
										PropertyKey='EntityID'
										BaseValue=''/>
									<Argument Type='DataObjectCollection'
										TypeKey='ViewAppPDF'
										DataObjectPropertyKey='WfTask.WfTaskModule.ReportOutputDefinitionID'
										PropertyKey='DefinitionID'
										BaseValue=''/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Upload' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlMoreText'
						Container='spnMoreText'
						Type='cTextPopUp'
						PopUpCloseImage='Close'
						Height='650'
						Width='800'>
						<InstructionHtml>
							<p><b>Observe the following formatting requirements for each uploaded document:</b></p>
							All files must be in one of the following formats:
								<ul>
									<li>Microsoft Word for Windows, with a filename extension of .doc</li>
									<li>Rich Text Format (available from File|Save As menu item in most word processors) 
										with a filename extension of .rtf.  Macintosh, Linux, and other computers word 
										processors will support saving the file in RTF format.</li>
									<li>Adobe Portable Document Format, with a filename of extension of .pdf</li>
								</ul>
								<p>For all uploaded documents:</p>
								<ul>
									<li>Ensure that your file does not exceed specified size limitations expressed under 
										the upload in terms of characters, words or pages.</li>
									<li>Ensure that uploaded files do not have password security.  If you upload a file 
										without removing its password, you may be able to view it, but the uploaded file will be 
										missing from the Full Application PDF.</li>
									<li>All submissions must be prepared separately using a word processing program in a 
										standard typeface font, minimum 1 inch margins all around, 8/5 x 11 inch paper format, and 
										a file size no larger than 5 MB.</li>
									<li>Graphics, charts and pictures must be part of the respective files to upload.</li>
									<li>Do not include your full name at the top of each page.  This will be done by the proposal generation system.</li>
									<li>Do not number the pages in the body of the document.  This will be done by the proposal generation system.</li>
									<li>Do not include headers or footers in your document.</li>
								</ul>
								<p>After you upload each file, click on the View button that will be displayed in order to view 
									the file to ensure that it has been successfully uploaded and validated.   If there were any problems, 
									clicking the <b>View</b> button will display the error message.  If the file is uploaded and validated properly, 
									it will be displayed in PDF format.</p>
						</InstructionHtml>
						<Action PostBack='False'>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Uploads' DataObjectDefinitionKey=''>
			<DisplayProperties>					
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlLetterSupportUpload'
						Type='cUpload'
						Container='spnLetterSupportUpload'>
						<InstructionHtml>
							<table>
								<tr>
									<td>
										Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, or .pdf
									</td>
								</tr>
								<tr><td>&nbsp;</td></tr>
								<tr>
									<td>
										<font color='red'><b>IMPORTANT:</b></font>&nbsp;&nbsp;After you have uploaded the file, <b>you must</b> click the 
										<b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion 
										errors, you will view a screen with those details.
									</td>
								</tr>
							</table>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='38'
								Bool='and'
								Anchor='aLetterSupportUpload'/>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Value=''
								Bool='and'/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCVUpload'
						Type='cUpload'
						Container='spnCVUpload'>
						<InstructionHtml>
							<table>
								<tr>
									<td>
										Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, or .pdf
									</td>
								</tr>
								<tr><td>&nbsp;</td></tr>
								<tr>
									<td>
										<font color='red'><b>IMPORTANT:</b></font>&nbsp;&nbsp;After you have uploaded the file, <b>you must</b> click the 
										<b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion 
										errors, you will view a screen with those details.
									</td>
								</tr>
							</table>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='35'
								Bool='and'
								Anchor='aCVUpload'/>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Value=''
								Bool='and'/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTrainingPlanUpload'
						Type='cUpload'
						Container='spnTrainingPlanUpload'>
						<InstructionHtml>
							<table>
								<tr>
									<td>
										Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, or .pdf
									</td>
								</tr>
								<tr><td>&nbsp;</td></tr>
								<tr>
									<td>
										<font color='red'><b>IMPORTANT:</b></font>&nbsp;&nbsp;After you have uploaded the file, <b>you must</b> click the 
										<b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion 
										errors, you will view a screen with those details.
									</td>
								</tr>
							</table>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='39'
								Bool='and'
								Anchor='aTrainingPlanUpload'/>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Value=''
								Bool='and'/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOtherFundUpload'
						Type='cUpload'
						Container='spnOtherFundUpload'>
						<InstructionHtml>
							<table>
								<tr>
									<td>
										Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, or .pdf
									</td>
								</tr>
								<tr><td>&nbsp;</td></tr>
								<tr>
									<td>
										<font color='red'><b>IMPORTANT:</b></font>&nbsp;&nbsp;After you have uploaded the file, <b>you must</b> click the 
										<b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion 
										errors, you will view a screen with those details.
									</td>
								</tr>
							</table>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='40'
								Bool='and'
								Anchor='aOtherFundUpload'/>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Value=''
								Bool='and'/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton' GoToNextPage='True' />
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->
