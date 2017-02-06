<%@ Control Language="vb" AutoEventWireup="true" Codebehind="WSTest1.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cWSTest1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>
<br>
<br>

Parameter 1:&nbsp;&nbsp;
<span id='spnParam1' runat='server'>
	<Core:cUserCtlLoader CtlID='ctlParam1'
		Type='cTextBox'
		runat='server'/>
</span>
<br>
Parameter 2:&nbsp;&nbsp;
<span id='spnParam2' runat='server'>
	<Core:cUserCtlLoader CtlID='ctlParam2'
		Type='cTextBox'
		runat='server'/>
</span>
<br>
Result:&nbsp;&nbsp;
<span id='spnResult' runat='server'>
	<Core:cUserCtlLoader CtlID='ctlResult'
		Type='cTextBox'
		runat='server'/>
</span>
<br>
<span id='spnGo' runat='server' />

<br><br>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AdHocQuery' DataObjectDefinitionKey='' >
			<Sort>
				<Argument PropertyKey='Name' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnGo'
						Type='cButton'
						Container='spnGo'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='RunService'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlParam1' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlParam2' ControlPropertyKey='Value' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
