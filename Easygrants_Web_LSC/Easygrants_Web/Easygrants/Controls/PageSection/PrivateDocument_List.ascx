<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cPrivateDocument_List" CodeBehind="PrivateDocument_List.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Private Documents and Images</b>
		</td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='EntityID' 
					Value=''/>
				<Argument Type='Data' 
					TypeKey='' 
					PropertyKey='EntityDataObjectKey' 
					Value='Private'
					Bool='And'>
					<RelatedProperty PropertyKey = 'FileType'/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='SourceFileName' />	
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
									<Argument AttributeName='PageKey' Value='Document_Editor'/>
									<Argument Type='' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value='SubmittedFileID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' BaseValue='EntityID='/>
									<Argument Type='' TypeKey='' AttributeName='' Value='FileTypeID=21'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SubmittedFile'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='Title'>
							<Control ID='btnView'
								Type='cLink'>
									<Action
									PostBack='True'
									Object='DataPresenterControl'
									ControlID='ctlNewWindowOpener'
									Method='Test'>
									</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Date'/>
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
									<Action
									PostBack='True'
									Object='DataPresenterControl'
									ControlID='ctlNewWindowOpener'
									Method='Test'>
									</Action>
							</Control> -->
							<!-- 
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
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Properties'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Document_Editor'/>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='EntityID' AttributeName='EntityID' BaseValue='EntityID='/>
										<Argument Type='' TypeKey='' AttributeName='FileTypeID' Value='FileTypeID=21'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>		
						<DisplayProperty PropertyKey=''>
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	