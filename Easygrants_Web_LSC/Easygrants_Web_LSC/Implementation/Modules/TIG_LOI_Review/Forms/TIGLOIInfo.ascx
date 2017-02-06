<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='/Easygrants_Web_LSC/Core/Controls/Base/ReportOutputLink.ascx' %>

<div class='SeparatorHdg' width='100%'>
	Review Information
</div>
<br />
<table width='100%' cellpadding='1' cellspacing='0'>
	<tr>
		<td>
			<b>TIG</b> <span runat='server' id='spnTIG' />
		</td>
		<td>
			<b>Recipient ID</b> <span runat='server' id='spnRecipientID' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Request Type</b> <span runat='server' id='spnLscTigGrantType' />
		</td>
		<td>
			<b>Requested Amount</b> <span runat='server' id='spnRequestedAmount' />
		</td>
	</tr>
</table>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/>
<table width='100%' cellpadding='1' cellspacing='0'>
	<tr>
		<td>
			<b>Are you also requesting funding for this project through LSC’s Pro Bono Innovation Fund program?</b> <span runat='server' id='spnParallelPBIF' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Are you applying for a Pro Bono Innovation Fund that complements this grant?</b> <span runat='server' id='spnApplyForPBIF' />
		</td>
	</tr>
</table>
<br />
<span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='ReviewWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProject.LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID'>
					<Control ID='spnRecipientID'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.LscGranteeProjectTig.LscTigGrantType.Description'>
					<Control ID='spnLscTigGrantType'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LSCTIGLOIReadOnly' DataObjectDefinitionKey='LSCTIGLOIReadOnly' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RequestedAmount' Format='$0,#'>
					<Control ID='spnRequestedAmount'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ParallelPBIF' Format='YesNo'>
					<Control ID='spnParallelPBIF'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ApplyForPBIF' Format='YesNo'>
					<Control ID='spnApplyForPBIF'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LOIWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument Group='(' Bool='And'/>
					<Argument PropertyKey='WfTaskID' Value='31' Bool=''/>
					<Argument PropertyKey='WfTaskID' Value='32' Bool='Or'/>
					<Argument PropertyKey='WfTaskID' Value='36' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View LOI PDF~'>
						<Parameters>
							<Argument Type='DataObjectCollection'
								TypeKey='LOIWfTA'
								DataObjectPropertyKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='LOIWfTA'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
