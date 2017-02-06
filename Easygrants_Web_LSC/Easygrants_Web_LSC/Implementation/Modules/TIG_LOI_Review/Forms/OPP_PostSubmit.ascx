<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='/Easygrants_Web_LSC/Core/Controls/Base/ReportOutputLink.ascx' %>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlReviewInfo' 
	Src='Implementation/Modules/TIG_LOI_Review/Forms/TIGLOIInfo.ascx'
	runat='server'/>
<div class='SeparatorHdg'>Review Submitted</div>
<br />
<span runat='server' id='spnReturn'/>
<br />
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Review PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='WfTaskAssignment'
								DataObjectPropertyKey='WfTaskAssignmentID'
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
								<Argument Value='TIGLOIReview_O_R_WI_OPP' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>