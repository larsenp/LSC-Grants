<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div style="width:100%" class="SeparatorHdg">
	Instructions
</div>
<span runat='server' id='spnPageContent'/>
<br /><br />
<span runat='server' id='spnReturn' />
<br /><br />
<div style="width:100%" class='SeparatorHdg'>Proposed Payment Schedule</div>
<br />
<b>Approved Grant Amount: </b><span runat='server' id='spnAwardAmount' /><br />
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
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>
  

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='WfTAPresidentReview' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='51'/>
			</Filters>
		</DataObject>
		
		<%--<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTAPresidentReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RecommendedFundingAmount' Format='$#,0'>
					<Control ID='spnGrantAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>--%>
		
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTAPresidentReview' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AwardAmount' Format='$#,0'>
					<Control ID='spnAwardAmount'
						Type='HtmlGenericControl' />
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

		<DataObject Key='Payment1' DataObjectDefinitionKey='LscTigProposedPaymentSchedule' Updatable='True' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='PaymentNumber' Value='1' />
			</Filters>
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
					<Control ID='lnkReturn'
						Type='cLink'
						Container='spnReturn'
						Caption='Return to Review Assignment List'>
						<Action PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff' />
								<Argument Value='ModuleConfig' />
								<Argument Value='TIGAppReview_PaymentScheduleRevision' />
							</Parameters>
						</Action>	
					</Control>
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
				<Argument PropertyKey='PaymentNumber' Value='1' Operator='GreaterThan' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlAdditionalPayments'
						Type='cDataPresenterList'
						Container='spnAdditionalPayments'
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/TIG_RevisePaymentSchedule/Forms/ProposedPaymentScheduleItem.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>