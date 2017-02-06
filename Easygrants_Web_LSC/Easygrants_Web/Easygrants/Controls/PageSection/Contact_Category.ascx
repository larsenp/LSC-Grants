<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	
	<tr>
		<td>
			<span runat='server' id='spnDataList' visible='true'></span>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ContactCategory' DataObjectDefinitionKey='ContactCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='' 
					TypeKey=''
					PropertyKey='ContactCategoryID' 
					Value='0' 
					bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='ContactCategoryEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='New=1'/>
									<Argument Type='DataObjectCollection' TypeKey='ContactCategory' DataObjectPropertyKey='ContactCategoryID' AttributeName='' BaseValue='ContactCategoryID='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ContactCategoryList' DataObjectDefinitionKey='ContactCategory'>
		    <Sort>
				<Argument PropertyKey='Title' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ContactCategory'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Title' ColumnHeader='Title' Width='25%'>
							<Sortable>
								<Argument PropertyKey='Title'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Description' Width='50%'>
								<Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;&nbsp;Options' HeaderColspan='2' HeaderAlign='left'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ContactCategoryEditor'/>
										<Argument Type='DataObject' TypeKey='ContactCategoryID' AttributeName='ContactCategoryID' BaseValue='ContactCategoryID='/>
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
										<Argument Type='DataObject' TypeKey='ContactCategoryID' AttributeName='ContactCategoryID'/>
										<RelatedDataObjects>
											<RelatedDataObject DataObjectDefinitionKey='ContactCategoryMember'>
												<RelationshipProperties>
													<RelationshipProperty parentProperty='ContactCategoryID' childProperty='ContactCategoryID' />
												</RelationshipProperties>
											</RelatedDataObject>
										</RelatedDataObjects>
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
	