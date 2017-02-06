<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="False" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>


<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg'>
			Select Fields
		</td>
	</tr>
</table>
<br>
<table runat='server' width='100%'>
<tr>
	<td>
		Field Group:&nbsp;&nbsp;<b><span id='spnCategorySelected' runat='server'/></b>
	</td>
</tr>

</table><br><br>
<!-- contained in span below -->
<span runat='server' id='spnSelect' visible='false'>
	<Core:cUserCtlLoader CtlID='ctlSelect' 
		Type='cDoubleListBox'
		Properties='Size=10'
		runat='server'/>
	<asp:RequiredFieldValidator
		runat='server'
		id='valReqSelect'
		ControlToValidate='ctlSelect'
		Display='None'
		ErrorMessage='Designate at least one Select Field before running a query.'/></span>

	<span id='spnViewFieldDesc' runat='server'/>


<br><br>

<!-- contained in span below -->
<table width='50%'>
	<tr>
		<td colspan='2' align='center'>
				<Core:cUserCtlLoader CtlID='btnContinue' 
					Type='cButton'
					Properties='Caption=Continue&CausesValidation=False'
					runat='server'/>
				&nbsp;&nbsp;
			</span>
		</td>
	</tr>
</table>
<br><br>

<Core:cUserCtlLoader CtlID='ctlViewResults' Src='Core/Controls/Base/NewWindowOpener.ascx' runat='server'/>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control Container='spnViewFieldDesc' 
						ID='ctlHelp'
						Type='cLink'
						Caption='View Field Descriptions'>
						<Action
							PostBack='False'
							URL='../../../Easygrants/Controls/Base/pgQTFields.aspx'
							Target='Blank'>
						</Action>		
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>								
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->