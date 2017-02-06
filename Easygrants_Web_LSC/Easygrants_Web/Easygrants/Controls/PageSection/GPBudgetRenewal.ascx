<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GPBudgetRenewal.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cGPBudgetRenewal" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	<br />
<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	
	<tr><td><span id='spnDownload' runat='server' visible='false'></span></td></tr>
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
		<td colspan='2'><b>Total Salary</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;</td>
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
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCalc'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>		
	</td>
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
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser'
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID'
					Value=''
					Bool=''/>
			</Filters>
			<DisplayProperties/>
		</DataObject>		
	
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
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
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9,.]{0,10}\s?$' ErrorMessage='Total Salary is required. Do not use commas.' />
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
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9,.]{0,10}\s?$' ErrorMessage='Total Materials/Supplies is required. Do not use commas.' />
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
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9,.]{0,10}\s?$' ErrorMessage='Total Equipment is required. Do not use commas.' />
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
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9,.]{0,10}\s?$' ErrorMessage='Total Travel is required. Do not use commas.' />
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
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9,.]{0,10}\s?$' ErrorMessage='Total Other Expenses is required. Do not use commas.' />
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
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9,.]{0,10}\s?$' ErrorMessage='Indirect Costs is required. Do not use commas.' />
					</Control>
				</DisplayProperty>														
				<DisplayProperty PropertyKey='GrandTotal'>
					<Control ID='ctlTotalAmount'
						Container='spnTotalAmount'
						Type='cLabel'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalc'
						Container='spnCalc'
						Type='cButton'
						Image='Calculate'>
						<Action
							PostBack='True'
							AutoSave='True'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'/>
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
							URL='/EasyGrants_v4_WHCF_r1/Easygrants/PDF/EC AWARD BUDGET - 3RD YR.xls'/>
					</Control>
				</DisplayProperty>						
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlBudgetUpload'
						Type='cUpload'
						Container='spnBudgetUpload'>
						<InstructionHtml>
							<p>
							Download the following file to complete the third year budget.  Easygrants&reg; uses pop-up functionality.  This functionality must be enabled (i.e., turn off pop-up blockers.)</p>
							<p><a href='/EasyGrants_v4_WHCF_r1/Easygrants/PDF/EC AWARD BUDGET - 3RD YR.xls' target='_blank'>Budget Format - Early Career Applications</a>
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

