<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Main Page
</div>	
<p><b>This is the main page for the reviewer’s evaluation submission.  Review its entire contents before beginning the renewal 
application evaluation.  It lists the documents to be reviewed in the grant renewal evaluation process and the technical 
requirements for completing and submitting the grant renewal evaluation. </b> </p>

<p><i>Grant Renewal Documents Reviewed</i></p>

<p>The documents listed below are included in the grant renewal files as applicable.   
They are identified in the “Grant Renewal Reader Guide” and reviewed as part of the grant renewal evaluation.</p>

<p>  1.  Grant Renewal narrative </p>
<p>  2.  Revenue, Expense, CSR, Board, Staffing, PAI, and Technology data</p>
<p>  3.  Program Profile </p>
<p>  4.  Other Services Report</p>
<p>  5.  Final OCE CMS/CSR Reports <u>if any</u></p>
<p>  6.  Special grant conditions or letters of concern, <u>if any</u></p>
<p>  7.  OPP program quality visit reports (2009, 2010), <u>if any</u></p>

<p><i>Technical Requirements for Completing and Submitting the Grant Application Evaluation:</i></p>

<p>The Status section (below) indicates the status of each page in your submission. 
All required pages must be completed before the system will allow you to submit the evaluation. 
A red “X” will be displayed when an item is incomplete and a green checkmark will be displayed when an item is complete. 
Use the Review and Submit page (in the navigation list at left) to see which specific fields must be completed before the 
evaluation can be submitted. </p>

<p>Once all required pages are complete, submit the evaluation using the Review and Submit page.</p>

<p>Send an email to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a> if you have difficulties using the online application, or if you want to make changes to a grant evaluation after it has been submitted.  
Send an email to <a href="mailto:competition@lsc.gov">competition@lsc.gov</a> if you have questions about the evaluation process.</p>


<div width='100%' class='SeparatorHdg'>
	Validation Summary
</div>
<Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
