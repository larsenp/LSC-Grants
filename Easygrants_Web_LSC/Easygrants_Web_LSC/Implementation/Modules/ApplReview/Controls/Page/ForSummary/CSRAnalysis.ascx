<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	CSR Analysis
</div>
<br />
<table width='600px' cellpadding='1'>
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
			<b>1. # of cases <span runat='server' id='spnCurrentYear' /></b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnCasesCurrent' />
		</td>
		<td style="background-color:Gray" />
		<td style="background-color:Gray" />
	</tr>
	<tr>
		<td>
			<b>2. # of cases <span runat='server' id='spnOneYrAgo' /></b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnCases1YrAgo' />
		</td>
		<td style="background-color:Gray" />
		<td style="background-color:Gray" />
	</tr>
	<tr>
		<td>
			<b>3. # of cases <span runat='server' id='spnTwoYrsAgo' /></b>
		</td>
		<td style="text-align:center">
			<span runat='server' id='spnCases2YrsAgo' />
		</td>
		<td style="background-color:Gray" />
		<td style="background-color:Gray" />
	</tr>
	<tr>
		<td>
			<b>4. Cases per 10,000 poverty population</b>
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
			<b>5. Extended cases per 10,000 poverty population</b>
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
			<b>6. Contested cases per 10,000 poverty population</b>
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
			<b>7. Percentage of non-LSC funding</b>
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
	<tr>
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
	</tr>
</table>
<br />
<div class='SeparatorHdg' width='100%'>
	Reviewer's Summary
</div>
<p>1. Are CSR numbers below 70% of the national median &mdash; less than <span runat='server' id='spnMedianCasesPer10k_70_2' /> per 
10,000 poverty population?</p>
<b><span runat='server' id='spnCSRBelow70' /></b>

<p>2. <i>Only for applications for which CSR numbers are below 70% of the national median.</i><br />
Analysis when cases per 10,000 poverty population are below 70% of the median.  </p>
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
		<span runat='server' id='spnLowCaseRateOther' /> Other explanation(s) (specify below):
	</li>
</ol>
<span runat='server' id='spnLowCaseRateComment' />
<br /><br />
</a><p>3.  Are there other CSR number patterns to be looked into?</p>
<table style="padding:1px">
	<tr>
		<td>a.</td>
		<td style="text-align:center">
			<b><span runat='server' id='spnExtCSRBelow70' /></b>
		</td>
		<td>
			Extended cases per 10,000 poverty population below 70% of median (<span runat='server' id='spnxxx' />or less)
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
	<tr>
		<td>c.</td>
		<td style="text-align:center">
			<b><span runat='server' id='spnMWExtCSRBelow70' /></b>
		</td>
		<td>
			MW Extended cases per 10,000 poverty population below 70% of median (or less)
		</td>
	</tr>
	<tr>
		<td>d.</td>
		<td style="text-align:center">
			<b><span runat='server' id='spnMWContestedCSRBelow70' /></b>
		</td>
		<td>
			Migrant Contested cases per 10,000 poverty population below 70% of median (or less)
		</td>
	</tr>
	<tr>
		<td>b.</td>
		<td style="text-align:center">
			<b><span runat='server' id='spnPrecipitousDrop' /></b>
		</td>
		<td>
			Precipitous drop (more than 20%) in case numbers in the last two years?
		</td>
	</tr>
	<tr>
		<td>c.</td>
		<td>
			<span runat='server' id='spnOtherCsrNumberPatternsOther' />
		</td>
		<td>
			Other pattern?  Describe.
		</td>
	</tr>
</table>
<br />Comment below is required if "Yes" has been selected for item f above.
<span runat='server' id='spnOtherCsrNumberPatternsComment' />

<a name='q4'></a><p>4.  <b>Conclusion</b>. CSRs as indicated above:</p>
<span runat='server' id='spnCsrAnalysisConclusionID'/><br />
Briefly explain conclusions if not adequately covered above.<br />
Comment is required if "need to be looked into further" has been selected above.<br />
<span runat='server' id='spnCsrAnalysisComment' />
<br /><br />
<br />
<br />
<hr style="height:5px;width:100%;color:#888888"/>
<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscCsrAnalysisByRecipient' DataObjectDefinitionKey='LscCsrAnalysisByRecipient' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganization.LegacyOrganizationID' PropertyKey='recipient_id' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.WfTAYear' PropertyKey='year' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CurrentYear'>
					<Control ID='spnCurrentYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CasesCurrent' Format='#,0'>
					<Control ID='spnCasesCurrent'
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
				<DisplayProperty PropertyKey='TwoYrsAgo'>
					<Control ID='spnTwoYrsAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Cases2YrsAgo' Format='#,0'>
					<Control ID='spnCases2YrsAgo'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='TwoYrsAgo'>
					<Control ID='spnTwoYrsAgo'
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
				<DisplayProperty PropertyKey='MedianCasesPer10k_70'>
					<Control ID='spnMedianCasesPer10k_70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='MedianCasesPer10k_70'>
					<Control ID='spnMedianCasesPer10k_70_2'
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
				<DisplayProperty PropertyKey='ExtCSRBelow70' Format='YesNo'>
					<Control ID='spnExtCSRBelow70'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrecipitousDrop' Format='YesNo'>
					<Control ID='spnPrecipitousDrop'
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
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscCsrAnalysisByRecipientMW' DataObjectDefinitionKey='LscCsrAnalysisByRecipient' Updatable='False' CreateNew='False'>
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
		</DataObject>
		
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
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
				<DisplayProperty PropertyKey='LowCaseRateOther'>
					<Control ID='chkLowCaseRateOther'
						Type='cCheckBox'
						Container='spnLowCaseRateOther' />
				</DisplayProperty> 
				<DisplayProperty PropertyKey='LowCaseRateComment'>
					<Control ID='spnLowCaseRateComment'
						Type='HtmlGenericControl'/>
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
					<Control ID='spnOtherCsrNumberPatternsComment'
						Type='HtmlGenericControl'/>
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
					<Control ID='spnCsrAnalysisComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty> 
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>