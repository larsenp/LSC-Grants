
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GrantPayments.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cGrantPayments" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Payment Schedule</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td ><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		
		<td width='64%' align='right'><span runat='server' id='spnReqTotalLbl' visible='False'><b>Total:&nbsp;&nbsp;</span></b><span runat='server' id='spnReqTotal' visible='False'></span></td>
		<td width='4%'>&nbsp;</td>
		<td width='32%'><span runat='server' id='spnPayTotalLbl' visible='False'><b>Total:&nbsp;&nbsp;</span></b><span runat='server' id='spnPayTotal' visible='False'></span></td>
		
		
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PaymentList' DataObjectDefinitionKey='Payment'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='PaymentEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='PaymentID=0'/>
									<Argument Type='DataPresenter' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Payment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='PaymentID' ColumnHeader='Payment ID'  Width='8%'>
							<Sortable>
								<Argument PropertyKey='PaymentID'/>								   
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestStatus.RequestStatus' ColumnHeader='Payment Status'  Width='10%'>
							<Sortable>
								<Argument PropertyKey='RequestStatus'>
								    <RelatedProperty PropertyKey='RequestStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestAccountFund.FundAccountNumber' ColumnHeader='FundNumber'  Width='15%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='FundAccountNumber'>
								    <RelatedProperty PropertyKey='RequestAccountFund'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PaymentContingencyTask.ContingencyTaskAssignment.WfTask.WfTask' ColumnHeader='Contingency' Width='20%'>
							<Sortable>
								<Argument PropertyKey='WfTask'>
								    <RelatedProperty PropertyKey='PaymentContingencyTask.ContingencyTaskAssignment.WfTask'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestedDate' ColumnHeader='PaymentRequestedDate' Format='M/d/yyyy' Width='10%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='RequestedDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestedAmount' ColumnHeader='PaymentRequestedAmount'  Format='c' Width='10%' ConfigurableHeader='True'>
							<Sortable>
								<Argument PropertyKey='RequestedAmount'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PaymentAmount' ColumnHeader='Payment Amount'    Format='c'  Width='10%'>
							<Sortable>
								<Argument PropertyKey='PaymentAmount'/>								   
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='&nbsp;&nbsp;&nbsp;Options' Width='3%' HeaderColspan='2' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='PaymentEditor'/>
										<Argument Type='DataObject' TypeKey='PaymentID' AttributeName='PaymentID' BaseValue='PaymentID='/>
										<Argument Type='DataObject' TypeKey='GranteeProjectID' AttributeName='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataObject' TypeKey='TaskID' AttributeName='TaskID' BaseValue='WfTaskID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' Width='14%'>
							<Parameters>
							<Argument Value='4' ValueKey='RequestStatusID' DisplayValue=''/>	
							<Argument Value='4' ValueKey='RequestStatusID' DisplayValue='Control'  Operator='NotEqual'>	
								<Control ID='btnDelete'
									Type='cButton'
									Image='Delete'
									Confirmation='Are you sure you want to delete this item?'>
										<Action
										PostBack='True'
										Object='EventController'
										Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='PaymentID' AttributeName='PaymentID'/>
											</Parameters>
										</Action>
								</Control>
							</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
	