<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.QueryTool.cSelectFields" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="False" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>
<br>

<Core:cUserCtlLoader CtlID='ctlQueryNav' Src='Implementation/Modules/Staff/Controls/Page/QueryTool/PageSection/QueryNav.ascx' runat='server'/>
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

	<span runat='server' id='spnSelectDD'/>
		
		
	<asp:RequiredFieldValidator
		runat='server'
		id='valReqSelect'
		ControlToValidate='ctlSelect'
		Display='None'
		ErrorMessage='Select at least one field for this query.'/></span>

	<span id='spnViewFieldDesc' runat='server'/>


<br><br>

<!-- contained in span below -->
<table width='50%'>
	<tr>
		<td colspan='2' align='center'>
				<span id='spnContinue' runat='server'/>
				&nbsp;&nbsp;
			</span>
		</td>
	</tr>
</table>
<br><br>



<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
	
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
			
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlSelect'
						Container='spnSelectDD'
						Type='cDoubleListBox' 
						Size='10'
						Height='10'
						DisplayNone='False'>
					</Control>
				</DisplayProperty>
			
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue' Container='spnContinue' Type='cButton' Image='continue'>
						<Action PostBack='True' Object='DataPresenter' Method='PersistQueryInfo'>
							<Parameters>
								<Argument Value='SelectCriteria'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>								
		
	
	
	
	</ModuleSection>
</span>
<!-- End Embedded XML -->