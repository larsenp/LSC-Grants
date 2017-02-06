<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.TIG_Application.Forms.cProposedPaymentSchedule" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
<div runat='server' id='divNoGrantTerm'>
	<p>
		The Payment Schedule form is not yet available. Before completing the payment schedule, you 
		must first specify the grant term on the <span runat='server' id='spnApplication'/> form.
	</p>
</div>
<div runat='server' id='divGrantTerm'>
	<p>The dates and number of payments below are generated based on the Term of the grant selected on the Application page. Please provide a proposed payment amount for each period. The initial payment must not exceed 40% of the grant total. The total of the final two payments must be for at least 20% of the grant request, up to a maximum of $50,000. Apportion the balance of the monies requested among the interim payments.  </p>
    <p>Please note that you must save your payment amounts before proceeding to input your payment milestones.</p>
    <p>Beginning with Payment Period #2 below, add discrete milestones that will be completed by the end of this payment period. Repeat this for Payment #3 and any subsequent payment periods. The milestones should reflect the <i>major activities and deliverables</i> identified d in the draft evaluation plan that would need to be completed to achieve the project&rsquo;s goals and objectives. Please be sure to input each deliverable as a separate milestone in the online system. This is done using the <strong>“Add Milestone”</strong> button.<strong> DO NOT add more than one milestone in each milestone input box. </strong>For more information on payment schedules, go to <a target="_blank" href=' http://tinyurl.com/TIGProcess2016'> http://tinyurl.com/TIGProcess2016.</a></p>
    <p>Note that there are two fixed Payment Periods added to the project term: a penultimate Payment Period of six (6) months for evaluation and submitting a draft final report; and the Final Payment Period of three (3) months to submit the final budget and the approved final report.</p>
<div style="width:100%" class='SeparatorHdg'>Proposed Payment Schedule</div>
	<br />
	<b>Grant Request Amount: </b><span runat='server' id='spnGrantRequest' /><br />
	<b>Proposed Payment Schedule Total: </b><span runat='server' id='spnPaymentTotal' /><br /><br />
	<div style="width:100%" class='MinorSeparatorHdg'>Initial Payment</div>
	<br />
	<table border='0' cellpadding='1'>
		<tr>
			<td style="width:20px; text-align:right">
				#1
			</td>
			<td style="width:150px; text-align:right">
				<b>Payment Date</b> <span runat='server' id='spnPaymentDate1' /><br />
			</td>
			<td style="width:230px; text-align:center">
				<b>Payment Amount</b><font color='red'>*</font> <span runat='server' id='spnPaymentAmount1' /><br />
			</td>
		</tr>
	</table>
	
	
	<br />
	<div style="width:100%" class='MinorSeparatorHdg'>Additional Payments</div>
	<br />
	<span runat='server' id='spnAdditionalPayments' />
	<div style="width:100%" class='MinorSeparatorHdg'>Final Payments</div>
	<br />
	<table border='0' cellpadding='1'>
	<tr>
		<td style="width:20px; text-align:right">
			#<span runat='server' id='spnPaymentNumberL1' />
		</td>
		<td style="width:150px; text-align:right">
			<b>Payment Date</b> <span runat=server id='spnPaymentDateL1' />
		</td>
		<td style="width:230px; text-align:center">
			<b>Payment Amount</b><font color='red'>*</font> <span runat=server id='spnPaymentAmountL1' />
		</td>
		<%--<td style="width:100px"><span runat='server' id='spnDelete' /></td>--%>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="vertical-align:text-top" colspan='4'>
			<b>Milestones</b><br /><br />
			<span runat='server' id='spnMilestonesL1' />
		</td>
	</tr>
</table>
<hr style="width:100%; height:1px; color: Gray" />
<table border='0' cellpadding='1'>
	<tr>
		<td style="width:20px; text-align:right">
			#<span runat='server' id='spnPaymentNumberL2' />
		</td>
		<td style="width:150px; text-align:right">
			<b>Payment Date</b> <span runat=server id='spnPaymentDateL2' />
		</td>
		<td style="width:230px; text-align:center">
			<b>Payment Amount</b><font color='red'>*</font> <span runat=server id='spnPaymentAmountL2' />
		</td>
		<%--<td style="width:100px"><span runat='server' id='spnDelete' /></td>--%>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="vertical-align:text-top" colspan='4'>
			<b>Milestones</b><br /><br />
			<span runat='server' id='spnMilestonesL2' />
		</td>
	</tr>
</table>
<hr style="width:100%; height:1px; color: Gray" />

	<div width='100%' style="text-align:center" >
		<span runat='server' id='spnSave' />
		<span runat='server' id='spnContinue' />
	</div>
</div>  

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantRequest' Format='$#,0'>
					<Control ID='spnGrantRequest'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkApplication'
						Type='cLink'
						Container='spnApplication'
						Caption='Application'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Application'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigProposedPaymentScheduleTotal' DataObjectDefinitionKey='LscTigProposedPaymentScheduleTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaymentTotal' Format='$#,0'>
					<Control ID='spnPaymentTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<!--Note: the following DataObject element retrieves all proposed payment schedule items for this task assignment because the count
		is used in retrieving the last payment below. However, it is configured to display and collect information only for the first payment. -->
		<DataObject Key='Payment1' DataObjectDefinitionKey='LscTigProposedPaymentSchedule' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='PaymentNumber'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaymentDate' Format='M/d/yyyy'>
					<Control ID='spnPaymentDate1' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentAmount'>
					<Control ID='txtPaymentAmount1'
						Type='cMoneyTextBox'
						Container='spnPaymentAmount1'
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
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='AdditionalPayments' DataObjectDefinitionKey='LscTigProposedPaymentSchedule' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='PaymentGroup' Value='2' >
					<RelatedProperty PropertyKey="LscTigProposedPaymentScheduleGroups"/>
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlAdditionalPayments'
						Type='cDataPresenterList'
						Container='spnAdditionalPayments'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/TIG_Application/Forms/ProposedPaymentScheduleItem.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LastPayment1' DataObjectDefinitionKey='LscTigProposedPaymentSchedule' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='PaymentGroup' Value='3' >
					<RelatedProperty PropertyKey="LscTigProposedPaymentScheduleGroups"/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='PaymentNumber' />
				<Argument PropertyKey='LscTigProposedPaymentScheduleID' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaymentNumber'>
					<Control ID='spnPaymentNumberL1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentDate' Format='M/d/yyyy'>
					<Control ID='spnPaymentDateL1'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentAmount'>
					<Control ID='txtPaymentAmountL1'
						Type='cMoneyTextBox'
						Container='spnPaymentAmountL1'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Payment Amount must be a whole number.'
						RegExErrorMessage='Payment Amount must be a whole number.'
						MaxLength='10'
						Size='6' 
						MinimumValue='1'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscMilestoneL1' DataObjectDefinitionKey='LscMilestone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LastPayment1' DataObjectPropertyKey='LscTigProposedPaymentScheduleID' PropertyKey='LscTigProposedPaymentScheduleID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='MilestoneNumber' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlMilestonesL1'
						Type='cDataListCtl'
						Container='spnMilestonesL1'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='MilestoneNumber'/>
						<DisplayProperty PropertyKey='Milestone'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LastPayment2' DataObjectDefinitionKey='LscTigProposedPaymentSchedule' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='PaymentGroup' Value='3' >
					<RelatedProperty PropertyKey="LscTigProposedPaymentScheduleGroups"/>
				</Argument>
			</Filters>
			<Sort>
				<Argument PropertyKey='PaymentNumber' Direction='Descending'/>
				<Argument PropertyKey='LscTigProposedPaymentScheduleID' Direction='Descending' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaymentNumber'>
					<Control ID='spnPaymentNumberL2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentDate' Format='M/d/yyyy'>
					<Control ID='spnPaymentDateL2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentAmount'>
					<Control ID='txtPaymentAmountL2'
						Type='cMoneyTextBox'
						Container='spnPaymentAmountL2'
						AllowInputCommas='True'
						Format='#,0'
						MaxInputDecimalPlaces='0'
						DecimalErrorMessage='Payment Amount must be a whole number.'
						RegExErrorMessage='Payment Amount must be a whole number.'
						MaxLength='10'
						Size='6' 
						MinimumValue='1'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscMilestoneL2' DataObjectDefinitionKey='LscMilestone' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LastPayment2' DataObjectPropertyKey='LscTigProposedPaymentScheduleID' PropertyKey='LscTigProposedPaymentScheduleID'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='MilestoneNumber' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlMilestonesL2'
						Type='cDataListCtl'
						Container='spnMilestonesL2'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='MilestoneNumber'/>
						<DisplayProperty PropertyKey='Milestone'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>



	</ModuleSection>
</span>