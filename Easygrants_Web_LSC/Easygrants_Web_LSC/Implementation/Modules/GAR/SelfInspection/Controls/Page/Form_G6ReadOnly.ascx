<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-6: Self-Inspection</h1></td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<table width='600' cellspacing='0' cellpadding='2'>
	<tr>
		<td class='SeparatorHdg' colspan='6'>
			Self-Inspection Certification
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	  <td colspan="3">Recipient certifies that it has completed the Self-Inspection Procedure as required by Program Letter 11-2. Pursuant to the instructions in the Program Letter.</td>
	  <td valign='top'>&nbsp;</td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
	  <td valign='top'>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td valign='top'>&nbsp;</td>
  </tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='20' valign='top'>
		<strong>A)</strong>		</td>
		<td>
			Representative sample of the total number of closed cases being reported to LSC that have been reviewed. (The number must be greater than 0).</td>
		<td valign='top'>
			<strong><span runat='server' id='spnCases' /></strong>
		</td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td valign='top'>
		<strong>B)</strong>		</td>
		<td>
			Number of exception cases within the sample. The accompanying Self-Inspection Summary Form accurately reports, by category, actual numbers of exceptions noted during the Self Inspection. (This number must be smaller than the number in item A and may be 0.)</td>
		<td valign='top'>
			<strong><span runat='server' id='spnExceptions' /></strong>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="3" >
			Recipient further certifies that:		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td valign='top'><b>1)</b></td>
		<td>
			Some cases were excluded from the 2011 CSR data submitted to LSC as a result of a case review done <em>prior</em> to the Self-Inspection.
		</td>
		<td>
			<strong><span runat='server' id='spnExcludePri' /></strong>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td valign='top'><b>2)</b></td>
		<td>
			Some cases were excluded from the 2011 CSR data submitted to LSC as a result of a case review done <em>after</em> the Self-Inspection.
		</td>
		<td>
			<strong><span runat='server' id='spnExcludeAft' /></strong>
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			If Yes, enter the number of cases so excluded from report to LSC
		</td>
		<td>
			<strong><span runat='server' id='spnExcludeCase' /></strong>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td valign='top'><b>3)</b></td>
		<td>
			If cases were excluded as a result of a case review done <em>prior</em> to the Self Inspection, they were excluded because (check all that apply):
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
		
			Income eligibility was not documented
		</td>
		<td>
			<strong><span runat='server' id='spnIncome' /></strong>
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			Assets eligibility was not documented
		</td>
		<td>
			<strong><span runat='server' id='spnAssets' /></strong>
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			Citizenship/alien eligibility was not documented
		</td>
		<td>
			<strong><span runat='server' id='spnCitizenship' /></strong>
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			Evidence of actual legal assistance rendered to the client was not in the file
		</td>
		<td>
			<strong><span runat='server' id='spnNotInFile' /></strong>
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			Case closure was not timely
		</td>
		<td>
			<strong><span runat='server' id='spnNotTimely' /></strong>
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			Other (Specify)
		</td>
		<td>
			<strong><span runat='server' id='spnOther' /></strong>
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			<strong><span runat='server' id='spnOtherSpec' /></strong>
		</td>
	</tr>
	<tr>
	  <td colspan='2' >&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td colspan='4'>
			If corrective action was taken <i>after</i> the Self Inspection to exclude cases from the 2011 CSR data 
			reported to LSC, the attached Self Inspection Summary Form indicates in what categories such corrective action was taken.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			Name of Executive Director<br />
			<strong><span runat='server' id='spnExecDir' /></strong>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table width='600' cellspacing=0 cellpadding=5>
	<tr>
		<td class='SeparatorHdg' colspan='4'>
			Self-Inspection summary
		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td colspan="4">The numeric entries in the &ldquo;Numbers of Cases&rdquo; column of this form represent the numbers of cases in which exceptions were noted (by &ldquo;No&rdquo; answers) in individual Case Review forms completed in the Self-Inspection process required by Program Letter 11-2. The check box entries in the &ldquo;Corrective Action&rdquo; column indicate whether the Recipient has (or has not) undertaken corrective action, not just in cases sampled in the Self-Inspection but also in affected cases outside the sample, which resulted in adjustments to the 2011 CSR data submitted to LSC.</td>
	  </tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>  </tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td class='MinorSeparatorHdg'>
			Types of Cases
		</td>
		<td class='MinorSeparatorHdg'>
			Number of Cases
		</td>
		<td class='MinorSeparatorHdg'>
			Corrective Action
              <br>
              (Yes/No)
</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			1. Cases in which income information was not recorded
		</td>
		<td>
			<span runat='server' id='spnQCase1' />
		</td>
		<td>
			<span runat='server' id='spnAction1' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			2. Cases in which household income exceed 200% of the poverty guidelines
		</td>
		<td>
			<span runat='server' id='spnQCase2' />
		</td>
		<td>
			<span runat='server' id='spnAction2' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			3. Cases in which assets information was not recorded
		</td>
		<td>
			<span runat='server' id='spnQCase3' />
		</td>
		<td>
			<span runat='server' id='spnAction3' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			4. Telephone cases in which citizenship/alien status was not noted (and client is not eligible under 
			VAWA 2006 or TVPA - see Program Letters 05-2 and 06-2)
		</td>
		<td>
			<span runat='server' id='spnQCase4' />
		</td>
		<td>
			<span runat='server' id='spnAction4' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			5. Non-telephone cases which lacked a citizenship attestation or documentation of alien eligibility
			(and client not eligible under VAWA 2006 or TVPA - see Program Letters 05-2 and 06-2)
		</td>
		<td>
			<span runat='server' id='spnQCase5' />
		</td>
		<td>
			<span runat='server' id='spnAction5' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			6. Cases in which the case handler was not an attorney or a person acting in the capacity of a 
			paralegal
		</td>
		<td>
			<span runat='server' id='spnQCase6' />
		</td>
		<td>
			<span runat='server' id='spnAction6' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			7. Cases in which there is no written evidence of advice or representation
		</td>
		<td>
			<span runat='server' id='spnQCase7' />
		</td>
		<td>
			<span runat='server' id='spnAction7' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			8. Counsel &amp; Advice or Limited Action cases opened prior to 10/1/10 and not falling under the exception 3.3(a)(ii) of the 2008 CSR Handbook or, for PAI cases, the exception in §10.3 of the 2008 CSR Handbook, as amended</td>
		<td>
			<span runat='server' id='spnQCase8' />
		</td>
		<td>
			<span runat='server' id='spnAction8' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			9. Extended service cases in which no legal assistance activity occurred in 2010 or 2011</td>
		<td>
			<span runat='server' id='spnQCase9' />
		</td>
		<td>
			<span runat='server' id='spnAction9' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			10. Cases in which the client is not identified by name
		</td>
		<td>
			<span runat='server' id='spnQCase10' />
		</td>
		<td>
			<span runat='server' id='spnAction10' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			11. Cases reported more than once in 2011 with the same client, problem code, and set of facts
		</td>
		<td>
			<span runat='server' id='spnQCase11' />
		</td>
		<td>
			<span runat='server' id='spnAction11' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			12. Cases that do not fall within an eligible case type.  (That is restricted case type such as a class 
			action, abortion case, redistricting case, representation of an incarcerated person, etc. or a case 
			type that may be pursued only with non-LSC funds).
		</td>
		<td>
			<span runat='server' id='spnQCase12' />
		</td>
		<td>
			<span runat='server' id='spnAction12' />
		</td>
	</tr>
	<tr valign='top'>
		<td>&nbsp;</td>
		<td>
			<b>Total</b>
		</td>
		<td>
			<b><span runat='server' id='spnQCaseTotal' /></b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<%--<table width='600' cellspacing=0 cellpadding=5>
	<tr>
		<td class='SeparatorHdg' colspan='4'>
			Unreported Cases
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	  <td colspan="2">Please report below how many cases were closed with non-LSC funds in 2011 that were not reported to LSC. If none, please report 0 or none. Such cases may be cases for clients who are not financially eligible under LSC guidelines but are eligible under a non-LSC program; they may be cases that are for clients who are LSC-ineligible but are eligible for legal assistance supported with non-LSC funds; or they may be cases where eligibility documentation was insufficient to support LSC eligibility but sufficient to support eligibility for assistance with non-LSC funds. </td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td>
			Number of non-LSC funded cases not reported to LSC *
		</td>
		<td>
			<strong><span runat='server' id='spnNlscCases' /></strong>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			If above number greater than 0, then:
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td valign='top'>
			Figure based on (A = Actual count; B = Estimate; C = Partly a count and partly an estimate)
		</td>
		<td>
			<strong><span runat='server' id='spnFigure' /></strong>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			If (c) then:
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Number Counted
		</td>
		<td>
			<strong><span runat='server' id='spnCounted' /></strong>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Number Estimated
		</td>
		<td>
			<strong><span runat='server' id='spnEstimated' /></strong>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>--%>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscSelfInspection' DataObjectDefinitionKey='LscSelfInspection' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Cases'>
					<Control ID='spnCases'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Exceptions'>
					<Control ID='spnExceptions'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExcludePri' Format='YesNo'>
					<Control ID='spnExcludePri'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExcludeAft' Format='YesNo'>
					<Control ID='spnExcludeAft'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExcludeCase'>
					<Control ID='spnExcludeCase'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Income' Format='YesNo'>
					<Control ID='spnIncome'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Assets' Format='YesNo'>
					<Control ID='spnAssets'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Citizenship' Format='YesNo'>
					<Control ID='spnCitizenship'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NotInFile' Format='YesNo'>
					<Control ID='spnNotInFile'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NotTimely' Format='YesNo'>
					<Control ID='spnNotTimely'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other' Format='YesNo'>
					<Control ID='spnOther'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherSpec'>
					<Control ID='spnOtherSpec'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExecDir'>
					<Control ID='spnExecDir'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<DisplayProperty PropertyKey='QCase1'>
					<Control ID='spnQCase1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action1' Format='YesNo'>
					<Control ID='spnAction1'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase2'>
					<Control ID='spnQCase2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action2' Format='YesNo'>
					<Control ID='spnAction2'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase3'>
					<Control ID='spnQCase3'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action3' Format='YesNo'>
					<Control ID='spnAction3'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase4'>
					<Control ID='spnQCase4'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action4' Format='YesNo'>
					<Control ID='spnAction4'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase5'>
					<Control ID='spnQCase5'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action5' Format='YesNo'>
					<Control ID='spnAction5'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase6'>
					<Control ID='spnQCase6'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action6' Format='YesNo'>
					<Control ID='spnAction6'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase7'>
					<Control ID='spnQCase7'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action7' Format='YesNo'>
					<Control ID='spnAction7'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase8'>
					<Control ID='spnQCase8'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action8' Format='YesNo'>
					<Control ID='spnAction8'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase9'>
					<Control ID='spnQCase9'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action9' Format='YesNo'>
					<Control ID='spnAction9'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase10'>
					<Control ID='spnQCase10'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action10' Format='YesNo'>
					<Control ID='spnAction10'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase11'>
					<Control ID='spnQCase11'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action11' Format='YesNo'>
					<Control ID='spnAction11'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase12'>
					<Control ID='spnQCase12'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action12' Format='YesNo'>
					<Control ID='spnAction12'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscSelfInspectionTotal.QCaseTotal'>
					<Control ID='spnQCaseTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>

				<%--<DisplayProperty PropertyKey='NlscCases'>
					<Control ID='spnNlscCases'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Figure'>
					<Control ID='spnFigure'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Counted'>
					<Control ID='spnCounted'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Estimated'>
					<Control ID='spnEstimated'
						Type='HtmlGenericControl'/>
				</DisplayProperty>--%>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
