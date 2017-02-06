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
    <td><h1>Form M: Outreach</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormIV' 
	Src='Implementation/Modules/GAR/OtherServices/Controls/PageSection/FormIV_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormIVF' 
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
			Outreach
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Informational Notices Published in Print Media
		</td>
		<td>
			<span runat='server' id='spnIV1_Info' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			TV Spots or PSAs
		</td>
		<td>
			<span runat='server' id='spnIV2_TV' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Radio Spots or PSAs
		</td>
		<td>
			<span runat='server' id='spnIV3_Radio' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Newsletter(s) - External to Program
		</td>
		<td>
			<span runat='server' id='spnIV4_News' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Referral Agreements with Other Agencies
		</td>
		<td>
			<span runat='server' id='spnIV5_Refer' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<i>How to Reach Us</i> page on Web Sites
		</td>
		<td>
			<span runat='server' id='spnIV6_How' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Other - Please Describe in Narrative
		</td>
		<td>
			<span runat='server' id='spnIV7_Other' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr >
		<td colspan='3' align='center'>
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

		<DataObject Key='LscOtherServices' DataObjectDefinitionKey='LscOtherServices' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='GranteeProject.PrimaryOrganizationID' PropertyKey='OrganizationID' />
				<Argument Type='DataObjectCollection' TypeKey='WfTaskAssignment' DataObjectPropertyKey='WfTACompetitionYear.TimePeriodID' PropertyKey='TimePeriodID'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IV1_Info'>
					<Control ID='txtIV1_Info'
						Type='cCheckBox'
						Container='spnIV1_Info'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IV2_TV'>
					<Control ID='txtIV2_TV'
						Type='cCheckBox'
						Container='spnIV2_TV'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IV3_Radio'>
					<Control ID='txtIV3_Radio'
						Type='cCheckBox'
						Container='spnIV3_Radio'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IV4_News'>
					<Control ID='txtIV4_News'
						Type='cCheckBox'
						Container='spnIV4_News'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IV5_Refer'>
					<Control ID='txtIV5_Refer'
						Type='cCheckBox'
						Container='spnIV5_Refer'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IV6_How'>
					<Control ID='txtIV6_How'
						Type='cCheckBox'
						Container='spnIV6_How'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IV7_Other'>
					<Control ID='txtIV7_Other'
						Type='cCheckBox'
						Container='spnIV7_Other'/>
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
		                            <Argument Value='IndirectOtherServices'/>
		                            <Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
	                        </Parameters>							
	                    </Action>
				     </Control>		
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
