<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>TBD</p>

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	OCE and OPP Record Review Checklist:
</div>
<table width='100%'>
	<tr>
		<td width='70%'>
			<b>1. OCE Final Compliance Reports Reviewed? <%=kDenoteRequiredField %></b>
		</td>
		<td width='30%' align='left' >
			<span runat="server" id='spnCertification' />
		</td>
	</tr>
	<%--<tr>
		<td colspan='2'>
			<b>Substantial Issues Identified</b><br />
			<span runat='server' id='spnComment7' />
		</td>
	</tr>--%>
	<%--<tr><td>&nbsp;</td></tr>
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
	</tr>--%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='70%'>
			<b>2. Special Grant Conditions, Letters of Concern, Program Visit Reports Reviewed? <%=kDenoteRequiredField %></b>
		</td>
		<td width='30%' align='center' >
			<span runat="server" id='spnOther' />
		</td>
	</tr>
	<%--<tr>
		<td colspan='2'>
			<b>Substantial Issues Identified</b><br />
			<span runat='server' id='spnComment9' />
		</td>
	</tr>--%>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align="center">
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveAndContinue'/>
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Create='True' Update='False'/>
			</DefaultValues>
			<DisplayProperties>
				<%--<DisplayProperty PropertyKey='Certification'>
					<Control ID='rdoCertification'
						Type='cRadioButtonList'
						Container='spnCertification'
						RepeatDirection='Horizontal'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='Certification'>
					<Control ID='rdoCertification'
						Container='spnCertification'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Yes'/>
							<Parameter StoredValue='2' DisplayValue='No'/>
							<Parameter StoredValue='3' DisplayValue='No Final Report'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='Comment7'>
					<Control ID='txtComment7'
						Type='cTextArea'
						Container='spnComment7'
						Rows='5'
						Cols='80' />
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey='Forms'>
					<Control ID='rdoForms'
						Type='cRadioButtonList'
						Container='spnForms'
						RepeatDirection='Horizontal'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'>
					</Control>
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey='Comment8'>
					<Control ID='txtComment8'
						Type='cTextArea'
						Container='spnComment8'
						Rows='5'
						Cols='80' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='rdoOther'
						Container='spnOther'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='1' DisplayValue='Yes'/>
							<Parameter StoredValue='2' DisplayValue='No'/>
							<Parameter StoredValue='3' DisplayValue='No SGCs, Letters of Concern or Program Visit Reports '/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='Other'>
					<Control ID='rdoOther'
						Type='cRadioButtonList'
						Container='spnOther'
						RepeatDirection='Horizontal'
						DataObjectDefinitionKey='LscYesNoNA'
						StoredValue='LscYesNoNAID'
						DisplayValue='Abbr'>
					</Control>
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey='Comment9'>
					<Control ID='txtComment9'
						Type='cTextArea'
						Container='spnComment9'
						Rows='5'
						Cols='80' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Container='spnSave'
						Caption='Save'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnSaveAndContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
