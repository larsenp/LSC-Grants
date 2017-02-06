<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Reports.cAdHocQueryList_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="True"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' tagname='cButton' src='../../../../../../Core/Controls/Base/CSSButton.ascx' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<!-- USER MODIFIABLE CONTENT AREA -->
<table runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			The Queries feature allows you to create, edit, save, and run reports. You can also export results to Microsoft Excel, send bulk e-mails, or merge
			the data with an uploaded Microsoft Word document to create personalized reports or letters.
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Find Saved Queries
		</td>
	</tr>
	<tr>
		<td>
			To see a list of saved queries, either select a <b>Query Type</b> or enter text in the <b>Search for Query Name</b> field and click the appropriate <b>Go</b> button.
			Saved queries matching the search criteria will be displayed below.
		</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Query Type</b>
			&nbsp;&nbsp;
			<span id='spnQueryType' runat='server'/>
			&nbsp;&nbsp;
			<span id='spnSubmitQueryType' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			Note: This search finds <i>your</i> private queries and all public queries for the Query Type you select.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>OR</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Search For Query Name</b>
			&nbsp;&nbsp;
			<span id='spnQueryName' runat='server'/>
			&nbsp;&nbsp;
			<span id='spnSubmitQueryName' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			Note: This search will find all the queries with names containing the text you entered.
		</td>
	</tr>
</table>

<span id='spnListText' runat='server'>
	<table runat='server' width='100%'>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				To use a saved query, select an option from the Action drop-down list and click on the <b>Go</b> button. Click on the column heading names in the table
				below to sort the list of queries in ascending or descending order.
			</td>
		</tr>
		<tr>
			<td>
				<span id='spnActionText' runat='server'/>
			</td>
		</tr>
		<tr>
		<td colspan='2'>
			<span runat='server' id='spnQueries' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnNoResult'/>
		</td>
	</tr>
	</table>
</span>

<table runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class='SeparatorHdg'>
			Create New Query
		</td>
	</tr>
	<tr>
		<td>
			To create a new query, first select the type of information (the field group) on which you would like to report and click <b>Go</b>.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Select Field Group</b>
			&nbsp;&nbsp;
			<span id='spnBaseType' runat='server'/>
			&nbsp;&nbsp;
			<span id='spnAdd' runat='server'/>
			<asp:CustomValidator 
				id='valGo'
				runat='server'
				OnServerValidate='ValidateFieldGroup'
				ErrorMessage='A Field Group is required.'
				Display='None'/>
		</td>
	</tr>
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click <span id='spnHelp' runat='server'/> for a list of fields in each field group.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
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
					<Control ID='btnSubmitQueryType'
						Container='spnSubmitQueryType'
						Type='cButton'
						visible='false' 
						Image='Go'
						EnterKey='True'>
						<Action
							PostBack='True'
							Object='ModulePageContent'
							Method='FilterListDataPresenter_Find'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlQueryName'
						Container='spnQueryName'
						Type='cTextBox'
						Size='50'
						MaxLength='50'
						FilterKey='Name'>
							<FilterList List='QueryList' Property='Name'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmitQueryName'
						Container='spnSubmitQueryName'
						Type='cButton'
						visible='false' 
						Image='Go'>
						<Action
							PostBack='True'
							Object='ModulePageContent'
							Method='FilterListDataPresenter_Find'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlActionText'
						Container='spnActionText'
						Type='cTextPopUp'
						PopUpCloseImage='Close'
						Caption='More on Action drop-down list...'
						PopUpTitle='Action Drop-Down List Options'
						Height='300'
						Width='600'>
						<InstructionHtml>
							<ul>
								<li>Copy - makes a copy of an existing query</li>
								<li>Delete – deletes the query</li>
								<li>Edit – allows you to modify the query</li>
								<li>Export to Excel – exports query results to Microsoft Excel</li>
								<li>Export to E-mail – allows you to send e-mail to all primary people associated with the query results</li>
								<li>View Results – displays query results in HTML format in a new window</li>
								<li>Word Merge - allows you to merge the data with an uploaded Microsoft Word document</li>
							</ul>
						</InstructionHtml>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='QueryList' DataObjectDefinitionKey='SavedQuery' Updatable='False' GetData='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' Value=''/>
				<Argument Type='' TypeKey='' PropertyKey='AccessTypeID' Value='1' Bool='And'/>
				<Argument Type='' TypeKey='' PropertyKey='AccessTypeID' Operator='NotEqual' Value='1' Bool='Or'/>
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
						<DisplayProperty PropertyKey='' ColumnHeader='Action' NoWrap='True' Width='200'>
							<Control ID='ctlActions'
								Type='cDropDown'
								DataObjectDefinitionKey='SavedQueryAction'
								StoredValue='SavedQueryActionID'
								DisplayValue='SavedQueryAction'>
								<Sort>
									<Argument PropertyKey='SavedQueryAction' />
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
									Method='Execute_Query_Action'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='SavedQueryID' AttributeName='SavedQueryID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Name' ColumnHeader='Query Name'>
							<Sortable>
								<Argument PropertyKey='Name'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AccessType.AccessTypeDesc' ColumnHeader='Private?'>
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
						<DisplayProperty PropertyKey='Description' ColumnHeader='Query Description'/>
						<DisplayProperty PropertyKey='User.Person.LastNameFirstNameMiddleName' ColumnHeader='Last Saved By'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='User.Person'/>
								</Argument>
							</Sortable>
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
						RequiredField='False'>
						<Sort><Argument PropertyKey='BaseType'/></Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='AdHocQueryTool'/>
								<Argument Value='QueryType=New'/>
								<Argument Type='Control' TypeKey='ctlBaseType' ControlPropertyKey='SelectedValue' BaseValue='Category='/>
								<Argument Value='Display=0'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnHelp' 
						ID='ctlHelp'
						Type='cLink'
						Caption='here'>
						<Action
							PostBack='False'
							URL='../../../Easygrants/Controls/Base/pgQTFields.aspx'
							Target='Blank'>
						</Action>		
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>