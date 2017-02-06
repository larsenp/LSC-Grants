<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Main Page
</div>

<p>This is the main page for the reviewer’s evaluation submission. Review its entire contents before beginning the grant application evaluation.  
It lists the grant documents to be reviewed in the grant evaluation process and the technical requirements for completing and submitting the grant 
application evaluation.</p>

<p><i>Competitive Grant Documents to be Reviewed:</i></p>

<p>The documents listed below are included in the competitive grant application files as applicable. 
They are identified in the “Reader Guide” and reviewed as part of the grant application evaluation. </p>


<p>  1.  Competitive grant proposal narrative </p>
<p>  2.  Resumes of key staff and the board chair</p>
<p>  3.  Listing of disciplinary complaints <u>if any</u></p>
<p>  4.  Listing of malpractice lawsuits <u>if any</u></p>
<p>  5.  Revenue, Expense, CSR, Board, Staffing, PAI, and Technology data</p>
<p>  6.  Program Profile </p>
<p>  7.  Other Services Report</p>
<p>  8.  Final OCE CMS/CSR Reports <u>if any</u></p>
<p>  9.  Special grant conditions or letters of concern, <u>if any</u></p>
<p>  10. Audit reports (for new Applicants only)</p>
<p>  11. Performance evaluations and monitoring reports by non-LSC funders <u>if any</u></p>
<p>  12. OPP program quality visit reports (2009, 2010), <u>if any</u></p>

<p><i>Technical Requirements for Completing and Submitting the Grant Application Evaluation:</i></p>

<p>The <b>Status</b> section (below) indicates the status of each page in your submission. 
All required pages must be completed before the system will allow you to submit the evaluation. 
A red “X” will be displayed when an item is incomplete and a green checkmark will be displayed when an item is complete. 
Use the <b>Review and Submit</b> page (in the navigation list at left) to see which specific fields must be completed before the 
evaluation can be submitted. </p>

<p>Once all required pages are complete, submit the evaluation using the <b>Review and Submit</b> page. </p>

<p>Send an email to <a href="mailto:techsupport@lsc.gov">techsupport@lsc.gov</a> if you have difficulties using the online application, or if you want to make changes to a grant evaluation after it has been submitted.  
Send an email to <a href="mailto:competition@lsc.gov">competition@lsc.gov</a> if you have questions about the evaluation process.</p>

<div width='100%' class='SeparatorHdg'>
	Validation Summary
</div>
<Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
<br />
<br />			
<%--			
<p>To view scores of 2.0 and below AND 4.0 and above, click <b>Score Report</b> below.</p>
<span runat='server' id='spnScoreReport' />	--%>		
			
			

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <%--<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False' >
			<DisplayProperties>
	            <DisplayProperty PropertyKey=''>
					<Control ID='btnScoreReport'
						Type='cButton'
						Container='spnScoreReport'
						Caption='Score Report'>
						<Action PostBack='False'
							URL='/Easygrants_Web_LSC/Implementation/Modules/ApplReview/ModuleContent.aspx?Config=ApplReviewModuleConfig&amp;amp;Page=ScoreReport&amp;amp;PageFrame=Print'
							Target='_blank'/>
					</Control>
			    </DisplayProperty>
			 </DisplayProperties>
	    </DataObject>--%>		    
	</ModuleSection>
</span>
