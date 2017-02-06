<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cAdditionalUploadsList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
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
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='ModuleUser'
					TypeKey='WfTaskAssignmentID'
					PropertyKey='EntityID'
					Value='' 
					bool=''/>
				<Argument Type='Data' 
					TypeKey='' 
					PropertyKey='IsAdditional' 
					Value='1' 
					Bool='And'/>
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
									<Argument AttributeName='PageKey' Value='AdditionalUploadsEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='SubmittedFileID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' BaseValue='EntityID='/>
									<Argument Type='' TypeKey='FileTypeID' Value='FileTypeID=0'/>
									<Argument Type='DataPresenter' TypeKey='Description' BaseValue='Description='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReportOutputOpen'
						Type='cFileUploadOpen'
						Container='spnReportOutputOpen'
					/>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDocumentList'
						Container='spnDocumentList'
						Type='cDocumentListCtl'
						DataObjectDefinitionKey='SubmittedFile'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='FileType.Description' ColumnHeader='Upload Type'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='FileType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File Name'>
							<Control ID='btnView'
								Type='cLink'>
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
								<Argument PropertyKey='SourceFileName'/>
							</Sortable>
						</DisplayProperty>
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnView'
								Type='cButton'
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
						<DisplayProperty PropertyKey=''  ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Properties'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='AdditionalUploadsEditor'/>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='FileTypeID' AttributeName='FileTypeID' BaseValue='FileTypeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>		
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'>
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
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GeneratePDF'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->