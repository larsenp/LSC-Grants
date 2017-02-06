<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Category Affiliation</b></td>
	</tr>	
</table>

<br>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td >
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td ><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ContactCategoryMember' DataObjectDefinitionKey='ContactCategoryMember'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='EntityID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Title'>	
					<RelatedProperty PropertyKey='ContactCategory'/>
				</Argument>
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
									<Argument AttributeName='PageKey' Value='PersonCategoryAffiliation'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='ContactCategoryMemberID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='' BaseValue='EntityID='/>
									<Argument Type='DataPresenter' TypeKey='EntityTypeID' AttributeName='' BaseValue='EntityTypeID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='ContactCategoryMember'
						SeparatorWidth='2'
						MaxPerPage='10'>
						
						<DisplayProperty PropertyKey='ContactCategory.Title' ColumnHeader='Category' Width='20%'/>
						<DisplayProperty PropertyKey='ContactCategory.Description' ColumnHeader='Description' Width='55%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' Width='25%'>
							<Control ID='btnEdit' 
								Type='cButton' 
								Image='Edit'>
									<Action
										PostBack='True'
										Object='EventController'
										Method='EventController_NavigateToModulePageKey'>
										<Parameters>
											<Argument AttributeName='PageKey' Value='PersonCategoryAffiliation'/>
											<Argument Type='DataObject' TypeKey='ContactCategoryMemberID' AttributeName='ContactCategoryMemberID' BaseValue='ContactCategoryMemberID='/>
											<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='EntityID' BaseValue='EntityID='/>
										<Argument Type='DataPresenter' TypeKey='EntityTypeID' AttributeName='EntityTypeID' BaseValue='EntityTypeID='/>
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
											<Argument Type='DataObject' TypeKey='ContactCategoryMemberID' AttributeName='ContactCategoryMemberID'/>
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
	