<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.ThirdParty.PageContent.cKatzMain" CodeBehind="KatzMain.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<br>
<span id='spnPageContent' runat='server'/>
<p>
<!--
<br>Folllow the instructions below to upload your letter of support in support of your 
sponsorship of this applicant (<font color=red>one letter is required</font>).  
<p>
To view instructions on how to use this page, click on the <b>Help</b> link in the left 
navigation.  For details on document upload formatting requirements, click the <b>More…</b> link 
below.
<p>
<b>IMPORTANT:</b> When you are finished uploading your file, click the <b>Save and Continue</b> button 
at the bottom of this page to proceed to the Validate/Submit page to complete your 
submission.-->
<p><span id='spnMoreText' runat='server'/>
<p>

<!-- Control Label (for Publication upload) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnUploadRefLtr'/>
		</td>
	</tr>	
						
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnSubmit'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' 
					PropertyKey='EntityID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlMoreText'
						Container='spnMoreText'
						Type='cTextPopUp'
						PopUpCloseImage='Close'
						Height='400'
						Width='400'>
						<InstructionHtml>
							<b>IMPORTANT:</b> Deleting a contact record requires that you first mark any Active 
							tasks associated with the contact as Inactive.  If there are Active tasks, no 
							Delete button will be displayed. In addition, deleting a contact record will 
							delete all of the child records, including application, grant, progress report, 
							organization and person affiliation records.
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
								<font color='red'>IMPORTANT:</font> After you have uploaded the file, <b>you must</b> click the <b>View</b> button to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.</p>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' Value='38' Bool=''/>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID' Bool=''/>	
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmit'
						Container='spnSubmit'
						Type='cButton'
						Image='Submit'
						Confirmation='Are you sure you want to Submit?  Once you submit, you will not be able to make changes.'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController' 
							Method='Submit'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Home' />
								<Argument Type='' TypeKey='' Value='HomeModuleConfig' />
								<Argument Type='' TypeKey='' Value='Home' />
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='ConversionStatus' NullDataObject='True' Operator='Equal' Value='-1' />
						</Visible>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
</span>
<!-- End Embedded XML -->
