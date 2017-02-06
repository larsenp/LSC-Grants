<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<div class="SeparatorHdg">Review Grant Award Package</div>
<p>
Click the <b>View PDF</b> button below to view the grant award package for this grant.
</p>
<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/></p>

<div class="SeparatorHdg">Certify Grant Award Package</div>
<p>
Click the <b>Submit</b> button below to certify the following:
</p>

<p>
I certify that the grant award package for TIG grant #<span runat='server' id='spnTIG'/>, as viewed from this page, is correct.
</p>
<table>
	<tr>
		<td>
			Certified by
		</td>
		<td>
			<b><span runat='server' id='spnFirstNameLastName'/></b>
		</td>
	</tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader" 
		CtlID='ctlSubmissionButton' 
		Src='Easygrants/Controls/Base/Submission_Button.ascx' 
		Properties='ForceGen=False' 
		runat='server' />
<br />
<div runat='server' id='spnHome' style="text-align:center; width:100%"/>

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
				<DisplayProperty PropertyKey='Person.FirstNameLastName'>
					<Control ID='spnFirstNameLastName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProject.LegacyGrantID'>
					<Control ID='spnTIG'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnHome'
						Type='cButton'
						Container='spnHome'
						Caption='Return to Home Page'>
							<Action PostBack='True'
								Object='WebSession'
								Method='RedirectToModule'>
								<Parameters>
									<Argument Value='Staff' />
									<Argument Value='ModuleConfig' />
									<Argument Value='Home' />
								</Parameters>
							</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

    </ModuleSection>
  </span>