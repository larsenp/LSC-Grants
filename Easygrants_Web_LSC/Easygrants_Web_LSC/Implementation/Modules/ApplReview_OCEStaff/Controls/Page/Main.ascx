<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview_OCEStaff/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Main Page
</div>
<br />
<p>Send an email to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a> if you have difficulties using the online application, or if you want to make changes to a grant evaluation after it has been submitted.  
Send an email to <a href="mailto:competition@lsc.gov">competition@lsc.gov</a> if you have questions about the evaluation process.</p>

<div width='100%' class='SeparatorHdg'>
	Validation Summary
</div>
<Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
<br />
<br />


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	  <%-- <DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>
	
	    <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='ReviewWfTA' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='2' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Responses~'>
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
							<Argument Type='DataObjectCollection' TypeKey='ReportOutputDefinition' DataObjectPropertyKey='ReportOutputDefinitionID' PropertyKey='DefinitionID' Value=''/> 

						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'
						Enter='False'
						Caption='Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	--%>
		
	</ModuleSection>
</span>
