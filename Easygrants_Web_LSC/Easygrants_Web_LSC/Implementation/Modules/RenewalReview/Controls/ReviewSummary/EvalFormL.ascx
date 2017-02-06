<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Renewal Inquiries Review
</div>
<p></p>
<p><b>Do the responses to the Renewal Inquiries indicate significant issues that would affect the funding recommendation to renew the grant? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnFormL' /></p>

<p>If yes, concisely state in the box below the significant issues identified in the responses to the Renewal Inquiries that would affect the funding recommendation to renew grant.</p>
<span runat='server' id='spnCommentL' />
<br /><br />
<p>Check the boxes (where applicable), if the narrative describes exceptional work in any of the following areas.</p>
<table>
	<tr>
		<td>
			<span runat='server' id='spnManagement'/>&nbsp;
			Management/Strategic Planning
		</td>
		<td width='20'>&nbsp;</td>
		<td>
			<span runat='server' id='spnPai'/>&nbsp;
			PAI
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnIntake'/>&nbsp;
			Intake
		</td>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnCoordination'/>&nbsp;
			Coordination within the delivery system
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnTechno'/>&nbsp;
			Technology
		</td>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnResourceDevelopment'/>&nbsp;
			Resource Development
		</td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnProSe'/>&nbsp;
			Pro Se
		</td>
		<td>&nbsp;</td>
		<td>
			<span runat='server' id='spnForeclosure'/>&nbsp;
			Foreclosure/Homelessness prevention
		</td>
	</tr>
</table>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FormL' Format='YesNo'>
					<Control ID='spnFormL'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalEvalHtml.CommentL' HtmlEncode='False'>
					<Control ID='spnCommentL'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Management'>
					<Control ID='chkManagement'
						Type='cCheckBox'
						Container='spnManagement'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Intake'>
					<Control ID='chkIntake'
						Type='cCheckBox'
						Container='spnIntake'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Techno'>
					<Control ID='chkTechno'
						Type='cCheckBox'
						Container='spnTechno'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProSe'>
					<Control ID='chkProSe'
						Type='cCheckBox'
						Container='spnProSe'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Pai'>
					<Control ID='chkPai'
						Type='cCheckBox'
						Container='spnPai'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Coordination'>
					<Control ID='chkCoordination'
						Type='cCheckBox'
						Container='spnCoordination'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ResourceDevelopment'>
					<Control ID='chkResourceDevelopment'
						Type='cCheckBox'
						Container='spnResourceDevelopment'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Foreclosure'>
					<Control ID='chkForeclosure'
						Type='cCheckBox'
						Container='spnForeclosure'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
