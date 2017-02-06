<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan='3'><h1>Form G-2: Additional Information Relating to Cases</h1></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  	<td colspan="3">
		<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
			Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
			runat='server'/>
	</td>
	</tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan='3' class="SeparatorHdg">Additional Information Relating to Cases</td>
  </tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td style="width:20px">
			<b>1.</b>
		</td>
		<td colspan="2">
			<b>Total number of Persons in all Households Served:</b>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total number of Adults</b>
		</td>
		<td style="text-align:right">
			<b><span runat='server' id='spnAdultsInHouseholds'/></b>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total number of Children</b>
		</td>
		<td style="text-align:right">
			<b><span runat='server' id='spnChildrenInHouseholds'/></b>
		</td>
	</tr>
	<tr style="height:20px; vertical-align:bottom">
		<td>&nbsp;</td>
		<td>
			<b>Total number of all persons served</b>
		</td>
		<td style="text-align:right">
			<b><span runat='server' id='spnTotalPersonsServed'/></b>
		</td>
	</tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
	<tr>
		<td style="width:20px">
			<b>2.</b>
		</td>
		<td>
			<b>Total number of Cases involving Domestic Violence</b>
		</td>
		<td style="text-align:right">
			<b><span runat='server' id='spnDomesticViolenceCases'/></b>
		</td>
	</tr>
</table>
<br />
<table width='600' cellspacing=0 cellpadding=5>
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
</table>
<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscGarAdditionalInfoTotals' DataObjectDefinitionKey='LscGarAdditionalInfoTotals' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataPresenter" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AdultsInHouseholds' Format='#,0'>
					<Control ID='spnAdultsInHouseholds'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChildrenInHouseholds' Format='#,0'>
					<Control ID='spnChildrenInHouseholds'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalPersonsServed' Format='#,0'>
					<Control ID='spnTotalPersonsServed'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DomesticViolenceCases' Format='#,0'>
					<Control ID='spnDomesticViolenceCases'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
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
			    <DisplayProperty PropertyKey='NlscCases'>
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
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
