<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cTechnology" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->

<!-- Instructions section -->
<br/>
<table id="Table1" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
	<tr>
	  <td><h1>Current Applicant Technology (Form K-1)</h1>
        <strong>Calendar Year: 2009 (For Grant Application 2010)</strong></td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" ><p>The<strong> Current Applicant Technology (Form K-1)</strong> page captures data on Applicant&rsquo;s staffing and office technology capacity at the time the Current Applicant Technology (Form K-1) is completed.&nbsp; Please refer to the technology definitions below in responding to the technology questions in Current Applicant Technology (Form K-1) and Tech Software (Form K-2).</p>
              <ul>
                <li><font color="#990000"><strong>All applicants must complete the Current Applicant Technology (Form K-1) page. </strong></font></li>
                <li> Include employees who are paid in full or in part with LSC funds. </li>
                <li> Use whole numbers without decimal points when entering percentages in the form. For example, enter the whole number 50 if the proportion of staff using an application is 50% or one-half<em>.</em></li>
                <li>All fields marked with an asterisk (*) are required.</li>
                <li>Enter information in the fields below and click <strong>Save</strong>.</li>
                <li>To continue to the next page, click <strong>Continue</strong>.</li>
                <li><strong>Computer Capacity:</strong> indicate &ldquo;yes&rdquo; or &ldquo;no&rdquo; as appropriate to each of the three questions on computer capacity. </li>
                <li><strong>Access to Automated Research:</strong> report the percent of case handlers who have access to automated research. </li>
                <li><strong>Degree of Connectivity:</strong> respond &ldquo;yes&rdquo; or &ldquo;no&rdquo; as appropriate to the questions regarding network capacity. </li>
                <li><strong>Internet Access:</strong> respond &ldquo;yes&rdquo; or &ldquo;no&rdquo; as appropriate to the questions regarding Applicant&rsquo;s offices internet connection. </li>
                <li> <strong>Telephones:</strong> respond appropriately to the questions regarding Applicant&rsquo;s telephone system. </li>
                <li><span runat='server' id='spnTechnologyDefinitions' /> </li>
              </ul>
              <p><strong> Follow the steps below for assistance on this form: </strong></p>
              <ul>
                <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
                <li> Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>. </li>
                <li> Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov"> haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours.</li>
              </ul></td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
      </table></td>
  </tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- Computer Capacity section -->
<table id="Table2" border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg">Computer Capacity</td>
	</tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
  </tr>
	<tr>
	  <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr  valign="top">
          <td width="63%"><strong>Does each employee have a computer at their desk with sufficient computing capacity to 
efficiently and effectively run applications critical to the successful fulfillment of their job 
duties? <%=kDenoteRequiredField%></strong></td>
          <td width="7%">&nbsp;</td>
          <td width="30%"><span runat='server' id="spnComputerCapacityDesk" />
          </td>
        </tr>
        <tr  valign="top">
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr  valign="top">
          <td><strong>Does each employee receive regular and sufficient training to effectively use all applications 
critical to the successful fulfillment of their job duties? <%=kDenoteRequiredField%></strong></td>
          <td>&nbsp;</td>
             <td width="30%"><span runat='server' id="spnComputerCapacityTraining" />
           </td>
        </tr>
      </table></td>
  </tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	
<!-- Access to Automated Research -->
	<tr>
		<td class="SeparatorHdg" colspan="4">Access to Automated Research</td>
  </tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
  </tr>
	<tr>
	  <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr  valign="top">
          <td width="67%"><strong>Percentage of case handlers who have desktop access to legal research: 
          <%=kDenoteRequiredField%></strong><br>
          </td>
          <td><span id='spnAccessResearchDesktop' runat='server'/>%</td>
        </tr>
        <tr  valign="top">
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr  valign="top">
          <td><strong>Percentage of case handlers who have other access to automated legal research: 
          <%=kDenoteRequiredField%></strong></td>
           <td><span id='spnAccessResearchOther' runat='server'/>%</td>
        </tr>
        <tr  valign="top">
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Percentage of case handlers who do not have other access to automated legal research: <%=kDenoteRequiredField%></strong></td>
           <td><span id='spnAccessResearchNone' runat='server'/>%</td>
        </tr>
      </table></td>
  </tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
  </tr>
  
  
<!-- Degree of Connectivity -->
	<%--<tr>
		<td class="SeparatorHdg" colspan="4"><strong>Degree of Connectivity</strong></td>
  </tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
  </tr>
	<tr>
	  <td colspan="4"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="6"><strong>Are program computers networked:</strong></td>
        </tr>
        <tr>
          <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
          <td width="29%">Within any one office? <%=kDenoteRequiredField%></td>
          <td width="30%"><span runat='server' id="spnConnectivityWiOne" /></td>
          <td width="25%">Within all program offices? <%=kDenoteRequiredField%></td>
          <td width="30%"><span runat='server' id="spnConnectivityWiAll" /></td>
        </tr>

        <tr>
          <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
          <td>Between any two offices? <%=kDenoteRequiredField%></td>
          <td width="30%"><span runat='server' id="spnConnectivityBtTwo" /></td>
          <td>Between all program offices? <%=kDenoteRequiredField%></td>
          <td width="30%"><span runat='server' id="spnConnectivityBtAll" /></td>
        </tr>
      </table></td>
  </tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
  </tr>
  --%>
 
<!-- Internet Access section-->
	<%--<tr>
		<td class="SeparatorHdg" colspan="4">Internet Access</td>
  </tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
  </tr>
	<tr>
	  <td colspan="4"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="6"><strong>How are your offices connected to the Internet?</strong></td>
        </tr>
        <tr>
          <td colspan="6">&nbsp;</td>
        </tr>
        <tr>
          <td width="20%">Dial-up? <%=kDenoteRequiredField%></td>
          <td width="30%"><span runat='server' id="spnDialUp" /></td>
          <td width="20%">DSL? <%=kDenoteRequiredField%></td>
          <td width="30%"><span runat='server' id="spnDsl" /></td>
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
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
  </tr>
  --%>
<!-- Telephones section-->
	<tr>
		<td class="SeparatorHdg" colspan="4">Telephones</td>
  </tr>
	<tr>
	  <td colspan="4">&nbsp;</td>
  </tr>
	<tr>
	  <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr  valign="top">
          <td width="61%"><strong>Do you use voice-over IP? <%=kDenoteRequiredField%></strong><br>
          </td>
          <td width="30%"><span runat='server' id="spnVoiceOverIp" />
          </td>
        <tr  valign="top">
          <td>If Yes, what type of network connection are you using?</td>
          <td colspan="2"><span runat='server' id="spnVoiceOverIpNetwork" /></td>
        </tr>
        <tr  valign="top">
          <td>&nbsp;</td>
          <td colspan="2">
          Limit: 75 characters</td>
        </tr>
        <tr  valign="top">
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr  valign="top">
          <td height="22">What is the bandwidth of the connection?</td>
          <td colspan="2"><span runat='server' id="spnVoiceOverIpBandwidth" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">&nbsp;</td>
          <td colspan="2">Limit: 75 characters</td>
        </tr>
        <tr  valign="top">
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr  valign="top">
          <td height="22">What type of router are you using?</td>
          <td colspan="2"><span runat='server' id="spnVoiceOverIpRouter" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">&nbsp;</td>
          <td colspan="2">Limit: 75 characters</td>
        </tr>

        <tr  valign="top">
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr  valign="top">
          <td height="22">What is the name of the phone system you are using?</td>
          <td colspan="2"><span runat='server' id="spnPhoneSystemName" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">&nbsp;</td>
          <td colspan="2">Limit: 75 characters</td>
        </tr>
        <tr  valign="top">
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
        </tr>
        
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>How many phone numbers do you publish for intake in your service area(s)? 
          <%=kDenoteRequiredField%></strong></td>
          <td colspan="2"><span runat='server' id="spnIntakePhone" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">If more than one, are phone numbers directed to different office locations?</td>
          <td><span runat='server' id="spnIntakeDirect" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">If more than one, may calls to one intake number be answered at a different location?</td>
          <td><span runat='server' id="spnIntakeMay" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>Number of incoming lines available at each phone number <%=kDenoteRequiredField%></b></td>
          <td colspan="2"><span runat='server' id="spnIntakeIncoming" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>What is the maximum number of calls your phone system can receive at the same time? 
          <%=kDenoteRequiredField%></b></td>
          <td colspan="2"><span runat='server' id="spnIntakeMaximum" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr> 
        <tr  valign="top">
          <td height="22"><strong>Do you use voice mail for intake calls? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnVoiceMail" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Do you use automated attendant technology intake? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnIntakeAutomated" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Does your phone system have automatic call distribution? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnCallDistribution" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">If so, can callers self-direct their call?</td>
          <td><span runat='server' id="spnSelfDirect" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">If callers can self-direct, can they self-select to leave a message?</td>
          <td><span runat='server' id="spnSelfSelect" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Does your  system offer callers the choice to receive a callback? 
          <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnCallback" /></td>
        </tr>
        <tr  valign="top">
          <td height="22">If yes, does your system return the call automatically?</td>
          <td><span runat='server' id="spnReturnCall" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Does your phone system include computer telephony integration? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnTelephony" /></td>
        </tr>
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Does your system include an interactive voice response feature? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnInteractiveVoice" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Do you have call routing by language, substantive and/or geographic area? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnCallRouting" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Do you have the ability to serve persons with speaking or hearing disabilities through access to TTY or relay service? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnDisabledAccess" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Do you have the capacity to review wait times, dropped calls? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnReviewWaitTime" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Do you have the ability to provide recorded information to callers while waiting or after hours? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnProvideRecordedInfo" /></td>
        </tr>

        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><strong>Do you have the capacity to enter data in real time into the case management system as intake is being accomplished including eligibility and appropriate case type data? <%=kDenoteRequiredField%></strong></td>
          <td><span runat='server' id="spnRealTimeDataEntry" /></td>
        </tr>

      </table></td>
  </tr>
</table>	

<p align="center">
  <span runat='server' id='spnSave' />
  <span runat='server' id='spnSave_and_Continue'/>
</p>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	    <DataObject Key='LscTechnology' DataObjectDefinitionKey='LscTechnology' Updatable='True' CreateNew='True'>
	        <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value=''/>
			</Filters> 
			<DefaultValues>
			    <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>

			  <DisplayProperty PropertyKey='ComputerCapacityDesk'>
					<Control ID='ctlComputerCapacityDesk'
						Container='spnComputerCapacityDesk'
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
				<DisplayProperty PropertyKey='ComputerCapacityTraining'>
					<Control ID='ctlComputerCapacityTraining'
						Container='spnComputerCapacityTraining'
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
				<DisplayProperty PropertyKey='AccessResearchDesktop'>
					<Control ID='ctlAccessResearchDesktop'
						Container='spnAccessResearchDesktop'
						Type='cTextBox'
						MaxLength='5'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='The field "Percentage of case handlers who have desktop access to legal research:" must be a whole number between 0 and 100, inclusive.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccessResearchOther'>
					<Control ID='ctlAccessResearchOther'
						Container='spnAccessResearchOther'
						Type='cTextBox'
						MaxLength='5'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='The field "Percentage of case handlers who have other access to automated legal research:" must be a whole number between 0	and 100, inclusive.'/>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='AccessResearchNone'>
					<Control ID='ctlAccessResearchNone'
						Container='spnAccessResearchNone'
						Type='cTextBox'
						MaxLength='5'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='The field "Percentage of case handlers who do not have other access to automated legal research:" must be a whole number between 0	and 100, inclusive.'/>
					</Control>
				</DisplayProperty>

			<%--	<DisplayProperty PropertyKey='ConnectivityWiOne'>
					<Control ID='ctlConnectivityWiOne'
						Container='spnConnectivityWiOne'
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
				<DisplayProperty PropertyKey='ConnectivityWiAll'>
					<Control ID='ctlConnectivityWiAll'
						Container='spnConnectivityWiAll'
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
			    <DisplayProperty PropertyKey='ConnectivityBtTwo'>
					<Control ID='ctlConnectivityBtTwo'
						Container='spnConnectivityBtTwo'
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
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey='DialUp'>
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
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='VoiceOverIp'>
					<Control ID='ctlVoiceOverIp'
						Container='spnVoiceOverIp'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VoiceOverIpNetwork'>
					<Control ID='ctlVoiceOverIpNetwork'
						Container='spnVoiceOverIpNetwork'
						Type='cTextBox'
						MaxLength='75'
						Size='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VoiceOverIpBandwidth'>
					<Control ID='ctlVoiceOverIpBandwidth'
						Container='spnVoiceOverIpBandwidth'
						Type='cTextBox'
						MaxLength='75'
						Size='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VoiceOverIpRouter'>
					<Control ID='ctlVoiceOverIpRouter'
						Container='spnVoiceOverIpRouter'
						Type='cTextBox'
						MaxLength='75'
						Size='50'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PhoneSystemName'>
					<Control ID='ctlPhoneSystemName'
						Container='spnPhoneSystemName'
						Type='cTextBox'
						MaxLength='75'
						Size='50'>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='IntakePhone'>
					<Control ID='ctlIntakePhone'
						Container='spnIntakePhone'
						Type='cTextBox'
						MaxLength='5'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100000'
							ErrorMessage='The field "How many phone numbers do you publish for intake in your service area(s)?" must be a whole number, 0 inclusive.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IntakeDirect'>
					<Control ID='ctlIntakeDirect'
						Container='spnIntakeDirect'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IntakeMay'>
					<Control ID='ctlIntakeMay'
						Container='spnIntakeMay'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='IntakeIncoming'>
					<Control ID='ctlIntakeIncoming'
						Container='spnIntakeIncoming'
						Type='cTextBox'
						MaxLength='5'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100000'
							ErrorMessage='The field "Number of incoming lines available at each phone number" must be a whole number, 0 inclusive.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IntakeMaximum'>
					<Control ID='ctlIntakeMaximum'
						Container='spnIntakeMaximum'
						Type='cTextBox'
						MaxLength='5'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100000'
							ErrorMessage='The field "What is the maximum number of calls your phone system can receive at the same time?" must be a whole number, 0 inclusive.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='VoiceMail'>
					<Control ID='ctlVoiceMail'
						Container='spnVoiceMail'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IntakeAutomated'>
					<Control ID='ctlIntakeAutomated'
						Container='spnIntakeAutomated'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CallDistribution'>
					<Control ID='ctlCallDistribution'
						Container='spnCallDistribution'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SelfDirect'>
					<Control ID='ctlSelfDirect'
						Container='spnSelfDirect'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SelfSelect'>
					<Control ID='ctlSelfSelect'
						Container='spnSelfSelect'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Callback'>
					<Control ID='ctlCallback'
						Container='spnCallback'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReturnCall'>
					<Control ID='ctlReturnCall'
						Container='spnReturnCall'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Telephony'>
					<Control ID='ctlTelephony'
						Container='spnTelephony'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='InteractiveVoice'>
					<Control ID='ctlInteractiveVoice'
						Container='spnInteractiveVoice'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CallRouting'>
					<Control ID='ctlCallRouting'
						Container='spnCallRouting'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='DisabledAccess'>
					<Control ID='ctlDisabledAccess'
						Container='spnDisabledAccess'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='ReviewWaitTime'>
					<Control ID='ctlReviewWaitTime'
						Container='spnReviewWaitTime'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='ProvideRecordedInfo'>
					<Control ID='ctlProvideRecordedInfo'
						Container='spnProvideRecordedInfo'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='RealTimeDataEntry'>
					<Control ID='ctlRealTimeDataEntry'
						Container='spnRealTimeDataEntry'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
					<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
			    	<Control ID='btnSave'
                        Container='spnSave'
                        Type='cButton'
                        Image='Save'>
                        <Action
                            PostBack='True'
                            AutoSave='True'/>
                    </Control>
				</DisplayProperty>
			</DisplayProperties>  
	    </DataObject>
	    <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
				  <Control ID='ctlTechnologyDefinitions' Container='spnTechnologyDefinitions' Type='cLink' Caption='Click here to view Technology Definitions.'>
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
