<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Affiliated <%=GetLabel("Organization")%></b></td>
	</tr>	
</table>
<!--
Click the <b>Add</b> button to affiliate an organization with this contact.  Click the organization name <b>link</b> below to view/edit 
that organization's contact record. Click the <b>Edit</b> or <b>Delete</b> option buttons to edit or delete the organization 
affiliation records. -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td >
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td >
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='PersonID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
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
									<Argument AttributeName='PageKey' Value='POAEditorPerson'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='PersonOrganizationAffiliationID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' BaseValue='PersonID='/>
									<Argument Type='QueryString' TypeKey='Origin' BaseValue='Origin='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='PersonOrganizationAffiliation'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary' Width='10%'/>
						<DisplayProperty PropertyKey='Type.Description' ColumnHeader='Type' Width='15%'/>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='30%' >
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObject' TypeKey='PersonOrganizationAffiliationID' AttributeName='PersonOrganizationAffiliationID' BaseValue='PersonOrganizationAffiliationID='/>
										<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Title' ColumnHeader='Job Title'  Width='20%'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center' Width='25%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='POAEditorPerson'/>
										<Argument Type='DataObject' TypeKey='PersonOrganizationAffiliationID' AttributeName='PersonOrganizationAffiliationID' BaseValue='PersonOrganizationAffiliationID='/>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='PersonID='/>
										<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
										<Argument Type='QueryString' TypeKey='Origin' BaseValue='Origin='/>
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
											<Argument Type='DataObject' TypeKey='PersonOrganizationAffiliationID' AttributeName='PersonOrganizationAffiliationID'/>
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
	