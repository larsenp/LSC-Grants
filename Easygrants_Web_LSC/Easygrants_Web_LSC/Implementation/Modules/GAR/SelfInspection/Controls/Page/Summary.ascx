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
    <td><h1>Form G-6: Self-Inspection Summary</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlSummaryIns' 
	Src='Implementation/Modules/GAR/SelfInspection/Controls/Page/Summary_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlfooter' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<table width='600' cellspacing=0 cellpadding=5>
	<tr>
		<td class='SeparatorHdg' colspan='4'>
			Self-Inspection summary
		</td>
	</tr>
	<tr>
	  <td colspan="4">The numeric entries in the &ldquo;Numbers of Cases&rdquo; column of this form represent the numbers of cases in which exceptions were noted (by &ldquo;No&rdquo; answers) in individual Case Review forms completed in the Self-Inspection process required by Program Letter 15-6. The &ldquo;Yes&rdquo; or &ldquo;No&rdquo; entries in the &ldquo;Corrective Action&rdquo; column indicate whether the Recipient has (or has not) undertaken corrective action, not just in cases sampled in the Self-Inspection but also in affected cases outside the sample, which resulted in adjustments to the 2015 CSR data submitted to LSC.</td>
	  </tr>
	<tr>
		<td width='10'>&nbsp;</td>
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
			3. Cases in which household income was over 125% but not over 200% of the poverty line and the required documentation was not on file
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
			4. Cases in which assets information was not recorded
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
			5. Telephone cases in which citizenship/alien status was not noted (and client is not eligible under 
			VAWA 2006 or TVPA - see Program Letters 05-2 and 06-2)
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
			6. Non-telephone cases which lacked a citizenship attestation or documentation of alien eligibility
			(and client not eligible under VAWA 2006 or TVPA - see Program Letters 05-2 and 06-2)
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
			7. Cases in which the case handler was not an attorney or a person acting in the capacity of a 
			paralegal
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
			8. Cases in which there is no written evidence of advice or representation
		</td>
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
			9. Counsel &amp; Advice or Limited Action cases opened prior to 10/1/14 and not falling under the exception 3.3(a)(ii) of the 2008 CSR Handbook, as amended or, for PAI cases, the exception in §10.3 of the 2008 CSR Handbook, as amended 2011</td>
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
			10. Extended service cases in which no legal assistance activity occurred in 2014 or 2015</td>
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
			11. Cases in which the client is not identified by name
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
			12. Cases reported more than once in 2015 with the same client, problem code, and set of facts
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
			13. Cases that do not fall within an eligible case type.  (That is restricted case type such as a class 
			action, abortion case, redistricting case, representation of an incarcerated person, etc. or a case 
			type that may be pursued only with non-LSC funds).
		</td>
		<td>
			<span runat='server' id='spnQCase13' />
		</td>
		<td>
			<span runat='server' id='spnAction13' />
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
				<DisplayProperty PropertyKey='QCase1'>
					<Control ID='txtQCase1'
						Type='cTextBox'
						Container='spnQCase1'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					 </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='Action1'>
					 <Control ID='rdoAction1'
						Type='cRadioButtonList'
						Container='spnAction1'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					 </Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase2'>
					<Control ID='txtQCase2'
						Type='cTextBox'
						Container='spnQCase2'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action2'>
					<Control ID='rdoAction2'
						Type='cRadioButtonList'
						Container='spnAction2'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase3'>
					<Control ID='txtQCase3'
						Type='cTextBox'
						Container='spnQCase3'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action3'>
					<Control ID='rdoAction3'
						Type='cRadioButtonList'
						Container='spnAction3'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase4'>
					<Control ID='txtQCase4'
						Type='cTextBox'
						Container='spnQCase4'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action4'>
					<Control ID='rdoAction4'
						Type='cRadioButtonList'
						Container='spnAction4'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase5'>
					<Control ID='txtQCase5'
						Type='cTextBox'
						Container='spnQCase5'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action5'>
					<Control ID='rdoAction5'
						Type='cRadioButtonList'
						Container='spnAction5'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase6'>
					<Control ID='txtQCase6'
						Type='cTextBox'
						Container='spnQCase6'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action6'>
					<Control ID='rdoAction6'
						Type='cRadioButtonList'
						Container='spnAction6'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase7'>
					<Control ID='txtQCase7'
						Type='cTextBox'
						Container='spnQCase7'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action7'>
					<Control ID='rdoAction7'
						Type='cRadioButtonList'
						Container='spnAction7'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase8'>
					<Control ID='txtQCase8'
						Type='cTextBox'
						Container='spnQCase8'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action8'>
					<Control ID='rdoAction8'
						Type='cRadioButtonList'
						Container='spnAction8'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase9'>
					<Control ID='txtQCase9'
						Type='cTextBox'
						Container='spnQCase9'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action9'>
					<Control ID='rdoAction9'
						Type='cRadioButtonList'
						Container='spnAction9'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase10'>
					<Control ID='txtQCase10'
						Type='cTextBox'
						Container='spnQCase10'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action10'>
					<Control ID='rdoAction10'
						Type='cRadioButtonList'
						Container='spnAction10'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase11'>
					<Control ID='txtQCase11'
						Type='cTextBox'
						Container='spnQCase11'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action11'>
					<Control ID='rdoAction11'
						Type='cRadioButtonList'
						Container='spnAction11'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase12'>
					<Control ID='txtQCase12'
						Type='cTextBox'
						Container='spnQCase12'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action12'>
					<Control ID='rdoAction12'
						Type='cRadioButtonList'
						Container='spnAction12'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='QCase13'>
					<Control ID='txtQCase13'
						Type='cTextBox'
						Container='spnQCase13'
						MaxLength='6'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Number of cases must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Action13'>
					<Control ID='rdoAction13'
						Type='cRadioButtonList'
						Container='spnAction13'
						LoadParam='True'
						RepeatDirection='Horizontal'>
							<Parameters>
								<Parameter StoredValue='True' DisplayValue='Yes'/>
								<Parameter StoredValue='False' DisplayValue='No'/>
							</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscSelfInspectionTotal.QCaseTotal'>
					<Control ID='spnQCaseTotal'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save and Calculate'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue' >
						<Action
	                        PostBack='True'
	                        AutoSave='True'
	                        Object='EventController'
	                        Method='EventController_NavigateToModulePageKey'>
	                        <Parameters>
		                            <Argument Value='Unreported'/>
		                            <Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
	                        </Parameters>							
	                    </Action>
				     </Control>				
				</DisplayProperty>--%>
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
