<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cDocumentList" CodeBehind="DocumentList.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br></br>
<p>
Upload Microsoft Word documents (.doc) and templates (.dot) here in order to use them with the Word Merge feature under Queries.
</p>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Word Merge Documents</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' ID="Table2" width='100%'>
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
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>				
				<Argument Type='DataPresenter' 
					TypeKey='FileTypeID' 
					PropertyKey='FileTypeID' 
					Value='' 
					Bool='And'>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='UploadTitle' />
			</Sort>
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
									<Argument AttributeName='PageKey' Value='DocumentEditor'/>
									<Argument Type='' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value='SubmittedFileID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' BaseValue='EntityID='/>
									<Argument Type='' TypeKey='FileTypeID' Value='FileTypeID=25'/>
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
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='UploadTitle' ColumnHeader='Description'>
							<Sortable>
								<Argument PropertyKey='UploadTitle'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Document File Name'>
							<Parameters>
								<Argument Value='' ValueKey='SubmittedFileData.SubmittedFileID' DisplayValue='' />
								<Argument Value='' Operator='NotEqual' ValueKey='SubmittedFileData.SubmittedFileID' DisplayValue='Control' PropertyKey='SourceFileName'>
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
								</Argument>
							</Parameters>
							<Sortable>
								<Argument PropertyKey='SourceFileName'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Uploaded Date' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='SubmitDate'/>
							</Sortable>
						</DisplayProperty>
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='' HeaderAlign='Right' DataAlign='Right'>
							<Parameters>
								<Argument Value='' ValueKey='SubmittedFileData.SubmittedFileID' DisplayValue='' />
								<Argument Value='' Operator='NotEqual' ValueKey='SubmittedFileData.SubmittedFileID' DisplayValue='Control' >
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
								</Argument>
							</Parameters>
						</DisplayProperty> -->
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='' HeaderAlign='Right' DataAlign='Right'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='DocumentEditor'/>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='EntityID' AttributeName='EntityID' BaseValue='EntityID='/>
										<Argument Type='DataPresenter' TypeKey='FileTypeID' AttributeName='FileTypeID' BaseValue='FileTypeID='/>
										<Argument Type='DataPresenter' TypeKey='Description' BaseValue='Description='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>		
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to remove this item?'>
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
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnUpload'
								Type='cButton'
								Image='Upload'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='DocumentUpload'/>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='EntityID' AttributeName='EntityID' BaseValue='EntityID='/>
										<Argument Type='DataObject' TypeKey='FileTypeID' AttributeName='FileTypeID' BaseValue='FileTypeID='/>
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
<!-- End Embedded XML -->
