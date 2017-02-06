<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>Review the grantee profile (in the grant file) to determine if there is a change of 10% or more 
in the four-year trend of:  staffing data, CSR data, or non-LSC funding data.  </p>

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<div class='SeparatorHdg' width='100%'>
	Grantee Profile Review
</div>
<p><b>Is there a change of 10% or more in the four-year trend of staffing data? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnStaffingData' /></p>

<%--<p><b>Is there a change of 10% or more in the four-year trend of CSR data? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnCsrData' /></p>--%>

<p><b>Is there a change of 10% or more in the four-year trend of non-LSC funding data? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnNonLscFundingData' /></p>

<%--<p>Substantial Issues Identified in the Grantee Profile Review.</p>
<span runat='server' id='spnGranteeProfileComment' />--%>
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
				<%--<DisplayProperty PropertyKey='CsrData'>
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
				</DisplayProperty>--%>
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
				<%--<DisplayProperty PropertyKey='GranteeProfileComment'>
					<Control ID='txtGranteeProfileComment'
						Type='cTextArea'
						Container='spnGranteeProfileComment'
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
