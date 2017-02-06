<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantFundingSourcesHistory.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.PageSection.cFundingSourcesHistory" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br />
<table id="TableMain" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Grant Fund Allocations History</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnFundingSourceHistoryList' visible='true'></span>
		</td>
	</tr>
</table>

<br/>



<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectFundingSourcesHistoryList' DataObjectDefinitionKey='GranteeProjectFundingSourcesHistory' Updatable='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlFundingSourceHistoryList'
						Container='spnFundingSourceHistoryList'
						Type='cDataListCtl'
						MaxPerPage='10'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Fund.FundName' ColumnHeader='FundName' ConfigurableHeader='True' Width='15%'>
							<Sortable>
							    <Argument PropertyKey='FundName'>
									<RelatedProperty PropertyKey='Fund'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='AmountAllocated'  ColumnHeader='GrantAllocation' ConfigurableHeader='True' Format='$#,0.00' Width='15%'>
							<Sortable>
							    <Argument PropertyKey='AmountAllocated'/>
							</Sortable>
						</DisplayProperty>
					   <DisplayProperty PropertyKey='Fund.FundSourceType.Description'  ColumnHeader='FundType' ConfigurableHeader='True' Width='15%'>
							<Sortable>
							    <Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='Fund.FundSourceType'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FundingSourceStatus.Description'  ColumnHeader='FundStatus' ConfigurableHeader='True' Width='10%'>
							<Sortable>
							    <Argument PropertyKey='Description'>
									<RelatedProperty PropertyKey='FundingSourceStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ChangeType'  ColumnHeader='Change Type' Width='10%'>
							<Sortable>
							    <Argument PropertyKey='ChangeType'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='HistoryModifiedByUser.Person.LastNameFirstName' ColumnHeader='Last Modified By' Width='15%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									    <RelatedProperty PropertyKey='HistoryModifiedByUser.Person'/>
								   </Argument>
								<Argument PropertyKey='FirstName'>
									<RelatedProperty PropertyKey='HistoryModifiedByUser.Person'/>
								</Argument> 
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='HistoryModifyDate' ColumnHeader='Modified Date' Format='MM/dd/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='HistoryModifyDate'/>								   
							</Sortable>
						</DisplayProperty>					
						
				    </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>
<!-- End Embedded XML -->
</span>