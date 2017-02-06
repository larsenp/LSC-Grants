<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ThirdParty.PageContent.cThirdParty_Uploads" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
<br>
<span id='spnPageContent' runat='server'/>
<p>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<asp:label id='lblValidationMessage' forecolor='red' runat='server' />

<asp:CustomValidator 
	id='valUpload'
	runat='server'
	OnServerValidate='ValidateUpload'
	ErrorMessage=''
	Display='None'/>

	
<!-- USER MODIFIABLE CONTENT AREA -->
<!--
<br>Follow the instructions below to upload your document in support of this applicant.  
<p>

To view instructions on how to use this page, click on the <b>Help</b> link in the left 
navigation.  For details on document upload formatting requirements, click the 
<b>More…</b> link below.

<p>
<b>IMPORTANT:</b> When you are finished uploading your file, click the <b>Submit</b> button 
	at the bottom of this page.
-->
<p><span id='spnMoreText' runat='server'/>
<p>
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

<p>

<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnDocUpload'/>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span id='spnSubmitButton' runat='server' />
		</td>
	</tr>					
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='ApplicantInfo' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False'>
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
										DataObjectPropertyKey='GranteeProject.ApplicantWfTaskAssignment.WfTaskAssignmentID'
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
							All files must be in one of the following two formats:
							<ul>
								<li>Microsoft Word for Windows, with a filename extension of .doc</li>
								<li>Rich Text Format (available from File|Save As menu item in most word processors) 
									with a filename extension  of .rtf.  Macintosh, Linuz, and other computers word 
									processors will support saving the file in RTF format.</li>
							</ul>
							<p>For Word (.doc) or Rich Text Format (.rtf) documents:</p>
							<ul>
								<li>Ensure that your file does not exceed specified size limitations expressed under 
									the upload in terms of characters, words or pages.</li>
								<li>Ensure that uploaded files do not have password security.  If you upload a file 
									without removing its password, you may be able to view it, but the uploaded file will be 
									missing from the full Application PDF.</li>
								<li>All submission must be prepared separately using a word processing program in a 
									standard typeface font, minimum 1 inch margins all around, 8/5/11 inch paper format, and 
									a file size no larger than 5MB.</li>
								<li>Graphics, charts and pictures must be part of the respective files to upload.</li>
								<li>Do not include your full name at the top of each page.  This will be done by the proposal generation system.</li>
								<li>Do not number the pages in the body of the document.  This will be done by the proposal generation system.</li>
								<li>Do not include headers or footers in your document.</li>
							</ul>
							<p>After you upload each file, click on the View button that will be displayed in order to view 
								the file to ensure that it has been successfully uploaded and validated.  If there were any problems, 
								clicking the <b>View</b> button will display the error message.  If the file is uploaded and validated properly, 
								it will be displayed in PDF format.</p>
						</InstructionHtml>
						<Action PostBack='False'>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlDocUpload'
						Type='cUpload'
						Container='spnDocUpload'>
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
								Value='41'
								Bool='and'/>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Value=''
								Bool='and'/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .pdf, .rtf or .docx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmitButton'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes.'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='SubmissionContent_Submit'/>
						<Visible>
							<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' />
						</Visible>						
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


		
	</ModuleSection>
</span>


