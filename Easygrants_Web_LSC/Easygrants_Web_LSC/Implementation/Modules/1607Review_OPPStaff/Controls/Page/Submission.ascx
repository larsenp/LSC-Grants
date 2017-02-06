<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<div style="width:600px">
	<div class='SeparatorHdg' width='100%'>
		Instructions
	</div>
	TBD<br/>
	<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/><br/>

	<Core:cUserCtlLoader CtlID='ctlAppInfo'
		Src='Implementation/Modules/1607Review_OPPStaff/Controls/PageSection/1607Information.ascx'
		runat='server'/>
	<div class='SeparatorHdg' width='100%'>Validation Summary</div>
	<br />
	<Core:cValidate id='ctlValidate' DisplayFormat='Detail' 
		runat='server'/>
	<br />
	
	<br />
	<div class='SeparatorHdg'>Submit</div>
	<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader3" 
		CtlID='ctlSubmissionButton' 
		Src='Easygrants/Controls/Base/Submission_Button.ascx' 
		Properties='ForceGen=False' 
		runat='server' />
	<br />
	<br />
	<br />
	<br />
	<span runat='server' id='spnReturn' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View&nbsp;Review&nbsp;PDF~'>
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
