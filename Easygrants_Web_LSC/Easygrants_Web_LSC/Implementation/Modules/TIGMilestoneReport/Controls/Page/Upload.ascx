<%@ Control Language="vb" AutoEventWireup="true" Codebehind="" Inherits="Implementation.Modules.TIGMilestoneReport.Controls.Page.cUpload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />

<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<br />
<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
	<tr>
		<td>
			<ol>
			  <li>In the <b>TIG Milestones Upload</b> section, click <b>Browse</b> to find the file on your computer</li>
			  <li>After the file name appears in the text box, click <b>Upload</b></li>
			  <li>When the upload is complete, the file name and upload date will appear in a list at the bottom of the page. The file name will include a prefix indicating the TIG grant number, the payment number, and the milestone number for which it was uploaded.</li>
			  <li>Click <b>View</b> to view the document to verify it was accepted by the system. The document will appear in a new browser window or tab. If the system encountered errors saving your document, they will appear in the new window</li>
			  <li>Click <b>Delete</b> to permanently remove the file from your report.</li>
			  <li>Click <b>Close</b> to return to the Milestones page.</li>
		  </ol>
		</td>
	</tr>
</table>
<div class='SeparatorHdg'>TIG Milestones Upload</div>
<br />
TIG: <span runat='server' id='spnTIG' /><br />
Payment Number: <span runat='server' id='spnPaymentNumber' /><br />
Milestone Number: <span runat='server' id='spnMilestoneNumber' /><br />

<span runat='server' id='spnUpload' />
<br />
<span runat='server' id='spnFileList' />
<br />
<div style="text-align: center">
	<span runat='server' id='spnClose' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscMilestone' DataObjectDefinitionKey='LscMilestone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='LscMilestoneID' PropertyKey='LscMilestoneID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Payment.GranteeProject.LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Payment.PaymentNumber'>
					<Control ID='spnPaymentNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MilestoneNumber'>
					<Control ID='spnMilestoneNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Report' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscMilestone' DataObjectPropertyKey='Payment.PaymentContingencyTask.ContingencyTaskAssignment.WfProjectTask.WfProjectTaskID' PropertyKey='WfProjectTaskID' />
				<Argument PropertyKey='UploadId' Value='15' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cLSCUpload'
						Container='spnUpload'>
						<Properties>
							<Argument Type='DataObjectCollection' TypeKey='LscMilestone' DataObjectPropertyKey='LscMilestoneID' PropertyKey='EntityID' />
							<Argument PropertyKey='EntityType' Value='LscMilestone' />
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskUpload' DataObjectPropertyKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID'/>
							<Argument PropertyKey='DisplayErrorInValidationSummary' Value='True' />
						</Properties>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='SubmittedFileMilestone' DataObjectDefinitionKey='SubmittedFileMilestone' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='QueryString' TypeKey='LscMilestoneID' PropertyKey='LscMilestoneID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileList'
						Type='cDataListCtl'
						Container='spnFileList'
						NoRecordMessage='No files have been uploaded for this milestone.'>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File Name' />
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Uploaded' Format='M/d/yyyy h:m tt' />
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
