<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='/Easygrants_Web_LSC/Core/Controls/Base/ReportOutputLink.ascx' %>
<div style="width:800px">
	<br />
	<div class='SeparatorHdg'>Review and Submit</div>
	<EasyGrants:cReportOutputLink id='ctlReviewPDF' runat='server'/>
	<br />
	<span runat='server' id='spnReturn'/>
	<br /><br />
	<Core:cUserCtlLoader 
		ID="CUserCtlLoader3" 
		CtlID='ctlSubmissionButton' 
		Src='Easygrants/Controls/Base/Submission_Button.ascx' 
		Properties='ForceGen=False' 
		runat='server' />
	<br />
	<div class='SeparatorHdg' width='100%'>Validation Summary</div>
	<br />
	<Core:cValidate id='ctlValidate' DisplayFormat='Detail' 
		runat='server'/>
	<br />

<div style="width:800px">

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
     <DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
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
								<Argument Value='ProBonoReviewPresident' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
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
