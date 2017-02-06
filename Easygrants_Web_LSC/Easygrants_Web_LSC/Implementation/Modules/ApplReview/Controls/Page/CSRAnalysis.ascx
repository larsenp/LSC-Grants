<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p><i>See the <a href='#DetailedInstructions'>Detailed Instructions</a> section below.</i></p>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/GrantInformationCSRAnalysis.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	CSR Analysis
</div>
<br />
<div>
<table style='padding-right:5px'>
    <tr>
       <td></td>
		 <td style="text-align:center; width:100px"><b>Percent of Change from the Prior Year</b></td>
       <td style="text-align:center"><b><span runat='server' id='spnCurrentYear' /></b></td>
       <td style="text-align:center"><b><span runat='server' id='spnOneYrAgo' /> </b></td>
       <td style="text-align:center"><b><span runat='server' id='spnTwoYrsAgo' /> </b></td>
     </tr>
	<tr>
		<td><b># of cases </b></td>
		<td style="text-align:center"><span runat='server' id='spnCasesPctIncrease'/>%</td>
		<td style="text-align:center"><span runat='server' id='spnCasesCurrent' /></td>
        <td style="text-align:center"><span runat='server' id='spnCases1YrAgo' /></td>
        <td style="text-align:center"><span runat='server' id='spnCases2YrsAgo' /></td>
	</tr>
	<tr>
		<td><b># of PAI cases </b></td>
		<td style="text-align:center"><span runat='server' id='spnPAICasesPctIncrease'/>%</td>
		<td style="text-align:center"><span runat='server' id='spnPAICasesCurrent' /></td>
        <td style="text-align:center"><span runat='server' id='spnPAICases1YrAgo' /></td>
        <td style="text-align:center"><span runat='server' id='spnPAICases2YrsAgo' /></td>
	</tr>
	<tr>
		<td><b>Staff FTEs </b></td>
		<td style="text-align:center"><span runat='server' id='spnStaffFTEsPctIncrease'/>%</td>
		<td style="text-align:center"><span runat='server' id='spnStaffFTEsCurrent' /></td>
        <td style="text-align:center"><span runat='server' id='spnStaffFTEs1YrAgo' /></td>
        <td style="text-align:center"><span runat='server' id='spnStaffFTEs2YrsAgo' /></td>
	</tr>
	<tr>
		<td><b>Non-LSC Funding</b></td>
		<td style="text-align:center"><span runat='server' id='spnOtherFundingPctIncrease'/>%</td>
		<td style="text-align:center">$<span runat='server' id='spnOtherFunding' /></td>
        <td style="text-align:center">$<span runat='server' id='spnOtherFunding1YrAgo' /></td>
        <td style="text-align:center">$<span runat='server' id='spnOtherFunding2YrsAgo' /></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>   
</div>
<p>
	1.	In the text box below provide an explanation for total CSR data, PAI data, FTEs, and non-LSC funding decreases greater than 20%:
</p>
<span runat='server' id='spnCaseStaffFundDecDesc'/>
<table width='600px' cellpadding='1' >
	<tr>
		<td>&nbsp;</td>
		<td style="text-align:center">
			<b>Column 1<br />
			Program Data</b>
		</td>
		<td style="text-align:center">
			<b>Column 2<br />
			National Figures</b>
		</td>
		<td style="text-align:center">
			<b>Column 3<br />
			70% of Median or Average</b>
		</td>
	</tr>
	<tr>
		<td>
			<b>Cases per 10,000 poverty population</b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnCasesPer10k' />
		</td>
		<td style="text-align:center" >
			Median = <span runat='server' id='spnMedianCasesPer10k' />
		</td>
		<td style="text-align:center" >
			<span runat='server' id='spnMedianCasesPer10k_70' />
		</td>
	</tr>
	<tr>
		<td>
			<b> Extended cases per 10,000 poverty population</b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnExtCasesPer10k' />
		</td>
		<td style="text-align:center" >
			Median = <span runat='server' id='spnMedianExtCasesPer10k' />
		</td>
		<td style="text-align:center" >
			<span runat='server' id='spnMedianExtCasesPer10k_70' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Contested cases per 10,000 poverty population</b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnContestedCasesPer10k' />
		</td>
		<td style="text-align:center" >
			Median = <span runat='server' id='spnMedianContestedCasesPer10k' />
		</td>
		<td style="text-align:center" >
			<span runat='server' id='spnMedianContestedCasesPer10k_70' />
		</td>
	</tr>
	<tr>
		<td>
			<b>PAI Cases per 10,000 poverty population</b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnPAICasesPer10k' />
		</td>
		<td style="text-align:center" >
			Median = <span runat='server' id='spnMedianPAICasesPer10k' />
		</td>
		<td style="text-align:center" >
			<span runat='server' id='spnMedianPAICasesPer10k_70' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Percentage of non-LSC funding</b><sup>(1)</sup>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnOtherFundPercent' />%
		</td>
		<td style="text-align:center" >
			Average = <span runat='server' id='spnAvgPctNonLsc' />%
		</td>
		<td style="text-align:center" >
			<span runat='server' id='spnAvgPctNonLsc_70' />%
		</td>
	</tr>
	<!--<tr>
		<td>
			<b>8. Migrant extended cases per 10,000 poverty population</b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnMWExtCasesPer10k' />
		</td>
		<td style="text-align:center" >
			Median = <span runat='server' id='spnMWMedianExtCasesPer10k' />
		</td>
		<td style="text-align:center" >
			<span runat='server' id='spnMWMedianExtCasesPer10k_70' />
		</td>
	</tr>
	<tr>
		<td>
			<b>9. Migrant contested cases per 10,000 poverty population</b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnMWContestedCasesPer10k' />
		</td>
		<td style="text-align:center" >
			Median = <span runat='server' id='spnMWMedianContestedCasesPer10k' />
		</td>
		<td style="text-align:center" >
			<span runat='server' id='spnMWMedianContestedCasesPer10k_70' />
		</td>
	</tr> -->
</table>
<p><i>
Note: (1) This calculation excludes LSC funding carryover, Non-LSC funding carryover, and Client Service Income revenue.</i></p> 
<br />
<div class='SeparatorHdg' width='100%'>
	Reviewer's Summary
</div>
<p>1. Was there a 20% decrease in total cases from 2014 to 2015?</p> <b><span runat='server' id='spnCasesDecreasePrevYr_20' /></b>
<p>If yes, please provide an explanation</p><br><p><span runat='server' id='spnCasesDecPrevYr20Desc' /></p>
<p>2. Was there a 20% decrease in PAI cases from 2014 to 2015?</p> <b><span runat='server' id='spnPAICasesDecreasePrevYr_20' /></b>
<p>If yes, please provide an explanation</p><br><p><span runat='server' id='spnPAICasesDecPrevYr20Desc' /></p>
<p>3. Are CSR numbers below 70% of the national median &mdash; less than <span runat='server' id='spnMedianCasesPer10k_70_2' /> per 
10,000 poverty population?</p><b><span runat='server' id='spnCSRBelow70' /></b>

<a name='q2' ></a><p>4. <i>Only for applications for which CSR numbers are below 70% of the national median.</i><br />
Analysis when cases per 10,000 poverty population are below 70% of the median.  (See <a href='#q2i'>detailed instructions</a>)   </p>
<p>Limited Service programs (107000, 122007, 122087, 122107, 130010, and 146010) are to be analyzed under # 2 above if their CSRs are below the median – not below 70% of the median.</p>
<p>Factors that the reviewer believes tend to explain applicant's low numbers.  <b>Check all that apply.</b></p>
<ol>
	<li>
		<span runat='server' id='spnHighPctExtCase' /> Applicant has a high percentage of extended cases
	</li>
	<li>
		<span runat='server' id='spnLowNonLscFund' /> Applicant has a low non-LSC funding
	</li>
	<li>
		<span runat='server' id='spnFundNonReportable' /> Applicant has significant non-LSC funding that does not generate reportable cases.
	</li>
	<li>
		<span runat='server' id='spnResourceIntensive' /> Applicant undertakes resource-intensive cases
	</li>
    <li>
		<span runat='server' id='spnCensusAdjIssues' /> Census adjustment issues
	</li>
	<li>
		<span runat='server' id='spnLowCaseRateOther' /> Other explanation(s) (specify below):
	</li>
</ol>
<span runat='server' id='spnLowCaseRateComment' />
<br /><br />
<p>5. Are PAI CSR numbers below 70% of the national median — less than <span runat='server' id='spnMedianPAICasesPer10k_70_2' /> per 10,000 poverty population?</p> <b><span runat='server' id='spnPAICSRBelow70' /></b>



<p>6. <i>Only for applications for which PAI CSR numbers are below 70% of the national median.</i><br />
Analysis when cases per 10,000 poverty population are below 70% of the median.  (See <a href='#q2i'>detailed instructions</a>)   </p>
<p>Factors that the reviewer believes tend to explain applicant's low numbers.  <b>Check all that apply.</b></p>
<ol>
	<li>
		<span runat='server' id='spnHighPctExtPAICase' /> Applicant has a high percentage of PAI extended cases
	</li>
	<li>
		<span runat='server' id='spnResourceIntensivePAI' /> Applicant undertakes resource-intensive PAI cases
	</li>
	<li>
		<span runat='server' id='spnLowCaseRateOtherPAI' /> Other explanation(s) (specify below):
	</li>
</ol>
<span runat='server' id='spnLowCaseRateCommentPAI' />
<br /><br />



<a name='q3' ></a><p>7.  Are there other CSR number patterns to be looked into? (See <a href='#q3i' >detailed instructions</a>)</p>
<table style="padding:1px">
	<tr>
		<td>a.</td>
		<td style="text-align:center">
			<b><span runat='server' id='spnExtCSRBelow70' /></b>
		</td>
		<td>
			Extended cases per 10,000 poverty population below 70% of median (or less)
		</td>
	</tr>
	<tr>
		<td>b.</td>
		<td style="text-align:center">
			<b><span runat='server' id='spnContestedCSRBelow70' /></b>
		</td>
		<td>
			Contested cases per 10,000 poverty population below 70% of median (or less)
		</td>
	</tr>
	<!--<tr>
		<td>c.</td>
		<td style="text-align:center">
			<b><span runat='server' id='spnMWExtCSRBelow70' /></b>
		</td>
		<td>
			Migrant extended cases per 10,000 poverty population below 70% of median (or less)
		</td>
	</tr>
	<tr>
		<td>d.</td>
		<td style="text-align:center">
			<b><span runat='server' id='spnMWContestedCSRBelow70' /></b>
		</td>
		<td>
			Migrant contested cases per 10,000 poverty population below 70% of median (or less)
		</td>
	</tr> -->
	<tr>
		<td>c.</td>
		<td>
			<span runat='server' id='spnOtherCsrNumberPatternsOther' />
		</td>
		<td>
			Other pattern?  Describe in the text box below.<span style="color:red">*</span> 
		</td>
	</tr>
</table>
<br />Provide analysis for each of the number patterns above marked "Yes".<span style="color:red">*</span>
<span runat='server' id='spnOtherCsrNumberPatternsComment' />

<a name='q4'></a><p>8.  <b>Conclusion</b>. CSRs as indicated above:<span style="color:red">*</span> </p>
<span runat='server' id='spnCsrAnalysisConclusionID'/>
<br /><br />
9. Briefly explain conclusions. For those programs outside the 70% of median or average provide a summary assessment of the applicant’s CSRs. <span style="color:red">*</span><br />
<span runat='server' id='spnCsrAnalysisComment' />
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSave' />
	<span runat="server" id='spnSaveContinue' />
</div>
<br />
<div class='SeparatorHdg' width='100%'>
	<a name='DetailedInstructions' ></a>Detailed Instructions
</div>
<div style="width:600px">
	<br />
	<p><i>Although the CSR analysis form is designed to identify programs with low CSR numbers, reviewers are also 
	encouraged to consider the factors identified in this form when they encounter programs that have high numbers 
	or significant increases in numbers over the two year period. These could be noted in the comment box in number 4.</i></p>
	<p><a name='q2i' ></a><b>2. Factors to consider when # of cases per 10,000 poverty population is less than 70% of national median.</b> 
	<i>(The national median is <span runat='server' id='spnMedianCasesPer10k_2' />.  70% of the national median is <span runat='server' id='spnMedianCasesPer10k_70_3' />.) </i></p>
	<a href='#q2'>Return to Reviewer's Summary</a>
	<style>
		ol	{list-style-type:lower-alpha;}
		li	{padding-bottom:6pt;}
		ul	{list-style-type:disc;}
	</style>
	<ol>
		<li>
			Does the program have a high percentage of extended cases?  
			<ul>
				<li>
					Background – extended cases generally take considerably more effort than limited cases.  Programs that produce 
					relatively high numbers of extended service cases will, all things being equal, produce fewer total cases.  
				</li>
				<li>
					Look at the extended cases per 10,000 poverty population.  Overall, <span runat='server' id='spnExtendedMedian_2' /> extended 
					cases are closed per 10,000 poor persons.  Programs with higher extended cases per 10,000 poor persons may be related to lower overall cases. 
				</li>
			</ul>
		</li>
		<li>
			Is the program’s non-LSC funding less than the median percentage of non-LSC funding?   
			<ul>
				<li>
					Background – programs that don’t have much non-LSC funding for casework that is LSC countable might be expected to 
					have lower than average cases per 10,000 poverty population. 
				</li>
				<li>
					The national average of non-LSC funding is <span runat='server' id='spnPercentNonLscAvg_2' />.  Where programs have 
					<span runat='server' id='spnPercentNonLscAvg70_2' /> or less non-LSC funding, it may be that their case numbers are low for that reason. 
				</li>
			</ul>
		</li>
		<li>
			Does a significant percentage of the program’s non-LSC funding support activities that do not produce reportable cases?
			<ul>
				<li>
					Background – Factor b. above notes that programs with low non-LSC funding may be expected to produce fewer cases per 10,000 
					poverty population than programs with high non-LSC funding. Factor c. recognizes that some programs may have average (or higher) 
					levels of non-LSC funding but that funding (or a significant portion of it) does not support LSC reportable activities. For example, 
					some funding sources do not result in case representation (e.g., pass through funding, community education) or do not require that 
					clients meet LSC eligibility qualifications (e.g., Title III, VAWA).  In these instances, a program’s CSRs will not reflect the 
					additional funding.
				</li>
				<li>
					If the non-LSC funding the program receives that goes to legal representation is less than <span runat='server' id='spnPercentNonLscAvg70_3' />,
					 it may be that their case numbers are low for this reason.
				</li>
			</ul>
		</li>
		<li>
			Has the program invested in a number of high-intensity cases that might help to explain its low numbers? 
			<ul>
				<li>
					Background – complex extended cases often require very high levels of program resources.  A program may have chosen to pursue 
					several such cases because of the promise they hold for the clients or the client community.  They can be an explanation of low numbers.
				</li>
				<li>
					This analysis can generally be best done in the context of a quality visit.  The reviewer of an RFP won’t necessarily have access 
					to extensive background about the program’s cases. 
				</li>
			</ul>
		</li>
		<li>
			Are there other factors (or a combination of factors) that explain low numbers? 
			<ul>
				<li>
					Background – There may be factors that the reviewer considers legitimate that are not listed above.  Examples might 
					include one-time circumstances such as a devastating hurricane, or structural issues such as a partner program that 
					does intake and advice and brief services.  It might also be that a program exhibits one or more factors that cumulatively 
					explain its low CSR numbers. 
				</li>
				<li>
					The conclusion that a factor not listed in a. to d. above, or a combination of factors explain a program’s low numbers 
					is a judgment to be made on a case by case basis.
				</li>
			</ul>
		</li>
	</ol>
	
	<a name='q3i' ></a><p><b>3. Other CSR number patterns to be looked into</b></p>
	<a href='#q3'>Return to Reviewer's Summary</a>
	<ol>
		<li>
			Precipitous drop in case numbers over the last two years. <b>This answer is pre-filled. There is nothing the reviewer needs to do.</b>
			<ul>
				<li>
					See rows 1-3 (# of cases in <span runat='server' id='spnCurrentYear_2' />, <span runat='server' id='spnOneYrAgo_2' />, 
					and <span runat='server' id='spnTwoYrsAgo_2' />).  Where a program’s CSRs have dropped significantly in the last two years, it is a 
					matter to look into further.  There may have been a drop in non-LSC funding, turnover might have affected case numbers, or the program 
					might have put new emphasis on extended cases.  If you are not aware of the reason for the drop, it might be a matter to look into further. 
				</li>
			</ul>
		</li>
		<li>
			Low % of extended cases. <b>This answer is pre-filled. There is nothing the reviewer needs to do.</b>
			<ul>
				<li>
					See row 4 (extended cases as a percentage of all cases). Generally, extended cases take significantly longer to complete than 
					do limited cases. Where a program’s percentage of extended cases is low and the program doesn’t show very high overall numbers, 
					this might be a matter to look into further.  (Another way to analyze this is to look at the extended cases per 10,000 
					poverty population. This statistic neutralized the effect that high or low overall case numbers would have on &ldquo;extended cases 
					as a percentage of all cases.&rdquo;)  
				</li>
			</ul>
		</li>
		<li>
			Other			
			<ul>
				<li>
					Describe any other anomalous CSR pattern in #3 above. 
				</li>
			</ul>
		</li>
	</ol>
	<a name='q4i' ></a><p><b>4. Conclusion</b></p>
	<a href='#q4'>Return to Reviewer's Summary</a>
	<ul>
		<li>
			This section calls for the reviewer’s conclusion as to CSRs based on the analysis that was done.  The nature of the conclusion 
			will vary based on the context in which it is being done and the knowledge that the reviewer has about the program. A review of case 
			numbers as part of the competition or renewal review will usually lead either to the conclusion that there are no CSR related concerns 
			or that there are issues to be looked into.  Depending on the issues, it might involve getting more information from the program as 
			part of the work plan, or visiting the program. 
		</li>
	</ul>
</div>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscCsrAnalysisByRecipient' DataObjectDefinitionKey='LscCsrAnalysisByRecipient' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID' PropertyKey='recipient_id' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.WfTAYear' PropertyKey='year' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CasesPctIncrease'>
					<Control ID='spnCasesPctIncrease'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PAICasesPctIncrease'>
					<Control ID='spnPAICasesPctIncrease'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='StaffFTEsPctIncrease'>
					<Control ID='spnStaffFTEsPctIncrease'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherFundingPctIncrease'>
					<Control ID='spnOtherFundingPctIncrease'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CurrentYear'>
					<Control ID='spnCurrentYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesCurrent' Format='#,0'>
					<Control ID='spnCasesCurrent'
						Type='HtmlGenericControl' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='PAICasesCurrent' Format='#,0'>
					<Control ID='spnPAICasesCurrent'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='StaffFTEsCurrent' Format='#,0.0'>
					<Control ID='spnStaffFTEsCurrent'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='OtherFunding' Format='#,0'>
					<Control ID='spnOtherFunding'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OneYrAgo'>
					<Control ID='spnOneYrAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Cases1YrAgo' Format='#,0'>
					<Control ID='spnCases1YrAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='PAICases1YrAgo' Format='#,0'>
					<Control ID='spnPAICases1YrAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='StaffFTEs1YrAgo' Format='#,0.0'>
					<Control ID='spnStaffFTEs1YrAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='OtherFunding1YrAgo' Format='#,0'>
					<Control ID='spnOtherFunding1YrAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TwoYrsAgo'>
					<Control ID='spnTwoYrsAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Cases2YrsAgo' Format='#,0'>
					<Control ID='spnCases2YrsAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='PAICases2YrsAgo' Format='#,0'>
					<Control ID='spnPAICases2YrsAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='StaffFTEs2YrsAgo' Format='#,0.0'>
					<Control ID='spnStaffFTEs2YrsAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
            <DisplayProperty PropertyKey='OtherFunding2YrsAgo' Format='#,0'>
					<Control ID='spnOtherFunding2YrsAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesPer10k' Format='#,0.0'>
					<Control ID='spnCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianCasesPer10k'>
					<Control ID='spnMedianCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianCasesPer10k'>
					<Control ID='spnMedianCasesPer10k_2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianCasesPer10k_70'>
					<Control ID='spnMedianCasesPer10k_70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianCasesPer10k_70'>
					<Control ID='spnMedianCasesPer10k_70_2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='MedianPAICasesPer10k_70'>
					<Control ID='spnMedianPAICasesPer10k_70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianCasesPer10k_70'>
					<Control ID='spnMedianCasesPer10k_70_3'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExtCasesPer10k' Format='#,0.0'>
					<Control ID='spnExtCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianExtCasesPer10k'>
					<Control ID='spnMedianExtCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianExtCasesPer10k_70'>
					<Control ID='spnMedianExtCasesPer10k_70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherFundPercent' Format='0.0'>
					<Control ID='spnOtherFundPercent'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AvgPctNonLsc' Format='0'>
					<Control ID='spnAvgPctNonLsc'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='AvgPctNonLsc_70' Format='0'>
					<Control ID='spnAvgPctNonLsc_70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CSRBelow70' Format='YesNo'>
					<Control ID='spnCSRBelow70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='PAICSRBelow70' Format='YesNo'>
					<Control ID='spnPAICSRBelow70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CurrentYear'>
					<Control ID='spnCurrentYear_2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='OneYrAgo'>
					<Control ID='spnOneYrAgo_2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TwoYrsAgo'>
					<Control ID='spnTwoYrsAgo_2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExtCSRBelow70' Format='YesNo'>
					<Control ID='spnExtCSRBelow70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContestedCasesPer10k' Format='#,0.0'>
					<Control ID='spnContestedCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianContestedCasesPer10k'>
					<Control ID='spnMedianContestedCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianContestedCasesPer10k_70'>
					<Control ID='spnMedianContestedCasesPer10k_70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContestedCSRBelow70' Format='YesNo'>
					<Control ID='spnContestedCSRBelow70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<!--<DisplayProperty PropertyKey='CurrentYear'>
					<Control ID='spnCurrentYearPAI'
						Type='HtmlGenericControl' />
				</DisplayProperty> -->
				
				<DisplayProperty PropertyKey='PAICasesPer10k' Format='#,0.0'>
					<Control ID='spnPAICasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianPAICasesPer10k'>
					<Control ID='spnMedianPAICasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianPAICasesPer10k_70'>
					<Control ID='spnMedianPAICasesPer10k_70_2'
						Type='HtmlGenericControl' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='CasesDecreasePrevYr_20' Format='YesNo'>
					<Control ID='spnCasesDecreasePrevYr_20'
						Type='HtmlGenericControl' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='PAICasesDecreasePrevYr_20' Format='YesNo'>
					<Control ID='spnPAICasesDecreasePrevYr_20'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
	
		<%--<DataObject Key='LscCsrAnalysisByRecipientMW' DataObjectDefinitionKey='LscCsrAnalysisByRecipient' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID' PropertyKey='recipient_id' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.WfTAYear' PropertyKey='year' />
				<Argument Type='' TypeKey='' PropertyKey='ServType' Value='MW' />
			</Filters>
			<DisplayProperties>
		         <DisplayProperty PropertyKey='MW_ExtCasesPer10k' Format='#,0.0'>
					<Control ID='spnMWExtCasesPer10k'
						Type='HtmlGenericControl' >
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MW_MedianExtCasesPer10k'>
					<Control ID='spnMWMedianExtCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MW_MedianExtCasesPer10k_70'>
					<Control ID='spnMWMedianExtCasesPer10k_70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MW_ExtCSRBelow70' Format='YesNo'>
					<Control ID='spnMWExtCSRBelow70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				 <DisplayProperty PropertyKey='MW_ContestedCasesPer10k' Format='#,0.0'>
					<Control ID='spnMWContestedCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MW_MedianContestedCasesPer10k'>
					<Control ID='spnMWMedianContestedCasesPer10k'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MW_MedianContestedCasesPer10k_70'>
					<Control ID='spnMWMedianContestedCasesPer10k_70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MW_ContestedCSRBelow70' Format='YesNo'>
					<Control ID='spnMWContestedCSRBelow70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>--%>
		
		
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
			
				<DisplayProperty PropertyKey='CaseStaffFundDecDesc'>
					<Control ID='txtCaseStaffFundDecDesc'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						Container='spnCaseStaffFundDecDesc' />
				</DisplayProperty> 
				<DisplayProperty PropertyKey='HighPctExtCase'>
					<Control ID='chkHighPctExtCase'
						Type='cCheckBox'
						Container='spnHighPctExtCase' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LowNonLscFund'>
					<Control ID='chkLowNonLscFund'
						Type='cCheckBox'
						Container='spnLowNonLscFund' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundNonReportable'>
					<Control ID='chkFundNonReportable'
						Type='cCheckBox'
						Container='spnFundNonReportable' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='ResourceIntensive'>
					<Control ID='chkResourceIntensive'
						Type='cCheckBox'
						Container='spnResourceIntensive' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='CensusAdjIssues'>
					<Control ID='chkCensusAdjIssues'
						Type='cCheckBox'
						Container='spnCensusAdjIssues' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LowCaseRateOther'>
					<Control ID='chkLowCaseRateOther'
						Type='cCheckBox'
						Container='spnLowCaseRateOther' />
				</DisplayProperty> 
				<DisplayProperty PropertyKey='LowCaseRateComment'>
					<Control ID='txtLowCaseRateComment'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						Container='spnLowCaseRateComment' />
				</DisplayProperty> 
				<DisplayProperty PropertyKey='OtherCsrNumberPatternsOther'>
					<Control ID='chkOtherCsrNumberPatternsOther'
						Type='cRadioButtonList'
						Container='spnOtherCsrNumberPatternsOther' 
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='OtherCsrNumberPatternsComment'>
					<Control ID='txtOtherCsrNumberPatternsComment'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						Container='spnOtherCsrNumberPatternsComment' />
				</DisplayProperty> 
				<DisplayProperty PropertyKey='CsrAnalysisConclusionID'>
					<Control ID='ctlCsrAnalysisConclusionID'
						Type='cRadioButtonList'
						Container='spnCsrAnalysisConclusionID'
						DataObjectDefinitionKey='LscCsrAnalysisConclusion'
						StoredValue='LscCsrAnalysisConclusionID'
						DisplayValue='Description'
						RepeatDirection='Vertical' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CsrAnalysisComment'>
					<Control ID='txtCsrAnalysisComment'
						Type='cTextArea'
						Rows='8'
						Cols='80'
						Container='spnCsrAnalysisComment' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='CasesDecPrevYr20Desc'>
					<Control ID='txtCasesDecPrevYr20Desc'
						Type='cTextArea'
						Rows='8'
						Cols='80'
						Container='spnCasesDecPrevYr20Desc' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='PAICasesDecPrevYr20Desc'>
					<Control ID='txtPAICasesDecPrevYr20Desc'
						Type='cTextArea'
						Rows='8'
						Cols='80'
						Container='spnPAICasesDecPrevYr20Desc' />
				</DisplayProperty>
                <DisplayProperty PropertyKey='HighPctExtPAICase'>
					<Control ID='chkHighPctExtPAICase'
						Type='cCheckBox'
						Container='spnHighPctExtPAICase' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='ResourceIntensivePAI'>
					<Control ID='chkResourceIntensivePAI'
						Type='cCheckBox'
						Container='spnResourceIntensivePAI' />
				</DisplayProperty>
                
				<DisplayProperty PropertyKey='LowCaseRateOtherPAI'>
					<Control ID='chkLowCaseRateOtherPAI'
						Type='cCheckBox'
						Container='spnLowCaseRateOtherPAI' />
				</DisplayProperty> 
				<DisplayProperty PropertyKey='LowCaseRateCommentPAI'>
					<Control ID='txtLowCaseRateCommentPAI'
						Type='cTextArea'
						Rows='5'
						Cols='80'
						Container='spnLowCaseRateCommentPAI' />
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
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>