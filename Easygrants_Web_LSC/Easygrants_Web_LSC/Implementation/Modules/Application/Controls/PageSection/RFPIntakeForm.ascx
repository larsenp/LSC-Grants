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
          <td colspan="4" >&nbsp;</td>
    </tr>
    <tr>
          <td valign="top" >
          	<p>Use the RFP Chart to address the technology used in applicant’s intake process.</p>
				<p style="color:red">For those applying to multiple service areas: This RFP Chart is <em>not</em> linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
				<p>All fields are required fields. When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return.</p>
				<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>
		   </td>
           <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/>
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
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
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
       <!-- <tr  valign="top">
          <td height="22"> a. Are phone numbers directed to different office locations?<font color='red'>*</font></td>
          <td><span runat='server' id="spnIntakeDirect" /></td>
        </tr> -->
        <tr  valign="top">
          <td height="22">a. Can calls to an intake number be answered at more than one location?<font color='red'>*</font></td>
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

        <!--<tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>13. Do you have the capacity to enter data in real time into the case management system as intake is being accomplished including eligibility and appropriate case type data?<font color='red'>*</font></b></td>
          <td><span runat='server' id="spnRealTimeDataEntry" /></td>
        </tr> -->
        <tr  valign="top">
          <td height="22" colspan="3"><hr noshade="noshade" /></td>
        </tr>
        <tr  valign="top">
          <td height="22"><b>13. Does your program provide an online intake option for prospective clients to apply for services?<font color='red'>*</font></b></td>
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
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveCloseStd' />
			<span runat='server' id='spnSaveClosePPQV' />
		</td>
	</tr>
</table>


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
			    <DisplayProperty PropertyKey='IntakePhone'>
					<Control ID='ctlIntakePhone'
						Container='spnIntakePhone'
						Type='cTextBox'
						MaxLength='3'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999'
							ErrorMessage='The field "How many phone numbers do you publish for intake in your service area(s)?" must be a whole number, 0 to 999 inclusive.'/>
					</Control>
				  </DisplayProperty>
				 <!-- <DisplayProperty PropertyKey='IntakeDirect'>
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
				  </DisplayProperty> -->
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
                 <DisplayProperty PropertyKey='IntakeMaximum'>
					<Control ID='ctlIntakeMaximum'
						Container='spnIntakeMaximum'
						Type='cTextBox'
						MaxLength='3'
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
				<!--<DisplayProperty PropertyKey='RealTimeDataEntry'>
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
				</DisplayProperty> -->
				<DisplayProperty PropertyKey='OnlineIntakeOption'>
					<Control ID='ctlOnlineIntakeOption'
						Container='spnOnlineIntakeOption'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OnlineIntakeXferCms'>
					<Control ID='ctlOnlineIntakeXferCms'
						Container='spnOnlineIntakeXferCms'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
                        <Parameter StoredValue='True' DisplayValue='Yes'/>
                        <Parameter StoredValue='False' DisplayValue='No'/>
                    </Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OnlineIntakeA2J'>
					<Control ID='ctlOnlineIntakeA2J'
						Container='spnOnlineIntakeA2J'
						Type='cRadioButtonList'
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
        
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False' >
			 <Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToCriterion'
						Type='cLabel'
						Container='spnReturnToCriterion'
						LabelText='Save and Return to Criterion Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lblReturnToPA'
						Type='cLabel'
						Container='spnReturnToPA'
						LabelText='Save and Return to Performance Area Page'>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveCloseStd'
						Type='cButton'
						Container='spnSaveCloseStd'
						Caption='Save and Return to Criterion Page'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="AppFormByCriterion"/>
								<Argument Type='QueryString' TypeKey='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='2'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClosePPQV'
						Type='cButton'
						Container='spnSaveClosePPQV'
						Caption='Save and Return to Performance Area Page'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value="PostPQVPA2"/>
							</Parameters>
						</Action>
						<Visible>
							<Argument PropertyKey='WfTaskID' Value='66'/>
						</Visible>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
				  <Control ID='ctlIntakesysTechnologyDefinitions' Container='spnIntakeSysTechDefinitions' Type='cLink' Caption='Click here for Intake System technology definitions.'>
					<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
					  <Parameters>
						<Argument Value='IntakeSystemTechnologyDefinitions' />
						<Argument Type='QueryString' TypeKey='LscReviewCriterionID' BaseValue='LscReviewCriterionID='/>
					  </Parameters>
					</Action>
				  </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

    </ModuleSection>
</span>