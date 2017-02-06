<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/TIG_Application/Forms/ApplicationInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' style="width:100%" >
	Grant Agreement Submitted
</div>
<p>
	Thank you for submitting your executed grant agreement.
</p>
<ul>
	<li>To return to your home page, click the Home link in the left-hand navigation.</li>
	<li>To leave LSC Grants, use the Log Out  link in the left-hand navigation.</li>
	<li>If you have submitted in error, or if you need to make a correction to your submission, contact Glenn Rawdon (grawdon@lsc.gov, 202-295-1552) or Jane Ribadeneyra (ribadeneyraj@lsc.gov, 202-295-1554)</li>
</ul>  
<b>Submission Date: </b>  <span runat='server' id='spnSubmittedDate'/>
<br />

  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubmittedDate' Format='MMMM dd, yyyy, h:mm tt'>
					<Control ID='spnSubmittedDate'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
    </ModuleSection>
  </span>