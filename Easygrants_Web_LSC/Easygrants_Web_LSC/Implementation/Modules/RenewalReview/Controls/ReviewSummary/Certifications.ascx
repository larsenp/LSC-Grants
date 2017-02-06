<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<div class='SeparatorHdg' width='100%'>
	Certifications
</div>
<p>(Review the compliance memo AT TAB-6 in the Grant Renewal folder and report any substantial issues below.) </p>
<p><b>Does the Compliance memo raise any substantial issues? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnComplianceMemo' /></p>

<p>Substantial Issues Identified</p>
<span runat='server' id='spnComplianceMemoComment' />
<br /><br />

<div class='SeparatorHdg' width='100%'>
	Program Profile
</div>
<p>Check to see whether information from the Program Profile shows any unusual patterns pertaining 
to offices, staffing, non-LSC funding, and CSR data that should be pursued</p>
<p><b>Does the Program Profile show any unusual patterns? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnProgramProfile' /></p>

<p>Substantial Issues Identified</p>
<span runat='server' id='spnProgramProfileComment' />
<br /><br />

<div class='SeparatorHdg' width='100%'>
	Other
</div>
<p>(Specify any other documents reviewed (e.g., grant conditions, LIPIIs, capability assessment reports, etc.)</p>
<p><b>   Does the review of other documents raise any substantial issues? <%=kDenoteRequiredField%></b>&nbsp;
<span runat='server' id='spnOtherDocs' /></p>

<p>Substantial Issues Identified</p>
<span runat='server' id='spnOtherDocsComment' />
<br /><br />

<table width='600'>
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
</table>
<br /><br />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscRenewalEval' DataObjectDefinitionKey='LscRenewalEval' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ComplianceMemo'>
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
				<DisplayProperty PropertyKey='ProgramProfile'>
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
				<DisplayProperty PropertyKey='CertPrimaryReaderPerson.FirstNameLastName'>
					<Control ID='spnCertPrimaryReaderPersonID' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CertPrimaryReaderDate' Format='M/d/yyyy'>
					<Control ID='spnCertPrimaryReaderDate' 
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CertSecondaryReaderPerson.FirstNameLastName'>
					<Control ID='spnCertSecondaryReaderPersonID' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='CertSecondaryReaderDate' Format='M/d/yyyy'>
					<Control ID='spnCertSecondaryReaderDate' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='LscRenewalEvalHtml' DataObjectDefinitionKey='LscRenewalEvalHtml' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscRenewalEval' DataObjectPropertyKey='LscRenewalEvalID' PropertyKey='LscRenewalEvalID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ComplianceMemoComment'>
					<Control ID='spnComplianceMemoComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OtherDocsComment'>
					<Control ID='spnOtherDocsComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProgramProfileComment'>
					<Control ID='spnProgramProfileComment'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
