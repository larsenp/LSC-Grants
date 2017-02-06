<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />

<div class='SeparatorHdg' width='100%'>
	OCE Report Review
</div>
<p><b>Are there significant corrective action requirements that would result in special grant conditions or affect the funding decision? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnCorrectiveActionRequirements' /></p>

<p><b>Are there significant complaints filed against the Applicant that would result in special grant conditions or affect the funding decision? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnApplicantComplaints' /></p>

<p>Substantial Issues Identified in the OCE Report Review.</p>
<span runat='server' id='spnOceReportComment' />
<br />
<hr style="height:5px;width:100%;color:#888888"/>
<br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewApplication' DataObjectDefinitionKey='LscReviewApplication' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CorrectiveActionRequirements'>
					<Control ID='ctlCorrectiveActionRequirements'
						Type='cRadioButtonList'
						Container='spnCorrectiveActionRequirements'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ApplicantComplaints'>
					<Control ID='ctlApplicantComplaints'
						Type='cRadioButtonList'
						Container='spnApplicantComplaints'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewApplicationHtml.OceReportComment' HtmlEncode='False'>
					<Control ID='spnOceReportComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
