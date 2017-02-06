<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	              AutoVDateType='Last' Key='Form_G5' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-5(d): Actual Open Cases (PAI)</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormG5d' 
	Src='Implementation/Modules/GAR/ActualOpenCases/Controls/PageSection/FormG5d_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormG5dF' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlEditor' 
	Src='Implementation/Modules/GAR/ActualOpenCases/Controls/PageSection/ActualOpenCasesPAIEditor.ascx'
	runat='server'/>
<br />
<table width='600'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp; 
			<span runat='server' id='spnContinue'/>
		</td>
	</tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
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
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEditor' 
						Type='cUserCtlLoader ' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
