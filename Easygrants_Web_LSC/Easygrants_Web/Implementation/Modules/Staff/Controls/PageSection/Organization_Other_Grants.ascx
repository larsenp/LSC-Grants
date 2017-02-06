<%@ Control Language="vb" AutoEventWireup="True" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width='100%' runat='server' ID="Table1">
	<tr>
		<td class='SeparatorHdg'>
			Other Grant Project Affiliations
		</td>
	</tr>
</table>
<br>
<!--
Listed below are the grant projects with which the organization is affiliated as a non-grantee.  To add a new non-grantee affiliation, click the <b>Add</b> button.  
To modify the role, click the <b>Edit</b> button.  To remove the affiliation, click the <b>Delete</b> button. To work with a grant project, select the appropriate option from the 
Action list and click the <b>Go</b> button (e.g., select "View Project Tasks" from the Action list to view all project tasks under that Grant Project.).
<br><br>
-->
<span runat='server' id='spnAdd' /><br><br>
<span runat='server' id='spnDataList'/>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectOrganizationAffiliation' DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OrganizationID' PropertyKey='OrganizationID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeProjectID' Direction='Descending'/>	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='GranteeProjectAffiliationEditor'/>
								<Argument Value='GranteeProjectOrganizationAffiliationID=0'/>
								<Argument Type='QueryString' TypeKey='OrganizationID' BaseValue='OrganizationID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>		
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectOrganizationAffiliation'
						SeparatorWidth='2'
						NoRecordMessage='No other grants.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' width='10%'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='OrganizationGranteeProject'>
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
										<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID'/>
										<ActionParameters>
											<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID'/>
										</ActionParameters>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' width='10%'>
							<Control ID='ctlGrantID'
								ToolTipPropertyKey='GranteeProject.GrantTitle'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantsEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
									</Parameters>
								</Action>
							</Control>	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'/>
							</Sortable>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='OrganizationRole.Abbr' ColumnHeader='Role' width='10%'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='OrganizationRole'/>
								</Argument>
							</Sortable>
						</DisplayProperty> 
						<DisplayProperty PropertyKey='GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' width='15%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='GrantTitle'>
									<RelatedProperty PropertyKey='GranteeProject'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.GrantStatus.Description' ColumnHeader='Status' width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GranteeProject.GrantStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CreatedByUser.Person.FirstNameLastName' ColumnHeader='Created By'  width='10%'>
							<!--
							<Control ID='ctlLinkName'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObjectRelated' TypeKey='CreatedUser.PersonID' AttributeName='PersonID' BaseValue='PersonID='/>
									</Parameters>
								</Action>
							</Control>
							-->
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='CreatedByUser.Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Created Date' Format='M/d/yyyy' width='10%'>
							<Sortable>
								<Argument PropertyKey='CreateDate' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;Options' HeaderColspan='2' HeaderAlign='Left' width='20%'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GranteeProjectAffiliationEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID' BaseValue='GranteeProjectOrganizationAffiliationID='/>
										<Argument Type='QueryString' TypeKey='OrganizationID' BaseValue='OrganizationID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete the item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='GranteeProjectOrganizationAffiliationID' AttributeName='GranteeProjectOrganizationAffiliationID'/>
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


