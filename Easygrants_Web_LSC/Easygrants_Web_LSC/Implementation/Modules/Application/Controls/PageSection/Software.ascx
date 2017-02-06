<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cSoftware" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->
<br/>
<h1>Technology (Form K)</h1>
<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
	  <td colspan="2" class="SeparatorHdg">Instructions</td>
	</tr>
	<tr>
	  <td colspan="2" >&nbsp;</td>
	</tr>
	<tr>
	  <td valign="top" ><p>The <strong>Technology Form (Form K)</strong> captures information on Applicant's current technology in place at the time the Application is filed. Answer questions about Applicant’s current technology and indicate the types of software applications available and the proportions of users for each of the software applications identified. Refer to the technology definitions before responding to the technology questions. <span runat='server' id='spnTechnologyDefinitions' /></p>
			<ul>
				<li>
					<strong>All applicants must complete Form K</strong>
				</li>
				<li>
					Indicate the software being used, and the percentage of staff using the software, for operating systems, email, Internet browsing, word processing, accounting, and case management. 
				</li>
				<li>
					Respond to each of the inquiries pertaining to time keeping, legal research, degree of connectivity, Applicant’s network, internet access, web conferencing, applicant’s website and statewide websites, and technology contact people.
				</li>
				</ul>
				<p><strong>Note the following:</strong> </p>
				<ul>
				  <li>When entering the percent of staff using the software applications listed in the form, use whole numbers without any punctuation such as decimal points. For example, enter the whole number 50 if the proportion of staff using an application is 50% or one-half.</li>
				  <li>All fields marked with an asterisk (<%=kDenoteRequiredField%>) are required.</li>
				  <li>To save data, click <strong>Save</strong>.</li>
				  <li>To continue to the next page, click <strong>Continue</strong>.</li>
			</ul>
			<p><strong>Follow the steps below for assistance on this form: </strong></p>
			<ul>
			  <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
			  <li> Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>. </li>
			  <li> Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov"> haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
			</ul></td>
	  <td >&nbsp;</td>
	  <td >&nbsp;</td>
	  <td width="160" valign="top" >
			<Core:cUserCtlLoader CtlID='ctlQuickLinks' 
				Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
				runat='server'/>
		</td>
	</tr>
 </table>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlSoftwareGrid' 
	Src='Implementation/Modules/Application/Controls/PageSection/SoftwareGrid.ascx'
	runat='server'/>

<%-- Time Keeping--%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			If Other Accounting software used, what?&nbsp;<span runat='server' id='spnAcctgSoftwareProductOther'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
  <tr>
    <td width="100%" class="SeparatorHdg">Time Keeping</td>
  </tr>
  <tr>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr valign="TOP">
          <td colspan="2">Do you use a program other than your case management software for your timekeeping?<strong><%=kDenoteRequiredField%></strong></td>
          <td width="44%">
				<span runat='server' id='spnDedicatedTimekeepingSW' /> 
		  </td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr valign="TOP">
          <td width="33%">If yes, what software are you using?</td>
          <td colspan="3">
				<span runat='server' id='spnTimekeepingSWName' />
		  </td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>

<%-- Legal Research--%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" class="SeparatorHdg">
  Legal Research</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="16%">Legal Research<strong><%=kDenoteRequiredField%></strong></td>
        <td width="20%">
          <span runat='server' id='spnLegalResearchSoftware' />
        </td>
        <td width="5%">Description<strong></strong></td>
        <td width="59%">
          <span runat='server' id='spnLegalResearchDesc' />
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<%-- Degree of Connectivity--%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
		    <td class="SeparatorHdg" colspan="4">Degree of Connectivity</td>
        </tr>
	    <tr>
	        <td colspan="4">&nbsp;</td>
        </tr>
	    <tr>
			 <td width="25%">Are program computers networked between all program offices? <%=kDenoteRequiredField%></td>
			 <td width="30%"><span runat='server' id="spnConnectivityBtAll" /></td>
        </tr>
	    <tr>
			 <td>Can staff access electronic files created or stored in other offices (through shared folders or a knowledge management system)?&nbsp;<%=kDenoteRequiredField%></td>
			 <td><span runat='server' id="spnAccessFilesAcrossOffices" /></td>
        </tr>
	    <tr>
			 <td>Do staff have the capacity to search for files across offices?&nbsp;<%=kDenoteRequiredField%></td>
			 <td><span runat='server' id="spnSearchFilesAcrossOffices" /></td>
        </tr>
	    <tr>
	        <td colspan="4">&nbsp;</td>
        </tr>
</table>

<%-- Network--%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" class="SeparatorHdg">Network</td>
  </tr>
  <tr>
    <td>
	</td>
</tr>
        <tr>
          <td colspan="3">
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr><td>&nbsp;</td></tr>
              <tr>
                <td>Approximately what portion of staff is provided remote access?<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnRemoteAccessPortion' />
					</td>
              </tr>
              <tr>
                <td>If remote access is offered, what software are you using?</td>
                <td><span runat='server' id='spnRemoteAccessSWType'/></td>
              </tr>
				  <tr>
				  	<td>
						If Other, what?
					</td>
					<td>
						<span runat='server' id='spnRemoteAccessSoftwareProductOther'/>
					</td>
				  </tr>
              <tr>
                <td>Are you using a VPN?<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnVPN' />
					</td>
             </tr>
              <tr>
                <td>Are some or all of your servers hosted on site (in the program office)?<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnServerHostingOnsite' />
					</td>
             </tr>
              <tr>
                <td>Are some or all of your servers hosted externally?<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnServerHostingExternal' />
					</td>
             </tr>
              <tr>
                <td>Does your program utilize virtualization?<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnVirtualization' />
					</td>
             </tr>
              <tr>
                <td>Does your program utilize virtual desktops/VDI?<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnVirtualDesktop' />
					</td>
             </tr>
              <tr>
                <td>Does your program utilize videoconferencing?&nbsp;<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnVideoconf' />
					</td>
             </tr>
              <tr>
                <td style="padding-left:20px">If yes, do you use a web-based videoconferencing, such as Skype or Go-to-Meeting?&nbsp;<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnVideoconfWebBased' />
					</td>
             </tr>
              <tr>
                <td style="padding-left:20px">If yes, do you use a standalone videoconferencing system, such as Polycom or Lifesize?&nbsp;<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnVideoconfStandalone' />
					</td>
             </tr>
              <tr>
                <td style="padding-left:40px">If yes, can it connect to videoconferencing systems outside the program?&nbsp;<strong><%=kDenoteRequiredField%></strong></td>
                <td>
						<span runat='server' id='spnVideoconfConnectExternal' />
					</td>
             </tr>
				<tr>
					<td>Does your program utilize web conferencing?" <strong><%=kDenoteRequiredField%></strong></td>
					<td>
						<span runat='server' id='spnWebconf' />
					</td>
				</tr>
      		<tr>
          		<td>&nbsp;</td>
	        </tr>
   		</table>
		</td>
  </tr>
</table>

<%-- Internet Access--%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
		    <td class="SeparatorHdg" colspan="4">Internet Access</td>
        </tr>
	    <tr>
	        <td colspan="4">&nbsp;</td>
        </tr>
	    <tr>
	        <td colspan="4">
	            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td colspan="6"><strong>How are your offices connected to the Internet?</strong></td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20%">Dial-up? <%=kDenoteRequiredField%></td>
                        <td width="30%"><span runat='server' id="spnDialUp" /></td>
                        <td width="25%">DSL? <%=kDenoteRequiredField%></td>
                        <td width="25%"><span runat='server' id="spnDsl" /></td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>ISDN? <%=kDenoteRequiredField%></td>
                        <td><span runat='server' id="spnIsdn" /></td>
                        <td>Frame? <%=kDenoteRequiredField%></td>
                        <td><span runat='server' id="spnFrame" /></td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>T1? <%=kDenoteRequiredField%></td>
                        <td><span runat='server' id="spnT1" /></td>
                        <td>Cable? <%=kDenoteRequiredField%></td>
                        <td><span runat='server' id="spnCable" /></td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Satellite? <%=kDenoteRequiredField%></td>
                        <td><span runat='server' id="spnSatellite" /></td>
                        <td>Fast Ethernet/Metro Ethernet/Fiber? <%=kDenoteRequiredField%></td>
                        <td><span runat='server' id="spnFiberOptics" /></td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;</td>
                    </tr>
                     <tr>
                        <td>T3/DS3? <%=kDenoteRequiredField%></td>
                        <td><span runat='server' id="spnT3DS3" /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Other? <%=kDenoteRequiredField%></td>
                        <td><span runat='server' id="spnOther" /></td>
                        <td>Describe </td>
                        <td><span runat='server' id="spnDescribe" /></td>
                    </tr>
						  <tr>
						  	<td colspan='4'>
								What range of bandwidth is available at your offices?&nbsp;<span runat='server' id='spnBandwidth'/>
							</td>
						  </tr>
                </table>
             </td>
        </tr>
	    <tr>
	        <td colspan="4">&nbsp;</td>
        </tr>
</table>



<%-- Web Site Information--%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3" class="SeparatorHdg">Web Site Information</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td>
	 	To what web page / resource should the LSC Find Legal Aid tool point users in your service area seeking legal assistance? (Please provide the full URL and ensure that the URL is accurate.)
	</td>
	<td>
		<span runat='server' id='spnLegalAidURL'/>
	</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td>
	 	Does your program have a Google AdWords campaign?
	</td>
	<td>
		<span runat='server' id='spnAdWords'/>
	</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><strong>Programs are expected to, in cooperation with other organizations that are part of the state justice community, to build and maintain a quality 
statewide web site for legal information. The web site will publish a full range of community legal education/pro se related materials and referral 
information, at least covering the common topics facing the client community on the subject matters that are the program's priorities.</strong></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td colspan="3">
      <tr valign="TOP">
        <td width="30%">What is the URL for your Statewide Web Site?<strong><%=kDenoteRequiredField%></strong></td>
        <td colspan="51"><span runat='server' id='spnSWWSURL' /></td>
        </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
        </tr>
      <tr valign="TOP">
        <td>Name of Statewide Web Site Coordinator<strong><%=kDenoteRequiredField%></strong></td>
     
        <td ><span runat='server' id='spnSWWSCoordNameFirst' />
          <br />
First Name<strong><%=kDenoteRequiredField%></strong></td>
        <td ><span runat='server' id='spnSWWSCoordNameLast' />
          <br />
Last name<strong><%=kDenoteRequiredField%></strong></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>&nbsp;</td>
        <td><span runat='server' id='spnSWWSCoordPhone' />
          <br />
Telephone<strong><%=kDenoteRequiredField%></strong></td>
        <td><span runat='server' id='spnSWWSCoordEmail' />
          <br />
Email Address<strong><%=kDenoteRequiredField%></strong></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>   
		<tr>
			<td>
				Does the state have a system for maintaining content on the SWWS?
			</td>
			<td>
				<span runat='server' id='spnSWWSCMS'/>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				If Yes, explain: 
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnSWWSCMSComment'/>
			</td>
		</tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>   
		<tr>
			<td>
				Does the program have any social media accounts?
			</td>
			<td>
				<span runat='server' id='spnHasSocialMedia'/>
			</td>
		</tr>
		<tr>
			<td>
				If yes, check which ones:
			</td>
		</tr>
		<tr>
			<td>
				<span runat='server' id='spnSocialMediaTypes'/>
			</td>
		</tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>  
		<tr>
			<td colspan='3' class="SeparatorHdg">
				Automated Documents
			</td>
		</tr> 
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>  
      <tr valign="TOP">
      	<td>
		  		Does your program make use of automated forms?<strong><%=kDenoteRequiredField%></strong>
			</td>
      	<td colspan="2">
      		<span runat='server' id='spnAutomatedFormUse' />
         </td>
      </tr>
		<tr>
			<td>
				If yes, are you using (check all that apply):
			</td>
		</tr>
		<tr>
			<td>
				<span runat='server' id='spnAutomatedFormsTypes'/>
			</td>
		</tr>
		<tr>
			<td>If other, what?</td>
			<td colspan='2'><span runat='server' id='spnAutomatedFormOther'/></td>
		</tr>
      <tr valign="TOP">
      	<td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
      	<td colspan='2'>
		  		If yes, does your program use automated forms for:
			</td>
      </tr>
		<tr>
			<td style="vertical-align:top">
				<ul><li>Pro se </li></ul>
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnAutomatedFormProSe'/>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				<ul><li>Staff advocate</li></ul>
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnAutomatedFormStaffAdvocate'/>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				<ul><li>Pro bono</li></ul>
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnAutomatedFormProBono'/>
			</td>
		</tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
		<tr>
			<td>
				Is staff required to use certain forms? 
			</td>
			<td>
				<span runat='server' id='spnAutomatedFormStaffMustUse'/>
			</td>
		</tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
		<tr>
			<td>
				What are the three most frequently used forms for advocates? 
			</td>
			<td colspan='2'>
				<span runat='server' id='spnAutomatedFormMostFreq'/>
			</td>
		</tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
		<tr>
			<td>
				Approximately how many forms are available for staff/pro bono use? 
			</td>
			<td>
				<span runat='server' id='spnAutomatedFormCount'/>
			</td>
		</tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
		<tr>
			<td>
				Are the automated forms created by:
			</td>
		</tr>
		<tr>
			<td>
				<ul><li>
					Staff
				</li></ul>
			</td>
			<td>
				<span runat='server' id='spnAutomatedFormCreatedByStaff'/>
			</td>
		</tr>
		<tr>
			<td>
				<ul><li>
					Law student
				</li></ul>
			</td>
			<td>
				<span runat='server' id='spnAutomatedFormCreatedByLawStudent'/>
			</td>
		</tr>
		<tr>
			<td>
				<ul><li>
					Pro bono
				</li></ul>
			</td>
			<td>
				<span runat='server' id='spnAutomatedFormCreatedByProBono'/>
			</td>
		</tr>
		<tr>
			<td>
				<ul><li>
					Outside contractor
				</li></ul>
			</td>
			<td>
				<span runat='server' id='spnAutomatedFormCreatedByContractor'/>
			</td>
		</tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
			<td>
				Are you using A2J Author?<strong><%=kDenoteRequiredField%></strong>
			</td>
			<td ><span runat='server' id='spnA2JAuthorUsage' /></td>
      </tr>
    </table>      
	 <table>
      <tr valign="TOP">
            <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
      	<td colspan='2'>
		  		If yes, does your program use it for:
			</td>
      </tr>
		<tr>
			<td style="vertical-align:top">
				<ul><li>Pro se forms</li></ul>
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnA2JAuthorProSe'/>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				<ul><li>Staff advocate/pro bono forms</li></ul>
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnA2JAuthorStaffProBono'/>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
				<ul><li>Online intake/triage</li></ul>
			</td>
			<td style="vertical-align:top">
				<span runat='server' id='spnA2JAuthorOnlineIntake'/>
			</td>
	  </tr>
      <tr valign="TOP">
        <td>Has your program made financial contributions to the statewide web sites (SWWS) <strong>in the past year</strong>?<strong><%=kDenoteRequiredField%></strong></td>
        <td colspan="2"><span runat='server' id='spnSWWSFinancialContribution' /></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>If yes, how much?</td>
        <td colspan="2"><span runat='server' id='spnSWWSFinancialContributionAmount' /></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>Has your program provided content for the SWWS <b>in the past year</b>?<strong><%=kDenoteRequiredField%></strong></td>
        <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span runat='server' id='spnSWWSContentContribution' /></td>
            </tr>
        </table></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>Has your program participated in stakeholder meetings for the SWWS <b>in the past year</b>?<strong><%=kDenoteRequiredField%></strong></td>
        <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span runat='server' id='spnSWWSStakeholderMtgs' /> </td>
            </tr>
        </table></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>Has your program done outreach for SWWS <b>in the past year</b>?<strong><%=kDenoteRequiredField%></strong></td>
        <td colspan="2"><span runat='server' id='spnSWWSOutreach' /></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>Is there a portion of the SWWS dedicated to the recruitment and support of pro bono attorneys?<strong><%=kDenoteRequiredField%></strong></td>
        <td colspan="3"><span runat='server' id='spnSWWSProBono' />
            <br />
        </td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>Does your program maintain a web site separate and apart from the SWWS?<strong><%=kDenoteRequiredField%></strong></td>
        <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td ><span runat='server' id='spnProgramWebSite' /></td>
            </tr>
        </table></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>If yes, what is the URL?</td>
        <td colspan="2"><span runat='server' id='spnPWSURL' />
          </td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>     
      <tr valign="TOP">
        <td>If yes, name of Program Website Contact<strong><%=kDenoteRequiredField%></strong></td>
     
        <td ><span runat='server' id='spnPWCNameFirst' />
          <br />
First Name<strong><%=kDenoteRequiredField%></strong></td>
        <td ><span runat='server' id='spnPWCNameLast' />
          <br />
Last name<strong><%=kDenoteRequiredField%></strong></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>&nbsp;</td>
        <td><span runat='server' id='spnPWCPhone' />
          <br />
Telephone<strong><%=kDenoteRequiredField%></strong></td>
        <td><span runat='server' id='spnPWCEmail' />
          <br />
Email Address<strong><%=kDenoteRequiredField%></strong></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>If yes, are any LSC funds used to maintain this web site?</td>
        <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span runat='server' id='spnPWSLSCFunded' /></td>
            </tr>
        </table></td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>Program Technology Contact Person<strong><%=kDenoteRequiredField%></strong></td>
        <td><span runat='server' id='spnProgramTechContactNameFirst' />
            <br />
    First Name<strong><%=kDenoteRequiredField%></strong></td>
        <td><span runat='server' id='spnProgramTechContactNameLast' />
            <br />
    Last name<strong><%=kDenoteRequiredField%></strong></td>
      </tr>
      <tr><td>&nbsp;</td></tr>
      <tr valign="TOP">
        <td>&nbsp;</td>
        <td><span runat='server' id='spnProgramTechContactPhone' />
            <br />
    Telephone<strong><%=kDenoteRequiredField%></strong></td>
        <td><span runat='server' id='spnProgramTechContactEmail' />
            <br />
    Email Address<strong><%=kDenoteRequiredField%></strong></td>
      </tr>
      <tr valign="TOP">
        <td>&nbsp;</td><td>&nbsp;</td>
        <td><span runat='server' id='spn3' />
            <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td><span runat='server' id='spn4' />
            <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      </tr>
      <tr valign="TOP">
        <td>Statewide Technology Contact Person<strong><%=kDenoteRequiredField%></strong></td>
        <td><span runat='server' id='spnSWTechContactNameFirst' />
            <br />
    First Name </td>
        <td><span runat='server' id='spnSWTechContactNameLast' />
            <br />
    Last name </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
      <tr valign="TOP">
        <td>&nbsp;</td>
        <td><span runat='server' id='spnSWTechContactPhone' />
            <br />
    Telephone</td>
        <td><span runat='server' id='spnSWTechContactEmail' />
            <br />
    Email Address</td>
      </tr>
      <tr valign="TOP">
        <td colspan="3">&nbsp;</td>
      </tr>
	  <tr><td>&nbsp;</td></tr>
    </table>
	 </td>
  </tr>
</table>

<br /><br />

<p align="center">
  <span id='spnSave' runat='server' />&nbsp;&nbsp;&nbsp;&nbsp;
  <span id='spnContinue' runat='server' />
</p>



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
	    </DataObject>
	    
	    <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	    </DataObject>
	
		<DataObject Key='LscSoftwareQuestion' DataObjectDefinitionKey='LscSoftwareQuestion' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AcctgSoftwareProductOther'>
					<Control ID='txtAcctgSoftwareProductOther'
						Type='cTextBox'
						Container='spnAcctgSoftwareProductOther'
						MaxLength='100'
						Size='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DedicatedTimekeepingSW'>
					<Control ID='rdoDedicatedTimekeepingSW'
						Type='cRadioButtonList'
						Container='spnDedicatedTimekeepingSW'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='TimekeepingSWName'>
					<Control ID='txtTimekeepingSWName'
						Type='cTextBox'
						Container='spnTimekeepingSWName'
						MaxLength='50'></Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RemoteAccessPortion'>
					<Control ID='ctlRemoteAccessPortion'
						Type='cDropDown'
						Container='spnRemoteAccessPortion'
						DataObjectDefinitionKey='LSCRFPRemoteAccessPortionLKP'
						StoredValue='LscRemoteAccessPortionLkpID'
						DisplayValue='Description'/>
				</DisplayProperty>
								
				<DisplayProperty PropertyKey='RemoteAccessSoftwareProductOther'>
					<Control ID='txtRemoteAccessSoftwareProductOther'
						Type='cTextBox'
						Container='spnRemoteAccessSoftwareProductOther'
						MaxLength='50'>
					</Control>
				</DisplayProperty>
            <DisplayProperty PropertyKey='VPN'>
					<Control ID='rdoVPN'
						Type='cRadioButtonList'
						Container='spnVPN'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalAidURL'>
					<Control ID='txtLegalAidURL'
						Type='cTextBox'
						Container='spnLegalAidURL'
						Size='30'
						MaxLength='200'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AdWords'>
					<Control ID='rdoAdWords'
						Type='cRadioButtonList'
						Container='spnAdWords'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSURL'>
					<Control ID='txtSWWSURL'
						Type='cTextBox'
						Container='spnSWWSURL'
						Size='30'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSCoordNameFirst'>
					<Control ID='txtSWWSCoordNameFirst'
						Type='cTextBox'
						Container='spnSWWSCoordNameFirst'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSCoordNameLast'>
					<Control ID='txtSWWSCoordNameLast'
						Type='cTextBox'
						Container='spnSWWSCoordNameLast'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSCoordPhone'>
					<Control ID='txtSWWSCoordPhone'
						Type='cMoneyTextBox'
						Container='spnSWWSCoordPhone'
						AllowInputCommas='False'
						MaxInputDecimalPlaces='0'
						MaxLength='15'
						RegExErrorMessage='The Statewide Web Site Coordinator Phone number must be entered as digits only, without hyphens, parentheses, or other characters.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSCoordEmail'>
					<Control ID='txtSWWSCoordEmail'
						Type='cEmailTextBox'
						Container='spnSWWSCoordEmail'
						MaxLength='100'
						RexErrorMessage='The Statewide Web Site Coordinator Email Address is incorrectly formatted. Use the following format to enter the email address: test@test.edu or test@test.edu.au.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSCMS'>
					<Control ID='rdoSWWSCMS'
						Type='cRadioButtonList'
						Container='spnSWWSCMS'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSCMSComment'>
					<Control ID='txtSWWSCMSComment'
						Type='cTextBox'
						Container='spnSWWSCMSComment'
						Size='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='HasSocialMedia'>
					<Control ID='rdoHasSocialMedia'
						Type='cRadioButtonList'
						Container='spnHasSocialMedia'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='PWCNameFirst'>
					<Control ID='txtPWCNameFirst'
						Type='cTextBox'
						Container='spnPWCNameFirst'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PWCNameLast'>
					<Control ID='txtPWCNameLast'
						Type='cTextBox'
						Container='spnPWCNameLast'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PWCPhone'>
					<Control ID='txtPWCPhone'
						Type='cMoneyTextBox'
						Container='spnPWCPhone'
						AllowInputCommas='False'
						MaxInputDecimalPlaces='0'
						MaxLength='15'
						RegExErrorMessage='The Statewide Web Site Coordinator Phone number must be entered as digits only, without hyphens, parentheses, or other characters.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PWCEmail'>
					<Control ID='txtPWCEmail'
						Type='cEmailTextBox'
						Container='spnPWCEmail'
						MaxLength='100'
						RexErrorMessage='The Statewide Web Site Coordinator Email Address is incorrectly formatted. Use the following format to enter the email address: test@test.edu or test@test.edu.au.'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='AutomatedFormUse'>
					<Control ID='rdoAutomatedFormUse'
						Type='cRadioButtonList'
						Container='spnAutomatedFormUse'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormOther'>
					<Control ID='txtAutomatedFormOther'
						Type='cTextBox'
						Container='spnAutomatedFormOther'
						Size='100'/>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='AutomatedFormProSe'>
					<Control ID='rdoAutomatedFormProSe'
						Type='cRadioButtonList'
						Container='spnAutomatedFormProSe'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormStaffAdvocate'>
					<Control ID='rdoAutomatedFormStaffAdvocate'
						Type='cRadioButtonList'
						Container='spnAutomatedFormStaffAdvocate'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormProBono'>
					<Control ID='rdoAutomatedFormProBono'
						Type='cRadioButtonList'
						Container='spnAutomatedFormProBono'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormStaffMustUse'>
					<Control ID='rdoAutomatedFormStaffMustUse'
						Type='cRadioButtonList'
						Container='spnAutomatedFormStaffMustUse'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormMostFreq'>
					<Control ID='txtAutomatedFormMostFreq'
						Type='cTextBox'
						Container='spnAutomatedFormMostFreq'
						Size='100'/>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormCount'>
					<Control ID='txtAutomatedFormCount'
						Type='cMoneyTextBox'
						Container='spnAutomatedFormCount'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						MaxLength='10'
						Size='10' 
						RegExErrorMessage='The number of forms available for staff/pro bono use must be a whole number containing only digits and commas.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormCreatedByStaff'>
					<Control ID='rdoAutomatedFormCreatedByStaff'
						Type='cRadioButtonList'
						Container='spnAutomatedFormCreatedByStaff'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormCreatedByLawStudent'>
					<Control ID='rdoAutomatedFormCreatedByLawStudent'
						Type='cRadioButtonList'
						Container='spnAutomatedFormCreatedByLawStudent'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormCreatedByProBono'>
					<Control ID='rdoAutomatedFormCreatedByProBono'
						Type='cRadioButtonList'
						Container='spnAutomatedFormCreatedByProBono'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormCreatedByContractor'>
					<Control ID='rdoAutomatedFormCreatedByContractor'
						Type='cRadioButtonList'
						Container='spnAutomatedFormCreatedByContractor'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>

				<DisplayProperty PropertyKey='A2JAuthorUsage'>
					<Control ID='rdoA2JAuthorUsage'
						Type='cRadioButtonList'
						Container='spnA2JAuthorUsage'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='A2JAuthorProSe'>
					<Control ID='rdoA2JAuthorProSe'
						Type='cRadioButtonList'
						Container='spnA2JAuthorProSe'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='A2JAuthorStaffProBono'>
					<Control ID='rdoA2JAuthorStaffProBono'
						Type='cRadioButtonList'
						Container='spnA2JAuthorStaffProBono'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='A2JAuthorOnlineIntake'>
					<Control ID='rdoA2JAuthorOnlineIntake'
						Type='cRadioButtonList'
						Container='spnA2JAuthorOnlineIntake'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSFinancialContribution'>
					<Control ID='rdoSWWSFinancialContribution'
						Type='cRadioButtonList'
						Container='spnSWWSFinancialContribution'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSFinancialContributionAmount'>
					<Control ID='txtSWWSFinancialContributionAmount'
						Type='cMoneyTextBox'
						Container='spnSWWSFinancialContributionAmount'
						AllowInputCommas='True'
						MaxInputDecimalPlaces='0'
						MaxLength='10'
						Size='10' 
						RegExErrorMessage='The financial contribution amount to the statewide web sites must contain only digits and commas.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWWSContentContribution'>
					<Control ID='rdoSWWSContentContribution'
						Type='cRadioButtonList'
						Container='spnSWWSContentContribution'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='SWWSStakeholderMtgs'>
					<Control ID='rdoSWWSStakeholderMtgs'
						Type='cRadioButtonList'
						Container='spnSWWSStakeholderMtgs'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>

				<DisplayProperty PropertyKey='SWWSOutreach'>
					<Control ID='rdoSWWSOutreach'
						Type='cRadioButtonList'
						Container='spnSWWSOutreach'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>


				<DisplayProperty PropertyKey='SWWSProBono'>
					<Control ID='rdoSWWSProBono'
						Type='cRadioButtonList'
						Container='spnSWWSProBono'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramWebSite'>
					<Control ID='rdoProgramWebSite'
						Type='cRadioButtonList'
						Container='spnProgramWebSite'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='PWSURL'>
					<Control ID='txtPWSURL'
						Type='cTextBox'
						Container='spnPWSURL'
						Size='30'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PWSLSCFunded'>
					<Control ID='rdoPWSLSCFunded'
						Type='cRadioButtonList'
						Container='spnPWSLSCFunded'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramTechContactNameFirst'>
					<Control ID='txtProgramTechContactNameFirst'
						Type='cTextBox'
						Container='spnProgramTechContactNameFirst'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramTechContactNameLast'>
					<Control ID='txtProgramTechContactNameLast'
						Type='cTextBox'
						Container='spnProgramTechContactNameLast'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramTechContactPhone'>
					<Control ID='txtProgramTechContactPhone'
						Type='cMoneyTextBox'
						Container='spnProgramTechContactPhone'
						AllowInputCommas='False'
						MaxInputDecimalPlaces='0'
						MaxLength='15'
						RegExErrorMessage='The Program Technology Contact Phone number must be entered as digits only, without hyphens, parentheses, or other characters.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramTechContactEmail'>
					<Control ID='txtProgramTechContactEmail'
						Type='cEmailTextBox'
						Container='spnProgramTechContactEmail'
						MaxLength='100'
						RexErrorMessage='The Program Technology Contact Email Address is incorrectly formatted. Use the following format to enter the email address: test@test.edu or test@test.edu.au.'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='SWTechContactNameFirst'>
					<Control ID='txtSWTechContactNameFirst'
						Type='cTextBox'
						Container='spnSWTechContactNameFirst'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWTechContactNameLast'>
					<Control ID='txtSWTechContactNameLast'
						Type='cTextBox'
						Container='spnSWTechContactNameLast'
						MaxLength='100'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWTechContactPhone'>
					<Control ID='txtSWTechContactPhone'
						Type='cMoneyTextBox'
						Container='spnSWTechContactPhone'
						AllowInputCommas='False'
						MaxInputDecimalPlaces='0'
						MaxLength='15'
						RegExErrorMessage='The Statewide Technology Contact Phone number must be entered as digits only, without hyphens, parentheses, or other characters.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SWTechContactEmail'>
					<Control ID='txtSWTechContactEmail'
						Type='cEmailTextBox'
						Container='spnSWTechContactEmail'
						MaxLength='100'
						RexErrorMessage='The Statewide Technology Contact Email Address is incorrectly formatted. Use the following format to enter the email address: test@test.edu or test@test.edu.au.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LegalResearchDesc'>
					<Control ID='txtLegalResearchDesc' 
						Type='cTextArea' 
						Container='spnLegalResearchDesc' 
						MaxLength='100'
						Rows='2' 
						Cols='55'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='True' CreateNew='True' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LegalResearchSoftware'>
					<Control ID='ctlLegalResearchSoftware'
						Container='spnLegalResearchSoftware'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscSoftwareProduct'
						DisplayValue='Description'
						StoredValue='LscSoftwareProductID'
						RepeatColumns='0'
						CellSpacing='12'
						RepeatDirection='Horizontal'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
							<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
							<Argument PropertyKey='InUse' Value='True' CreateNew='True' Update='True'/>
						</DefaultValues>
						<Filters>
							<Argument PropertyKey='LscSoftwareTypeID' Value='13' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RemoteAccessSoftware'>
					<Control ID='ctlRemoteAccessSWType'
						Container='spnRemoteAccessSWType'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscSoftwareProduct'
						DisplayValue='Description'
						StoredValue='LscSoftwareProductID'
						RepeatColumns='0'
						CellSpacing='12'
						RepeatDirection='Horizontal'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
							<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
							<Argument PropertyKey='InUse' Value='True' CreateNew='True' Update='True'/>
						</DefaultValues>
						<Filters>
							<Argument PropertyKey='LscSoftwareTypeID' Value='15' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SocialMediaTypes'>
					<Control ID='ctlSocialMediaTypes'
						Container='spnSocialMediaTypes'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscSoftwareProduct'
						DisplayValue='Description'
						StoredValue='LscSoftwareProductID'
						RepeatColumns='0'
						CellSpacing='12'
						RepeatDirection='Vertical'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
							<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
							<Argument PropertyKey='InUse' Value='True' CreateNew='True' Update='True'/>
						</DefaultValues>
						<Filters>
							<Argument PropertyKey='LscSoftwareTypeID' Value='20' />
						</Filters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutomatedFormsTypes'>
					<Control ID='ctlAutomatedFormsTypes'
						Container='spnAutomatedFormsTypes'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscSoftwareProduct'
						DisplayValue='Description'
						StoredValue='LscSoftwareProductID'
						RepeatColumns='0'
						CellSpacing='12'
						RepeatDirection='Vertical'>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
							<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
							<Argument PropertyKey='InUse' Value='True' CreateNew='True' Update='True'/>
						</DefaultValues>
						<Filters>
							<Argument PropertyKey='LscSoftwareTypeID' Value='21' />
						</Filters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		 <DataObject Key='LscTechnology' DataObjectDefinitionKey='LscTechnology' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID' />
			</DefaultValues>
			<DisplayProperties>
				    <DisplayProperty PropertyKey='ConnectivityBtAll'>
					    <Control ID='ctlConnectivityBtAll'
						Container='spnConnectivityBtAll'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RequiredField='False'
						RepeatColumns='0'>						
					    <Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                        </Parameters>
					    </Control>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='AccessFilesAcrossOffices'>
					    <Control ID='ctlAccessFilesAcrossOffices'
						Container='spnAccessFilesAcrossOffices'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RequiredField='False'
						RepeatColumns='0'>						
					    <Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                        </Parameters>
					    </Control>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='SearchFilesAcrossOffices'>
					    <Control ID='ctlSearchFilesAcrossOffices'
						Container='spnSearchFilesAcrossOffices'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RequiredField='False'
						RepeatColumns='0'>						
					    <Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                        </Parameters>
					    </Control>
				    </DisplayProperty>
				    <DisplayProperty PropertyKey='DialUp'>
					<Control ID='ctlDialUp'
						Container='spnDialUp'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Dsl'>
					<Control ID='ctlDsl'
						Container='spnDsl'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Isdn'>
					<Control ID='ctlIsdn'
						Container='spnIsdn'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Frame'>
					<Control ID='ctlFrame'
						Container='spnFrame'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='T1'>
					<Control ID='ctlT1'
						Container='spnT1'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Cable'>
					<Control ID='ctlCable'
						Container='spnCable'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Satellite'>
					<Control ID='ctlSatellite'
						Container='spnSatellite'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FiberOptics'>
					<Control ID='ctlFiberOptics'
						Container='spnFiberOptics'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='T3DS3'>
					<Control ID='ctlT3DS3'
						Container='spnT3DS3'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='ctlOther'
						Container='spnOther'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Describe'>
					<Control ID='txtDescribe' 
						Type='cTextArea' 
						Container='spnDescribe' 
						MaxLength='50'
						Rows='2' 
						Cols='25'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Bandwidth'>
					<Control ID='txtBandwidth' 
						Type='cTextBox' 
						Container='spnBandwidth' 
						Size='50'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServerHostingOnsite'>
					<Control ID='rdoServerHostingOnsite'
						Type='cRadioButtonList'
						Container='spnServerHostingOnsite'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='ServerHostingExternal'>
					<Control ID='rdoServerHostingExternal'
						Type='cRadioButtonList'
						Container='spnServerHostingExternal'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='Virtualization'>
					<Control ID='rdoVirtualization'
						Type='cRadioButtonList'
						Container='spnVirtualization'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='VirtualDesktop'>
					<Control ID='rdoVirtualDesktop'
						Type='cRadioButtonList'
						Container='spnVirtualDesktop'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='Videoconf'>
					<Control ID='rdoVideoconf'
						Type='cRadioButtonList'
						Container='spnVideoconf'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='VideoconfWebBased'>
					<Control ID='rdoVideoconfWebBased'
						Type='cRadioButtonList'
						Container='spnVideoconfWebBased'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='VideoconfStandalone'>
					<Control ID='rdoVideoconfStandalone'
						Type='cRadioButtonList'
						Container='spnVideoconfStandalone'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='VideoconfConnectExternal'>
					<Control ID='rdoVideoconfConnectExternal'
						Type='cRadioButtonList'
						Container='spnVideoconfConnectExternal'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='Webconf'>
					<Control ID='rdoWebconf'
						Type='cRadioButtonList'
						Container='spnWebconf'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>					
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSoftwareGrid'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
				  <Control ID='ctlTechnologyDefinitions' Container='spnTechnologyDefinitions' Type='cLink' Caption='Click here for technology definitions.'>
					<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
					  <Parameters>
						<Argument Value='TechnologyDefinitions' />
					  </Parameters>
					</Action>
				  </Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
