<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='/Easygrants_Web_LSC/Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<div style="width:800px">
	<Core:cUserCtlLoader CtlID='ctlApplicationInfo' 
				Src='Implementation/Modules/PBIF_Eligibility_Review/PageSection/ApplicationInfo.ascx'
				runat='server'/>
	<br />
	<div class='SeparatorHdg'>Review Submitted</div>
	<br />
	<p>Your review has been submitted with an outcome of <b><span runat='server' id='spnOutcome'/></b></p>
	<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
	<br />
	<span runat='server' id='spnReturn' />
	<br />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   <DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTaskOutcome.WfTaskOutcome'>
					<Control ID='spnOutcome'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Review PDF~'>
						<Parameters>
						<%--	<Argument Type='DataObjectCollection'
								TypeKey='WfTaskAssignment'
								DataObjectPropertyKey='GranteeProjectID'
								PropertyKey='EntityID'
								Value=''/>--%>
							<Argument Type='ModuleUser'
								TypeKey='GranteeProjectID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='WfTaskAssignment'
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
								<Argument Value='ProBonoReviewEligibility' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>