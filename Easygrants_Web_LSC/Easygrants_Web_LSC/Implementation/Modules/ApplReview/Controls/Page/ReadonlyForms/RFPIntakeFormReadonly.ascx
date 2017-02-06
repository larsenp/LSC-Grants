<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cTechnology" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='600' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Intake System Technology </h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area Two, Criterion 1 - <i>Dignity and sensitivity:</i></b> </td>
	</tr>
     <tr>
          <td colspan="4" >&nbsp;</td>
    </tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
    <tr>
          <td valign="top" >
          		<p>Competitive grant Applicants must complete this form for each service area for which they are competing.</p> 
    			<p>Use the web form below to address the technology used in Applicant’s intake process.  Complete this form by selecting the appropriate choice for each inquiry.  Each inquiry in the form must be answered before the form can be submitted.  Click the save button below once the form is completed and return to the proposal narrative. </p> 
				<p><b><u>Do not paste this form into the proposal narrative. </u></b> Email questions pertaining to this form to the competition service desk at  <a href="mailto:competition@lsc.gov"> <u>competition@lsc.gov.</u></a></p>
		   </td>
    </tr>
    <tr>
          <td colspan="4" >&nbsp;</td>
    </tr>
    <tr>
        <td><p><span runat='server' id='spnIntakeSysTechDefinitions' /></p></td>
    </tr>
</table>
<br />
<br />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
		    <td colspan="2" class="SeparatorHdg" >Intake Form</td>
	    </tr>
	    <tr><td>&nbsp;</td></tr>
        <tr  valign="top">
          <td width="61%"></td>
          <td width="30%"></td>
        </tr>
        <tr  valign="top">
          <td height="22" ><b>1. How many phone numbers do you publish for intake in your service area(s)?<font color='red'>*</font></b></td>
          <td colspan="2" ><span runat='server' id="spnIntakePhone" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"> a. Are phone numbers directed to different office locations?<font color='red'>*</font></td>
          <td><span runat='server' id="spnIntakeDirect" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">b. Can calls to an intake number be answered at a different location?<font color='red'>*</font></td>
          <td><span runat='server' id="spnIntakeMay" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>2. What is the maximum number of calls your phone system can receive at the same time?<font color='red'>*</font></b></td>
          <td colspan="2"><span runat='server' id="spnIntakeMaximum" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr> 
        <tr  valign="top">
          <td height="22"><b>3. Does your phone system have the capacity for voice mail for intake calls?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnVoiceMail" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>4. Does your phone system have the capacity for automated attendant technology for intake?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnIntakeAutomated" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>5. Does your phone system have automatic call distribution?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnCallDistribution" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">a. If so, can callers self-direct their call?<font color='red'>*</font></td>
          <td><span runat='server' id="spnSelfDirect" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">b. If callers can self-direct, can they self-select to leave a message?<font color='red'>*</font></td>
          <td><span runat='server' id="spnSelfSelect" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>6. Does your  system offer callers the choice to receive a callback?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnCallback" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">a. If yes, does your system return the call automatically?<font color='red'>*</font></td>
          <td><span runat='server' id="spnReturnCall" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>7. Does your phone system include computer telephony integration?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnTelephony" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>8. Does your system include an interactive voice response feature?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnInteractiveVoice" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>9. Does your system have call routing by language, substantive and/or geographic area?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnCallRouting" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>10. Does your system have the ability to serve persons with speaking or hearing disabilities through access to TTY or relay service or other mechanism (e.g.; email or text messaging)?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnDisabledAccess" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>11.Does your system have the capacity to review wait times in queue, dropped calls?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnReviewWaitTime" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>12. Does your system have the ability to provide recorded information to callers while waiting or after hours?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnProvideRecordedInfo" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>13. Do you have the capacity to enter data in real time into the case management system as intake is being accomplished including eligibility and appropriate case type data?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnRealTimeDataEntry" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>14. Does your program provide an online intake option for prospective clients to apply for services?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnOnlineIntakeOption" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">a. If yes, is the data electronically transferred into your CMS?<font color='red'>*</font></td>
          <td><span runat='server' id="spnOnlineIntakeXferCms" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">b. If yes, are you using an A2J interview?<font color='red'>*</font></td>
          <td><span runat='server' id="spnOnlineIntakeA2J" /></td>
        </tr>
</table>
<br />
<br />



<span id='spnConfigXML' visible='false' runat='server'> 
    <ModuleSection>
        <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
				<Argument Group='(' Bool='And' />
				<Argument PropertyKey='WfTaskID' Value='2' Bool='' />
				<Argument PropertyKey='WfTaskID' Value='66'  Bool='Or' />
				<Argument Group=')' Bool='' />
			</Filters>
		</DataObject>
        <DataObject Key='LscTechnology' DataObjectDefinitionKey='LscTechnology' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
	         <%--<Filters>
				    <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			    </Filters> 
			    <DefaultValues>
			        <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    </DefaultValues>--%>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='IntakePhone' >
					<Control ID='spnIntakePhone'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='IntakeDirect' Format='YesNo'>
					<Control ID='spnIntakeDirect'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
                  <DisplayProperty PropertyKey='IntakeMay' Format='YesNo'>
					<Control ID='spnIntakeMay'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
                 <DisplayProperty PropertyKey='IntakeMaximum' >
					<Control ID='spnIntakeMaximum'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
                  <DisplayProperty PropertyKey='VoiceMail' Format='YesNo'>
					<Control ID='spnVoiceMail'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IntakeAutomated' Format='YesNo'>
					<Control ID='spnIntakeAutomated'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CallDistribution' Format='YesNo'>
					<Control ID='spnCallDistribution'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SelfDirect' Format='YesNo'>
					<Control ID='spnSelfDirect'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SelfSelect' Format='YesNo'>
					<Control ID='spnSelfSelect'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Callback' Format='YesNo'>
					<Control ID='spnCallback'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReturnCall' Format='YesNo'>
					<Control ID='spnReturnCall'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telephony' Format='YesNo'>
					<Control ID='spnTelephony'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='InteractiveVoice' Format='YesNo'>
					<Control ID='spnInteractiveVoice'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CallRouting' Format='YesNo'>
					<Control ID='spnCallRouting'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DisabledAccess' Format='YesNo'>
					<Control ID='spnDisabledAccess'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReviewWaitTime' Format='YesNo'>
					<Control ID='spnReviewWaitTime'
						Type='HtmlGenericControl' />
				</DisplayProperty>

				<DisplayProperty PropertyKey='ProvideRecordedInfo' Format='YesNo'>
					<Control ID='spnProvideRecordedInfo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RealTimeDataEntry' Format='YesNo'>
					<Control ID='spnRealTimeDataEntry'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OnlineIntakeOption' Format='YesNo'>
					<Control ID='spnOnlineIntakeOption'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OnlineIntakeXferCms' Format='YesNo'>
					<Control ID='spnOnlineIntakeXferCms'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OnlineIntakeA2J' Format='YesNo'>
					<Control ID='spnOnlineIntakeA2J'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            </DisplayProperties>
        </DataObject>
        
        <DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
				  <Control ID='ctlIntakesysTechnologyDefinitions' Container='spnIntakeSysTechDefinitions' Type='cLink' Caption='Click here for Intake System technology definitions.'>
					<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
					  <Parameters>
						<Argument Value='IntakeSystemTechnologyDefinitions' />
					  </Parameters>
					</Action>
				  </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

    </ModuleSection>
</span>