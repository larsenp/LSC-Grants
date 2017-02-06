	<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Codebehind="HomeContent.ascx.vb" Inherits="Easygrants_Web.Modules.Home.Controls.Page.cHomeContent" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


<p><span id='spnPageContent' runat='server' />
<style>
	li {
		padding-bottom:5px;	
	}
</style>  
  <br>
</p>
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><h1>Welcome to your LSC Grants Home</h1></td>
  </tr>
  <tr>
	<td>
		<p>Your LSC Grants home page provides you with links to the different types of submissions that 
		LSC applicants and grantees must complete. The following links will take you directly to the different
		sections of the page.</p>
	    <p><strong><a href="#serviceareas" id="CompetitionLink" visible="true"  >COMPETITION</a></strong> - 
	    Click here to start a new application for LSC funding or to access your competitive or renewal grant applications.</p>
        <p><strong><a href="#GAR" id="GARLink" visible="true" >GAR</a></strong> - 
        Click here to access your Grant Activity Report forms</p>
        <p><strong><a href="#TIG" id="TIGLink" visible="true" >TIG</a></strong> - 
        Click here to access applications and milestone reports for the TIG competition.</p>
        <p><strong><a href="#Subgrant" id="SubgrantLink" visible="true" >SUBGRANTS</a></strong> - 
        Click here to access Subgrant approval requests.</p>
        <p runat='server' visible='true'><strong><a href="#Sandy" id="SubgrantLink" visible="true" >SANDY</a></strong> - 
        Click here to access Sandy disaster grant applications.</p>
        <p runat='server' visible='true'><strong><a href="#Disaster" id="SubgrantLink" visible="true" >DISASTER</a></strong> - 
        Click here to access LSC Emergency Disaster grant applications.</p>
         <p id="P1" runat='server' visible='true'><strong><a href="#PBIF" id="PBIFLink" visible="true" >PRO BONO INNOVATION FUND</a></strong> - 
        Click here to access the Pro Bono Innovation Fund</p>
         <p><strong><a href="#MLDCP" visible="true" >MIDWEST LEGAL DISASTER COORDINATION PROJECT</a></strong> - 
        Click here to access the Midwest Legal Disaster Coordination Project</p>
	</td>
  </tr>  

<!-- Instruction text for competition/renewal

  -->
  <!--Instruction text for grantee reports
  
  <ul>
			<li>The <strong>Grant Activity Reports</strong> section below contains a list of all the grantee activity report (GAR) forms assigned to you for submission.</li>
			<li>Grantees with multiple service areas will see links at the bottom right of the list labeled <strong>Next 22 &gt;</strong>, <strong>Last 22&gt;&gt;</strong>, etc. Use these links 
				to navigate through the list of forms assigned to you. You can also use the <strong>Show All</strong> link to display all of your forms at once.</li>
			<li>Click on the links in the <strong>Task</strong> column to access your forms.</li>  
			<li>Each form consists of one or more data entry pages and a Review and Submit page. </li>
			<li>In order to submit your form, you will have to have provided certain required data elements. The Review and Submit page for each form indicates
				what the requirements are and whether they have been met. If submission requirements have not been met, the Review and Submit page will display
				an explanation of each unmet requirement.</li>
		    <li>To see all of the GAR Instructions, click <strong>Help</strong> located within the left navigation of each webpage and then double-click <strong>Grant Activity Report Instructions</strong>.</li>
		</ul>
  -->
</table>
<br />
<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
  <tr>
    <td colspan="4" class="SeparatorHdg">Instructions</td>
  </tr>
  <tr>
    <td colspan="4" >&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" ><p>The <strong>LSC Grants Home</strong> page allows an applicant to either create a Notice of Intent to Compete (NIC) application or view existing NIC and grant applications.</p>
      <ul>
        <li>To begin your NIC application, click the link in the <strong><a href="#serviceareas">Service Areas in Competition for 2017 LSC Grants</a></strong> section below. After your NIC is approved, your grant application will appear in the <strong><a href="#todoapplication">To Do - Application</a></strong> section below. </li>
        <li>To view and edit your NIC and grant application(s) click the links listed under <strong>Tasks</strong> in the <strong><a href="#todoapplication">To Do - Application</a></strong> section below.</li>
        <li>Applicants who apply for more than one service area should complete a separate NIC for each service area.</li>
        <li>To create a new NIC based on a existing one, click <strong>Copy</strong> to the right of the NIC task in the <strong>To Do - Application</strong> section.</li>
        <li>To copy information from one grant application to another, click <strong>Copy</strong> to the right of the grant application task in the <strong>To Do - Application</strong> section.</li>
        <li>To view or print the information entered in the application, click <strong>View PDF</strong> to the right of the NIC or grant application task in the <strong>To Do - Application</strong> section. This will create a Adobe Acrobat PDF file which you can view, print or save. </li>
        <li>To print a particular form, click the printer icon which appears at the right side of the blue title bar at the top of each page. You will get a pop-up window showing the contents of the form without the left-hand navigation. </li>
        <li>To change your password, click <strong>Change Password</strong> in the navigation on the left.</li>
    </ul></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td valign="top" >&nbsp;</td>
  </tr>
</table>
<table width='100%' border="0" cellpadding='0' cellspacing='0'>
	
	<tr>
		<td>
			<span id='spnStaffAdministration' visible='false' runat='server'>
				<Core:cUserCtlLoader CtlID='ctlStaffAdministration' Src='EasyGrants/Controls/PageSection/StaffAdministration.ascx'
					runat='server'/>
			</span>
		</td>
	</tr>
	<!-- disabled by Alex on 3/10/08 as requested by Reggie
	<tr id='trProfileHdg' visible='true' runat='server'>
		<td colspan="4" class="SeparatorHdg"><b>Profile</b></td>
	</tr>
	<tr id='trProfileLink' visible='true' runat='server'>
		<td>
			<br>
		  To ensure that your 
			profile reflects the most current information, be sure to regularly update it.
			<br>
			<br>
			<span id='spnProfile' visible='true' runat='server'></span>
			<br><br><br>
	  </td>
	</tr> -->
	<tr id='trToDoHdg' visible='true' runat='server'>
		<td colspan="4" class="SeparatorHdg"><a name="serviceareas"></a>Service Areas in Competition for 2017 LSC Grants</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trToDoSummary' visible='true' runat='server'>
		<td>
			<span id='spnApply' visible='True' runat='server'></span>  NOTE: <span>Do <strong>not</strong> click the link if you have already created a  NIC for a particular service area. NICs that you have already created will appear in the <strong>To Do - Application</strong> section below.(Not Applicable to GAR)</span>
<span style="display:none">The Notice of Intent to Compete (NIC) for FY 2017 grants was due May 6, 2016. NICs are no longer being accepted. </span>
Please visit <a href="www.grants.lsc.gov" >www.grants.lsc.gov </a>for more information about LSC Grants, or send questions to <a href="mailto:competition@lsc.gov" >competition@lsc.gov </a></td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td><a name="todoapplication"></a>
			<Core:cUserCtlLoader CtlID='ctlToDoListApplicant' Src='EasyGrants/Controls/PageSection/ToDoList_Applicant.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListThirdParty' Src='EasyGrants/Controls/PageSection/ToDoList_Reference.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListDepartmentChair' Src='EasyGrants/Controls/PageSection/ToDoList_DepartmentChair.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
		   <Core:cUserCtlLoader CtlID='ctlToDoListRenewalAppReviewer' Src='EasyGrants/Controls/PageSection/ToDoList_RenewalAppReviewer.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListReviewer' Src='EasyGrants/Controls/PageSection/ToDoList_Reviewer.ascx'
				runat='server'/>
		</td>
	</tr>
 <span id='spnAwardee' runat='server' visible='false'>
	<tr id="Tr1" visible='true' runat='server'>
		<td colspan="4" class="SeparatorHdg"><a name="GAR"> Grant Activity Reports</a></td>
	</tr>
	<tr>
	  <td colspan="4" >&nbsp;</td>
    </tr>
    <tr>
         <td colspan="4" class="MinorSeparatorHdg">Instructions</td>
     </tr>
      <tr>
	     <td colspan="4" >&nbsp;</td>
     </tr>
     <tr>
        <%-- <td>Instructions: <span runat='server' id='spnInstructions' visible='true' /></td>--%>
        <td>
        <p><a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=GARInstructionsSummary&PageFrame=Print" target="_blank">2015 GAR Instructions Summary</a></p>
        </td>
     </tr>
      <tr>
	     <td colspan="4" >&nbsp;</td>
     </tr>
     <tr>
        <td colspan="4" class="MinorSeparatorHdg">Current Grant Activity Reports</td>
    </tr>
    <tr>
	    <td colspan="4" >&nbsp;</td>
    </tr>
	<tr>
	  <td colspan="4" >
	  <p><strong>Submission Requirements</strong></p>
      <p>Programs receiving funding for more than one LSC service area must complete some separate forms for each service area. Before going any further we recommend you <a href="../LOI/Help/submission_requirements.htm" target="_blank">click here for a listing of which forms are submitted by service area and which only once per grantee, for due dates of forms, and types of forms due</a>.</p></td>
    </tr>
    <tr>
		<td>
			<Core:cUserCtlLoader CtlID='ctlToDoListAwardees' Src='EasyGrants/Controls/PageSection/ToDoList_Awardees.ascx'
				runat='server' ID="Cuserctlloader6"/>
		</td>
	</tr>
  </span>
     <tr>
         <td colspan="4" class="MinorSeparatorHdg">Previous Year's Reports</td>
     </tr>
     <tr>
	     <td colspan="4" >&nbsp;</td>
     </tr>
     <tr>
         <td>Click Here to access reports submitted in previous years: <span runat='server' id='spnPrevGAR' visible='true' /></td>
     </tr>
     
     
</table>    
<br />
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
  <tr>
    <td colspan="4" class="SeparatorHdg">
		<a name="TIG" />
		TIG LOI/Application Instructions</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>
        <ul>
            <li>To start, view, or edit your TIG application, click the link listed below under Tasks in the <strong>TIG LOI/Application</strong> section for  the TIG number on which you intend to work. <strong>Be sure you choose TIG Application and not TIG  LOI. There will be one task for each TIG number</strong>. You will be able to save your work and return to complete or view your application. Once you have submitted the application, you will be able to view but not edit a PDF of your submission. </li>
            <li>TIG  staff recommends drafting the different sections needed for the application in  a Word document to cut and paste into the appropriate sections in the online  system. This  will minimize problems in the event you lose work while you are in the system.  You can be logged out of the system after a period of inactivity, so please  save your work frequently. </li>
            <li><strong>PLEASE NOTE:</strong>The input fields are HTML boxes and will only accept plain text formatting. <strong>Do not paste any formatted copy from a Word or Excel document, such as tables, bullets, bold, etc. </strong></li>
            <li>Be sure to review the <a href='http://www.lsc.gov/grants-grantee-resources/our-grant-programs/tig' target='_blank'> Legal Services Corporation Technology Initiative Grant Program's Application Instructions for 2016 Grant Funding </a> for instructions and guidance on completing the application</li>
            <li>Additional Guidance and sample Project Narratives, Payment Schedules, and Budgets are available on the<a href='http://www.lsc.gov/grants-grantee-resources/our-grant-programs/tig' target='_blank'> TIG Application Process page.</a> These documents are intended to provide general guidance to applicants and may not meet all requirements for the 2016 TIG cycle.</li>
            <li>For additional information, please see the <a href='http://www.lsc.gov/grants-grantee-resources/grantee-guidance/reporting-requirements/tig-reporting/tig-compliance' target='_blank'> TIG Compliance Resources page.</a></li>
          <li>TIG Applications must be completed and submitted into the online system no later than 11:59 p.m. EST, <strong>Friday, May 31, 2016.</strong></li>
        </ul> 
    </td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr id='tr2' visible='true' runat='server'>
		<td colspan="4" class="SeparatorHdg">TIG LOI/Application</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr id='tr3' visible='true' runat='server'>
	<td>
		<span id='spnTIGApply' visible='true' runat='server'></span> 
	</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
     <td><a name="TIGLOI"></a>
         <Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlToDoListTIGLOIApp' Src='EasyGrants/Controls/PageSection/ToDoList_TIGLOIApp.ascx'
	        runat='server'/>
	 </td>
   </tr>
	
</table>
  <br />
<table width='100%' border="0" cellpadding='0' cellspacing='0'>
   <tr>
     <td>
         <Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlToDoListMilestoneReports' Src='EasyGrants/Controls/PageSection/ToDoList_TIGMilestoneReports.ascx'
	        runat='server'/>
	 </td>
   </tr>
</table>
<table width='100%' border="0" cellpadding='0' cellspacing='0'>
   <tr>
     <td class='SeparatorHdg'><a name="Subgrant"></a>
         Subgrants
	 </td>
   </tr>
	<tr><td>&nbsp;</td></tr>
	<tr runat='server' visible='true'>
		<td class="MinorSeparatorHdg" >
			Subgrant Approval Requests - Step 1 (2015 and later)
		</td>
	</tr>
	<tr  runat='server' visible='true'	>
		<td>
			<p>This subgrant application procedure is a two-step process.  In step one, all applicants are required to provide the information requested in the LSC Grants data fields provided in the Subrecipient Profile, Subgrant Summary, and Subrecipient Budget screens, and to upload a Draft Subgrant Agreement and other required documents.  In step two, applicants will be required to request approval of their subgrant agreement(s) at least 45 days in advance of the effective date(s) of the fully Executed Subgrant Agreement.  </p>
			<p><span runat='server' id='spnRequestNewPSA' /> </p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr  runat='server' visible='true'>
		<td >
			<Core:cUserCtlLoader CtlID='ctlToDoListSubgrantStep2' Src='EasyGrants/Controls/PageSection/ToDoList_ProvisionalSubgrantApproval.ascx'
				runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr runat='server' visible='true'>
		<td class="MinorSeparatorHdg" >
			Subgrant Approval Requests - Step 2 (2015 and later)
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<p>In step two, applicants are required to review the information provided in the LSC Grants data fields - located on the Subrecipient Profile, Subgrant Summary, and Subrecipient Budget screens - and to make any updates or required changes.  Applicants are also required to upload an Executed Subgrant Agreement.  Lastly, applicants are asked to summarize any changes made to the information in the LSC Grants data fields, and to summarize any differences between the Draft Subgrant Agreement uploaded in step one and the Executed Subgrant Agreement uploaded in step two.  Once step two is submitted, under 45 CFR § 1627.3(a)(2), LSC will have 45 days to process this application.</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr  runat='server' visible='true'>
		<td >
			<Core:cUserCtlLoader CtlID='ctlToDoListPSA' Src='EasyGrants/Controls/PageSection/ToDoList_SubgrantApprovalStep2.ascx'
				runat='server'/>
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
		<td class='MinorSeparatorHdg'>
			Subgrant Approval Requests (2014 and earlier)
		</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
     <td>
         <Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlToDoListSubgrants' Src='EasyGrants/Controls/PageSection/ToDoList_SubgrantApproval.ascx'
	        runat='server'/>
	 </td>
   </tr>
</table>

<table width="600" runat='server' visible='true'>
	<tr>
		<td class="SeparatorHdg">
	  		<a name='Sandy'></a>
			Sandy Disaster Grant
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
		<td>
			The application period for Hurricane Sandy Disaster Grants is now closed. 
		</td> 
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
      <td class='MinorSeparatorHdg'>
               Sandy and Disaster Grant Reporting
      </td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
		<td>
			Sandy Grant Reports and Disaster Grant Reports are due quarterly on the 30th of January, April, July and October.
		</td> 
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
        <td>
           Blank copies of the Sandy Report and Disaster Report Templates are available by clicking on the grant number links below.  You may also upload your completed reports by clicking the grant number link for the time period for which you are reporting and following the instructions to upload documents.
		</td> 
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
		<td>
			To upload your completed Sandy Report and Disaster Report Templates, please click on the grant number link for the time period for which you are reporting and follow the instructions for uploading a document.
		</td> 
   </tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			 <Core:cUserCtlLoader ID="CUserCtlLoaderSandy" 
			 	CtlID='ctlToDoListSandy' 
				Src='EasyGrants/Controls/PageSection/ToDoList_SandyApplicant.ascx'
	        runat='server'/>
		</td>
	</tr>
</table>

<table width="600" runat='server' visible='true'>
	<tr>
		<td class="SeparatorHdg">
	  		<a name='Disaster'></a>
			LSC Emergency Disaster Grant
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			Click the button below to create a new LSC Emergency Disaster Grant application. If you have already started an application, you will find a link to it in the list below the button.
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnDisasterApplyGrant'/>
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			 <Core:cUserCtlLoader ID="CUserCtlLoaderDisaster" 
			 	CtlID='ctlToDoListDisaster' 
				Src='EasyGrants/Controls/PageSection/ToDoList_DisasterApplicant.ascx'
	        runat='server'/>
		</td>
	</tr>
</table>


<table id="Table2" width="600" runat='server'>
	<tr>
		<td class="SeparatorHdg">
			<a name='PBIF'/>
			Pro Bono Innovation Fund
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
	<tr runat='server' visible='true'>
		<td>
			Click the button below to submit a Letter of Intent to Apply for a grant from the 2017 Pro Bono Innovation Fund
		</td>
	</tr>
   <tr runat='server' visible='true'><td>&nbsp;</td></tr>
	<tr runat='server' visible='true'>
		<td>
			<span runat='server' id='spnProBonoApplyGrant'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table width="600">
	<tr>
		<td>
			 <Core:cUserCtlLoader ID="CUserCtlProBono" 
			 	CtlID='ctlToDoListProBono' 
				Src='EasyGrants/Controls/PageSection/ToDoList_ProBonoApplicant.ascx'
	        runat='server'/>
		</td>
	</tr>
</table>

<table width="600">
	<tr>
		<td class="SeparatorHdg">
	  		<a name='MLDCP'></a>
			Midwest Legal Disaster Coordination Project
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			The Midwest Legal Disaster Coordination Project application is available to LSC grantees from the following states: Arkansas, Iowa, Kansas, Minnesota, Missouri, Montana, Nebraska, North Dakota, Oklahoma, and South Dakota. If your program is in one of these states, you will see an <b>Apply</b> button below. Click this button to start an application. If you have already started an application, you will find a link to it in the list below the button.
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnMLDCPApplyGrant'/>
		</td>
	</tr>
   <tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			 <Core:cUserCtlLoader ID="CUserCtlMLDCP" 
			 	CtlID='ctlToDoListMLDCP' 
				Src='EasyGrants/Controls/PageSection/ToDoList_MLDCPApplicant.ascx'
	        runat='server'/>
		</td>
	</tr>
</table>

<table width="600" id='tbInEligible' visible='true' runat='server'>
	<tr>
		<td>
			<b>Eligibility Outcome: Ineligible</b>
		</td>
	</tr>
	<tr>
		<td>
			For your reference, below are your answers to the eligibility questions 
			(Answers in red are incorrect). Click <span id='spnGuidelines' runat='server' />
			to view the guidelines for this Award Program. If 
			you have further questions, contact the .
		</td>
	</tr>
	<tr>
		<td>
			1) Full Tenure Track:&nbsp;<span id='spnIsTenure' runat='server' />
		</td>
	</tr>
	<tr>
		<td>
			2) Biomedical Engineering Primary Department:&nbsp;<span id='spnIsBiomedical' runat='server' />
		</td>
	</tr>
	<tr>
		<td>
			3) Doctoral Degree received:&nbsp;<span id='spnDegreeYear' runat='server' />
		</td>
	</tr>
	<tr>
		<td>
			4) Academic Rank:&nbsp;<span id='spnRankType' runat='server' />
		</td>
	</tr>
</table> 


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<!--
		<PageContent />-->
		<DataObject Key='ProfileOther' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonID'>
					<Control ID='profile' Type='cLink' Container='spnProfile' Caption='Click here to view and update your profile.'>
						<Action PostBack='True' Object='ModulePage' Method='RedirectToModule'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Profile' />
								<Argument Type='' TypeKey='' Value='ProfileModuleConfig' />
								<Argument Type='' TypeKey='' Value='Contact' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGuidelines' Container='spnGuidelines' Type='cLink' Caption='here'>
						<Action PostBack='False' URL='/Easygrants_v4_AHA_r1/Implementation/Modules/Home/Help/EC_admin _application_guidelines.pdf' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='ApplyGrant' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='apply' 
						Type='cLink' 
						Container='spnApply'
						Caption='Click here to create a new  Notice of Intent to Compete (NIC) application.'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ApplyGrant' />
							</Parameters>
						</Action>
						
					</Control>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkDisasterApplyGrant' 
						Type='cButton' 
						Container='spnDisasterApplyGrant'
						Caption='Apply'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='DisasterApplyGrant' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkspnProBonoApplyGrant' 
						Type='cButton' 
						Container='spnProBonoApplyGrant'
						Caption='Apply'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ProBonoApplyGrant' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' Bool='' />
			</Filters>
		</DataObject>

		<DataObject Key='TIGLOITypes' DataObjectDefinitionKey='TIGLOITypes' Updatable='False' CreateNew='False'>
		    <Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.OrganizationID' PropertyKey='org_id' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTIGApply' 
						Type='cLink' 
						Container='spnTIGApply'
						Caption='Click here to create a new  TIG Letter of Intent (LOI).'>
						<Visible>
							<Argument NullDataObject='False' PropertyKey='WfTaskID' Value='0' Operator='GreaterThan'/>
						</Visible>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='TIGApplyGrant' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		
		
		<DataObject Key='PersonEligibility' DataObjectDefinitionKey='PersonEligibility' Updatable='False'
			CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' Bool='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsTenure' Format='YesNo'>
					<Control ID='spnIsTenure' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsBiomedical' Format='YesNo'>
					<Control ID='spnIsBiomedical' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DegreeYear'>
					<Control ID='spnDegreeYear' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RankType.Abbr'>
					<Control ID='spnRankType' Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WFPTRequestPSA' DataObjectDefinitionKey='WfProjectTask' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument PropertyKey='WfTaskID' Value='101'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='OpenDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='CloseDate' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='lstRequestNewPSA'
						Type='cDataListCtl'
						Container='spnRequestNewPSA'
						DataObjectDefinitionKey='LscToDoListRequestSubgrantApproval'
						ShowColumnHeaderRow='False'>
						<DisplayProperty PropertyKey='WfProject.WfProjectName'>
							<Control ID='lnkNewRequest'
								Type='cButton'
								Caption='Initiate Step 1'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='RequestNewPSA' />
										<Argument AttributeName='PageKey1' Type='DataObject' TypeKey='WfProjectID' BaseValue='WfProjectID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey=''>
		    <DisplayProperties>
		       <DisplayProperty PropertyKey=''>
                   <Control ID='ctlPrevGAR' Container='spnPrevGAR' Type='cLink' Caption='Click Here'>
                      <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                        <Parameters>
                            <Argument Value='PreviousGAR' />
                        </Parameters>
                       </Action>
                   </Control>
               </DisplayProperty>
               <!--<DisplayProperty PropertyKey=''>
                   <Control ID='ctlInstructions' Container='spnInstructions' Type='cLink' Caption='Click Here for Instructions for all Forms'>
                      <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                        <Parameters>
                            <Argument Value='InstructionsSummary' />
                        </Parameters>
                       </Action>
                   </Control>
               </DisplayProperty>-->
		    </DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscStateProv' DataObjectDefinitionKey='LscStateProv' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonPrimaryAffiliation.Organization.PrimaryAddress.StateID' PropertyKey='StateProvinceID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnMLDCPApplyGrant' 
						Type='cButton' 
						Container='spnMLDCPApplyGrant'
						Caption='Apply'>
						<Visible>
							<Argument PropertyKey='MldcpEligible' Value='True' Operator='Boolean'/>
						</Visible>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='MLDCPApplyGrant' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->
