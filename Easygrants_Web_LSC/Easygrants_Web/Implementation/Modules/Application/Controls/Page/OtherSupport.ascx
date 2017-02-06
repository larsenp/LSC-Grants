<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cOtherSupport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="OtherSupport.ascx.vb" %>

<br>
<span id='spnPageContent' runat='server'/>
<p>
<!-- Control Label (for  Address information) -->
<p>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Other Support</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr id='trNoOtherSupport' runat='server'>
		<td colspan='5'>
			<span runat='server' id='spnNoOtherSupport'></span>&nbsp;&nbsp;Check here if there is no Other Support to report.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
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
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align='center'>
			<span runat='server' id='spnSave_and_Continue'/> 
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent />
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='NoOtherSupport'>
					<Control ID='ctlNoOtherSupport'
						Container='spnNoOtherSupport'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Check here if there is no Other Support to report.'>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd' EnterKey='True'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OtherSupportEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectOtherSupportID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				
			</DisplayProperties>
		</DataObject>			
		<DataObject Key='GranteeProjectOtherSupport' DataObjectDefinitionKey='GranteeProjectOtherSupport'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ProjectNumber' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='ProjectNumber' ColumnHeader='Project Number or Award Name'/>
						<DisplayProperty PropertyKey='Source' ColumnHeader='Source/Agency'/>
						<DisplayProperty PropertyKey='ProjectTitle' ColumnHeader='Title of Project'/>
						<DisplayProperty PropertyKey='StartDate' ColumnHeader='Start Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='End Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='Total' ColumnHeader='Total Amount of Award' Format='$#,##0.##'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OtherSupportEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectOtherSupportID' AttributeName='GranteeProjectOtherSupportID' BaseValue='GranteeProjectOtherSupportID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='GranteeProjectOtherSupportID' AttributeName='GranteeProjectOtherSupportID'/>
											<RelatedDataObjects>
												<RelatedDataObject DataObjectDefinitionKey='SubmittedFile'>
													<RelationshipProperties>
														<RelationshipProperty parentProperty='GranteeProjectOtherSupportID' childProperty='EntityID' />
														<RelationshipProperty aValue='31' childProperty='FileTypeID' />
													</RelationshipProperties>
												</RelatedDataObject>
											</RelatedDataObjects>
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
										<Argument AttributeName='PageKey' Value='OtherSupportUpload'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectOtherSupportID' AttributeName='GranteeProjectOtherSupportID' BaseValue='GranteeProjectOtherSupportID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton' GoToNextPage='True' >
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>	
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
	