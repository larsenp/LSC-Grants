<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-1: Interim Case Services (Staff)</h1></td>
  </tr>
</table>
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlGARSubmittedInstructions' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GARSubmittedInstructions.ascx'
	runat='server'/>

<%--<span runat='server' id='spnPrint' class='CSSButtonStyle' />--%>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
	 <DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''  bool='' />
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
		
		<%--<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnPrint'
						Type='cLink'
						Container='spnPrint'
						Caption='Printable View'>
						<Action PostBack='True' Object='EventController'
							Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
							<Parameters>			
								<Argument Type='' TypeKey='' Value='Page=PrintableView'/>
								<Argument Type='' TypeKey='' Value='PageFrame=Print'/>					
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>--%>
	</ModuleSection>
</span>
