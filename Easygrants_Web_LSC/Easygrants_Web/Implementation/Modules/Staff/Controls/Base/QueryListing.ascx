<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.Base.cQueryListing" %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlShow'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnQueries' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AdHocQuery' DataObjectDefinitionKey='SavedQuery' >
			<Filters>
				<Argument Group='('/>
				<Argument PropertyKey='AccessTypeID' Value='2' Bool='' />
				<Argument Group='(' Bool='Or'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' Bool='' />
				<Argument PropertyKey='AccessTypeID' Value='1' Bool='And' />
				<Argument PropertyKey='' Value='' Group=')' Bool=' '/>
				<Argument PropertyKey='' Value='' Group=')' Bool=' '/>
				<Argument Group='(' Bool='And' />
				<Argument Type='QueryString' TypeKey='QueryTypeID' PropertyKey='QueryTypeID' Bool='' />
				<Argument Type='QueryString' TypeKey='QueryName' PropertyKey='Name' Operator='Like' Bool='Or'/>
				<Argument PropertyKey='' Value='' Group=')' Bool=' '/>
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
								<Argument PropertyKey='LastNameFirstNameMiddleName'>
									<RelatedProperty PropertyKey='User.Person'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>