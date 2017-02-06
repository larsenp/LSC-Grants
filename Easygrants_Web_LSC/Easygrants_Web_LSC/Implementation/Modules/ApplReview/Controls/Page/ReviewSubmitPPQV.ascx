<%@ Control Language="vb" AutoEventWireup="true" Inherits="EasyGrants.Modules.Application.Controls.Page.cSubmissionContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<span id='spnInvalidText' runat='server' visible='false'>
	<br />
	<p><b>ATTENTION:</b> You may not submit at this time because your task is not complete.  Please see the Status section for details.</p>

</span>

<span id='spnSubmitText' runat='server' visible='false'>
	<p><b>You have met all the requirements of the task and can now submit.</b></p>

	<p>Once you submit, you will receive an e-mail confirmation.</p>
</span>

<Core:cUserCtlLoader CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False&Confirmation=Are you sure you want to submit this review?' runat='server' />

<%--<div width='100' class='SeparatorHdg'>
	Review Summary
</div>
<p>Click the <b>Review Summary</b> button for a single-page view of all the information provided for this review.</p>
<span runat='server' id='spnReviewSummary' /><br /><br />
--%>
<p>
Click the <b>View PDF</b> button below to view Staff Review of this grant.</p>
<p><EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/></p>
<br />
<br />
<div width='100' class='SeparatorHdg'>
	Submission Status
</div>
<Core:cValidate id='ctlValidate' DisplayFormat='Detail' 
			runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'/>
			</Filters>		
			<%--<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnReviewSummary'
						Type='cButton'
						Container='spnReviewSummary'
						Caption='Review Summary'>
							<Action PostBack='False'
								URL='/Easygrants_Web_LSC/Implementation/Modules/ApplReview/ModuleContent.aspx?Config=ApplReviewModuleConfig&amp;amp;Page=ReviewSummary&amp;amp;PageFrame=Print'
								Target='_blank'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>--%>
		</DataObject>
		
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool='' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Review PDF~'>
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
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
