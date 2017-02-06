<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PublicationsList.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cPublicationsList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<span runat='server' id='spnReportOutputOpen' visible='true'></span>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td colspan="2" class="SeparatorHdg">
			<b>Publications</b>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>		
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
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
		<DataObject Key='GranteeProjectPublications' DataObjectDefinitionKey='GranteeProjectPublications'>
			<Filters>
				<!-- <Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/> -->
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
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
									<Argument AttributeName='PageKey' Value='PublicationsEditor'/>
									<Argument Type='' TypeKey='' Value='GranteeProjectPublicationsID=0'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectPublications'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='ArticleTitle' ColumnHeader='Publication Title' Width='35%'>
						     <Sortable>
								<Argument PropertyKey='ArticleTitle'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='PublicationType.Description' ColumnHeader='Type' Width='10%'>
						    <Sortable>
								<Argument PropertyKey='Description'>	
									<RelatedProperty PropertyKey='PublicationType'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='PublicationStatus.Description' ColumnHeader='Status' Width='10%'>
						    <Sortable>
								<Argument PropertyKey='Description'>	
									<RelatedProperty PropertyKey='PublicationStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PublicationYear' ColumnHeader='Published Year' Width='10%'>
						    <Sortable>
								<Argument PropertyKey='PublicationYear'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='Url' ColumnHeader='URL' Width='15%'>
						    <Sortable>
								<Argument PropertyKey='Url'>	
								</Argument>
							</Sortable>
							<Control ID='ctlURL' Type='cLink'>
						        <Action Target='_blank' URL='Web'></Action>
					        </Control>		
						</DisplayProperty>
						<DisplayProperty PropertyKey='PublicationUpload.SourceFileName' ColumnHeader='File Name'  Width='10%'>
							
										
									<Control ID='btnView'
										Type='cLink'>
											<Action
											PostBack='True'
											Object='DataPresenter'
											Method='DocumentList_ViewConvertedUploadedFile'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='PublicationUploadID' AttributeName='PublicationUploadID='/>
												</Parameters>
											</Action>
									</Control>
									
							
							<Sortable>
								<Argument PropertyKey='SourceFileName'>	
									<RelatedProperty PropertyKey='PublicationUpload'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='2' HeaderAlign='Center' Width='10%' DataAlign='right'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PublicationsEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectPublicationsID' AttributeName='GranteeProjectPublicationsID' BaseValue='GranteeProjectPublicationsID='/>
										<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False' >
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Publication_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='GranteeProjectPublicationsID' AttributeName='GranteeProjectPublicationsID'/>
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
