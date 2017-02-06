<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.GAR.ActualStaffing.Controls.Page.cStaffMemberEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
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
    <td><h1>Form E-1 : Staff Member Editor</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormE1' 
	Src='Implementation/Modules/GAR/ActualStaffing/Controls/PageSection/FormE1_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>

<Core:cUserCtlLoader ID="CUserCtlLoader4" CtlID='ctlStaffMemberEditor' 
	Src='Implementation/Modules/GAR/ActualStaffing/Controls/PageSection/StaffMemberEditor.ascx'
	runat='server'/>

<table width='800' cellpadding='5' cellspacing='0' >
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='5' align="center">
			<span runat="server" id='spnSave'/>&nbsp;&nbsp;
			<span runat="server" id='spnClose' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True'>
							<%--Object='EventController'
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument Value='StaffMemberEditor' />
								<Argument Type='DataPresenter' TypeKey='LscStaffDetailID' BaseValue='LscStaffDetailID=' />
								<Argument Type='QueryString' TypeKey='LscOfficeID' BaseValue='LscOfficeID=' />--%>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Container='spnClose'
						Caption='Close'
						Confirmation='Click OK to leave the Staff Detail Editor without saving your data. Click Cancel to return to the Staff Detail listing.'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>	
							<Parameters>
								<%--<Argument Type='QueryString' TypeKey='Page' BaseValue='ReturnPageKey=' />--%>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
								
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStaffMemberEditor'
						Type='cUserCtlLoader' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

