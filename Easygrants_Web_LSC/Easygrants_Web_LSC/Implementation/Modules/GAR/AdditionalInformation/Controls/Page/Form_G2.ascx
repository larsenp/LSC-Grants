<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	              AutoVDateType='Last' Key='Form_E1a' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-2: Additional Information Relating to Cases</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlInstructions' 
	Src='Implementation/Modules/GAR/AdditionalInformation/Controls/PageSection/FormG2_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlFormD1F' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
		Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
		runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
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
		<td>
			<span runat='server' id='spnAdultsInHouseholds'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Total number of Children</b>
		</td>
		<td>
			<span runat='server' id='spnChildrenInHouseholds'/>
		</td>
	</tr>
	<tr style="height:20px; vertical-align:bottom">
		<td>&nbsp;</td>
		<td>
			<b>Total number of all persons served</b>
		</td>
		<td>
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
		<td>
		<span runat='server' id='spnDomesticViolenceCases'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	
</table>
<br />
<table width='600' cellspacing=0 cellpadding=4>
	<tr>
		<td class='SeparatorHdg' colspan='4'>
			Unreported Cases
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	  <td colspan="2">Please report below how many cases were closed with non-LSC funds in 2015 that were <strong>not</strong> reported to LSC. If none, please report 0 or none. Such cases include: (a) cases for clients who are not financially eligible under LSC guidelines but are eligible under non-LSC funding; (b) cases that are LSC-ineligible but are eligible for legal assistance supported with non-LSC funds; or (c) cases for which eligibility documentation was insufficient to support LSC eligibility but was sufficient to support eligibility for assistance with non-LSC funds. This data is important so LSC can get a better idea of the overall number of cases closed by LSC programs.  Note – it is unlikely that you have no such cases, but if you do, please enter 0 – do not leave the box blank.  </td>
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
	<tr>
		<td align='center' colspan="3">
			<span runat='server' id='spnSave'/>&nbsp;&nbsp; 
			<span runat='server' id='spnContinue'/>
		</td>
	</tr>
</table>
<br />
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscGarAdditionalInfo' DataObjectDefinitionKey='LscGarAdditionalInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type="DataPresenter" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DefaultValues>
				<Argument Type="DataPresenter" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AdultsInHouseholds'>
					<Control ID='txtAdultsInHouseholds'
						Type='cTextBox'
						Container='spnAdultsInHouseholds'
						Size='6'
						MaxLength='6'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Total number of Adults must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ChildrenInHouseholds'>
					<Control ID='txtChildrenInHouseholds'
						Type='cTextBox'
						Container='spnChildrenInHouseholds'
						Size='6'
						MaxLength='6'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='999999'
							ErrorMessage='Total number of Children must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DomesticViolenceCases'>
					<Control ID='txtDomesticViolenceCases'
						Type='cTextBox'
						Container='spnDomesticViolenceCases'
						Size='5'
						MaxLength='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='Total number of Cases involving Domestic Violence must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='LscGarAdditionalInfoTotals' DataObjectDefinitionKey='LscGarAdditionalInfoTotals' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type="DataPresenter" TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TotalPersonsServed' Format='#,0'>
					<Control ID='spnTotalPersonsServed'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		
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
			 </DisplayProperties>
		   </DataObject>
		   
		   <DataObject Key='User' DataObjectDefinitionKey='User' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save and Calculate'
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
						GoToNextPage='True'>
						 <Visible>
						      <Argument PropertyKey='UserTypeID' Value='1' />
					    </Visible>
					 </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
	</ModuleSection>
</span>
