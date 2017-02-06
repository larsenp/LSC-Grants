<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.QueryTool.cSelectCriteria" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="False" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br>

			


<a name='Filters'></a>
<span runat='server' id='spnFilters' visible='false'>



				<Core:cUserCtlLoader id='ctlField' CtlID='ctlLoaderFieldName' 
					Src='Staff/Controls/Page/QueryTool/PageSection/SelectFieldName.ascx'
					PathVar='DefaultModuleRoot'
					runat='server'/>
<br><br>


<table runat='server' width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='3'>
			Select Query Criteria - Step Two:  Select Operator and Value
		</td>
	</tr>
</table>
<br>

	<table runat='server' width='100%' border='0' id='tbFilters'>
		<tr runat='server' id='trFilters'>
			<td width='1%'>&nbsp;</td>
			<td width='10%'>
				<asp:DropDownList runat='server' id='ctlOperator'/>
			</td>
			<td width='20%'>
				<asp:TextBox runat='server' id='txtValue'/>
				<asp:RequiredFieldValidator
					runat='server'
					id='valReqValue'
					ControlToValidate='txtValue'
					ErrorMessage='Specify a value before adding a filter.'
					Display='None'/>
			</td>
			<td>
				<Core:cUserCtlLoader id='ctlLoader' CtlID='btnAddFilter' 
					Src='Core/Controls/Base/CSSButton.ascx'
					Properties='Caption=Add&CausesValidation=False'
					runat='server'/>
				<Core:cUserCtlLoader id='ctlSaveFilterLoader' CtlID='btnSaveFilter' 
					Src='Core/Controls/Base/CSSButton.ascx'
					Properties='Caption=Save&CausesValidation=False'
					runat='server'/>
			</td>
		</tr>
		<tr>
			<td colspan='2'>&nbsp;</td>
			<td coslpan='2'>
				<Core:cUserCtlLoader id='ctlLookUp' CtlID='lnkLookUp' 
					Src='Core/Controls/Base/Link.ascx'
					Properties='Caption=Select from Lookup Values&CausesValidation=False'
					runat='server'/>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
	</table>
	<table runat='server' width='100%' id='tabFilters' border='0'>
		<tr><td>&nbsp;</td></tr>
		<tr id='trAdvFilter' runat='server' visible='true'>
			<td colspan='4'><Core:cUserCtlLoader id='ctlAdvFilter' CtlID='lnkAdvFilters' 
					Src='Core/Controls/Base/Link.ascx'
					Properties='Caption=Advanced Filter Options&CausesValidation=False'
					runat='server'/>
			</td>
		</tr>
		<tr id='trErrorMessage' runat='server' visible='false'><td colspan='4'><span id='spnErrorMessage' runat='server' visible='true'/></td></tr>
		<tr id='trParenErrorMessage' runat='server' visible='false'><td colspan='4'><span id='spnParenErrorMessage' runat='server' visible='true'/></td></tr>
		<tr class='ModuleHdg'>
			<td width='1%' id='tdSpacer' runat='server' visible='true'>&nbsp;</td>
			<td id='tdBoolean' visible='true' width='15%'>
				<b>Boolean</b>
			</td>
			<td>
				<b>Field</b>
			</td>
			<td>
				<b>Operator</b>
			</td>
			<td>
				<b>Value</b>
			</td>
			<td id='tdOptions' width='20%' colspan='6' runat='server' visible='true'>
				<b>Options</b>
			</td>
			<td id='tdShowColumn' visible='false'>
				<b>Show Column</b>
			</td>
			<td colspan='2'>
				&nbsp;
			</td>
		</tr>
	</table>
	<br><br>
	
	
	<Core:cUserCtlLoader CtlID='ctlViewResults' Src='Core/Controls/Base/NewWindowOpener.ascx' runat='server'/>

	
	
	
	
</span>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>				
		
	</ModuleSection>
</span>
<!-- End Embedded XML -->