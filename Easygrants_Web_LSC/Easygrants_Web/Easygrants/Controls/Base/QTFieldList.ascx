<%@ Control Language="vb" AutoEventWireup="true" Codebehind="QTFieldList.ascx.vb" Inherits="Easygrants_Web.Controls.Base.cQTFieldList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>
<title>Query Tool Field Groups and Merge Codes</title>
<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr>
			<td colspan="4" class="SeparatorHdg"><b>Query Tool Fields and Merge Codes</b></td>
	</tr>
</table>


<P>
To see a list of all fields and merge codes for a particular field group, select the field group from the drop-down list and click <b>Go</b>.
</P>
Field Group:&nbsp;&nbsp;<span id='spnBaseType' runat='server'/>
&nbsp;&nbsp;<span id='spnGo' runat='server'/>

<br><br>


<table id='tblFields' width='100%' border='1' cellspacing='0' cellpadding='0' runat='server' visible='false'>
	<tr align='middle' bgcolor='#f0f0f0'><td><B>Query Tool Field</B></td><td><B>Description</B></td><td><B>Merge Code</B></td></tr>
</table>

<br><br>

<span runat='server' id='spnFields' visible='false'>
	<Core:cUserCtlLoader CtlID='ctlFields'
		Type='cTextArea'
		Properties='Rows=40&Cols=100'
		runat='server'/>
</span>
<br />
<table border='0' cellpadding='2' cellspacing='0' width='100%'><tr><td align="center"><a href="javascript:window.close()" style="vertical-align:top" class="CSSButtonStyle">Close</a></td></tr></table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='AdHocQuery' DataObjectDefinitionKey='SavedQuery' >
			<Sort>
				<Argument PropertyKey='Name' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlBaseType'
						Type='cDropDown'
						Container='spnBaseType'
						DataObjectDefinitionKey='SavedQueryBaseType'
						StoredValue='BaseType'
						DisplayValue='BaseType'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='A Field Group is required.'>
						<Sort><Argument PropertyKey='BaseType' /></Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnGo'
						Type='cButton'
						Container='spnGo'
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='ShowFields'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlBaseType' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
