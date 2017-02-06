<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div class="SeparatorHdg">TIG Revise Payment Schedule Post-Submission</div>
<p>You have submitted your revisions to the Payment and Reporting Schedule for this grant. The 
information you submitted is detailed below. You can also access the submitted information
by clicking the <b>View PDF</b> button below.</p> 
<span runat='server' id='spnReturn' />
<br /><br />
<div style="width:100%" class='SeparatorHdg'>Proposed Payment Schedule</div>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
<br />
<b>Approved Grant Amount: </b><span runat='server' id='spnGrantAmount' /><br />
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
	<span runat='server' id='spnHome' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View PDF~'>
						<Parameters>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
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
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WfTAPresidentReview' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='51'/>
			</Filters>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTAPresidentReview' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RecommendedFundingAmount' Format='$#,0'>
					<Control ID='spnGrantAmount'
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
				<DisplayProperty PropertyKey='PaymentAmount' Format='$#,0'>
					<Control ID='spnPaymentAmount1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHome'
						Type='cButton'
						Container='spnHome'
						Caption='Return to Home Page'>
						<Action
							PostBack='True'
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Staff'/>
								<Argument Value='ModuleConfig'/>
								<Argument Value='Home'/>
							</Parameters>								
						</Action>
					</Control>
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
						DataPresenterURL='Implementation/Modules/TIG_RevisePaymentSchedule/Forms/ProposedPaymentScheduleItemPostSubmission.ascx'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
