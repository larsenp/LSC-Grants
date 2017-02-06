<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Grant Projects</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>	
		<td >
			<span id='spnNewGranteeProject' runat='server' visible='true'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'  width='100%'>
	<tr>
		<td ><span runat='server' id='spnDataList'></span></td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonGranteeProjectsList' DataObjectDefinitionKey='PersonGranteeProjects'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='GranteeProjectID' Direction='Descending'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlNewGranteeProject'
						Container='spnNewGranteeProject'
						Type='cButton'
						Caption='Add New Grant'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='AddGrants'/>
									<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID=' bool=''/>
									<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' Value=''/>
								</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProject'
						SeparatorWidth='2'
						NoRecordMessage='This person contact is not associated as the primary contact for any grants at this time.'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' Width='23%'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='EasylistAction'
								StoredValue='EasylistActionID'
								DisplayValue='EasylistAction'
								DisplayNone='False'>
								<Filters>
									<Argument Type='' TypeKey='' PropertyKey='DataObjectDefinitionKey' Value='PersonGranteeProject'>
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
						<DisplayProperty PropertyKey='GranteeProjectID' ColumnHeader='GrantId' ConfigurableHeader='True' Width='8%'>
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
								<Argument PropertyKey='GranteeProjectID'>
								
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.GrantTitle' ColumnHeader='ProjectTitle' Width='32%' ConfigurableHeader='True'>
						<Sortable>
								<Argument PropertyKey='GrantTitle'>
									<RelatedProperty PropertyKey='GranteeProject'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.GrantAwardDate' ColumnHeader='Award Date' Width='10%' Format='M/d/yyyy'>
							<Sortable>
								<Argument PropertyKey='GrantAwardDate'>
									<RelatedProperty PropertyKey='GranteeProject'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.GrantStatus.Description' ColumnHeader='Status' Width='10%'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GranteeProject.GrantStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='GranteeProject.WfProjectOutcome.Description' ColumnHeader='Outcome' Width='17%'> 
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='GranteeProject.WfProjectOutcome'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
