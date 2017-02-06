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
    <td><h1>Form M: Indirect Other Services</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormV' 
	Src='Implementation/Modules/GAR/OtherServices/Controls/PageSection/FormV_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormVF' 
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
			Indirect Other Services
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><strong>Models Used</strong></td>
  </tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Legal Education for Lay Service Providers
		</td>
		<td>
			<span runat='server' id='spnV1_Legal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Collaborative Service Delivery Models
		</td>
		<td>
			<span runat='server' id='spnV2_Collab' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Miscellaneous Indirect Other Services<br>
		    <em>Please describe in Narrative
        </em>		</td>
		<td>
			<span runat='server' id='spnV3_Other' />
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
				<DisplayProperty PropertyKey='V1_Legal'>
					<Control ID='txtV1_Legal'
						Type='cCheckBox'
						Container='spnV1_Legal'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='V2_Collab'>
					<Control ID='txtV2_Collab'
						Type='cCheckBox'
						Container='spnV2_Collab'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='V3_Other'>
					<Control ID='txtV3_Other'
						Type='cCheckBox'
						Container='spnV3_Other'/>
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
		                            <Argument Value='MiscOtherServices'/>
		                            <Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
	                        </Parameters>							
	                    </Action>
				     </Control>		
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
