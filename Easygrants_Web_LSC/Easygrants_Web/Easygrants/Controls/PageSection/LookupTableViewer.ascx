<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="LookupTableViewer.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cLookupTableViewer" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>
<table width='100%' id='tblFilter' runat='server' visible='false'>
	<tr><td class='SeparatorHdg' colspan='2'>Filter</td></tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr>
		<td width='25%'><b><span runat='server' id='spnFilterLabel'/></b></td>
		<td><Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFilterDD' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr><td colspan='2'>&nbsp;</td></tr>
	<tr align='Center'>
		<td colspan='2'><span runat='server' id='spnFind'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClear'/></td>
	</tr>
</table>
<br>


<table width='100%'>
	<tr><td class='SeparatorHdg'>Lookup Table Information</td></tr>
</table>
<br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlLookupTableSummary' 
	Src='EasyGrants/Controls/PageSection/LookupTableSummary.ascx'
	runat='server'/>
<br><br>

<span runat='server' id='spnAdd'/>
<br><br>
<span runat='server' id='spnList'/>
<br><br>

<table width='100%'>
	<tr><td align='Center'><span runat='server' id='spnClose'/></td></tr>
</table>

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<!--The DataObjectDefinitionKey attribute for the following DataObject element is set in the code-behind, 
		based on the table being edited. -->
		<DataObject Key='LookupTableList' DataObjectDefinitionKey='' Updatable='False' CreateNew='False'>
			<!--The below filter Element is used for Tiered Table types, other wise the Filter is deleted from codebehind. and also the PropertyKey value is set from codebehind -->
			<Filters>
				<Argument Type='QueryString' TypeKey='FilterID' PropertyKey='' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Image='Add'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='LookupTableEditor'/>
								<Argument Type='QueryString' TypeKey='TableName' BaseValue='TableName='/>
								<!--The following Argument element will be altered by the codebehind on load. The AttributeName
								attribute is included so that this element can be identified by the codebehind.-->
								<Argument AttributeName='ID' Value=''/>
								<Argument Type='QueryString' TypeKey='LookupTableTypeID' BaseValue='LookupTableTypeID='/>
								<Argument Type='QueryString' TypeKey='FilterID' BaseValue='FilterID='/>
								<Argument Type='QueryString' TypeKey='' BaseValue='OperationType=Add'/>
								<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlList'
						Type='cDataListCtl'
						Container='spnList'
						SeparatorWidth='1'
						DataObjectDefinitionKey=''>
						<DisplayProperty PropertyKey='Description' ColumnHeader='Description'>
							<Sortable>
								<Argument PropertyKey='Description'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Sort Order'>
							<Sortable>
								<Argument PropertyKey='SortOrder'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Abbr' ColumnHeader='Abbreviation'>
							<Sortable>
								<Argument PropertyKey='Abbr'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='EndDate' ColumnHeader='Status'>
							<Parameters>
								<Argument Value='' ValueKey='EndDate' Operator='Equal' DisplayValue='Active'/>
								<Argument Value='CurrentDate' ValueKey='EndDate' Operator='GreaterThan' DisplayValue='Active'/>
								<Argument Value='CurrentDate' ValueKey='EndDate' Operator='LessThanEqual' DisplayValue='Inactive'/>
							</Parameters>
							<Sortable>
								<Argument PropertyKey='EndDate'/>
							</Sortable>
						</DisplayProperty>
						<!--The below DisplayProperty will be available for Tiered Table types all the attribute Value arein the code-behind, 
						based on the table being edited. -->
						<DisplayProperty PropertyKey='' ColumnHeader='' ID='Dynamic'>
							<Sortable>
								<Argument PropertyKey=''>	
									<RelatedProperty PropertyKey=''/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options'>
							<Control ID='ctlEdit'
								Type='cButton'
								Image='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='LookupTableEditor'/>
										<Argument Type='QueryString' TypeKey='TableName' AttributeName='TableName' BaseValue='TableName='/>
										<!--The following Argument element will be altered by the codebehind on load>-->
										<Argument Type='DataObject' TypeKey='' AttributeName='' BaseValue='ID='/>
										<Argument Type='QueryString' TypeKey='LookupTableTypeID' BaseValue='LookupTableTypeID='/>
										<Argument Type='QueryString' TypeKey='FilterID' BaseValue='FilterID='/>
										<Argument Type='QueryString' TypeKey='' BaseValue='OperationType=Edit'/>
										<Argument Type='URL' TypeKey='PathAndQuery' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnFind'
						Container='spnFind'
						Type='cButton'
						Image='Find'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='Find'>				
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClear'
						Container='spnClear'
						Type='cButton'
						Image='Clear'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='Clear'>				
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='LookupTableManagement'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>