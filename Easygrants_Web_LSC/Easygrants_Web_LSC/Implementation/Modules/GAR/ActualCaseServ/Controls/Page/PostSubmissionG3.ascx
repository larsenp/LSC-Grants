<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-3: Actual Case Services (Staff)</h1></td>
  </tr>
</table>
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlGARSubmittedInstructions' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GARSubmittedInstructions.ascx'
	runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='btnViewPDF' 
				Src='Implementation/Modules/GAR/Controls/PageSection/SubmissionViewPDF.ascx'
				runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool='' />
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewPDF'
						Type='cUserCtlLoader'>
						<Visible>
							<Argument PropertyKey='ReportOutputDefinitionID' Value='' Operator='NotEqual'>
								<RelatedProperty PropertyKey="WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink"/>
							</Argument>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
