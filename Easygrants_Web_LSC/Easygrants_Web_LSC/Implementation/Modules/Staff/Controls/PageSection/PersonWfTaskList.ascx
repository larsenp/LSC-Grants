<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cPersonWfTasklist" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Workgroup Tasks</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<!-- Page Content - Controls -->
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonWfTaskList' DataObjectDefinitionKey='WorkGroupToDoList' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID'/>
				<Argument Type='' TypeKey='' PropertyKey='TaskPersonID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Operator='NotEqual' Value='3' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument> 
			</Filters>
			<Sort>
				<Argument PropertyKey='OpenDate' Direction='Descending'/>
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						NoRecordMessage='No workgroup tasks.'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='' NoWrap='True'  Width='20%' ColumnHeader='Action'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument PropertyKey='DataObjectDefinitionKey' Value='GroupTask'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
								</Filters>
								<Sort>
									<Argument PropertyKey='SortOrder'>
										<RelatedProperty PropertyKey='EasylistActionType'/>
									</Argument>
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
										<Argument Type='DataObject' TypeKey='WfTaskAssignmentID' AttributeName='WfTaskAssignmentID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>	
						<DisplayProperty PropertyKey='CreateDate' ColumnHeader='Task Creation Date' Format='M/d/yyyy' Width='15%'>
							<Sortable>
								<Argument PropertyKey='CreateDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='TaskTitle' ColumnHeader='Task' Width='20%'>
							<Sortable>
								<Argument PropertyKey='TaskTitle'/>
							</Sortable>
						</DisplayProperty>
						<%--<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='10%'> 	
							<Sortable>
								<Argument PropertyKey='GranteeProjectID' />
							</Sortable>
							<Control ID='ctlLinkGrantID'
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
						</DisplayProperty>--%>
						<%--  Added by bindu to change Grant ID to TIG Number 11/4/10 --%>
						<DisplayProperty PropertyKey='GranteeProject.LegacyGrantID' ColumnHeader='TIG Number' Width='10%'>
							<Sortable>
								<Argument PropertyKey='LegacyGrantID'>
									<RelatedProperty PropertyKey='GranteeProject'/>
								</Argument>
							</Sortable>
							<Control ID='ctlLinkGrantID'
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
						</DisplayProperty>
						<DisplayProperty PropertyKey='Organization.CommonOrganizationName' ColumnHeader='~~Organization~~' Width='15%'>
							<Sortable>
								<Argument PropertyKey='CommonOrganizationName'>
									<RelatedProperty PropertyKey='Organization'/>
								</Argument>
							</Sortable>
							<Control ID='ctlLinkOrganization'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObject' TypeKey='OrganizationID' AttributeName='OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
							
							
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.GrantStatus.Abbr' ColumnHeader='Grant Status' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='GranteeProject.GrantStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PrimaryPerson' ColumnHeader='Primary Person' Width='25%'>	
							<Sortable>
								<Argument PropertyKey='PrimaryPerson'/>
							</Sortable>
							<Control ID='ctlLinkLastNameFirstName'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PersonContact'/>
										<Argument Type='DataObjectRelated' TypeKey='WfTaskAssignment.GranteeProject.PrimaryPersonID' AttributeName='PrimaryPersonID' BaseValue='PersonID='/>
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
