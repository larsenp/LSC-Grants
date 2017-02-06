<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<!-- Control Label (for  Address information) -->
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>Payment Schedule</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td>
			<span runat='server' id='spnAdd'/>&nbsp;&nbsp;
			<span runat='server' id='spnPaymentSchedule' />
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
<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		
		<td width='64%' align='right'><b>Total Requested:&nbsp;&nbsp;</b><span runat='server' id='spnReqTotal'></span></td>
		<td width='4%'>&nbsp;</td>
		<td width='32%'><b>Total Paid:&nbsp;&nbsp;</b><span runat='server' id='spnPayTotal'></span></td>
		
		
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PaymentList' DataObjectDefinitionKey='Payment'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='PaymentNumber' />
			</Sort>
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
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>								
				<DisplayProperty PropertyKey=''>
					<Control ID='btnPaymentSchedule' 
						Type='cButton' 
						Image='View Report'
						Container='spnPaymentSchedule'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='PaymentSchedule'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Value='PageFrame=Print' />
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
						<DisplayProperty PropertyKey='PaymentNumber' ColumnHeader='Payment No'  Width='8%'>
							<Sortable>
								<Argument PropertyKey='PaymentNumber'/>								   
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestStatus.RequestStatus' ColumnHeader='Payment Status'  Width='10%'>
							<Sortable>
								<Argument PropertyKey='RequestStatus'>
								    <RelatedProperty PropertyKey='RequestStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='RequestedDate' ColumnHeader='Due Date' Format='M/d/yyyy' Width='10%' >
							<Sortable>
								<Argument PropertyKey='RequestedDate'>
									<RelatedProperty PropertyKey='LscPayment' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LscPayment.ReceivedDate' ColumnHeader='Received' Format='M/d/yyyy' Width='10%' >
							<Sortable>
								<Argument PropertyKey='ReceivedDate'>
									<RelatedProperty PropertyKey='LscPayment' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LscPayment.AnalyzedDate' ColumnHeader='Analyzed' Format='M/d/yyyy' Width='10%' >
							<Sortable>
								<Argument PropertyKey='AnalyzedDate'>
									<RelatedProperty PropertyKey='LscPayment' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LscPayment.SubmittedDate' ColumnHeader='Completed' Format='M/d/yyyy' Width='10%' >
							<Sortable>
								<Argument PropertyKey='SubmittedDate'>
									<RelatedProperty PropertyKey='LscPayment' />
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='LscPayment.ComptrollerRequestDate' ColumnHeader='Approved' Format='M/d/yyyy' Width='10%' >
							<Sortable>
								<Argument PropertyKey='ComptrollerRequestDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PaymentAmount' ColumnHeader='Payment Amount'    Format='c'  Width='10%'>
							<Sortable>
								<Argument PropertyKey='PaymentAmount'/>								   
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='PaymentDate' ColumnHeader='Payment Date' Format='M/d/yyyy' Width='10%' >
							<Sortable>
								<Argument PropertyKey='PaymentDate'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CheckPaymentNumber' ColumnHeader='Check Number' Width='10%' >
							<Sortable>
								<Argument PropertyKey='CheckPaymentNumber'/>
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
		
		<DataObject Key='LscPaymentTotal' DataObjectDefinitionKey='LscPaymentTotal'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RequestTotal' Format='$#,0'>
					<Control ID='spnReqTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentTotal' Format='$#,0'>
					<Control ID='spnPayTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
<!-- End Embedded XML -->
</span>
	
