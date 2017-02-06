<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<div style="width:600px">
  <div class='SeparatorHdg'>Review Submitted</div>
	<p>Thank you for submitting your review.</p>
	<ul>
		<li>To return to your home page, click the <b>Home</b> link in the left-hand navigation.</li>
		<li>To leave LSC Grants, use the <b>Log Out</b> link in the left-hand navigation.</li>
		<li>To view the data you submitted in PDF format, click the <b>View Review PDF</b> button.</li>
		<li>To view the data from the 1607 compliance report you reviewed, click the <b>View 1607 Report PDF</b> button.
	</ul>
	<Core:cUserCtlLoader CtlID='ctlAppInfo'
		Src='Implementation/Modules/1607Review_OPPStaff/Controls/PageSection/1607Information.ascx'
		runat='server'/>
  <div class='SeparatorHdg'>Review Information</div>
		<EasyGrants:cReportOutputLink id='ctlReviewReportLink' runat='server'/><br>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewReportLink'
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
