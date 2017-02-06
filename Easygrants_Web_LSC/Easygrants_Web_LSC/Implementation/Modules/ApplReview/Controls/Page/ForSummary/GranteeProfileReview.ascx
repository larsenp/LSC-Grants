<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Grantee Profile Review
</div>
<p><b>Is there a change of 10% or more in the four-year trend of staffing data? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnStaffingData' /></p>

<p><b>Is there a change of 10% or more in the four-year trend of CSR data? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnCsrData' /></p>

<p><b>Is there a change of 10% or more in the four-year trend of non-LSC funding data? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnNonLscFundingData' /></p>

<p>Substantial Issues Identified in the Grantee Profile Review.</p>
<span runat='server' id='spnGranteeProfileComment' />
<br /><br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='StaffingData'>
					<Control ID='ctlStaffingData'
						Type='cRadioButtonList'
						Container='spnStaffingData'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CsrData'>
					<Control ID='ctlCsrData'
						Type='cRadioButtonList'
						Container='spnCsrData'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonLscFundingData'>
					<Control ID='ctlNonLscFundingData'
						Type='cRadioButtonList'
						Container='spnNonLscFundingData'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewApplicationHtml.GranteeProfileComment' HtmlEncode='False'>
					<Control ID='spnGranteeProfileComment'
						Type='HtmlGenericControl'
						Container='spnGranteeProfileComment'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
