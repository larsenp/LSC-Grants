<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.Page.cMatchingContributionsBase" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->

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
		<td  class="SeparatorHdg"><b>Matching Contributions</b></td>
	</tr>	
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
	<tr>
		<td>
			<span runat='server' id='spnlblTotal' visible='False'><b>Total Amount of Matching Contributions&nbsp;&nbsp;</span></b><span runat='server' id='spnTotal' visible='False'></span>	
		</td>
	</tr>
</table>
<table id="Table5" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>	
	<tr >
		<td align='center'>
			<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProjectMatchingContributionList' DataObjectDefinitionKey='GranteeProjectMatchingContribution'>
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
								<Argument AttributeName='PageKey' Value='MatchingContributionsEditor'/>
								<Argument Type='' TypeKey='' AttributeName='' Value='ProjectMatchingContributionID=0'/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='ContributionAmount' Width='20%' Format='$#,0' ColumnHeader='Amount of Contribution'>
							<Sortable>
							    <Argument PropertyKey='ContributionAmount'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='MatchingContributionType.Abbr' Width='10%' ColumnHeader='Type'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='MatchingContributionType'/>
								</Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='MatchingContributionStatus.Abbr' Width='20%' ColumnHeader='Status'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='MatchingContributionStatus'/>
								</Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='ContributionSource' Width='20%' ColumnHeader='Source' >
							<Sortable>
							    <Argument PropertyKey='ContributionSource'/>
							</Sortable>
						</DisplayProperty>							
					    <DisplayProperty PropertyKey='MatchingContributionSourceType.Abbr' Width='20%' ColumnHeader='Source Type'>
							<Sortable>
								<Argument PropertyKey='Abbr'>
									<RelatedProperty PropertyKey='MatchingContributionSourceType'/>
								</Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='2' Width='30%' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='MatchingContributionsEditor'/>
										<Argument Type='DataObject' TypeKey='ProjectMatchingContributionID' AttributeName='ProjectMatchingContributionID' BaseValue='ProjectMatchingContributionID='/>								
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>																	
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
											<Argument Type='DataObject' TypeKey='ProjectMatchingContributionID' AttributeName='ProjectMatchingContributionID'/>
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
							Type='cButton' Image='Save and Continue' GoToNextPage='True' >
						</Control>	
				</DisplayProperty>
					
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->



