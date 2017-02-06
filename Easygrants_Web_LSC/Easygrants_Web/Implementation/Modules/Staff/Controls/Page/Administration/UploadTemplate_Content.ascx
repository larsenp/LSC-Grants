<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="UploadTemplate_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.cUploadTemplate_Content" %>
<%@ Register Tagprefix='Core1' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<br />
<br />
<Core1:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/UploadManagerPages.ascx'
	runat='server'/>

<br />

<table cellpadding='2' cellspacing='0' width='100%'>
	<tr>
		<td class='SeparatorHdg'>Upload Templates</td>
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
</table>
<table cellpadding='2' cellspacing='0' width='70%'>
	<tr>
		<td>
			<span runat='server' id='spnUploadTemplateList' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td><span id='spnUploadTemplate' runat=	"server"></span></td></tr>
</table>

	
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='UploadTemplate' DataObjectDefinitionKey='UploadTemplate' Updatable='False'>
			<Filters>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
						<Control ID='btnAdd' Type='cButton' Image='Add' Container='spnAdd'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='UploadTemplateEditor' />
									<Argument Type='Data' TypeKey='' BaseValue='UploadTemplateID=0' Value='' />
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
								</Parameters>
							</Action>
						</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlUploadTemplateList' Container='spnUploadTemplateList' Type='cDataListCtl' DataObjectDefinitionKey='UploadTemplate'
								MaxPerPage='5' SeparatorWidth='2'>
						<DisplayProperty PropertyKey='TemplateName' ColumnHeader='Template Name' Width='50%'>
							<!-- <Control ID='lnkTemplate'
								Type='cLink'>
								<Action ID='View' Target='_blank' URL='../../../Core/Controls/Base/pgUploadSrcReader.aspx' >
								</Action>
							</Control> -->
							<Control ID='lnkTemplate'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewTemplate'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='UploadTemplateID' AttributeName='UploadTemplateID='/>
										</Parameters>
								</Action>
					</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Right' DataAlign='Right' Width='10%'>
							<Control ID='btnEdit' Type='cButton' Image='Edit'>
								<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='UploadTemplateEditor' />
										<Argument Type='DataObject' TypeKey='UploadTemplateID' AttributeName='UploadTemplateID' BaseValue='UploadTemplateID=' />
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderAlign='Left' DataAlign='Left'>
							<Parameters>
								<Argument Value='' Operator='NotEqual' ValueKey='UploadsUsingThisTemplate.UploadTemplateID' DisplayValue=''/>
								<Argument Value='' ValueKey='UploadsUsingThisTemplate.UploadTemplateID' DisplayValue='Control' >
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='UploadTemplateID' AttributeName='UploadTemplateID'/>
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