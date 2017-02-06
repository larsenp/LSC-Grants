<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GPBudget.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cGPBudget" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>

	<tr><td><span id='spnDownload' runat='server'></span></td></tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Budget Groups Total</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='1' cellpadding='1' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><b>Total Salary&nbsp;</b><%=kDenoteRequiredField%>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;$&nbsp;<span id='spnTotalSalary' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><b>Total Materials/Supplies</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;$&nbsp;<span id='spnTotalMaterials' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><b>Total Equipment</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;$&nbsp;<span id='spnTotalEquipment' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><b>Total Travel</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;$&nbsp;<span id='spnTotalTravel' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><b>Total Other Expenses</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;$&nbsp;<span id='spnTotalOther' runat='server'/></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'><b>Indirect Costs</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;$&nbsp;<span id='spnIndirectCosts' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><b>Total</b></td>
		<td>&nbsp;&nbsp;&nbsp;$&nbsp;<span id='spnTotalAmount' runat='server'/></td>
	</tr>
</table>
<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<a name='aBudgetUpload'></a>
			<span runat='server' id='spnBudgetUpload'/>
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Update='False' Create='True'/>
				<Argument Type='' TypeKey='' PropertyKey='BudgetTypeID' Value='1'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
		</DataObject>

		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Budget' DataObjectPropertyKey='BudgetID' PropertyKey='BudgetID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Budget' DataObjectPropertyKey='BudgetID' PropertyKey='BudgetID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TotalSalary'>
					<Control ID='ctlTotalSalary'
						Type='cTextBox'
						Container='spnTotalSalary'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Total Salary is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TotalMaterials'>
					<Control ID='ctlTotalMaterials'
						Type='cTextBox'
						Container='spnTotalMaterials'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Total Materials is required.'>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='TotalEquipment'>
					<Control ID='ctlTotalEquipment'
						Type='cTextBox'
						Container='spnTotalEquipment'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Total Equipment is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalTravel'>
					<Control ID='ctlTotalTravel'
						Type='cTextBox'
						Container='spnTotalTravel'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Total Travel is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='TotalOther'>
					<Control ID='ctlTotalOther'
						Type='cTextBox'
						Container='spnTotalOther'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Total Other is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='IndirectCosts'>
					<Control ID='ctlIndirectCosts'
						Type='cTextBox'
						Container='spnIndirectCosts'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Indirect Costs is required.'>
					</Control>
				</DisplayProperty>														
				<DisplayProperty PropertyKey='Total'>
					<Control ID='ctlTotalAmount'
						Container='spnTotalAmount'
						Type='cLabel'>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>

		<DataObject Key='BudgetUpload' DataObjectDefinitionKey=''>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlDownload'
						Container='spnDownload'
						Type='cLink'
						Caption='Early Career Budget Download'>
						<Action PostBack='False'
							Target='_blank'
							URL='/EasyGrants_v4_WHCF_r1/Easygrants/PDF/Early Career Budget Download.doc'/>
					</Control>
				</DisplayProperty>						
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlBudgetUpload'
						Type='cUpload'
						Container='spnBudgetUpload'>
						<InstructionHtml>
							<p>
							<b>Download the following file to complete the extended budget.</b></p>
							<p><a href='/EasyGrants_v4_WHCF_r1/Easygrants/PDF/Budget Format - Placeholder.xls' target='_blank'>Budget Format - Early Career Applications</a>
							</p>
							<p>
								Click on the <b>Browse…</b> button to find the file on your computer to upload.  Use the dialog box that pops up to find the file and click Open.  Once the filename is in the field below, click the <b>Upload</b> button.</p>
							<p>
								<font color='red'>IMPORTANT:</font> After you have uploaded the file, you must click the <b>File/Document Name</b> to view the document as it has been converted.  If there were any conversion errors, you will view a screen with those details.</p>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='14'
								Bool='and'
								Anchor='aProjectDescription'/>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityAssocID'
								Value=''
								Bool='and'/>
							<Argument PropertyKey='FileExtensionList' 
								Value='xls,xlsx'
								ErrorMessage='Error : Only files with extension .xls or .xlsx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->

