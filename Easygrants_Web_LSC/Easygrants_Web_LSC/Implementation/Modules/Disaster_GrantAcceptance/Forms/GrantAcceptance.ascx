<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<style>
	table.instr td { 
		padding-bottom:10px;
		padding-right:20px;
		vertical-align:top;
	}
</style>
<div style="width:600px;">
	<div class="SeparatorHdg">Instructions</div>
	<p>Please follow the steps below for uploading and transmitting the Acceptance of Grant Award PDF file to LSC.</p>
	<p><strong>Note</strong>: this process must be followed for both the Hurricane Sandy Disaster grant and the LSC Disaster Relief Emergency grant. Each grant is represented by a separate task on your main LSC Grants home page.</p>
	<table width='100%' class="instr">
		<tr>
			<td>
				Step&nbsp;1
			</td>
			<td>
				Download the <strong>Grant Award Package</strong> emailed to you by LSC. 
			</td>
		</tr>
		<tr>
			<td>
				Step 2
			</td>
			<td>
			<strong>All grantees must:</strong>
			<ol type='a'>
				<li>Assure that a complete set of the grant award documents are provided to the Executive Director and the Board Chair, </li>
				<li>Review and sign the “Acceptance of Grant Award” (AGA) and the Grant Assurances for each grant you are receiving.</li>
			</ol>
			</td>
		</tr>
		<tr>
			<td>
				Step 3
			</td>
			<td>
			Convert the Acceptance of Grant Award for your grant into a PDF file. (You do not need to return the 2013 Grant Assurances, but you must keep them with your grant documents and make them available to LSC upon request.)
			</td>
		</tr>
		<tr>
			<td>
				Step 4
			</td>
			<td>
			In the "Upload Executed Acceptance of Grant Award (AGA)" section below, click the <strong>Browse...</strong> button to locate and select the PDF file to upload. 
			</td>
		</tr>
		<tr>
			<td>
				Step 5
			</td>
			<td>
			Click <strong>Upload</strong> to transmit the file to LSC. After you have uploaded your file, the file information will appear below the <strong>Upload</strong> button. You can review your uploaded file by clicking the <strong>View</strong> button that will appear as part of your file information.
			</td>
		</tr>
		<tr>
			<td>
				Step 6
			</td>
			<td>
				Click <strong>Continue</strong> at the bottom of the page to proceed to the Review and Submit page.
			</td>
		</tr>
		<tr>
			<td>
				Step 7
			</td>
			<td>
				On the Review and Submit page, click <strong>Submit</strong> to finalize the submission of your executed Acceptance of Grant Award document.
			</td>
		</tr>
	</table>
	<div class="SeparatorHdg">Upload Executed Acceptance of Grant Award (AGA)</div>
	<p>Upload the executed AGA as a PDF file.</p>
	<span runat='server' id='spnUpload' />
	<br />
	<span runat='server' id='spnFileList' />
	<br />
	<div style="text-align: center">
		<span runat='server' id='spnContinue' />
	</div>
</div>

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
				<Argument PropertyKey='UploadId' Value='50' />
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
							<Argument PropertyKey='DisplayErrorInValidationSummary' Value='True' />
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
				<Argument PropertyKey='UploadId' Value='50'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileList'
						Type='cDataListCtl'
						Container='spnFileList'
						NoRecordMessage='The executed AGA has not been uploaded..'>
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
