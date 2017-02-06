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
            <p>Then, for each type of intake, enter the average amount of time it takes from the prospective clients’ initial contact with the program until the prospective client receives the service indicated. Enter the time by using whole numbers and selecting a unit of time from the drop-down menu.</p>
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
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='1' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='1' />
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='IntakePercentage'>
					<Control ID='ctlIntakePercentage1'
						Container='spnIntakePercentage1'
						Type='cTextBox'
						MaxLength='3'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='Telephone intake: The field "Percentage of Intake applications for this method" must be a whole number, 0 to 100 inclusive.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					<Control ID='ctlSpeakWorkerTimeAmt'
						Container='spnSpeakWorkerTimeAmt'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Telephone intake: The field "First speaks to an intake worker?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTPTypeID'> 
					<Control ID='ctlSpeakWorkerTPTypeID'
						Container='spnSpeakWorkerTPTypeID'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			      <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					<Control ID='ctlSubstantiveInterviewTimeAmt'
						Container='spnSubstantiveInterviewTimeAmt'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Telephone intake: The field "Has a substantive interview?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SubstantiveInterviewTPTypeID'> 
					<Control ID='ctlSubstantiveInterviewTPTypeID'
						Container='spnSubstantiveInterviewTPTypeID'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					<Control ID='ctlCounselAdviceTimeAmt'
						Container='spnCounselAdviceTimeAmt'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Telephone intake: The field "Receives counsel and advice?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='CounselAdviceTPTypeID'> 
					<Control ID='ctlCounselAdviceTPTypeID'
						Container='spnCounselAdviceTPTypeID'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					<Control ID='ctlLimitedActionTimeAmt'
						Container='spnLimitedActionTimeAmt'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Telephone intake: The field "Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LimitedActionTPTypeID'> 
					<Control ID='ctlLimitedActionTPTypeID'
						Container='spnLimitedActionTPTypeID'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			      <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					<Control ID='ctlInvestigationEvalTimeAmt'
						Container='spnInvestigationEvalTimeAmt'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Telephone intake: The field "Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='InvestigationEvalTPTypeID'> 
					<Control ID='ctlInvestigationEvalTPTypeID'
						Container='spnInvestigationEvalTPTypeID'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
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
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='2' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='2' />
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='IntakePercentage'>
					<Control ID='ctlIntakePercentage2'
						Container='spnIntakePercentage2'
						Type='cTextBox'
						MaxLength='3'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='Walk-in intake: The field "Percentage of Intake applications for this method" must be a whole number, 0 to 100 inclusive.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					<Control ID='ctlSpeakWorkerTimeAmt2'
						Container='spnSpeakWorkerTimeAmt2'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Walk-in intake: The field "First speaks to an intake worker?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTPTypeID'> 
					<Control ID='ctlSpeakWorkerTPTypeID2'
						Container='spnSpeakWorkerTPTypeID2'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					<Control ID='ctlSubstantiveInterviewTimeAmt2'
						Container='spnSubstantiveInterviewTimeAmt2'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Walk-in intake: The field "Has a substantive interview?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SubstantiveInterviewTPTypeID'> 
					<Control ID='ctlSubstantiveInterviewTPTypeID2'
						Container='spnSubstantiveInterviewTPTypeID2'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					<Control ID='ctlCounselAdviceTimeAmt2'
						Container='spnCounselAdviceTimeAmt2'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Walk-in intake: The field "Receives counsel and advice?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='CounselAdviceTPTypeID'> 
					<Control ID='ctlCounselAdviceTPTypeID2'
						Container='spnCounselAdviceTPTypeID2'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					<Control ID='ctlLimitedActionTimeAmt2'
						Container='spnLimitedActionTimeAmt2'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Walk-in intake: The field "Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LimitedActionTPTypeID'> 
					<Control ID='ctlLimitedActionTPTypeID2'
						Container='spnLimitedActionTPTypeID2'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			      <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					<Control ID='ctlInvestigationEvalTimeAmt2'
						Container='spnInvestigationEvalTimeAmt2'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Walk-in intake: The field "Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='InvestigationEvalTPTypeID'> 
					<Control ID='ctlInvestigationEvalTPTypeID2'
						Container='spnInvestigationEvalTPTypeID2'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
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
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='3' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='3' />
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='IntakePercentage'>
					<Control ID='ctlIntakePercentage3'
						Container='spnIntakePercentage3'
						Type='cTextBox'
						MaxLength='3'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='In-person appointment intake: The field "Percentage of Intake applications for this method" must be a whole number, 0 to 100 inclusive.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					<Control ID='ctlSpeakWorkerTimeAmt3'
						Container='spnSpeakWorkerTimeAmt3'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='In-person appointment intake: The field "First speaks to an intake worker?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTPTypeID'> 
					<Control ID='ctlSpeakWorkerTPTypeID3'
						Container='spnSpeakWorkerTPTypeID3'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					<Control ID='ctlSubstantiveInterviewTimeAmt3'
						Container='spnSubstantiveInterviewTimeAmt3'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='In-person appointment intake: The field "Has a substantive interview?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SubstantiveInterviewTPTypeID'> 
					<Control ID='ctlSubstantiveInterviewTPTypeID3'
						Container='spnSubstantiveInterviewTPTypeID3'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					<Control ID='ctlCounselAdviceTimeAmt3'
						Container='spnCounselAdviceTimeAmt3'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='In-person appointment intake: The field "Receives counsel and advice?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='CounselAdviceTPTypeID'> 
					<Control ID='ctlCounselAdviceTPTypeID3'
						Container='spnCounselAdviceTPTypeID3'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					<Control ID='ctlLimitedActionTimeAmt3'
						Container='spnLimitedActionTimeAmt3'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='In-person appointment intake: The field "Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LimitedActionTPTypeID'> 
					<Control ID='ctlLimitedActionTPTypeID3'
						Container='spnLimitedActionTPTypeID3'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			      <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					<Control ID='ctlInvestigationEvalTimeAmt3'
						Container='spnInvestigationEvalTimeAmt3'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='In-person appointment intake: The field "Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='InvestigationEvalTPTypeID'> 
					<Control ID='ctlInvestigationEvalTPTypeID3'
						Container='spnInvestigationEvalTPTypeID3'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
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
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='4' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='4' />
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='IntakePercentage'>
					<Control ID='ctlIntakePercentage4'
						Container='spnIntakePercentage4'
						Type='cTextBox'
						MaxLength='3'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='Internet/Online intake: The field "Percentage of Intake applications for this method" must be a whole number, 0 to 100 inclusive.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					<Control ID='ctlSpeakWorkerTimeAmt4'
						Container='spnSpeakWorkerTimeAmt4'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Internet/Online intake: The field "First speaks to an intake worker?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTPTypeID'> 
					<Control ID='ctlSpeakWorkerTPTypeID4'
						Container='spnSpeakWorkerTPTypeID4'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					<Control ID='ctlSubstantiveInterviewTimeAmt4'
						Container='spnSubstantiveInterviewTimeAmt4'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Internet/Online intake: The field "Has a substantive interview?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SubstantiveInterviewTPTypeID'> 
					<Control ID='ctlSubstantiveInterviewTPTypeID4'
						Container='spnSubstantiveInterviewTPTypeID4'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					<Control ID='ctlCounselAdviceTimeAmt4'
						Container='spnCounselAdviceTimeAmt4'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Internet/Online intake: The field "Receives counsel and advice?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='CounselAdviceTPTypeID'> 
					<Control ID='ctlCounselAdviceTPTypeID4'
						Container='spnCounselAdviceTPTypeID4'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					<Control ID='ctlLimitedActionTimeAmt4'
						Container='spnLimitedActionTimeAmt4'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Internet/Online intake: The field "Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LimitedActionTPTypeID'> 
					<Control ID='ctlLimitedActionTPTypeID4'
						Container='spnLimitedActionTPTypeID4'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			      <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					<Control ID='ctlInvestigationEvalTimeAmt4'
						Container='spnInvestigationEvalTimeAmt4'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Internet/Online intake: The field "Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='InvestigationEvalTPTypeID'> 
					<Control ID='ctlInvestigationEvalTPTypeID4'
						Container='spnInvestigationEvalTPTypeID4'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
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
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='5' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='5' />
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='IntakePercentage'>
					<Control ID='ctlIntakePercentage5'
						Container='spnIntakePercentage5'
						Type='cTextBox'
						MaxLength='3'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='Outreach intake: The field "Percentage of Intake applications for this method" must be a whole number, 0 to 100 inclusive.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					<Control ID='ctlSpeakWorkerTimeAmt5'
						Container='spnSpeakWorkerTimeAmt5'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Outreach intake: The field "First speaks to an intake worker?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTPTypeID'> 
					<Control ID='ctlSpeakWorkerTPTypeID5'
						Container='spnSpeakWorkerTPTypeID5'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					<Control ID='ctlSubstantiveInterviewTimeAmt5'
						Container='spnSubstantiveInterviewTimeAmt5'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Outreach intake: The field "Has a substantive interview?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SubstantiveInterviewTPTypeID'> 
					<Control ID='ctlSubstantiveInterviewTPTypeID5'
						Container='spnSubstantiveInterviewTPTypeID5'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					<Control ID='ctlCounselAdviceTimeAmt5'
						Container='spnCounselAdviceTimeAmt5'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Outreach intake: The field "Receives counsel and advice?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='CounselAdviceTPTypeID'> 
					<Control ID='ctlCounselAdviceTPTypeID5'
						Container='spnCounselAdviceTPTypeID5'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					<Control ID='ctlLimitedActionTimeAmt5'
						Container='spnLimitedActionTimeAmt5'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Outreach intake: The field "Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LimitedActionTPTypeID'> 
					<Control ID='ctlLimitedActionTPTypeID5'
						Container='spnLimitedActionTPTypeID5'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			      <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					<Control ID='ctlInvestigationEvalTimeAmt5'
						Container='spnInvestigationEvalTimeAmt5'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Outreach intake: The field "Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='InvestigationEvalTPTypeID'> 
					<Control ID='ctlInvestigationEvalTPTypeID5'
						Container='spnInvestigationEvalTPTypeID5'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
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
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='6' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument PropertyKey='IntakeTypeID' Value='6' />
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='IntakeTypeOtherDesc'>
					<Control ID='ctlIntakeTypeOtherDesc'
						Container='spnIntakeTypeOtherDesc'
						Type='cTextBox'
						MaxLength='50'
						Size='30'>
					</Control>	
				</DisplayProperty>
			    <DisplayProperty PropertyKey='IntakePercentage'>
					<Control ID='ctlIntakePercentageOther1'
						Container='spnIntakePercentageOther1'
						Type='cTextBox'
						MaxLength='3'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='100'
							ErrorMessage='Other type(s) of intake: The field "Percentage of Intake applications for this method" must be a whole number, 0 to 100 inclusive.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTimeAmt'>
					<Control ID='ctlSpeakWorkerTimeAmtOther1'
						Container='spnSpeakWorkerTimeAmtOther1'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Other type(s) of intake: The field "First speaks to an intake worker?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SpeakWorkerTPTypeID'> 
					<Control ID='ctlSpeakWorkerTPTypeIDOther1'
						Container='spnSpeakWorkerTPTypeIDOther1'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='SubstantiveInterviewTimeAmt'>
					<Control ID='ctlSubstantiveInterviewTimeAmtOther1'
						Container='spnSubstantiveInterviewTimeAmtOther1'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Other type(s) of intake: The field "Has a substantive interview?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='SubstantiveInterviewTPTypeID'> 
					<Control ID='ctlSubstantiveInterviewTPTypeIDOther1'
						Container='spnSubstantiveInterviewTPTypeIDOther1'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='CounselAdviceTimeAmt'>
					<Control ID='ctlCounselAdviceTimeAmtOther1'
						Container='spnCounselAdviceTimeAmtOther1'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Other type(s) of intake: The field "Receives counsel and advice?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='CounselAdviceTPTypeID'> 
					<Control ID='ctlCounselAdviceTPTypeIDOther1'
						Container='spnCounselAdviceTPTypeIDOther1'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			       <DisplayProperty PropertyKey='LimitedActionTimeAmt'>
					<Control ID='ctlLimitedActionTimeAmtOther1'
						Container='spnLimitedActionTimeAmtOther1'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Other type(s) of intake: The field "Receives limited action and/or referral assistance? (for cases in which extended service will not be provided)" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='LimitedActionTPTypeID'> 
					<Control ID='ctlLimitedActionTPTypeIDOther1'
						Container='spnLimitedActionTPTypeIDOther1'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			      <DisplayProperty PropertyKey='InvestigationEvalTimeAmt'>
					<Control ID='ctlInvestigationEvalTimeAmtOther1'
						Container='spnInvestigationEvalTimeAmtOther1'
						Type='cTextBox'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='10000'
							ErrorMessage='Other type(s) of intake: The field "Receives notice that their case was assigned to a case handler for extended representation or further investigation and evaluation?" must be a whole number.'/>
					</Control>	
				  </DisplayProperty>
				  <DisplayProperty PropertyKey='InvestigationEvalTPTypeID'> 
					<Control ID='ctlInvestigationEvalTPTypeIDOther1'
						Container='spnInvestigationEvalTPTypeIDOther1'
						Type='cDropDown'
						DataObjectDefinitionKey='LSCTimePeriodTypeLKP'
						StoredValue='LSCTimePeriodTypeLKPID'
						DisplayValue='Description' 
						RequiredField='True'
						ErrorMessage='' /> 
			      </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscRFPIntakeMethodsTotalPercentage' DataObjectDefinitionKey='LscRFPIntakeMethodsTotalPercentage' Updatable='False' CreateNew='False'>
            <Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TotalPercentage'>
					<Control ID='spnTotalPercentage'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
		    </DisplayProperties>
		 </DataObject>
		 
		  
		  
		  
	<%--	<DataObject Key='LSCRFPRIntakeMetricsLKP' DataObjectDefinitionKey='LSCRFPRIntakeMetricsLKP' Updatable='True' CreateNew='False' >
			<Filters>	
				<Argument PropertyKey='LSCRFPRIntakeTypesLKPID' Value='1' >
					<RelatedProperty PropertyKey='LscRFPIntakeMethodsByTypeMetric.LSCRFPRIntakeTypesLKP' />
				</Argument>	
			</Filters>
			<Sort>
				<Argument PropertyKey="LSCRFPRIntakeMetricsLKPID"/>
			</Sort>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPL' 
						Container='spnDPL' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/RFPIntakeMethodsChild.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	--%>
	 
	   
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
			</DisplayProperties>
		</DataObject>
	  
	    
	</ModuleSection>
</span>

