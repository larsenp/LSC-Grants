<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />

<div style='width:800px'>
	<br />
	<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
	<div style="width:100%" class='SeparatorHdg' >Application Info</div>
	<table width='600px' cellpadding='1' border='0'>
		<tr>
			<td>
				<b>Organization</b> <span runat='server' id='spnOrganization' /> (<span runat='server' id='spnRecipientID' />)
			</td>
			<td>
				<b>Grant Number</b> <span runat='server' id='spnTIG' />
			</td>
		</tr>
	</table>
	<br />
	
	<div style="width:100%" class='SeparatorHdg' >Instructions</div>
	<table border='0' cellspacing='0' cellpadding='2' width='100%'>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				Please upload your organization’s signed Acceptance of 2014 Pro Bono Innovation grant award form, 2014 Pro Bono Innovation Fund Grant Assurances, and Conflict of Interest and Acknowledgement Disclosure Form as a single PDF by September 26, 2014.
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<ol>
				  <li>In the <b>Grant Acceptance</b> section below, click <b>Browse</b> to find the file on your computer. Your grant acceptance must be in PDF format.</li>
				  <li>After the file name appears in the text box, click <b>Upload</b></li>
				  <li>When the upload is complete, the file name and upload date will appear in a list at the bottom of the page.</li>
				  <li>Click <b>View</b> to view the document to verify it was accepted by the system. The document will appear in a new browser window or tab. If the system encountered errors saving your document, an error message will appear in the new window.</li>
				  <li>If there has been an error and you need to re-upload your grant acceptance, first delete your original uploaded document by clicking the <b>Delete</b> button.</li>
			  </ol>
			</td>
		</tr>
	</table>
	
	<div width='100%' class='SeparatorHdg'>Grant Acceptance</div>
	<br />
	<span runat='server' id='spnUpload' />
	<br />
	<span runat='server' id='spnFileList' />
	<br />
	<div style="text-align: center">
		<span runat='server' id='spnContinue' />
	</div>
</div>
  
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryOrganization.OrganizationName'>
					<Control ID='spnOrganization'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnRecipientID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
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
				<Argument PropertyKey='UploadId' Value='70' />
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
				<Argument PropertyKey='UploadId' Value='70'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileList'
						Type='cDataListCtl'
						Container='spnFileList'
						NoRecordMessage='The grant acceptance package has not been uploaded.'>
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