<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<br />
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
	<tr>
		<td>
			As noted above, in addition to the Project Narrative, a maximum of 32 total pages may be submitted 
			to fully document the proposal. The 32-page limit is inclusive of the Project Narrative Appendices, 
			the Draft Evaluation Plan, the Letters of Commitment from Key Partners and Letters of Support. 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			TIG applicants must upload a draft evaluation plan for their proposed project. The evaluation plan 
			should clearly articulate the goal and objectives of the project; identify the activities and strategies 
			that will be implemented to achieve the goal and objectives; and specify the methodologies and data sets 
			that will be used to evaluate the project's progress and accomplishments.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Please consult the evaluation planning guidance and use the automated form found on the TIG website at 
			<a target="_blank" href='http://www.lsc.gov/grants-grantee-resources/grantee-guidance/reporting-requirements/tig-reporting/tig-evaluation-plans' >http://www.lsc.gov/grants-grantee-resources/grantee-guidance/reporting-requirements/tig-reporting/tig-evaluation-plans</a>. The contents of the draft evaluation plan should be consistent with the Project Goal, Objectives, Activities, and Evaluation section of the Project Narrative.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<ol>
			  <li>In the <b>Draft Evaluation Plan</b> section, click <b>Browse</b> to find the file on your computer. You can upload files with extension types of .doc, .docx, .xls, .xlsx, .pdf, and .rtf only.</li>
			  <li>After the file name appears in the text box, click <b>Upload</b></li>
			  <li>When the upload is complete, the file name and upload date will appear in a list at the bottom of the page.</li>
			  <li>Click <b>View</b> to view the document to verify it was accepted by the system. The document will appear in a new browser window or tab. If the system encountered errors saving your document, the error message will appear in the new window.</li>
			  <li>Click <b>Delete</b> to permanently remove the file from your report.</li>
		  </ol>
		</td>
	</tr>
</table>

<div width='100%' class='SeparatorHdg'>Evaluation Plan</div>
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
				<Argument PropertyKey='UploadId' Value='40' />
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
				<Argument PropertyKey='UploadId' Value='40'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileList'
						Type='cDataListCtl'
						Container='spnFileList'
						NoRecordMessage='No evaluation plan have been uploaded for this application.'>
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