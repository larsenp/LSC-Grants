<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
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
    <td><h1>Form E-2(c): Projected Staffing Subrecipient</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormE2c' 
	Src='Implementation/Modules/GAR/ProjectedStaffing/Controls/PageSection/FormE2c_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormE2cF' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlProjectedStaffing' 
	Src='Implementation/Modules/GAR/ProjectedStaffing/Controls/PageSection/ProjectedStaffingEditor.ascx'
	runat='server'
	Properties='OffTypeID=3'/>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnSaveAndCalculate'/>&nbsp;&nbsp;
	<span runat="server" id='spnContinue' />
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='User' DataObjectDefinitionKey='User' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndCalculate'
						Type='cButton'
						Container='spnSaveAndCalculate'
						Caption='Save and Calculate'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Caption='Save and Continue'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Submission' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Save and Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
						<Visible>
						      <Argument PropertyKey='UserTypeID' Value='1' />
					    </Visible>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProjectedStaffing'
						Type='cUserCtlLoader' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
