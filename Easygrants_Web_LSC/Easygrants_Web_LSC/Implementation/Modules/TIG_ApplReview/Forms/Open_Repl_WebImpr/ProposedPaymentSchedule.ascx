<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_ApplReview/Forms/ReviewInfo.ascx'
	runat='server'/>
	
<div class='SeparatorHdg'>Proposed Payment Schedule</div>
<br />
<b>Grant Request Amount: </b><span runat='server' id='spnGrantRequest' /><br />
<b>Proposed Payment Schedule Total: </b><span runat='server' id='spnPaymentTotal' /><br /><br />
<span runat='server' id='spnLscTigProposedPaymentSchedule' />
<br /><br />
<div class='MinorSeparatorHdg'>Comments from Other Reviewers</div>
<br />
<span runat='server' id='spnProposedPaymentScheduleCommentOther' />
<br />
<div class='MinorSeparatorHdg'>Your Comments</div>
<br />
<span runat='server' id='spnProposedPaymentScheduleComment' />
<br /><br />
<div width='100%' style="text-align:center" >
	<span runat='server' id='spnSave' />
	<span runat='server' id='spnContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
				<Argument PropertyKey='WfTaskStatusID' Value='2' />
			</Filters>
		</DataObject>

		<DataObject Key='LscTigApp' DataObjectDefinitionKey='LscTigApp' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantRequest' Format='$#,0'>
					<Control ID='spnGrantRequest'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigProposedPaymentScheduleTotal' DataObjectDefinitionKey='LscTigProposedPaymentScheduleTotal' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaymentTotal' Format='$#,0'>
					<Control ID='spnPaymentTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigProposedPaymentSchedule' DataObjectDefinitionKey='LscTigProposedPaymentSchedule' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='PaymentNumber' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlLscTigProposedPaymentSchedule'
						Type='cDataListCtl'
						Container='spnLscTigProposedPaymentSchedule'>
						<DisplayProperty PropertyKey='PaymentNumber' ColumnHeader='#' />
						<DisplayProperty PropertyKey='PaymentDate' ColumnHeader='Payment Date' Format='M/d/yyyy'/>
						<DisplayProperty PropertyKey='PaymentAmount' ColumnHeader='Payment Amount' Format='$#,0'/>
						<DisplayProperty PropertyKey='LscPpsMilestones.MilestonesText' ColumnHeader='Milestones' >
							<Control ID='lblMilestones'
								Type='cLabel' />
						</DisplayProperty>
						<DisplayProperty PropertyKey='ApplicantComment' ColumnHeader='Applicant Comment'>
							<Control ID='lblApplicantComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscTigReviewOpenRepWebImprOther' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' >
					<RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Operator='NotEqual'/>
				<Argument Type='Data' PropertyKey='WfTaskID' Value='43' >
				   <RelatedProperty PropertyKey='WfTaskAssignment' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlProposedPaymentScheduleCommentOther'
						Type='cDataListCtl'
						Container='spnProposedPaymentScheduleCommentOther'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='WfTaskAssignment.Person.FirstNameLastName' ColumnHeader='Reviewer' />
						<DisplayProperty PropertyKey='ProposedPaymentScheduleComment' ColumnHeader='Comment' >
							<Control ID='lblProposedPaymentScheduleComment'
								Type='cLabel' />
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscTigReviewOpenRepWebImpr' DataObjectDefinitionKey='LscTigReviewOpenRepWebImpr' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProposedPaymentScheduleComment'>
					<Control ID='txtProposedPaymentScheduleComment'
						Type='cTextArea'
						Container='spnProposedPaymentScheduleComment'
						Rows='5'
						Cols='80' />
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
