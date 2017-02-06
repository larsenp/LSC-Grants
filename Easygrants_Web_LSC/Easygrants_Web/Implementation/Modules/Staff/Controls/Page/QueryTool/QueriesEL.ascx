<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.QueryTool.cQueriesEL" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>

<Core:cNewWindowOpener runat='server' id='ctlShow'/>
<asp:PlaceHolder Visible='true' id='PlaceHolder' runat='server'></asp:PlaceHolder>

<br>
<table width='100%' border='0' runat='server'>
	<tr>
		<td width='26%'><b>Create New Query</b></td>
		<td width='10%'><span id='spnBaseType' runat='server'/></td>
		<td><span id='spnCreate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='2'><span id='spnViewAllFields' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table width='100%' runat='server'>

	<tr class='SeparatorHdg'>
		<td colspan='2'>
			<span runat='server' id='spnHide' visible='true' /><span runat='server' id='spnHideLink' visible='true' />
			<span runat='server' id='spnShow' visible='true' /><span runat='server' id='spnShowLink' visible='true' />
			(clicking on this link will display Easylist search criteria if it is hidden)
		</td>
	</tr>
</table>

<table id='tbSearchParameters' width='100%' runat='server' visible='true'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Query Name</b></td>
		<td>
			<span runat='server' id='spnQueryName' />
		</td>
	</tr>
	<tr>
		<td><b>Query Type</b></td>
		<td>
			<span runat='server' id='spnQueryType' />
		</td>
	</tr>
	<tr>
		<td><b>Security</b></td>
		<td>
			<span runat='server' id='spnQuerySecurity' />
		</td>
	</tr>
	<tr>
		<td><b>Output Format</b></td>
		<td>
			<span runat='server' id='spnQueryOutputFormat' />
		</td>
	</tr>
	<tr>
		<td><b>Last Saved By Name</b></td>
		<td>
			<span runat='server' id='spnQuerySavedBy' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnFind' />&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>

<table width="100%">
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnQueries' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnNoResult' />
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>


<ModuleSection>
		<ResultLists>
			<ResultList Key='QueryList'>Queries</ResultList>
		</ResultLists>
		<DataObject Key='Filter' DataObjectDefinitionKey='' Updatable='False'>
			<Sort>
				<Argument PropertyKey='Name' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlQueryName' 
						Type='cTextBox' 
						Container='spnQueryName' 
						Size='50'
						MaxLength='50'
						FilterKey='Name'>
						<FilterList List='QueryList' Property='Name' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlQueryType'
						Container='spnQueryType'
						Type='cDropDown'
						DataObjectDefinitionKey='QueryType'
						StoredValue='QueryTypeID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='QueryTypeID'>
						<Sort>
								<Argument PropertyKey='SortOrder' />
						</Sort>
							<FilterList List='QueryList' Property='QueryTypeID'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlQuerySecurity'
						Container='spnQuerySecurity'
						Type='cDropDown'
						DataObjectDefinitionKey='AccessType'
						StoredValue='AccessTypeID'
						DisplayValue='AccessTypeDesc'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='AccessTypeID'>
							<FilterList List='QueryList' Property='AccessTypeID'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlQueryOutputFormat'
						Container='spnQueryOutputFormat'
						Type='cDropDown'
						DataObjectDefinitionKey='QueryOutput'
						StoredValue='QueryOutputID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='QueryOutputID'>
							<FilterList List='QueryList' Property='QueryOutputID'/>
					</Control>	
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlQuerySavedBy'
						Container='spnQuerySavedBy'
						Type='cDropDown'
						DataObjectDefinitionKey='SavedQuery'
						StoredValue='UserID'
						DisplayValue='User.Person.LastNameFirstNameMiddleName'
						DisplayNone='False'
						DisplayText='All'
						FilterKey='UserID'>
							<FilterList List='QueryList' Property='UserID'/>	
					</Control>	
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnShow' Type='cButtonImage' Container='spnShow' Image='Show'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkShow' Type='cLink' Container='spnShowLink' Caption='Find Saved Query'>
						<Action PostBack='True' Object='DataPresenter' Method='ShowSearchParameters' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHide' Type='cButtonImage' Container='spnHide' Image='Hide'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHide' Type='cLink' Container='spnHideLink' Caption='Find Saved Query'>
						<Action PostBack='True' Object='DataPresenter' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind' Type='cButton' Container='spnFind' Image='Find'>
						<Action PostBack='True' Object='ModulePageContent' Method='FilterListDataPresenter_Find' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='QueryList' DataObjectDefinitionKey='SavedQuery' Updatable='False' GetData='False'>
			<Filters>	
			</Filters>
			<Sort>
				<Argument PropertyKey='Name' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnQueries'
						DataObjectDefinitionKey='SavedQuery'
						SeparatorWidth='2'>
						
						<DisplayProperty PropertyKey='Name' ColumnHeader='Query Name'>
							<Sortable>
								<Argument PropertyKey='Name'/>
							</Sortable>
							<Control ID='ctlQueryName'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Query_Action'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SavedQueryID' AttributeName='SavedQueryID'/>
										<Argument Type='DataObject' TypeKey='QueryOutputID' AttributeName='QueryOutputID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AccessType.AccessTypeDesc' ColumnHeader='Security'>
							<Sortable>
								<Argument PropertyKey='AccessTypeDesc'>
									<RelatedProperty PropertyKey='AccessType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='QueryType.Description' ColumnHeader='Query Type'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='QueryType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='QueryOutput.Description' ColumnHeader='Query Output'>
							<Sortable>
								<Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='QueryOutput'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='User.Person.LastNameFirstNameMiddleName' ColumnHeader='Last Saved By'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='User.Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='200'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='SavedQueryAction'
								StoredValue='SavedQueryActionID'
								DisplayValue='SavedQueryAction'>
								<Sort>
									<Argument PropertyKey='SavedQueryAction' />
								</Sort>
								<SelectedValue>
									<Argument PropertyKey='SavedQueryActionID' Value='9'/>
								</SelectedValue>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnGo'
								Type='cButton'
								Image='Go'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='Execute_Query_Action'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SavedQueryID' AttributeName='SavedQueryID'/>
										<Argument Type='DataObject' TypeKey='QueryOutputID' AttributeName='QueryOutputID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='AdHocQuery' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlBaseType'
						Type='cDropDown'
						Container='spnBaseType'
						DataObjectDefinitionKey='SavedQueryBaseType'
						StoredValue='BaseType'
						DisplayValue='BaseType'
						RequiredField='False'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCreate'
						Type='cButton'
						Container='spnCreate'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='SelectFields'/>
								<Argument Value='QueryType=New'/>
								<Argument Type='Control' TypeKey='ctlBaseType' ControlPropertyKey='SelectedValue' BaseValue='Category='/>
								<Argument Value='Display=0'/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnViewAllFields' 
						ID='ctlViewAllFields'
						Type='cLink'
						Caption='View All Fields...'>
						<Action
							PostBack='False'
							URL='../../../Easygrants/PDF/GuidelinesPlaceholder.pdf'
							Target='Blank'>
						</Action>		
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>


	
</span>
<!-- End Embedded XML -->
