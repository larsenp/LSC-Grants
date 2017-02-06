<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cContent_Mgmt" CodeBehind="Content_Mgmt.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Pages</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
</table>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='DataPresenter'
								Method='DisplayPageContent'>
								<Parameters>
									<Argument AttributeName='Page' Value='Easygrants/Controls/PageSection/PageContent_Editor.aspx'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='Page=PageContentEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='PageContentID=0'/>
									<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
									<Argument Type='QueryString' TypeKey='CmptID' BaseValue='CmptID='/>
									<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
									<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
									<Argument Type='' TypeKey='' AttributeName='' Value='PageKey='/>
									<Argument Type='' TypeKey='' AttributeName='' Value='WfTaskStatusID='/>
								</Parameters>
							</Action>	
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		<DataObject Key='PageContentList' DataObjectDefinitionKey='PageContent'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID'/>
				<Argument Type='QueryString' TypeKey='WfTaskID' PropertyKey='WfTaskID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='PageKey' />	
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>						
						<DisplayProperty PropertyKey='PageKey' ColumnHeader='Page Name' Width='35%'>
							<Control ID='lblTitle'
								Type='cLabel'>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus.WfTaskStatus' ColumnHeader='Task Status' Width='35%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='2' HeaderAlign='left' Width='30%'>
							<Control ID='btnPreview'
								Type='cButton'
								Image='Preview'>
									<Action
									PostBack='True'
									AutoSave='True'
									Object='DataPresenter'
									Method='OnPreview'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='PageContentID' AttributeName='PageContentID' Value=''/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DisplayPageContent'>
									<Parameters>
										<Argument AttributeName='Page' Value='Easygrants/Controls/PageSection/PageContent_Editor.aspx'/>
										<Argument Type='' TypeKey='' AttributeName='' Value='Page=PageContentEditor'/>
										<Argument Type='DataObject' TypeKey='PageContentID' AttributeName='PageContentID' BaseValue='PageContentID='/>
										<Argument Type='QueryString' TypeKey='ProgramID' BaseValue='ProgramID='/>
										<Argument Type='QueryString' TypeKey='CmptID' BaseValue='CmptID='/>
										<Argument Type='QueryString' TypeKey='WfProjectID' BaseValue='WfProjectID='/>
										<Argument Type='QueryString' TypeKey='WfTaskID' BaseValue='WfTaskID='/>
										<Argument Type='DataObject' TypeKey='PageKey' AttributeName='PageKey' BaseValue='PageKey='/>
										<Argument Type='DataObject' TypeKey='WfTaskStatusID' AttributeName='WfTaskStatusID' BaseValue='WfTaskStatusID='/>
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