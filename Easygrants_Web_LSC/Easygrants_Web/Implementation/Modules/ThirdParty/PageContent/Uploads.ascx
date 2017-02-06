<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- 
<br>Follow the instructions below to upload your letter of support in support of your 
sponsorship of this applicant (<font color=red>one letter is required</font>).  
<p>
To view instructions on how to use this page, click on the <b>Help</b> link in the left 
navigation.  For details on document upload formatting requirements, click the <b>More…</b> link 
below.
<p>
<b>IMPORTANT:</b> When you are finished uploading your file, click the <b>Save and Continue</b> button 
at the bottom of this page to proceed to the Validate/Submit page to complete your 
submission.
-->

<br>
<span id='spnPageContent' runat='server'/>
<p>

<p><span id='spnMoreText' runat='server'/>
<p>
<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnUploadRefLtr'/>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave_and_Continue'/> 
		</td>
	</tr>					
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
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
					<Control ID='ctlUploadRefLtr'
						Type='cUpload'
						Container='spnUploadRefLtr'>
						<InstructionHtml>
							<p>
							Uploaded files should be no larger than 5 MB and have the following file extensions: .doc, .rtf, or .pdf
							</p>
							<p>
								<font color='red'>IMPORTANT:</font> After you have uploaded the file, <b>you must</b> click the <b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.</p>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' Value='38' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID' Bool=''/>	
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton' GoToNextPage='True' >
					</Control>	
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>


