<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Applicant PAI Plan Review
</div>
<p><b>Did the Applicant submit a PAI plan for calendar year 2008? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnPaiPlanSubmitted' /></p>

<p><b>Is the PAI plan responsive to 45 C.F.R. § 1614.4? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnPaiPlanResponsive' /></p>

<p>Substantial Issues Identified in the Applicant PAI Plan.</p>
<span runat='server' id='spnPaiPlanComment' />

<br />
<hr style="height:5px;width:100%;color:#888888"/>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
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
				<DisplayProperty PropertyKey='PaiPlanResponsive'>
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
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscRenewalEvalHtml.PaiPlanComment' HtmlEncode='False'>
					<Control ID='spnPaiPlanComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
