<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<span id='spnPageContent' runat='server' />

<div class='SeparatorHdg'>
	Instructions
</div>

<div style="width:600px">
	<br />

	<p><b>Narrative</b>&nbsp;<%=kDenoteRequiredField%></p>

	<p>
		Please upload your entire <em>Narrative</em> document by clicking on the <strong>Upload</strong> button below. LSC will enforce our published page, formatting, and character limits. Your application score may be negatively affected if it does not follow the formatting requirements below.
	</p>
	<p>
		REQUIREMENTS FOR APPLICANTS THAT ARE NOT PRO BONO INNOVATION FUND GRANTEES:
		<ul>
			<li>
				20 double-spaced pages with one-inch margins. (Approximately 12,000 words or 62,000 characters not including spaces in a standard word processing document.)
			</li>
			<li>
				Times New Roman 12-point font
			</li>
		</ul>
	</p>
	<p>
		REQUIREMENTS FOR CURRENT PRO BONO INNOVATION FUND GRANTEES:
		<ul>
			<li>
				25 double-spaced pages with one-inch margins. (Approximately 15,000 words or 78,000 characters not including spaces in a standard word processing document.)
			</li>
			<li>
				Times New Roman 12-point font
			</li>
		</ul>
	</p>
	<p><b>Upload Instructions</b></p>
	<ol>
		<li>
			Once you are in this <strong>Narrative</strong> section of your LSC Grants PBIF application, click <strong>Browse</strong> or <strong>Choose File</strong> to find the file locally on your computer. Please upload either a Word or PDF document.
		</li>
		<li>
			After the file name appears in the text box, click <strong>Upload</strong>.
		</li>
		<li>
			When the upload is complete, the file name and upload date will appear in a list at the bottom of the page.
		</li>
		<li>
			Click <strong>View</strong> to view the document to verify it was accepted by the system. The document will appear in a new browser window or tab. If the system encountered errors saving your document, an error message will appear in the new window.
		</li>
		<li>
			Click <strong>Delete</strong> to permanently remove the file from your application.
		</li>
	</ol>
</div>

<div class='SeparatorHdg'>
	Narrative
</div>
<div style="width:600px">
	<span runat="server" id='spnUpload' />
	<br />
	<span runat='server' id='spnFileList' />
	<br />	
	<div style="text-align:center">
		<span runat='server' id='spnContinue' />
	</div>	
</div>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='LscPbifApp' DataObjectDefinitionKey='LscPbifApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Continue'
						Save='False'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfProjectTask.WfProjectTaskID' PropertyKey='WfProjectTaskID' />
				<Argument PropertyKey='UploadId' Value='81' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cLSCUpload'
						Container='spnUpload'>
						<Properties>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
							<Argument PropertyKey='EntityType' Value='WfTaskAssignment' />
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskUpload' DataObjectPropertyKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID'/>
							<Argument PropertyKey='DisplayErrorInValidationSummary' Value='False' />
						</Properties>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='81'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileList'
						Type='cDataListCtl'
						Container='spnFileList'
						NoRecordMessage='No Narrative has been uploaded for this application.'>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File Name' />
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Uploaded' Format='M/d/yyyy h:mm tt' />
						<DisplayProperty PropertyKey='' DataAlign='Center'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this file?'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='SubmittedFile_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value=''/>
										</Parameters>
								</Action>
								<Action
									PostBack='True'
									Object='ModulePage'
									Method='Redirect'>
								</Action>
							</Control>
						</DisplayProperty> 
						<DisplayProperty PropertyKey='' DataAlign='Center'>
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value=''/>
									</Parameters>	
								</Action>	
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>		
