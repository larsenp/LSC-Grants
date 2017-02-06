<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.cLogicFrameworkBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />

<br>
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<br>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg"><b>Outcomes</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnAdd' visible='true'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server' ID="Table3">	
	<tr align='Center'>
		<td>
			<span runat='server' id='spnOutcomesandIndicatorsReport'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr align='center'>
		<td><span runat='server' id='spnSave_and_Continue'/></td>
	</tr>
</table>



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		
		<DataObject Key='GranteeProjectLogicFramework' DataObjectDefinitionKey='GranteeProjectLogicFramework'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' 	Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAdd'
						Container='spnAdd'
						Type='cButton'
						Image='Add'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='ProjectLogicFrameworkID=0'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='LogicFrameworkIndicatorsID=0'/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
						<Control ID='btnSave_and_Continue'
							Container='spnSave_and_Continue'
							Type='cButton' Image='Save and Continue' GoToNextPage='True' >
						</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='LongTermConservationOutcome' Width='60%' ColumnHeader='Outcome Description' WordBreak='True'>
							<Sortable>
							    <Argument PropertyKey='LongTermConservationOutcome'/>									
							</Sortable>
						</DisplayProperty>
					    <DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='2' Width='20%' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsEditor'/>
										<Argument Type='DataObject' TypeKey='ProjectLogicFrameworkID' AttributeName='ProjectLogicFrameworkID' BaseValue='ProjectLogicFrameworkID='/>										
										<Argument Type='' TypeKey='' AttributeName='' Value='LogicFrameworkIndicatorsID=0'/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='ProjectLogicFrameworkID' AttributeName='ProjectLogicFrameworkID'/>
											<RelatedDataObjects>
												<RelatedDataObject DataObjectDefinitionKey='GranteeProjectLogicFrameworkIndicators'>
													<RelationshipProperties>
														<RelationshipProperty parentProperty='ProjectLogicFrameworkID' childProperty='ProjectLogicFrameworkID' />
													</RelationshipProperties>
													<RelatedDataObjects>													
													</RelatedDataObjects>
												</RelatedDataObject>
											</RelatedDataObjects>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
				    </Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlOutcomesandIndicatorsReport' 
						Type='cButton' 
						Image='View Outcomes and Indicators Report'
						Container='spnOutcomesandIndicatorsReport'>
							<Action
								PostBack='True'
								Object='DataPresenter'
								Method='ViewOutcomesandIndicatorsReport'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='OutcomesandIndicatorsReport'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
			
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
