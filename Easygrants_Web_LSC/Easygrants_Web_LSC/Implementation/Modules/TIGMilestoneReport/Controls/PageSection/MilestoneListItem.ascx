<%@ Control Language="vb" AutoEventWireup="true" Codebehind="" Inherits="Implementation.Modules.TIGMilestoneReport.Controls.PageSection.cMilestoneListItem" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<table width='100%'>
	<tr>
		<td colspan=2 class='MinorSeparatorHdg'>
			Milestone <span runat='server' id='spnMilestoneNumber' />
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<span runat='server' id='spnMilestone' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2>
			<b>Instruction</b>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<span runat='server' id='spnInstructions' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign='top'>
			<b>Grantee Response</b>
		</td>
		<td>
			<span runat='server' id='spnReport' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td >
			<b>File Uploads</b>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnUpload' />
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<span runat='server' id='spnFileList' />
		</td>
	</tr>
</table>
<hr width='100%' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='LscMilestone' Key='LscMilestone' Updatable='True' CreateNew='True'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='MilestoneNumber'>
					<Control ID='spnMilestoneNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Milestone'>
					<Control ID='spnMilestone'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Instructions'>
					<Control ID='spnInstructions'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Report'>
					<Control ID='txtReport'
						Container='spnReport'
						Type='cTextArea' 
						Rows='5'
						Cols='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnUpload'
						Type='cButton'
						Container='spnUpload'
						Caption='Upload File' 
						Confirmation='If you have added or changed any milestone comments, you must first click Save at the bottom of the page before uploading a file, or your risk losing information. Click OK to upload a file or Cancel to return to the page.'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='UploadRelated' />
								<Argument Type='DataObjectCollection' TypeKey='LscMilestone' DataObjectPropertyKey='LscMilestoneID' BaseValue='LscMilestoneID=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SubmittedFileMilestone' DataObjectDefinitionKey='SubmittedFileMilestone' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscMilestone' DataObjectPropertyKey='LscMilestoneID' PropertyKey='LscMilestoneID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFileList'
						Type='cDataListCtl'
						Container='spnFileList'
						NoRecordMessage='No files have been uploaded for this milestone.'>
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
