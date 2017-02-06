<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />

<div class='SeparatorHdg' width='100%'>Instructions</div>
<br />
<p>The <strong>Validation Summary</strong> below displays the status of your submission, indicating whether each section is validated (complete).</p>

<p>If all the validation rules have been met, you will see a <b>Submit</b> button below.</p>

<p>Once your grant award package is uploaded, click the <strong>Submit</strong> button to submit the documents. You will receive a confirmation email acknowledging that you have submitted your grant acceptance. Please save this confirmation email and a copy of your grant award acceptance for your records. If you do not receive a confirmation email, contact us at <a href='mailto:probonoinnovation@lsc.gov'>probonoinnovation@lsc.gov</a></p>

<p><strong>PLEASE NOTE</strong>: Some areas in the Validation Summary may be checked as complete even though you may need to provide additional information. Please check to make sure all the necessary files have been uploaded before you submit your grant award package. </p>

<p>To make changes to the document before submitting, click the name of the form you want to change under <b>Page Name</b> below.</p> 


<p>To return to your full list of grant applications please click on <strong>Home</strong> in the left navigation bar.</p>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />
<br />
<div class='SeparatorHdg' width='100%'>Validation Summary</div>
<br />
<Core:cValidate id='ctlValidate' DisplayFormat='Detail' 
	runat='server'/>

  
  
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
    </ModuleSection>
  </span>