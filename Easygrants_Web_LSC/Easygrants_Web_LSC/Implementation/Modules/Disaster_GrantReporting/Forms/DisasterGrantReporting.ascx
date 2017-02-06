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
	<p>Below you will find blank Disaster Grant Report Templates and instructions to upload your completed reports. Before uploading your documents, please make sure that the pop-up blocker in your browser is disabled.  This will allow you to view your reports once you have uploaded them.</p>
 <p>We encourage you to save your Disaster Grant reports using the following filename extensions to indicate the report type, reporting year, reporting quarter, and recipient number for the submission.</p>   
 <DL>
  <DT>
    <DD><b>Disaster Grant Narrative Year 1 or 2 - Quarter 1, 2, 3, or 4 - Your Recipient Number.DOC</b></DD>
    <DD><b>Disaster Grant Data Year 1 or 2 - Quarter 1, 2, 3, or 4 - Your Recipient Number.XLS</b></DD>
  </DT>  
</DL>

<OL>
  <LI>In the categories below, click <b>Browse</b> to open a dialog box and to locate your Word or Excel reports for the category.</LI>
  <LI>After you have uploaded the document, you will see its filename, and the date and time it was uploaded.</LI>
  <LI>You may click <b>Delete</b> to remove the document from the system.</LI>
  <LI>You may click <b>View</b> to see the file you have uploaded. </LI>
  <LI>When you have uploaded all of the relevant documents, click <b>Continue</b> to advance to the Review and Submit page.</LI>
  <LI>On the Review and Submit page, LSC Grants will verify that your report is complete and you may click the <b>Submit</b> button to make your Disaster Report available to LSC.</LI>
</OL>
	
	<div class="SeparatorHdg">Upload Disaster Narrative Report</div>
	<p><span id="spnUploadListWord" runat="server"></span></p>
	<p>Upload the Disaster Narrative Report</p>
	<span runat='server' id='spnUploadWord' />
	<br />
	<span runat='server' id='spnFileListWord' />
	<br />
	
	<div class="SeparatorHdg">Upload Disaster Data Report</div>
	<p><span id="spnUploadListExcel" runat="server"></span></p>
	<p>Upload the Disaster Data Report</p>
	<span runat='server' id='spnUploadExcel' />
	<br />
	<span runat='server' id='spnFileListExcel' />
	<br />
	<div class="SeparatorHdg">Upload Miscellaneous documents</div>
	<p>Miscellaneous documents may include:  Resumés, reports from your Case Management System, Budget Information, marketing information, and screen shots.</p>
	<span runat='server' id='spnUploadMisc' />
	<br />
	<span runat='server' id='spnFileListMisc' />
	<br />
	<div style="text-align: center">
		<span runat='server' id='spnContinue' />
	</div>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
    
    <DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable=''>
				<Filters>
					<Argument Type='ModuleUser' 
						TypeKey='GranteeProjectID'
						PropertyKey='GranteeProjectID'
						Value='' 
						bool=''/>
				</Filters>
				<DisplayProperties>
				</DisplayProperties>
			</DataObject>
		
			<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable=''>
				<Filters>
					<Argument Type='DataObjectCollection' 
						TypeKey='GranteeProject'
						DataObjectPropertyKey='WfProjectID'
						PropertyKey='WfProjectID'
						Value='' 
						bool=''/>
					<Argument Type='ModuleUser' 
						TypeKey='WfTaskID'
						PropertyKey='WfTaskID'
						Value='' 
						bool=''/>
				</Filters>
			<DisplayProperties>
			</DisplayProperties>
		</DataObject>
    
        <DataObject Key='WfProjectTaskUploadWordTemp' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable=''>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfProjectTask'
					DataObjectPropertyKey='WfProjectTaskID'
					PropertyKey='WfProjectTaskID'
					Value='' 
					bool=''/>
				<Argument PropertyKey='UploadId' Value='58' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlUploadsListWord'
						Container='spnUploadListWord'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskUpload'>
						<DisplayProperty PropertyKey='Upload.UploadName' ColumnHeader='Type' Width='40%'/>
						<DisplayProperty PropertyKey='Upload.UploadTemplate.TemplateName'  Width='60%' ColumnHeader='Template' >
							<Parameters>
								<Argument Value='' ValueKey='Upload.UploadTemplate.TemplateName' Operator='Equal' 
										DisplayValue='N/A' />
								<Argument Value='' ValueKey='Upload.UploadTemplate.TemplateName' Operator='NotEqual' 
										DisplayValue='Control'  PropertyKey='Upload.UploadTemplate.TemplateName'>
									<Control ID='lnkTemplate'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
											<Parameters>
												<Argument Value='/Easygrants_web_lsc/Core/Controls/Base/pgUploadSrcReader.aspx' />
												<Argument Value='DataObject=UploadTemplate' />
												<Argument Value='ID=53' />
											</Parameters>	
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		 <DataObject Key='WfProjectTaskUploadExcelTemp' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable=''>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfProjectTask'
					DataObjectPropertyKey='WfProjectTaskID'
					PropertyKey='WfProjectTaskID'
					Value='' 
					bool=''/>
				<Argument PropertyKey='UploadId' Value='59' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlUploadsListExcel'
						Container='spnUploadListExcel'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskUpload'>
						<DisplayProperty PropertyKey='Upload.UploadName' ColumnHeader='Type' Width='40%'/>
						<DisplayProperty PropertyKey='Upload.UploadTemplate.TemplateName'  Width='60%' ColumnHeader='Template' >
							<Parameters>
								<Argument Value='' ValueKey='Upload.UploadTemplate.TemplateName' Operator='Equal' 
										DisplayValue='N/A' />
								<Argument Value='' ValueKey='Upload.UploadTemplate.TemplateName' Operator='NotEqual' 
										DisplayValue='Control'  PropertyKey='Upload.UploadTemplate.TemplateName'>
									<Control ID='lnkTemplate'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
											<Parameters>
												<Argument Value='/Easygrants_web_lsc/Core/Controls/Base/pgUploadSrcReader.aspx' />
												<Argument Value='DataObject=UploadTemplate' />
												<Argument Value='ID=54' />
											</Parameters>	
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
		
		<DataObject Key='WfProjectTaskUploadWord' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfProjectTask.WfProjectTaskID' PropertyKey='WfProjectTaskID' />
				<Argument PropertyKey='UploadId' Value='58' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadWord'
						Type='cLSCUpload'
						Container='spnUploadWord'>
						<Properties>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
							<Argument PropertyKey='EntityType' Value='WfTaskAssignment' />
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskUploadWord' DataObjectPropertyKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID'/>
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

        <DataObject Key='SubmittedFileWord' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='58'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileListWord'
						Type='cDataListCtl'
						Container='spnFileListWord'
						NoRecordMessage='The disaster quarterly report narrative has not been uploaded..'>
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
		
		<DataObject Key='WfProjectTaskUploadExcel' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfProjectTask.WfProjectTaskID' PropertyKey='WfProjectTaskID' />
				<Argument PropertyKey='UploadId' Value='59' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadExcel'
						Type='cLSCUpload'
						Container='spnUploadExcel'>
						<Properties>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
							<Argument PropertyKey='EntityType' Value='WfTaskAssignment' />
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskUploadExcel' DataObjectPropertyKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID'/>
							<Argument PropertyKey='DisplayErrorInValidationSummary' Value='True' />
						</Properties>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


      <DataObject Key='SubmittedFileExcel' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='59'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileListExcel'
						Type='cDataListCtl'
						Container='spnFileListExcel'
						NoRecordMessage='The disaster quarterly report data has not been uploaded.'>
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
		
		<DataObject Key='WfProjectTaskUploadMisc' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfProjectTask.WfProjectTaskID' PropertyKey='WfProjectTaskID' />
				<Argument PropertyKey='UploadId' Value='60' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadMisc'
						Type='cLSCUpload'
						Container='spnUploadMisc'>
						<Properties>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
							<Argument PropertyKey='EntityType' Value='WfTaskAssignment' />
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskUploadMisc' DataObjectPropertyKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID'/>
							<Argument PropertyKey='DisplayErrorInValidationSummary' Value='True' />
						</Properties>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


      <DataObject Key='SubmittedFileMisc' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='60'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileListMisc'
						Type='cDataListCtl'
						Container='spnFileListMisc'>
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
