<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %><Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' style="width:100%" >
	Review Submitted
</div>
<table width='100%' cellpadding='2' cellspacing='0'>
   <tr>
		<td>
			Thank you for submitting your review. Because your review has been completed and submitted, the data entry pages 
			are no longer available to you. If you have any questions, please contact us using the support information at the bottom of the page.  
			<br></br>
			To view the application, <b>click View Application PDF</b>.
			
		</td>
	</tr>
</table>
<br />
<div class='SeparatorHdg'>Application</div>	
<table cellpadding='1' width='600px'>
	<tr>
		<td>
			<b>Applicant</b>&nbsp;
			<span runat='server' id='spnApplicant' /> (<span runat='server' id='spnRNO' />)
		</td>
		<td>
			<b>TIG</b>&nbsp;
			<span runat='server' id='spnTIG' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Category</b>&nbsp;
			<span runat='server' id='spnTigGrantType' />
		</td>
		<td>
			<b>Grant Term</b>&nbsp;
			<span runat='server' id='spnGrantTermMonths' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Total Grant Request</b>&nbsp;
			<span runat='server' id='spnGrantRequest' />
		</td>
		<td>
			<b>Total Project Budget</b>&nbsp;
			<span runat='server' id='spnProjectBudget' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<b>Brief Description of Proposed Project</b><br />
			<span runat='server' id='spnBriefDescription' />
		</td>
	</tr>
</table>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
<br />
<span runat='server' id='spnReturn' />
<br />
<br />
<div class='SeparatorHdg'>Your Recommendations</div>
<br />
<table cellpadding='1'>
	<tr>
		<td>
			<b>Funding Recommendation:</b>
		</td>
		<td>
			<span runat='server' id='spnLscTigFundingRecommendationID' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Recommended Funding Amount:</b> 
		</td>
		<td>
			<span runat='server' id='spnRecommendedFundingAmount' />
		</td>
	</tr>
</table>
 <br />

<b>Overall Comments:</b><br />
<span runat='server' id='spnOverallComment' />
<br /><br />


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	   
	    <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='41' />
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
				<DisplayProperty PropertyKey='GrantTermMonths'>
					<Control ID='spnGrantTermMonths'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectBudget' Format='$#,0'>
					<Control ID='spnProjectBudget'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='BriefDescription'>
					<Control ID='spnBriefDescription'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Application PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='AppWfTA'
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
								<Argument Value='TIGAppReview_O_R_WI_VP' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscGranteeProjectTig' DataObjectDefinitionKey='LscGranteeProjectTig' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscTigGrantType.Description'>
					<Control ID='spnTigGrantType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.OrganizationName'>
					<Control ID='spnApplicant'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnRNO'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
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
				<DisplayProperty PropertyKey='LscTigFundingRecommendationID'>
					<Control ID='spnLscTigFundingRecommendationID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OverallComment'>
					<Control ID='spnOverallComment'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RecommendedFundingAmount' Format='$#,0'>
					<Control ID='spnRecommendedFundingAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>  
		
	</ModuleSection>
</span>