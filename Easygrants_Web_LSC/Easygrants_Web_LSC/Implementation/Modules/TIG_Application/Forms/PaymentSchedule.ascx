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
<br />
<div style="width:100%" class="SeparatorHdg">
	Payment Schedule
</div>
<br />
<span runat='server' id='spnContinuation'/>
<span runat='server' id='spnRenewal'/>
<p><b>Do you accept this payment schedule in its entirety?</b></p>
<span runat='server' id='spnPaymentScheduleAgree' /> I agree.
<div style="text-align:center">
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlContinuation'
						Type='cLink'
						Caption='View Payment Schedule'
						Container='spnContinuation'>
						<Action PostBack='False'
							URL='/Easygrants_Web_LSC/Implementation/Modules/TIG_Application/PDFs/2010ContinuationWebsitePaymentSchedule.pdf'
							Target='_blank'/>
						<Visible>
							<Argument PropertyKey='TigGrantTypeID' Value='2' >
								<RelatedProperty PropertyKey='WfTaskAssignment.GranteeProject.LscGranteeProjectTig' />
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlRenewal'
						Type='cLink'
						Caption='View Payment Schedule'
						Container='spnRenewal'>
						<Action PostBack='False'
							URL='/Easygrants_Web_LSC/Implementation/Modules/TIG_Application/PDFs/2010RenewalWebsitePaymentSchedule.pdf'
							Target='_blank'/>
						<Visible>
							<Argument PropertyKey='TigGrantTypeID' Value='17' >
								<RelatedProperty PropertyKey='WfTaskAssignment.GranteeProject.LscGranteeProjectTig' />
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentScheduleAgree'>
					<Control ID='ctlPaymentScheduleAgree'
						Type='cCheckBox'
						Container='spnPaymentScheduleAgree' />
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
	</ModuleSection>
</span>
