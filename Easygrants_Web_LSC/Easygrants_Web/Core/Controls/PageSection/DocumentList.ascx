<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../Base/NewWindowOpener.ascx' %>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.PageSection.cDocumentList" CodeBehind="DocumentList.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' id='tabTitle'>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>
				<%=Title%>
			</b>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<br>
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
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='SubmittedFileList' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Value='' />
				<Argument Type='DataPresenter' TypeKey='FileTypeID' PropertyKey='FileTypeID' Value='' Bool='And'></Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' Type='cButton' Image='Add' Container='spnAdd'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Document_Editor' />
								<Argument Type='' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value='SubmittedFileID=0' />
								<Argument Type='DataPresenter' TypeKey='EntityID' BaseValue='EntityID=' />
								<Argument Type='DataPresenter' TypeKey='FileTypeID' BaseValue='FileTypeID=' />
								<Argument Type='DataPresenter' TypeKey='Description' BaseValue='Description=' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReportOutputOpen' Type='cFileUploadOpen' Container='spnReportOutputOpen' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDocumentList' Container='spnDocumentList' Type='cDocumentListCtl' DataObjectDefinitionKey='SubmittedFile'
						SeparatorWidth='2' MaxPerPage='10'>
						<DisplayProperty PropertyKey='description' ColumnHeader='Description' Width='34%'>
						    <Sortable>
								<Argument PropertyKey='Description'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File/Document Name' Width='21%'>
							<Control ID='btnView' Type='cLink' >
								<Action PostBack='True' Object='DataPresenter' Method='DocumentList_ViewConvertedUploadedFile'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID=' />
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='SourceFileName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='UploadedBy.LastNameFirstNameMiddleName' ColumnHeader='Uploaded By'  Width='15%'>
							<Sortable>
								<Argument PropertyKey='SubmitDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Uploaded Date' Format='M/d/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='SubmitDate' />
							</Sortable>
						</DisplayProperty>
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='3' HeaderAlign='Center' Width='20%' DataAlign='right'>
							<Control ID='btnView' Type='cButton' Image='View'>
								<Action PostBack='True' Object='DataPresenter' Method='DocumentList_ViewConvertedUploadedFile'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty> -->
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='3' HeaderAlign='Center' Width='20%' DataAlign='right'>
							<Control ID='btnEdit' Type='cButton' Image='Properties'>
								<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='Document_Editor' />
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID=' />
										<Argument Type='DataPresenter' TypeKey='EntityID' BaseValue='EntityID=' />
										<Argument Type='DataPresenter' TypeKey='FileTypeID' BaseValue='FileTypeID=' />
										<Argument Type='DataPresenter' TypeKey='Description' BaseValue='Description=' />
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False' DataAlign='Center'>
							<Control ID='btnDelete' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this file?'>
								<Action PostBack='True' Object='DataPresenter' Method='DocumentList_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value='' />
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
