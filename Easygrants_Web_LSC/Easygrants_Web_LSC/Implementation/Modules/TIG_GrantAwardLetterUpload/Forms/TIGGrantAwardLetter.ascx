<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<style type="text/css">
	td {vertical-align:top;}
</style>
<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
		Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
		runat='server'/>
<br />
<div class="SeparatorHdg">Instructions</div>
<table width='100%' cellpadding="1">
	<tr>
		<td colspan="2">
			Please follow the steps below for uploading and transmitting the AGA PDF file to LSC. <b>Note</b>: grantees receiving
			multiple TIG grants must follow this process for each grant received. Each TIG grant will be represented by a separate link in 
			the TIG section of your LSC Grants home page.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='80px'>
			Step 1
		</td>
		<td>
			<p>In the "Download TIG Grant Award Package" section below, click the <b>Download Grant Award Package</b> button 
			to download the award package for this grant.</p>
			<p><strong>NOTE: You need to have pop-up windows enabled for lscgrants.lsc.gov in order to generate the PDF.</strong></p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='80px'>
			Step 2
		</td>
		<td>
			<b>All grantees must:</b>
			<ol style="list-style-type:lower-alpha">
				<li>
					Assure that a complete set of the grant award documents are provided to the Executive Director and the Board Chair, 
				</li>
				<li>
					 Review and sign the “Acceptance of Grant Award” (AGA) and the <span runat='server' id='spnYear1'/> TIG Grant Assurances for each grant you are receiving. 
				</li>
			</ol>
		</td>
	</tr>
	<tr>
		<td>
			Step 3
		</td>
		<td>
			Convert the AGA for your grant into a PDF file. (You do not need to return the signed <span runat='server' id='spnYear2'/> TIG Grant Assurances, 
			but you must keep them with your grant documents and make them available to LSC upon request.)
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Step 4
		</td>
		<td>
			In the "Upload Executed Acceptance of Grant Award (AGA)" section below, click the <b>Browse...</b> button to locate and 
			select the PDF file to upload. 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Step 5
		</td>
		<td>
			Click <b>Upload</b> to transmit the file to LSC. After you have uploaded your file, the file information will appear below the 
			<b>Upload</b> button. You can review your uploaded file by clicking the <b>View</b> button that will appear as part of your
			file information.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Step 6
		</td>
		<td>
			Click <b>Continue</b> at the bottom of the page to proceed to the Review and Submit page.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Step 7
		</td>
		<td>
			On the Review and Submit page, click <b>Submit</b> to finalize the submission of your executed AGA document.
		</td>
	</tr>
</table>
<br />
<div class="SeparatorHdg">Download TIG Grant Award Package</div>
<p>
Click the <b>Download Grant Award Package</b> button below to download the award package for this grant.
</p>
<span runat='server' id='spnDownload'/>
<br /><br />
<div class="SeparatorHdg">Upload Executed Acceptance of Grant Award (AGA)</div>
<p>Upload the executed AGA as a PDF file.</p>
<span runat='server' id='spnUpload' />
<br />
<span runat='server' id='spnFileList' />
<br />
<div style="text-align: center">
	<span runat='server' id='spnContinue' />
</div>


<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'/>
				<Argument PropertyKey='WfTaskID' Value='62'  />
				<Argument PropertyKey='WfTaskStatusID' Value='2'/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDownload'
						Type='cButton'
						Container='spnDownload'
						Caption='Download Grant Award Package'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='LSC_EventController_NavigateToURL_NewWindowOpener'>
							<Parameters>
								<Argument Value='/Easygrants_Web_LSC/Core/Controls/Base/pgReportOutputReader.aspx?Validate=False'/>
								<Argument Type='DataObjectCollection' TypeKey='ReportOutputLink' DataObjectPropertyKey='WfTaskAssignmentID' BaseValue='EntityID='/>
								<Argument Type='DataObjectCollection' TypeKey='ReportOutputLink' DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID' BaseValue='DefinitionID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	    <DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
		<Filters>
			<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
		</Filters>
		<DisplayProperties>
			<DisplayProperty PropertyKey='GranteeProject.WfProject.TimePeriod.SortOrder'>
				<Control ID='spnYear1'
					Type='HtmlGenericControl'/>
			</DisplayProperty>
			<DisplayProperty PropertyKey='GranteeProject.WfProject.TimePeriod.SortOrder'>
				<Control ID='spnYear2'
					Type='HtmlGenericControl'/>
			</DisplayProperty>
		</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfProjectTask.WfProjectTaskID' PropertyKey='WfProjectTaskID' />
				<Argument PropertyKey='UploadId' Value='19' />
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
				<Argument PropertyKey='UploadId' Value='19'>
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