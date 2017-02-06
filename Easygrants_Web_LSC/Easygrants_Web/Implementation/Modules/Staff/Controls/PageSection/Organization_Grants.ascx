<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table width='100%' runat='server'>
	<tr>
		<td class='SeparatorHdg'>
			Grant Projects
		</td>
	</tr>
</table>
<br>
<!--
Listed below are the grant projects for which this organization is the primary grantee.  Tasks such as Application, Review, and Grantee Reports are grouped under 
the grant projects listed in this section.  To work with a grant project, select the appropriate option from the Action list and click the <b>Go</b> button (e.g., select 
"View Project Tasks" from the Action list to view all project tasks under that Grant Project.).  To add a new grant project go to the primary contact's person 
Activity page and click on the  <b>Add New Grant</b> link.
<br><br>
-->
<span runat='server' id='spnDataList'/>

<span id='spnConfigXML' runat='server' visible='false'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='OrganizationID' PropertyKey='PrimaryOrganizationID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeProjectID' Direction='Descending' />	
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProject'
						SeparatorWidth='2'
						NoRecordMessage='No current grants.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' width='20%'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='GranteeProject'>
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
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' width='10%'>
							<Control ID='ctlGrantID'
								ToolTipPropertyKey='GrantTitle'
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
						<!-- <DisplayProperty PropertyKey='OrganizationRole.Abbr' ColumnHeader='Role'/>  -->
						<DisplayProperty PropertyKey='GrantTitle' ColumnHeader='ProjectTitle' width='20%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='GrantTitle'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProject.WfProjectName' ColumnHeader='Funding Cycle' width='20%'>
							<Sortable>
								<Argument PropertyKey='WfProjectName'>
									<RelatedProperty PropertyKey='WfProject'/>
								</Argument>	
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProject.WfCompetition.WfProgram.ProgramDisplayName' ColumnHeader='ProgramName' width='10%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='ProgramDisplayName'>
									<RelatedProperty PropertyKey='WfProject.WfCompetition.WfProgram'/>
								</Argument>	
							</Sortable>
						</DisplayProperty>
						
						
						<DisplayProperty PropertyKey='GrantStatus.Description' ColumnHeader='Status' width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GrantStatus'/>
								</Argument>	
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfProjectOutcome.Description' ColumnHeader='Outcome' width='10%'>
								<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='WfProjectOutcome'/>
								</Argument>	
							</Sortable>
						</DisplayProperty>
						<!--
						<DisplayProperty PropertyKey='CreatedByUser.Person.FirstNameLastName' ColumnHeader='Created By'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='CreatedByUser.Person'/>
								</Argument>	
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Submitted Date' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='CreateDate'/>
							</Sortable>
						</DisplayProperty>
						-->
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>