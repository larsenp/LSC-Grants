<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<h1>Form G-3: Actual Case Services (Staff)</h1>
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
		<td>&nbsp;</td>
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
		<td>&nbsp;</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4' class='SeparatorHdg' >
			Actual Case Services
		</td>
	</tr>
</table>
<br />
<Core:cUserCtlLoader CtlID='ctlGrid' 
	Src='Implementation/Modules/GAR/ActualCaseServ/Controls/PageSection/ActualCaseServGrid.ascx'
	runat='server'/>
<br /><br />

<script language="javascript">
	coll = window.document.forms[0].elements
	
	for(var i = 0; i<coll.length;i++) {
		if(coll[i].name.match("txtText") == "txtText"){
			coll[i].readOnly = true;
		}
	}
</script>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscCsrQuestion' DataObjectDefinitionKey='LscCsrQuestion' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FullyFund' Format='YesNo'>
					<Control ID='spnFullyFund'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Pct'>
					<Control ID='spnPct'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
