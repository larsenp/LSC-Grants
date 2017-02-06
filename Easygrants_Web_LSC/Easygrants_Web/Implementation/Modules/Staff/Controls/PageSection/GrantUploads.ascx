<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantUploads" CodeBehind="GrantUploads.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg">
			<b>Private Documents</b>
		</td>
	</tr>	
	<tr><td height='6px' /></tr>
	<tr>
		<td>To upload a document to this grant file, click <b>Add</b>. To view a document in its original file format, click the corresponding <b>File Name</b>. To delete a document from the grant file, click the corresponding <b>Delete</b> button.
        </td>
	</tr>
    <tr><td>&nbsp;</td></tr>
    
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>		
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
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
	
		<DataObject Key='GrantUploadsList' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='EntityID'
					Value='' Bool=''/>
				<Argument Type='Data' PropertyKey='FileTypeID' Value='55' />
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
									<Argument AttributeName='PageKey' Value='GrantUploadsEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value='SubmittedFileID=0'/>
									<Argument Type='' TypeKey='FileTypeID' AttributeName='FileTypeID' Value='FileTypeID=55'/>
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
						<DisplayProperty PropertyKey='description' ColumnHeader='Description' Width='34%'>
						    <Sortable>
								<Argument PropertyKey='Description'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Uploaded Date' Format='M/d/yyyy'  Width='15%'>
						    <Sortable>
								<Argument PropertyKey='SubmitDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='UploadedBy.LastNameFirstName' ColumnHeader='Uploaded By'  Width='10%'>
						    <Sortable>
								<Argument PropertyKey='SubmitDate'>	
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File Name' Width='21%'>
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
						<%--<DisplayProperty PropertyKey='SourceFileDisplayURL' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='3' HeaderAlign='Center' Width='20%' DataAlign='right'>
							<Control ID='btnView'
								Type='cButton'  DisableControl='False'
								Caption='View'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control>
						</DisplayProperty> --%>
						
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='3' HeaderAlign='Center' Width='20%' DataAlign='right'>
							<Control ID='btnView'
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
						
						<DisplayProperty PropertyKey=''  ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='2' HeaderAlign='Center' Width='20%' DataAlign='right'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Properties'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantUploadsEditor'/>
										<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='FileTypeID' AttributeName='FileTypeID' BaseValue='FileTypeID='/>
										<Argument Type='' TypeKey='Description' AttributeName='Description' BaseValue='Description=True'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False' DataAlign='Center'>
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
	



						
						<!-- <DisplayProperty PropertyKey='FileType.Description' ColumnHeader='Upload Type'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='FileType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='UploadTitle' ColumnHeader='Upload Title'>
							<Sortable>
								<Argument PropertyKey='UploadTitle'/>
							</Sortable>
						</DisplayProperty> -->