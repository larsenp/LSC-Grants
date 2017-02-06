<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Staff.Controls.Page.QueryTool.cLookupTable" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<br>

<span id='spnLookup' runat='server' visible='true'>
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
		<tr>
			<td class='SeparatorHdg'>
				Select From Lookup Values
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>		
	</table>



	<b>Field Name</b>&nbsp;&nbsp;<asp:Label runat='server' id='lblFieldName' />
	<br><br>
	<b>Lookup Value</b>&nbsp;&nbsp;<asp:DropDownList runat='server' id='ctlLookupValues'/>&nbsp;&nbsp;
					<Core:cUserCtlLoader id='ctlSelect' CtlID='btnSelect' 
						Src='Core/Controls/Base/CSSButton.ascx'
						Properties='Caption=Select&CausesValidation=False'
						runat='server'/>

			<span id='spRefreshParentPage' runat='server' visible='false'>
				<script language="JavaScript">
					function RefreshParentPage() {
						var aUrl = window.opener.location.href
						var aIndex = aUrl.indexOf('LookupValue=<%=request.querystring("lookupvalue")%>')
						if(aIndex != -1) {
							aUrl = aUrl.substring(0, aIndex - 1)
						}
						window.opener.location = aUrl + '&LookupValue=<%=LookupValue%>' + '&Operator=<%=OperatorValue%>';
						window.close();
					}
					RefreshParentPage()
				</script>
			</span>
	<br><br>


</span>


<span id='spnNoLookup' runat='server' visible='true'>
	<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
		<tr>
			<td class='SeparatorHdg'>
				No Lookup Table Available
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td><b>No lookup table values exist for the selected field.</b></td></tr>		
	</table>

	
</span>


	<table id='tblCloseWindow' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td align='center'><span runat='server' id='spnCancel' visible='true'/></td>
		</tr>
		<tr>
			<td align='center'><span runat='server' id='spnClose' visible='true'/></td>
		</tr>	
		<tr>
			<td><span runat='server' id='spnCloseControl' visible='false'/></td>
		</tr>	
	</table>






<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
	
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CloseWindow' />
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCloseControl'
						Container='spnCloseControl'
						Type='cCloseWindow' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	
	
	<!--			
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSelect'
						Container='spnSelect'
						Caption='Select'
						Type='cButton'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SelectLookupValue'>
							<Parameters>
								<Argument Type='Control' TypeKey='ctlLookupValues' ControlPropertyKey='SelectedValue' Value=''/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>
		-->			
	</ModuleSection>
</span>
<!-- End Embedded XML -->