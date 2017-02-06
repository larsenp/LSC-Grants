<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>Post-Submission Page</div>
<br />
<p>Thank you for submitting your subgrant approval request. Because you have submitted, you no longer have access to update the information provided.</p> 

<p>Click <strong>View PDF</strong> to view a PDF of your subgrant approval request.</p>

<p>Click <b>Home</b> in the left navigation bar to return to your LSC Grants home page.</p>

<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/></p>

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
		</DisplayProperties>
	</DataObject>

 </ModuleSection>
</span>