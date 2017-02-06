<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />

<div class='SeparatorHdg' width='100%'>
	Instructions
</div>
<p>(Review the compliance memo and CSR/CMS report (if any) at TAB-6 in the Grant Renewal folder 
and report any substantial corrective action requirements below.) </p>

<Core:cUserCtlLoader CtlID='ctlAppInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/ApplicantInformation.ascx'
	runat='server'/>

<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='Implementation/Modules/RenewalReview/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>

<%--<div class='SeparatorHdg' width='100%'>
	Certifications
</div>
<p>(Review the compliance memo AT TAB-6 in the Grant Renewal folder and report any substantial issues below.) </p>
<p><b>Does the Compliance memo raise any substantial issues? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnComplianceMemo' /></p>

<p>Substantial Issues Identified</p>
<span runat='server' id='spnComplianceMemoComment' />
<br /><br />--%>

<%--<div class='SeparatorHdg' width='100%'>
	Program Profile
</div>
<p>Check to see whether information from the Program Profile shows any unusual patterns pertaining 
to offices, staffing, non-LSC funding, and CSR data that should be pursued</p>
<p><b>Does the Program Profile show any unusual patterns? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnProgramProfile' /></p>

<p>Substantial Issues Identified</p>
<span runat='server' id='spnProgramProfileComment' />
<br /><br />
--%>
<%--<div class='SeparatorHdg' width='100%'>
	Other
</div>
<p>(Specify any other documents reviewed  LIPIIs, capability assessment reports, etc.)</p>--%>
<p><b>   Does the review of other documents (e.g., grant conditions, Letters of Concern, Program Visit Reports) indicate significant issues that adversely affect service delivery? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnOtherDocs' /></p>

<p>Significant Issues Identified</p>
<span runat='server' id='spnOtherDocsComment' />
<br /><br />

<%--<table width='100%'>
	<tr>
		<td>
			<b>Primary Reader</b>
		</td>
		<td>
			<span runat='server' id='spnCertPrimaryReaderPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnCertPrimaryReaderDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Secondary Reader</b>
		</td>
		<td>
			<span runat='server' id='spnCertSecondaryReaderPersonID' />
		</td>
		<td>
			<b>Date</b> 
			<span runat='server' id='spnCertSecondaryReaderDate' />
		</td>
	</tr>
</table>--%>
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
				<%--<DisplayProperty PropertyKey='ComplianceMemo'>
					<Control ID='ctlComplianceMemo'
						Type='cRadioButtonList'
						Container='spnComplianceMemo'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ComplianceMemoComment'>
					<Control ID='txtComplianceMemoComment'
						Type='cTextArea'
						Container='spnComplianceMemoComment'
						Rows='8'
						Cols='50' />
				</DisplayProperty>--%>
				<%--<DisplayProperty PropertyKey='ProgramProfile'>
					<Control ID='ctlProgramProfile'
						Type='cRadioButtonList'
						Container='spnProgramProfile'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramProfileComment'>
					<Control ID='txtProgramProfileComment'
						Type='cTextArea'
						Container='spnProgramProfileComment'
						Rows='8'
						Cols='50' />
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='OtherDocs'>
					<Control ID='ctlOtherDocs'
						Type='cRadioButtonList'
						Container='spnOtherDocs'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherDocsComment'>
					<Control ID='txtOtherDocsComment'
						Type='cTextArea'
						Container='spnOtherDocsComment'
						Rows='8'
						Cols='50' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='CertPrimaryReaderPersonID'>
					<Control ID='ctlCertPrimaryReaderPersonID' 
						Type='cDropDown' 
						Container='spnCertPrimaryReaderPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='PersonReviewer'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CertPrimaryReaderDate'>
					<Control ID='ctlCertPrimaryReaderDate' 
						Type='cDateTextBox' 
						Container='spnCertPrimaryReaderDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Primary Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CertSecondaryReaderPersonID'>
					<Control ID='ctlCertSecondaryReaderPersonID' 
						Type='cDropDown' 
						Container='spnCertSecondaryReaderPersonID'
						DisplayValue='Person.FirstNameLastName'
						StoredValue='PersonID'
						DataObjectDefinitionKey='PersonReviewer'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CertSecondaryReaderDate'>
					<Control ID='ctlCertSecondaryReaderDate' 
						Type='cDateTextBox' 
						Container='spnCertSecondaryReaderDate'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='Secondary Reader Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Secondary Reader Date must be in mm/dd/yyyy format.'
						Size='25'
						MaxLength='10'>
					</Control>
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
