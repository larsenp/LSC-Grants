<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="UploadManager_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.cUploadManager_Content" %>
<%@ Register Tagprefix='Core1' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<br />
<br />
<Core1:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/UploadManagerPages.ascx'
	runat='server'/>

<br />
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg'>Uploads</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnUploadsList' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
<DataObject Key='UploadList' DataObjectDefinitionKey='Upload' Updatable='False'>
	<Filters></Filters>
		<DisplayProperties>
			<DisplayProperty PropertyKey=''>
				<Control ID='btnAdd' Type='cButton' Image='Add' Container='spnAdd'>
					<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
						<Parameters>
							<Argument AttributeName='PageKey' Value='UploadEditor' />
							<Argument Type='Data' TypeKey='' BaseValue='UploadID=0' Value=''/>
							<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
						</Parameters>
					</Action>
				</Control>
			</DisplayProperty>
			<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
				<Control ID='ctlUploadsList' Container='spnUploadsList' Type='cDataListCtl' DataObjectDefinitionKey='Upload'
							MaxPerPage='5' SeparatorWidth='2'>
					<DisplayProperty PropertyKey='UploadName' ColumnHeader='Upload Name' Width='50%'/>
					<DisplayProperty PropertyKey='UploadTemplate.TemplateName' ColumnHeader='Template' Width='20%'>
					<%--	<Control ID='lnkTemplate'
							Type='cLink'>
							<Action ID='View' Target='_blank' URL='../../../Core/Controls/Base/pgUploadSrcReader.aspx' >
							</Action>
					</Control> --%>
					
					<Control ID='lnkTemplate'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewTemplate'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID='/>
										</Parameters>
								</Action>
					</Control>
					
					</DisplayProperty>
					<DisplayProperty PropertyKey='' ColumnHeader='Options'>
						<Control ID='btnEdit' Type='cButton' Image='Edit'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='UploadEditor' />
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL'
												BaseValue='ReturnURL=' />
									<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID' BaseValue='UploadID=' />
								</Parameters>
							</Action>
						</Control>
					</DisplayProperty>
					<DisplayProperty PropertyKey=''  HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='10%'>
						<Parameters>
							<Argument Value='' Operator='NotEqual' ValueKey='UploadWfProjectTaskUpload.UploadId' DisplayValue=''/>
							<Argument Value='' ValueKey='UploadWfProjectTaskUpload.UploadId' DisplayValue='Control' >
								<Control ID='btnDelete' Type='cButton' Image='Delete' Confirmation='Are you sure you want to delete this item?'>
									<Action PostBack='True' Object='EventController' Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID' Value='' />
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
</ModuleSection>
</span>