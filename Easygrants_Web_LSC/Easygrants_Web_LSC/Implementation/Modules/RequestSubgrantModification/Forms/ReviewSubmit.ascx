<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantModification/PageSection/SubgrantInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>Instructions</div>
<br />

<p>The <strong>Validation Summary</strong> section below displays the status of your submission, indicating whether each section is validated (complete). 
<b>PLEASE NOTE</b>: Some areas in the Validation Summary may be checked as complete even though you may need or wish to provide additional information. In particular, pages for which information is not required will be checked as complete whether or not information is submitted. If you wish to provide such information in your request, check to ensure that you have done so before you submit the request.  </p>

<p>To make changes to the application before submitting, click the name of the form you want to change under <b>Page Name</b> below.</p> 

<p>If all the validation rules have been met, you will see a <b>Submit</b> button below. Once your application is complete, click the <strong>Submit</strong> button to submit the application.
You will receive a confirmation email that your application was received. Please save this confirmation email. </p>

<p>To return to your full list of subgrant approval requests, click on "Home" in the left navigation bar.</p>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />
<br />
<div class='SeparatorHdg' width='100%'>Validation Summary</div>
<br />
<Core:cValidate id='ctlValidate' DisplayFormat='Detail' 
	runat='server'/>

  
  
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
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
		</DataObject>

    </ModuleSection>
  </span>