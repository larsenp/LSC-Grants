<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	              AutoVDateType='Last' Key='Form_E2c' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-6: Self-Inspection Unreported Non-LSC Case</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlUnreported' 
	Src='Implementation/Modules/GAR/SelfInspection/Controls/Page/Unreported_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlUnreportedF' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<table width='600' cellspacing=0 cellpadding=4>
	<tr>
		<td class='SeparatorHdg' colspan='4'>
			Unreported Cases
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	  <td colspan="2">Please report below how many cases were closed with non-LSC funds in 2014 that were not reported to LSC. If none, please report 0 or none. Such cases may be cases for clients who are not financially eligible under LSC guidelines but are eligible under a non-LSC program; they may be cases that are for clients who are LSC-ineligible but are eligible for legal assistance supported with non-LSC funds; or they may be cases where eligibility documentation was insufficient to support LSC eligibility but sufficient to support eligibility for assistance with non-LSC funds. If you close any unreported Non-LSC cases, please make every effort to give us a number that reasonably reflects your total of such cases to the best of your ability.  LSC needs this information to get a better idea of the overall number of cases closed by LSC programs.   </td>
	  <td>&nbsp;</td>
  </tr>
</table>
<br />
<br />
<table width='600' cellspacing=0 cellpadding=4>
	<tr>
		<td>&nbsp;</td>
		<td>
			Number of non-LSC funded cases not reported to LSC<Font color='Red'>*</Font>
		</td>
		<td>
			<span runat='server' id='spnNlscCases' />
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
		<td>
			<b>Check one of the alternatives below</b>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td valign='top'>
			Figure based on
		</td>
		<td>
			<span runat='server' id='spnFigure' />
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
			<span runat='server' id='spnCounted' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Number Estimated
		</td>
		<td>
			<span runat='server' id='spnEstimated' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr >
		<td colspan='4' align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>

		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
		</DataObject>

		<DataObject Key='LscSelfInspection' DataObjectDefinitionKey='LscSelfInspection' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NlscCases'>
					<Control ID='txtNlscCases'
						Type='cTextBox'
						Container='spnNlscCases'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of non-LSC cases not funded by LSC must be a whole number zero or greater.'/>
				</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Figure'>
					<Control ID='ctlFigure'
						Type='cRadioButtonList'
						Container='spnFigure'
						LoadParam='True'
						RepeatDirection='Vertical'>
						<Parameters>
							<Parameter StoredValue='A' DisplayValue='(a) Actual Count'/>
							<Parameter StoredValue='B' DisplayValue='(b) Estimate'/>
							<Parameter StoredValue='C' DisplayValue='(c) Partly a Count and Partly an Estimate'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Counted'>
					<Control ID='txtCounted'
						Type='cTextBox'
						Container='spnCounted'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number Counted must be a whole number zero or greater.'/>
				</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Estimated'>
					<Control ID='txtEstimated'
						Type='cTextBox'
						Container='spnEstimated'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number Estimated must be a whole number zero or greater.'/>
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
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
