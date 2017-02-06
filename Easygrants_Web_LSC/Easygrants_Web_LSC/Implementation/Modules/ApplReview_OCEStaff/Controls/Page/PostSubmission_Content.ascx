<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>


<br />
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class='SeparatorHdg'>Review Submitted</td>
  </tr>
  <tr>
    <td>
		<p>Thank you for submitting your competitive application review.</p>
		<ul>
			<li>To return to your home page, click the <b>Home</b> link in the left-hand navigation.</li>
			<li>To leave LSC Grants, use the <b>Log Out</b> link in the left-hand navigation.</li>
			<li>To view the data you submitted in PDF format, click the <b>View Review PDF</b> button.</li>
		</ul>
	</td>
  </tr>
  <tr>
  	<td>
		<EasyGrants:cReportOutputLink id='ctlReviewReportLink' runat='server'/>
	</td>
  </tr>
</table>



<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlReviewReportLink'
						Type='cReportOutputLink'
						DisplayText='~View Review PDF~'>
						<Parameters>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='WfTaskAssignment'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
		   </DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>



