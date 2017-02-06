<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.SelfInspection.cCertification" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
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
    <td><h1>Form G-6: Self-Inspection Certification</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormG6' 
	Src='Implementation/Modules/GAR/SelfInspection/Controls/Page/Certification_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormG6F' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
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
	  <td colspan="3">Recipient certifies that it has completed the Self-Inspection Procedure as required by Program Letter 15-6. Pursuant to the instructions in the Program Letter:</td>
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
			<span runat='server' id='spnCases' />
		</td>
	</tr>
	<tr>
		<td >&nbsp;</td>
		<td valign='top'>
		<strong>B)</strong>		</td>
		<td>
			Number of exception cases within the sample. The accompanying Self-Inspection Summary Form accurately reports, by category, actual numbers of exceptions noted during the Self Inspection. (This number must be smaller than the number in item A and may be 0.)</td>
		<td valign='top'>
			<span runat='server' id='spnExceptions' />
			<asp:CustomValidator id='valCusExceptions'
				runat='server'
				OnServerValidate='ValidateExceptions'
				ErrorMessage='A whole number which may be zero but may not be greater than the number in Box A must be entered in Box B.'
				Display="none" />
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
			Some cases were excluded from the 2015 CSR data submitted to LSC as a result of a case review done <em>prior</em> to the Self-Inspection.
		</td>
		<td>
			<span runat='server' id='spnExcludePri' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td valign='top'><b>2)</b></td>
		<td>
			Some cases were excluded from the 2015 CSR data submitted to LSC as a result of a case review done <em>after</em> the Self-Inspection.
		</td>
		<td>
			<span runat='server' id='spnExcludeAft' />
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			If Yes, enter the number of cases so excluded from report to LSC
		</td>
		<td>
			<span runat='server' id='spnExcludeCase' />
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
			<span runat='server' id='spnIncome' />&nbsp;
			Income eligibility was not documented
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			<span runat='server' id='spnAssets' />&nbsp;
			Assets eligibility was not documented
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			<span runat='server' id='spnCitizenship' />&nbsp;
			Citizenship/alien eligibility was not documented
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			<span runat='server' id='spnNotInFile' />&nbsp;
			Evidence of actual legal assistance rendered to the client was not in the file
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			<span runat='server' id='spnNotTimely' />&nbsp;
			Case closure was not timely
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			<span runat='server' id='spnOther' />&nbsp;
			Other (Specify)
		</td>
	</tr>
	<tr>
		<td colspan='2' >&nbsp;</td>
		<td>
			<span runat='server' id='spnOtherSpec' />
		</td>
	</tr>
	<tr>
	  <td colspan='2' >&nbsp;</td>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td colspan='4'>
			If corrective action was taken <i>after</i> the Self Inspection to exclude cases from the 2015 CSR data 
			reported to LSC, the attached Self Inspection Summary Form indicates in what categories such corrective action was taken.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			Name of Executive Director<br />
			<span runat='server' id='spnExecDir' />
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
				<DisplayProperty PropertyKey='Cases'>
					<Control ID='txtCases'
						Type='cTextBox'
						Container='spnCases'
						MaxLength='6'
						Size='5'
						RequiredField='True'
						ErrorMessage='A whole number greater than zero must be entered in Certification Box A.'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='1'
							MaximumValue='999999'
							ErrorMessage='A whole number greater than zero must be entered in Certification Box A.'/>
				</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Exceptions'>
					<Control ID='txtExceptions'
						Type='cTextBox'
						Container='spnExceptions'
						MaxLength='6'
						Size='5'
						RequiredField='True'
						ErrorMessage='A whole number which may be zero but may not be greater than the number in Box A must be entered in Box B.'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='A whole number which may be zero but may not be greater than the number in Box A must be entered in Box B.'/>
				</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExcludePri'>
					<Control ID='ctlExcludePri'
						Type='cRadioButtonList'
						Container='spnExcludePri'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExcludeAft'>
					<Control ID='ctlExcludeAft'
						Type='cRadioButtonList'
						Container='spnExcludeAft'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExcludeCase'>
					<Control ID='txtExcludeCase'
						Type='cTextBox'
						Container='spnExcludeCase'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases excluded after self-inspection must be a whole number zero or greater.'/>
				</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Income'>
					<Control ID='chkIncome'
						Type='cCheckBox'
						Container='spnIncome'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Assets'>
					<Control ID='chkAssets'
						Type='cCheckBox'
						Container='spnAssets'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Citizenship'>
					<Control ID='chkCitizenship'
						Type='cCheckBox'
						Container='spnCitizenship'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NotInFile'>
					<Control ID='chkNotInFile'
						Type='cCheckBox'
						Container='spnNotInFile'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NotTimely'>
					<Control ID='chkNotTimely'
						Type='cCheckBox'
						Container='spnNotTimely'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='chkOther'
						Type='cCheckBox'
						Container='spnOther'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherSpec'>
					<Control ID='txtOtherSpec'
						Type='cTextBox'
						Container='spnOtherSpec'
						Size='50'
						MaxLength='100'>
				</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ExecDir'>
					<Control ID='txtExecDir'
						Type='cTextBox'
						Container='spnExecDir'
						Size='50'
						MaxLength='50' />
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
						Container='spnContinue' >
						<Action
	                        PostBack='True'
	                        AutoSave='True'
	                        Object='EventController'
	                        Method='EventController_NavigateToModulePageKey'>
	                        <Parameters>
		                            <Argument Value='Summary'/>
		                            <Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
	                        </Parameters>							
	                    </Action>
				     </Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
