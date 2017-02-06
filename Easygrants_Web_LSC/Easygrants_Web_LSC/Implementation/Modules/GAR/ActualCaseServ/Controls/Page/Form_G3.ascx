<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
   <td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	AutoVDateType='Last' Key='Form_J1' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-3: Actual Case Services (Staff)</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormG3' 
	Src='Implementation/Modules/GAR/ActualCaseServ/Controls/PageSection/FormG_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormG3F' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<div width='100%' class='SeparatorHdg'>
	Information
</div>
<br />
<table>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='400'>
			Did you close any cases funded under Title III or IV of the Older Americans Act?
		</td>
		<td>
			<span runat="server" id='spnFullyFund' />
		</td>
	</tr>
	<tr>
		<td width='30'>&nbsp;</td>
		<td>
			If yes, please report the total number of Title III and Title IV cases closed (excluding 
			cases already reported to LSC and excluding cases ineligible for reasons other than client financial eligibility)
		</td>
		<td>
			<span runat='server' id='spnPct' />
		</td>
	</tr>
</table>
<br />
<div width='100%' class='SeparatorHdg'>
	Detail
</div>
<br />
<Core:cUserCtlLoader CtlID='ctlGrid' 
	Src='Implementation/Modules/GAR/ActualCaseServ/Controls/PageSection/ActualCaseServGrid.ascx'
	runat='server'/>
<br /><br />

<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscCsrQuestion' DataObjectDefinitionKey='LscCsrQuestion' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FullyFund'>
					<Control ID='ctlFullyFund'
						Container='spnFullyFund'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Pct'>
					<Control ID='ctlPct'
						Container='spnPct'
						Type='cTextBox'
						MaxLength='5'
						Size='10'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of cases closed must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrid'
						Type='cUserCtlLoader' />
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
