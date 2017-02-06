<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='/Easygrants_Web_LSC/Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<div style="width:800px">
	<Core:cUserCtlLoader CtlID='ctlApplicationInfo' 
				Src='Implementation/Modules/PBIF_LOIReview_President/PageSection/LOIInfo.ascx'
				runat='server'/>
	<br />
	<div class='SeparatorHdg'>Review Submitted</div>
	<br />
	<p>Thank you for submitting your review. A PDF of your submission is available below.</b></p>
	<EasyGrants:cReportOutputLink id='ctlReviewPDF' runat='server'/>
	<br />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
     <DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewPDF'
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