<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td colspan="2" class="SeparatorHdg">
			<b>Outcomes</b>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnNoOutcomes'></span>I have no Outcomes to report
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>		
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>
<br/>
<table id="Table5" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>	
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='OLGranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='NoOutcomesToReport'>
					<Control ID='ctlNoOutcomes'
						Container='spnNoOutcomes'
						Type='cCheckBox'
						StoredValue='1'	>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		<DataObject Key='GranteeProjectResearchOutcome' DataObjectDefinitionKey='GranteeProjectResearchOutcome'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								AutoSave='True'
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OutcomesEditor'/>
									<Argument Type='' TypeKey='' Value='GranteeProjectResearchOutcomeID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectResearchOutcome'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='ResearchOutcomes.Description' ColumnHeader='Outcome Type' Width='35%'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ResearchDescription' ColumnHeader='Description' Width='20%'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									AutoSave='True'
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OutcomesEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectResearchOutcomeID' AttributeName='GranteeProjectResearchOutcomeID' BaseValue='GranteeProjectResearchOutcomeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False' >
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='GranteeProjectResearchOutcomeID' AttributeName='GranteeProjectResearchOutcomeID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
								
				<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' Image='Continue' GoToNextPage='True' >
							<Action
								AutoSave='True'
								PostBack='True'>								
							</Action>
						</Control>	
				</DisplayProperty>
					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
