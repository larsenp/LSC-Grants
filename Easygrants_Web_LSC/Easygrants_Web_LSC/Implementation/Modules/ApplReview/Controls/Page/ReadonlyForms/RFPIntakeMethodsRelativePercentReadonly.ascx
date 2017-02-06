<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br/>
<table width='800' border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td ><h1>Intake Methods: Relative Percent and Time Elapsed Before Receiving Service</h1></td>
	</tr>
    <tr>
		<td ><b>Performance Area Two, Criterion 1 - <i>Intake Methods: Relative Percent and Time Elapsed Before Receiving Service</i></b> </td>
	</tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
	<tr>
        <td colspan="4" class="SeparatorHdg">Instructions</td>
    </tr>
     <tr><td colspan="4" >&nbsp;</td></tr>
    <tr>
        <td>
		  		<p>Enter the relative percentage of intake applications processed for each method of intake, using whole numbers. All percentages must total 100%.</p>
            <p>Then, for each type of intake, enter the average amount of time it takes from the prospective clients’ initial contact with the program until the prospective client receives the service indicated. Enter the time by using numbers with up to one decimal place, and selecting a unit of time from the drop-down menu.</p>
            <p>If the applicant does not use a given intake method, enter 0 for the percentage of applications, and leave all other items blank.</p>
				<p>All the percentage fields are required fields. The amount of time fields are required if the applicant uses the intake method. </p>
				<p style="color:red">For those applying to multiple service areas: This RFP Chart is <em>not</em> linked across service areas. Applicants should enter information into this form that is specific to this service area.</p>
				<p>When finished, click the <strong><span runat='server' id='spnReturnToCriterion'/><span runat='server' id='spnReturnToPA'/></strong> button to return to the criterion.</p>
				<p>Email questions pertaining to this RFP Chart to <a href='mailto:competition@lsc.gov'>competition@lsc.gov</a>.</p>
				</td>
         <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
    </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />
<table width='100%' cellpadding='0' cellspacing='0'>
    <tr>
        <td  colspan='2' class="SeparatorHdg" >Intake Methods: Relative Percent and Time Elapsed Before Receiving Service</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
       <td width="300"><b><span runat='server' id='spnLSCRFPRIntakeTypesLKPID1' /></b></td>
       <td width="25">&nbsp;</td>
       <td width="25" align="left">&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Percentage of Intake applications for this method:<font color='red'>*</font></td>
        <td><span runat='server' id='spnIntakePercentage1'/></td>
        <td>%</td>
    </tr>
    <tr>
        <td colspan='2'><i>If this intake method is not used, enter 0 for the percentage, and leave all other items blank.</i></td>
        <td>&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td colspan='2'><b>How much time elapses between the initial phone call until the prospective client..</b></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>First speaks to an intake worker?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSpeakWorkerTimeAmt' /></td>
        <td><span runat='server' id='spnSpeakWorkerTPTypeID' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Has a substantive interview?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSubstantiveInterviewTimeAmt' /></td>
        <td><span runat='server' id='spnSubstantiveInterviewTPTypeID' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives counsel and advice?<font color='red'>*</font></td>
        <td><span runat='server' id='spnCounselAdviceTimeAmt' /></td>
        <td><span runat='server' id='spnCounselAdviceTPTypeID' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)<font color='red'>*</font></td>
        <td><span runat='server' id='spnLimitedActionTimeAmt' /></td>
        <td><span runat='server' id='spnLimitedActionTPTypeID' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?<font color='red'>*</font></td>
        <td><span runat='server' id='spnInvestigationEvalTimeAmt' /></td>
        <td><span runat='server' id='spnInvestigationEvalTPTypeID' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br />
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
       <td width="300"><b><span runat='server' id='spnLSCRFPRIntakeTypesLKPID2' /></b></td>
       <td width="25">&nbsp;</td>
       <td width="25" align="left">&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Percentage of Intake applications for this method:<font color='red'>*</font></td>
        <td><span runat='server' id='spnIntakePercentage2'/></td>
        <td>%</td>
    </tr>
    <tr>
        <td colspan='2'><i>If this intake method is not used, enter 0 for the percentage, and leave all other items blank.</i></td>
        <td>&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td colspan='2'><b>How much time elapses between the initial walk-in until the prospective client..</b></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>First speaks to an intake worker?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSpeakWorkerTimeAmt2' /></td>
        <td><span runat='server' id='spnSpeakWorkerTPTypeID2' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Has a substantive interview?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSubstantiveInterviewTimeAmt2' /></td>
        <td><span runat='server' id='spnSubstantiveInterviewTPTypeID2' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives counsel and advice?<font color='red'>*</font></td>
        <td><span runat='server' id='spnCounselAdviceTimeAmt2' /></td>
        <td><span runat='server' id='spnCounselAdviceTPTypeID2' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)<font color='red'>*</font></td>
        <td><span runat='server' id='spnLimitedActionTimeAmt2' /></td>
        <td><span runat='server' id='spnLimitedActionTPTypeID2' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?<font color='red'>*</font></td>
        <td><span runat='server' id='spnInvestigationEvalTimeAmt2' /></td>
        <td><span runat='server' id='spnInvestigationEvalTPTypeID2' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br />
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
       <td width="300"><b><span runat='server' id='spnLSCRFPRIntakeTypesLKPID3' /></b></td>
       <td width="25">&nbsp;</td>
       <td width="25" align="left">&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Percentage of Intake applications for this method:<font color='red'>*</font></td>
        <td><span runat='server' id='spnIntakePercentage3'/></td>
        <td>%</td>
    </tr>
    <tr>
        <td colspan='2'><i>If this intake method is not used, enter 0 for the percentage, and leave all other items blank.</i></td>
        <td>&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td colspan='2'><b>How much time elapses between the initial appointment until the prospective client..</b></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>First speaks to an intake worker?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSpeakWorkerTimeAmt3' /></td>
        <td><span runat='server' id='spnSpeakWorkerTPTypeID3'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Has a substantive interview?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSubstantiveInterviewTimeAmt3' /></td>
        <td><span runat='server' id='spnSubstantiveInterviewTPTypeID3' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives counsel and advice?<font color='red'>*</font></td>
        <td><span runat='server' id='spnCounselAdviceTimeAmt3' /></td>
        <td><span runat='server' id='spnCounselAdviceTPTypeID3'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)<font color='red'>*</font></td>
        <td><span runat='server' id='spnLimitedActionTimeAmt3' /></td>
        <td><span runat='server' id='spnLimitedActionTPTypeID3' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?<font color='red'>*</font></td>
        <td><span runat='server' id='spnInvestigationEvalTimeAmt3' /></td>
        <td><span runat='server' id='spnInvestigationEvalTPTypeID3' /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br />
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
       <td width="300"><b><span runat='server' id='spnLSCRFPRIntakeTypesLKPID4' /></b></td>
       <td width="25">&nbsp;</td>
       <td width="25" align="left">&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Percentage of Intake applications for this method:<font color='red'>*</font></td>
        <td><span runat='server' id='spnIntakePercentage4' /></td>
        <td>%</td>
    </tr>
    <tr>
        <td colspan='2'><i>If this intake method is not used, enter 0 for the percentage, and leave all other items blank.</i></td>
        <td>&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td colspan='2'><b>How much time elapses between the submission of the online intake application until the prospective client..</b></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>First speaks to an intake worker?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSpeakWorkerTimeAmt4'/></td>
        <td><span runat='server' id='spnSpeakWorkerTPTypeID4'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Has a substantive interview?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSubstantiveInterviewTimeAmt4'/></td>
        <td><span runat='server' id='spnSubstantiveInterviewTPTypeID4'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives counsel and advice?<font color='red'>*</font></td>
        <td><span runat='server' id='spnCounselAdviceTimeAmt4'/></td>
        <td><span runat='server' id='spnCounselAdviceTPTypeID4'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)<font color='red'>*</font></td>
        <td><span runat='server' id='spnLimitedActionTimeAmt4'/></td>
        <td><span runat='server' id='spnLimitedActionTPTypeID4'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?<font color='red'>*</font></td>
        <td><span runat='server' id='spnInvestigationEvalTimeAmt4' /></td>
        <td><span runat='server' id='spnInvestigationEvalTPTypeID4'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br />
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
       <td width="300"><b><span runat='server' id='spnLSCRFPRIntakeTypesLKPID5' /></b></td>
       <td width="25">&nbsp;</td>
       <td width="25" align="left">&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Percentage of Intake applications for this method:<font color='red'>*</font></td>
        <td><span runat='server' id='spnIntakePercentage5' /></td>
        <td>%</td>
    </tr>
    <tr>
        <td colspan='3'><i>If this intake method is not used, enter 0 for the percentage, and leave all other items blank.</i></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td colspan='3'><b>How much time elapses between the submission of the outreach event until the prospective client..</b></td>
    </tr>
    <tr>
        <td>First speaks to an intake worker?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSpeakWorkerTimeAmt5'/></td>
        <td><span runat='server' id='spnSpeakWorkerTPTypeID5'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Has a substantive interview?<font color='red'>*</font></td>
        <td><span runat='server' id='spnSubstantiveInterviewTimeAmt5'/></td>
        <td><span runat='server' id='spnSubstantiveInterviewTPTypeID5'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives counsel and advice?<font color='red'>*</font></td>
        <td><span runat='server' id='spnCounselAdviceTimeAmt5'/></td>
        <td><span runat='server' id='spnCounselAdviceTPTypeID5'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)<font color='red'>*</font></td>
        <td><span runat='server' id='spnLimitedActionTimeAmt5'/></td>
        <td><span runat='server' id='spnLimitedActionTPTypeID5'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?<font color='red'>*</font></td>
        <td><span runat='server' id='spnInvestigationEvalTimeAmt5' /></td>
        <td><span runat='server' id='spnInvestigationEvalTPTypeID5'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br />
<br />
<table width='600' cellpadding='0' cellspacing='0'>
    <tr>
       <td width="300"><b><span runat='server' id='spnLSCRFPRIntakeTypesLKPID6' /></b></td>
       <td width="25">&nbsp;</td>
       <td width="25" align="left">&nbsp;</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Percentage of Intake applications for this method:</td>
        <td><span runat='server' id='spnIntakePercentageOther1'/></td>
        <td>%</td>
    </tr>
    <tr>
        <td colspan='3'><i>If this intake method is not used, enter 0 for the percentage, and leave all other items blank.</i></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Describe the other type(s) of intake</td>
        <td colspan='2'><span runat='server' id='spnIntakeTypeOtherDesc'/></td>
    </tr>
        <tr><td>&nbsp;</td></tr>
    <tr>
        <td colspan='3'><b>How much time elapses between the submission of the outreach event until the prospective client..</b></td>
    </tr>
    <tr>
        <td>First speaks to an intake worker?</td>
        <td><span runat='server' id='spnSpeakWorkerTimeAmtOther1'/></td>
        <td><span runat='server' id='spnSpeakWorkerTPTypeIDOther1'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Has a substantive interview?</td>
        <td><span runat='server' id='spnSubstantiveInterviewTimeAmtOther1'/></td>
        <td><span runat='server' id='spnSubstantiveInterviewTPTypeIDOther1'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives counsel and advice?</td>
        <td><span runat='server' id='spnCounselAdviceTimeAmtOther1'/></td>
        <td><span runat='server' id='spnCounselAdviceTPTypeIDOther1'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives limited action and/or referral assistance? (for cases in which extended service will not be provided) </td>
        <td><span runat='server' id='spnLimitedActionTimeAmtOther1'/></td>
        <td><span runat='server' id='spnLimitedActionTPTypeIDOther1'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td>Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?</td>
        <td><span runat='server' id='spnInvestigationEvalTimeAmtOther1' /></td>
        <td><span runat='server' id='spnInvestigationEvalTPTypeIDOther1'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br />
<table width='600' cellpadding='0' cellspacing='0'>
  <tr>
       <td width="300"><b>Total intake applications processed </b></td>
       <td width="25"><b><span runat='server' id='spnTotalPercentage'/></b></td>
       <td width="25" align="left">%</td>
   </tr>
   <tr><td><i>This number must equal 100%</i></td>
	   <td>&nbsp;</td>
       <td>&nbsp;</td>
   </tr>
</table>
<br />

<span id='spnConfigXML' visible='false' runat='server'> 
	<ModuleSection> 
	
	    <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskStatusID' Value='3' Operator='NotEqual'/>
				<Argument Group='(' Bool='And'/>
				<Argument PropertyKey='WfTaskID' Value='2' Bool=''/>
				<Argument PropertyKey='WfTaskID' Value='66' Bool='Or'/>
				<Argument Group=')' Bool=''/>
			</Filters>
		</DataObject>
	
	    <DataObject Key='LSCRFPRIntakeTypesLKP' DataObjectDefinitionKey='LSCRFPRIntakeTypesLKP' Updatable='False' CreateNew='False'>
            <Filters>
				<Argument PropertyKey='LSCRFPRIntakeTypesLKPID' Value='1' />
			</Filters>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Description'>
					<Control ID='spnLSCRFPRIntakeTypesLKPID1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		 <DataObject Key='LscRFPIntakeMethodsByType' DataObjectDefinitionKey='LscRFPIntakeMethodsByType' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='1' />
			</Filters>
			<DisplayProperties>
				  <DisplayProperty PropertyKey='IntakePercentage'>
					 <Control ID='spnIntakePercentage1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					 <Control ID='spnSpeakWorkerTimeAmt'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP1.Description'>
					 <Control ID='spnSpeakWorkerTPTypeID'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					 <Control ID='spnSubstantiveInterviewTimeAmt'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP2.Description'>
					 <Control ID='spnSubstantiveInterviewTPTypeID'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					 <Control ID='spnCounselAdviceTimeAmt'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP3.Description'>
					 <Control ID='spnCounselAdviceTPTypeID'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					 <Control ID='spnLimitedActionTimeAmt'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP4.Description'>
					 <Control ID='spnLimitedActionTPTypeID'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					 <Control ID='spnInvestigationEvalTimeAmt'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP5.Description'>
					 <Control ID='spnInvestigationEvalTPTypeID'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			</DisplayProperties>
		  </DataObject>
		  
		  <DataObject Key='LSCRFPRIntakeTypesLKP2' DataObjectDefinitionKey='LSCRFPRIntakeTypesLKP' Updatable='False' CreateNew='False'>
            <Filters>
				<Argument PropertyKey='LSCRFPRIntakeTypesLKPID' Value='2' />
			</Filters>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Description'>
					<Control ID='spnLSCRFPRIntakeTypesLKPID2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		  <DataObject Key='LscRFPIntakeMethodsByType2' DataObjectDefinitionKey='LscRFPIntakeMethodsByType' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='2' />
			</Filters>
			<DisplayProperties>
			 	  <DisplayProperty PropertyKey='IntakePercentage'>
					 <Control ID='spnIntakePercentage2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					 <Control ID='spnSpeakWorkerTimeAmt2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP1.Description'>
					 <Control ID='spnSpeakWorkerTPTypeID2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					 <Control ID='spnSubstantiveInterviewTimeAmt2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP2.Description'>
					 <Control ID='spnSubstantiveInterviewTPTypeID2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					 <Control ID='spnCounselAdviceTimeAmt2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP3.Description'>
					 <Control ID='spnCounselAdviceTPTypeID2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					 <Control ID='spnLimitedActionTimeAmt2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP4.Description'>
					 <Control ID='spnLimitedActionTPTypeID2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					 <Control ID='spnInvestigationEvalTimeAmt2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP5.Description'>
					 <Control ID='spnInvestigationEvalTPTypeID2'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LSCRFPRIntakeTypesLKP3' DataObjectDefinitionKey='LSCRFPRIntakeTypesLKP' Updatable='False' CreateNew='False'>
            <Filters>
				<Argument PropertyKey='LSCRFPRIntakeTypesLKPID' Value='3' />
			</Filters>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Description'>
					<Control ID='spnLSCRFPRIntakeTypesLKPID3'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscRFPIntakeMethodsByType3' DataObjectDefinitionKey='LscRFPIntakeMethodsByType' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='3' />
			</Filters>
			<DisplayProperties>
			      <DisplayProperty PropertyKey='IntakePercentage'>
					 <Control ID='spnIntakePercentage3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					 <Control ID='spnSpeakWorkerTimeAmt3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP1.Description'>
					 <Control ID='spnSpeakWorkerTPTypeID3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					 <Control ID='spnSubstantiveInterviewTimeAmt3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP2.Description'>
					 <Control ID='spnSubstantiveInterviewTPTypeID3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					 <Control ID='spnCounselAdviceTimeAmt3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP3.Description'>
					 <Control ID='spnCounselAdviceTPTypeID3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					 <Control ID='spnLimitedActionTimeAmt3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP4.Description'>
					 <Control ID='spnLimitedActionTPTypeID3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					 <Control ID='spnInvestigationEvalTimeAmt3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP5.Description'>
					 <Control ID='spnInvestigationEvalTPTypeID3'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LSCRFPRIntakeTypesLKP4' DataObjectDefinitionKey='LSCRFPRIntakeTypesLKP' Updatable='False' CreateNew='False'>
            <Filters>
				<Argument PropertyKey='LSCRFPRIntakeTypesLKPID' Value='4' />
			</Filters>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Description'>
					<Control ID='spnLSCRFPRIntakeTypesLKPID4'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscRFPIntakeMethodsByType4' DataObjectDefinitionKey='LscRFPIntakeMethodsByType' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='4' />
			</Filters>
			<DisplayProperties>
			     <DisplayProperty PropertyKey='IntakePercentage'>
					 <Control ID='spnIntakePercentage4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					 <Control ID='spnSpeakWorkerTimeAmt4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP1.Description'>
					 <Control ID='spnSpeakWorkerTPTypeID4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					 <Control ID='spnSubstantiveInterviewTimeAmt4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP2.Description'>
					 <Control ID='spnSubstantiveInterviewTPTypeID4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					 <Control ID='spnCounselAdviceTimeAmt4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP3.Description'>
					 <Control ID='spnCounselAdviceTPTypeID4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					 <Control ID='spnLimitedActionTimeAmt4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP4.Description'>
					 <Control ID='spnLimitedActionTPTypeID4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					 <Control ID='spnInvestigationEvalTimeAmt4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP5.Description'>
					 <Control ID='spnInvestigationEvalTPTypeID4'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LSCRFPRIntakeTypesLKP5' DataObjectDefinitionKey='LSCRFPRIntakeTypesLKP' Updatable='False' CreateNew='False'>
            <Filters>
				<Argument PropertyKey='LSCRFPRIntakeTypesLKPID' Value='5' />
			</Filters>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Description'>
					<Control ID='spnLSCRFPRIntakeTypesLKPID5'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscRFPIntakeMethodsByType5' DataObjectDefinitionKey='LscRFPIntakeMethodsByType' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='5' />
			</Filters>
			<DisplayProperties>
			     <DisplayProperty PropertyKey='IntakePercentage'>
					 <Control ID='spnIntakePercentage5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					 <Control ID='spnSpeakWorkerTimeAmt5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP1.Description'>
					 <Control ID='spnSpeakWorkerTPTypeID5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					 <Control ID='spnSubstantiveInterviewTimeAmt5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP2.Description'>
					 <Control ID='spnSubstantiveInterviewTPTypeID5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					 <Control ID='spnCounselAdviceTimeAmt5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP3.Description'>
					 <Control ID='spnCounselAdviceTPTypeID5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					 <Control ID='spnLimitedActionTimeAmt5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP4.Description'>
					 <Control ID='spnLimitedActionTPTypeID5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					 <Control ID='spnInvestigationEvalTimeAmt5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP5.Description'>
					 <Control ID='spnInvestigationEvalTPTypeID5'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LSCRFPRIntakeTypesLKP6' DataObjectDefinitionKey='LSCRFPRIntakeTypesLKP' Updatable='False' CreateNew='False'>
            <Filters>
				<Argument PropertyKey='LSCRFPRIntakeTypesLKPID' Value='6' />
			</Filters>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Description'>
					<Control ID='spnLSCRFPRIntakeTypesLKPID6'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		  
		<DataObject Key='LscRFPIntakeMethodsByTypeOther1' DataObjectDefinitionKey='LscRFPIntakeMethodsByType' Updatable='True' CreateNew='True'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='6' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IntakeTypeOtherDesc'>
					 <Control ID='spnIntakeTypeOtherDesc'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 <DisplayProperty PropertyKey='IntakePercentage'>
					 <Control ID='spnIntakePercentageOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					 <Control ID='spnSpeakWorkerTimeAmtOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP1.Description'>
					 <Control ID='spnSpeakWorkerTPTypeIDOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				 <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					 <Control ID='spnSubstantiveInterviewTimeAmtOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP2.Description'>
					 <Control ID='spnSubstantiveInterviewTPTypeIDOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					 <Control ID='spnCounselAdviceTimeAmtOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP3.Description'>
					 <Control ID='spnCounselAdviceTPTypeIDOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					 <Control ID='spnLimitedActionTimeAmtOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP4.Description'>
					 <Control ID='spnLimitedActionTPTypeIDOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
				   <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					 <Control ID='spnInvestigationEvalTimeAmtOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			       <DisplayProperty PropertyKey='LSCTimePeriodTypeLKP5.Description'>
					 <Control ID='spnInvestigationEvalTPTypeIDOther1'
						Type='HtmlGenericControl' />
				  </DisplayProperty>
			   
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscRFPIntakeMethodsTotalPercentage' DataObjectDefinitionKey='LscRFPIntakeMethodsTotalPercentage' Updatable='False' CreateNew='False'>
            <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TotalPercentage'>
					<Control ID='spnTotalPercentage'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
		    </DisplayProperties>
		 </DataObject>
		 
	
	</ModuleSection>
</span>

