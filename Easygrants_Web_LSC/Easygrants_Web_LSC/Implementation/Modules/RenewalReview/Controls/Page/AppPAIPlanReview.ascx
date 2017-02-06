<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Applicant PAI Plan Review
</div>
<p><b>Did the Applicant submit current year PAI plan? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnPaiPlanSubmitted' /></p>

<%--<p><b>Is the PAI plan responsive to 45 C.F.R. § 1614.4? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnPaiPlanResponsive' /></p>

<p>Substantial Issues Identified in the Applicant PAI Plan.</p>
<span runat='server' id='spnPaiPlanComment' />--%>

<br /><br />
<table width='100%'>
	<tr>
		<td align=center>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PaiPlanSubmitted'>
					<Control ID='ctlPaiPlanSubmitted'
						Type='cRadioButtonList'
						Container='spnPaiPlanSubmitted'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='PaiPlanResponsive'>
					<Control ID='ctlPaiPlanResponsive'
						Type='cRadioButtonList'
						Container='spnPaiPlanResponsive'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey='PaiPlanComment'>
					<Control ID='txtPaiPlanComment'
						Type='cTextArea'
						Container='spnPaiPlanComment'
						Rows='8'
						Cols='50' />
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
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'
						Enter='False'
						Caption='Save and Continue'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
