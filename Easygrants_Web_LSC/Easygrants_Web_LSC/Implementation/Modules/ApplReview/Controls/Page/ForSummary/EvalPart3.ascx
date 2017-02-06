<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	OCE and OPP Record Review Checklist:
</div>
<table width='100%'>
	<tr>
		<td width='70%'>
			<b>1. OCE Complaints and Final Compliance Reports Reviewed? <%=kDenoteRequiredField %></b>
		</td>
		<td width='30%' align='center' >
			<span runat="server" id='spnCertification' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<b>Substantial Issues Identified</b><br />
			<span runat='server' id='spnComment7' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='70%'>
			<b>2. Prior Year Evaluation, Recommendation, and Capability Assessment documents Reviewed? <%=kDenoteRequiredField %></b>
		</td>
		<td width='30%' align='center' >
			<span runat="server" id='spnForms' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<b>Substantial Issues Identified</b><br />
			<span runat='server' id='spnComment8' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='70%'>
			<b>3. Special Grant Conditions, and other relative documents Reviewed? <%=kDenoteRequiredField %></b>
		</td>
		<td width='30%' align='center' >
			<span runat="server" id='spnOther' />
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<b>Substantial Issues Identified</b><br />
			<span runat='server' id='spnComment9' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Certification'>
					<Control ID='rdoCertification'
						Type='cRadioButtonList'
						Container='spnCertification'
						RepeatDirection='Horizontal'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Forms'>
					<Control ID='rdoForms'
						Type='cRadioButtonList'
						Container='spnForms'
						RepeatDirection='Horizontal'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='rdoOther'
						Type='cRadioButtonList'
						Container='spnOther'
						RepeatDirection='Horizontal'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewApplicationHtml' DataObjectDefinitionKey='LscReviewApplicationHtml' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscReviewApplication' DataObjectPropertyKey='LscReviewApplicationID' PropertyKey='LscReviewApplicationID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment7' HtmlEncode='False'>
					<Control ID='spnComment7'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment8' HtmlEncode='False'>
					<Control ID='spnComment8'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Comment9' HtmlEncode='False'>
					<Control ID='spnComment9'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
