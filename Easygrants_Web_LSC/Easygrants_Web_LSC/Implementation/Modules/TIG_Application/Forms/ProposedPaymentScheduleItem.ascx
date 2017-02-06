<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<table border='0' cellpadding='1'>
	<tr>
		<td style="width:20px; text-align:right">
			#<span runat='server' id='spnPaymentNumber' />
		</td>
		<td style="width:150px; text-align:right">
			<b>Payment Date</b> <span runat=server id='spnPaymentDate' />
		</td>
		<td style="width:230px; text-align:center">
			<b>Payment Amount</b><font color='red'>*</font> <span runat=server id='spnPaymentAmount' />
		</td>
		<%--<td style="width:100px"><span runat='server' id='spnDelete' /></td>--%>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="vertical-align:text-top" colspan='4'>
			<b>Milestones</b><br /><br />
			<span runat='server' id='spnAdd'/><br /><br />
			<span runat='server' id='spnMilestones' />
		</td>
	</tr>
</table>
<hr style="width:100%; height:1px; color: Gray" />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='AdditionalPayments' DataObjectDefinitionKey='LscTigProposedPaymentSchedule' Key='AdditionalPayments' Updatable='True'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaymentNumber'>
					<Control ID='spnPaymentNumber'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentDate' Format='M/d/yyyy'>
					<Control ID='spnPaymentDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentAmount'>
					<Control ID='txtPaymentAmount'
						Type='cMoneyTextBox'
						Container='spnPaymentAmount'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Payment Amount must be a whole number.'
						RegExErrorMessage='Payment Amount must be a whole number.'
						MaxLength='10'
						Size='6' 
						MinimumValue='1'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add Milestone'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='MilestoneEditor'/>
								<Argument Value='LscMilestoneID=0'/>
								<Argument Type='DataObjectCollection' TypeKey='AdditionalPayments' DataObjectPropertyKey='LscTigProposedPaymentScheduleID' BaseValue='LscTigProposedPaymentScheduleID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Type='cButton'
						Container='spnDelete'
						Caption='Delete this Payment'
						Confirmation='Are you sure you want to delete this payment?'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_Delete'>
							<Parameters>
								<Argument Value='AdditionalPayments' />
								<Argument Type='DataObjectCollection' TypeKey='AdditionalPayments' DataObjectPropertyKey='LscTigProposedPaymentScheduleID' PropertyKey='LscTigProposedPaymentScheduleID' />
								<RelatedDataObjects>
									<RelatedDataObject DataObjectDefinitionKey='LscMilestone'>
										<RelationshipProperties>
											<RelationshipProperty parentProperty='LscTigProposedPaymentScheduleID' childProperty='LscTigProposedPaymentScheduleID' />
										</RelationshipProperties>
									</RelatedDataObject>
								</RelatedDataObjects>
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>--%>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscMilestone' DataObjectDefinitionKey='LscMilestone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AdditionalPayments' DataObjectPropertyKey='LscTigProposedPaymentScheduleID' PropertyKey='LscTigProposedPaymentScheduleID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='MilestoneNumber' />
			</Sort>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='AdditionalPayments' DataObjectPropertyKey='LscTigProposedPaymentScheduleID' PropertyKey='LscTigProposedPaymentScheduleID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlMilestones'
						Type='cDataListCtl'
						Container='spnMilestones'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Caption='Edit'>
								<Action PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='MilestoneEditor' />
										<Argument Type='DataObject' TypeKey='LscMilestoneID' AttributeName='LscMilestoneID' BaseValue='LscMilestoneID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='MilestoneNumber'/>
						<DisplayProperty PropertyKey='Milestone'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>