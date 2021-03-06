<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<br />
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br />


	<div style="width:100%" class="SeparatorHdg">
		Instructions
	</div>
<div style="width:600px">
	<p>&nbsp;Please upload the resumes for key staff responsible for the proposed project.</p>

	<ol>
		<li>
			In the&nbsp;<strong>Resumes and New Position Descriptions of Key Staff</strong>&nbsp;section, click&nbsp;<strong>Browse</strong>&nbsp;to find the file(s) locally on your computer.
		</li>
		<li>
			After the file name appears in the text box, click&nbsp;<strong>Upload</strong>
		</li>
		<li>When the upload is complete, the file name and upload date will appear in a list at the bottom of the page.</li>
		<li>
			Click&nbsp;<strong>View</strong>&nbsp;to view the document to verify it was accepted by the system. The document will appear in a new browser window or tab. If the system encountered errors saving your document, an error message will appear in the new window.
		</li>
		<li>
			You may repeat steps 1 � 4 for multiple documents.
		</li>
		<li>
			Click&nbsp;<strong>Delete</strong>&nbsp;to permanently remove the file from your application.
		</li>
	</ol>
</div>

	<div width='100%' class='SeparatorHdg'>Resumes of Key Staff</div>
	<br />
	<span runat='server' id='spnUpload' />
	<br />
	<span runat='server' id='spnFileList' />
	<br />
	<div style="text-align: center">
	<span runat='server' id='spnContinue' />
</div>




<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
	<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
	<Filters>
		<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
	</Filters>
	</DataObject>
	<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='False' CreateNew='False'>
		<Filters>
			<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfProjectTask.WfProjectTaskID' PropertyKey='WfProjectTaskID' />
			<Argument PropertyKey='UploadId' Value='62' />
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

	<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
		<Filters>
			<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
			<Argument PropertyKey='UploadId' Value='62'>
				<RelatedProperty PropertyKey='TaskUploadType' />
			</Argument>
		</Filters>
		<DisplayProperties>
			<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
				<Control ID='ctlFileList'
					Type='cDataListCtl'
					Container='spnFileList'
					NoRecordMessage='No Resumes of Key Staff have been uploaded for this application.'>
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