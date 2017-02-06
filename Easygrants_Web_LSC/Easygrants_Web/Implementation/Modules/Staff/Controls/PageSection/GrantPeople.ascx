<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Additional Grant Contacts</b></td>
	</tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' visible='false'>
	<tr>
		<td><b>Grantee Name</b></td>
		<td width='100'><span runat='server' id='ctlPrimaryGrantee'/></td>
		<td rowspan='2'><span runat='server' id='spnAction'/></td>
	</tr>
	<tr>
		<td><b>Grantee <%=GetLabel("Organization")%>&nbsp;</b></td>
		<td><span runat='server' id='ctlOrganization'/></td>
		<td></td>
	</tr>
</table>
<table>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='5'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstName'>
					<Control ID='ctlPrimaryGrantee' Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryOrganization.CommonOrganizationName'>
					<Control ID='ctlOrganization' Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='GranteeProjectPersonAffiliation' DataObjectDefinitionKey='GranteeProjectPersonAffiliation'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>	
				<!--	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnLogin' 
						Type='cButton' 
						Image='Login As'
						Container='spnLogin'>
							<Action PostBack='True' Object='ModulePage' Method='LoginAsUser_From_Person'>
								<Parameters>
									<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryPersonID' Value=''/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				-->
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
									<Argument AttributeName='PageKey' Value='GranteeProjectPersonAffiliation'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectPersonAffiliationID=0'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectPersonAffiliation'
						MaxPerPage='10'>
						
						<!--
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Name'/>
						-->
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Name'>
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<!--
										<Argument Type='DataObject' TypeKey='PersonOrganizationAffiliationID' AttributeName='PersonOrganizationAffiliationID' BaseValue='PersonOrganizationAffiliationID='/>
										-->
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>

						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='Organization'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Email' ColumnHeader='E-mail'>
							<Control ID='ctlEmail'
								Type='cLink'>
								<Action
									PostBack='False'
									URL='Email'>
								</Action>
							</Control>
							<Sortable>
								<Argument PropertyKey='Email'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeMemberRole' ColumnHeader='Role'>
							<Sortable>
								<Argument PropertyKey='GranteeMemberRole'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ProjectTitle' ColumnHeader='Project Title'>
							<Sortable>
								<Argument PropertyKey='ProjectTitle'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AwardYear' ColumnHeader='Year'>
							<Sortable>
								<Argument PropertyKey='AwardYear'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GranteeProjectPersonAffiliation'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectPersonAffiliationID' AttributeName='GranteeProjectPersonAffiliationID' BaseValue='GranteeProjectPersonAffiliationID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='GranteeProjectPersonAffiliationID' AttributeName='GranteeProjectPersonAffiliationID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''>
					<RelatedProperty PropertyKey='GranteeProjects'/>
				</Argument>
			</Filters>
			<DefaultValues />
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnAction'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='' ColumnHeader=''>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='Person'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey="EasylistAction" />
								</Sort>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Action'>
									<Parameters>
										<Argument Type='Object' ObjectType='CoreControl'/>
										<Argument Type='Object' ObjectType='EventSource'/>
										<Argument Type='DataObject' TypeKey='PersonID' AttributeName='PersonID'/>
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
	