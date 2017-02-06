<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.PageSection.cGrantMedia" CodeBehind="GrantUploads.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Media</b>
		</td>
	</tr>	
	<tr><td height='6px' /></tr>
	<tr>
		<td>To upload a document to this grant file, click <B>Add</B>. To view a document in its original file format, click 
		the corresponding <B>View</B> button.  To delete a document from the grant file, click the corresponding <B>Delete</B> button.
        </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='80%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>		
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDocumentList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
		</DataObject>
	
		<DataObject Key='GrantMediaList' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='EntityID'
					Value='' Bool=''/>
				<Argument Type='Data' PropertyKey='FileTypeID' Value='57' />
			</Filters>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='GrantMediaUploadEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value='SubmittedFileID=0'/>
									<Argument Type='' TypeKey='FileTypeID' AttributeName='FileTypeID' Value='FileTypeID=57'/>
									<Argument Type='' TypeKey='Description' AttributeName='Description' BaseValue='Description=True'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDocumentList'
						Container='spnDocumentList'
						Type='cDocumentListCtl'
						DataObjectDefinitionKey='SubmittedFile'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='description' ColumnHeader='Description' Width='30%'>
						    <Sortable>
								<Argument PropertyKey='Description'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Upload Date' Format='M/d/yyyy' >
						    <Sortable>
								<Argument PropertyKey='SubmitDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='UploadedBy.LastNameFirstName' ColumnHeader='Uploaded By' >
						    <Sortable>
								<Argument PropertyKey='SubmitDate'>	
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='FileName' >
							<Control ID='btnView'
								Type='cLink' >
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
									</Action>
							</Control>
						    <Sortable>
								<Argument PropertyKey='SourceFileName'>	
								</Argument>
							</Sortable>
						</DisplayProperty>
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='Options'> -->
						<!--	<Control ID='btnView'
								Type='cButton'  DisableControl='False'
								Caption='View'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control> -->
						<!--	<Control ID='btnView'
								Type='cButton' DisableControl='False'
								Image='View'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty> -->
						<DisplayProperty PropertyKey='' ColumnHeader='Options'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Properties'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantMediaUploadEditor'/>
										<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='FileTypeID' AttributeName='FileTypeID' BaseValue='FileTypeID='/>
										<Argument Type='' TypeKey='Description' AttributeName='Description' BaseValue='Description=True'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='false'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_Delete'>		
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value=''/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty> 
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReportOutputOpen'
						Type='cFileUploadOpen'
						Container='spnReportOutputOpen'
					/>
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>