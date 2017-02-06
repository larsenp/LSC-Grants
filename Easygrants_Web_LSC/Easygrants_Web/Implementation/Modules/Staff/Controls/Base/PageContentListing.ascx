<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PageContentListing.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Base.cPageContentListing" EnableViewState="False" %>
<!-- USER MODIFIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Pages</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnPageContentList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<span id='spnPageContent' runat='server'>

</span>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignmentList' DataObjectDefinitionKey='PageContent' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='PageKey'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnPageContentList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignmentList'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='PageKey' ColumnHeader='Page Key' />
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Task Status'/>
						<DisplayProperty PropertyKey='Content' ColumnHeader='Content' />																
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DisplayPageContent'>
									<Parameters>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='ReturnURL' BaseValue='ReturnURL='/>
										<Argument Type='DataObject' TypeKey='PageContentID' AttributeName='PageContentID' BaseValue='PageContentID='/>
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
