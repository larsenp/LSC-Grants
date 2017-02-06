<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="FundingSources.ascx.vb" Inherits="Easygrants.Controls.PageSection.cFundingSources" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='3' class="SeparatorHdg"><b>Grant Fund Allocations</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAddFundingSource'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnFundingSourceList' visible='true'></span>
		</td>
	</tr>
</table>
<table id="tblGPTotalAllocatedAmount" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' visible='False'>
	<tr>
		<td width='30%' align='left'><b>Total All Fund Allocations</b></td>
		<td width='32%'><span runat='server' id='spnGPTotalAllocatedAmount' visible='True'></span></td>
		<td>&nbsp;</td>
	</tr>
</table>
<br>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectTotalAllocatedAmount.TotalAllocatedAmount' Format='$#,0.00'>
					<Control ID='spnGPTotalAllocatedAmount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectFundingSources' DataObjectDefinitionKey='GranteeProjectFundingSources' Updatable='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAddFundingSource'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='FundingSourcesEditor'/>
								<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Type='' TypeKey='' AttributeName='' Value='GranteeProjectFundingSourcesID=0'/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFundingSourceList'
						Container='spnFundingSourceList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Fund.FundName' Width='15%' ColumnHeader='FundName' ConfigurableHeader='True'>
							<Sortable>
							    <Argument PropertyKey='FundName'>
									<RelatedProperty PropertyKey='Fund'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Fund.FundDescription' Width='15%' ColumnHeader='FundDescription' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='FundDescription'>
									<RelatedProperty PropertyKey='Fund'/>
								</Argument>
							</Sortable>
					    </DisplayProperty>
					    <DisplayProperty PropertyKey='AmountAllocated' Width='10%' ColumnHeader='GrantAllocation' Format='$#,0.00' ConfigurableHeader='True'>
							<Sortable>
							    <Argument PropertyKey='AmountAllocated'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundingSourceBalance.TotAmount' Width='10%' ColumnHeader='PaymentAllocation' Format='$#,0.00' ConfigurableHeader='True'>
							<Sortable>
							    <Argument PropertyKey='TotAmount'>
									<RelatedProperty PropertyKey='FundingSourceBalance'/>
							    </Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundingSourceBalance.GrantFSBalance' Width='10%' ColumnHeader='GrantAllocationBalance' Format='$#,0.00' ConfigurableHeader='True'>
							<Sortable>
							    <Argument PropertyKey='GrantFSBalance'>
									<RelatedProperty PropertyKey='FundingSourceBalance'/>
							    </Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Fund.FundSourceType.Description' Width='10%' ColumnHeader='FundType' ConfigurableHeader='True'>
							<Sortable>
							    <Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='Fund.FundSourceType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundingSourceStatus.Description' Width='10%' ColumnHeader='FundStatus' ConfigurableHeader='True'>
							<Sortable>
							    <Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='FundingSourceStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
					    <DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='2' Width='10%' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='FundingSourcesEditor'/>
										<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
										<Argument Type='DataObject' TypeKey='GranteeProjectFundingSourcesID' AttributeName='GranteeProjectFundingSourcesID' BaseValue='GranteeProjectFundingSourcesID='/>
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
									Object='DataPresenter'
									Method='Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='GranteeProjectFundingSourcesID' AttributeName='GranteeProjectFundingSourcesID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
				    </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>