<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg'>Instructions</div>
<br />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td>The <strong>Subrecipient Profile </strong>page  captures information regarding the proposed subrecipient program including its  full name and mailing address, the name of the Executive Director, and their  telephone number and email address. This page also captures information related  to the counties or other geographical areas to be served by the subrecipient,  the purpose of the subgrant, the number of cases closed by the subrecipient for  the two year period prior to this application, as well as information regarding  the type of oversight the recipient will maintain over the subrecipient.</td>
  </tr>
</table>
<br /><br />

<div class='SeparatorHdg'>Subrecipient Profile</div>
<br />
<style>
	table.pagecontent td { vertical-align:top;
		padding:1px 1px 5px 1px;}
</style>
<table class="pagecontent" style="width:800px;">
	<tr>
		<td style="width:200px">
			<b>Subrecipient Name<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnSubgranteeName' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Mailing Address<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnSubgranteeAddr1' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;
			
		</td>
		<td colspan="3">
			<span runat='server' id='spnSubgranteeAddr2' />
		</td>
	</tr>
	<tr>
		<td style="text-align:right">
			City, State, Zip
		</td>
		<td>
			<span runat='server' id='spnSubgranteeCity' />
		</td>
		<td>
			<span runat='server' id='spnSubgranteeStateProvID' />
		</td>
		<td>
			<span runat='server' id='spnSubgranteeZip' />
		</td>
	</tr>
	<tr style="padding-bottom:1px">
		<td>
			<b>Program Director Name<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnSubgranteePDFirst' />
		</td>
		<td>
			<span runat='server' id='spnSubgranteePDMiddle' />
		</td>
		<td>
			<span runat='server' id='spnSubgranteePDLast' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;
			
		</td>
		<td class="FieldLabel">
			First
		</td>
		<td class="FieldLabel">
			Middle
		</td>
		<td class="FieldLabel">
			Last
		</td>
	</tr>	
	<tr>
		<td>
			<b>Program Director Email<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnSubgranteePDEmail'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Program Director Phone<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnSubgranteePDPhone'/>
		</td>
	</tr>
	<tr>
		<td class="pagecontent">
			<b>List all counties (or other geographical units as applicable) served by this subrecipient<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnCounties'/>
		</td>
	</tr>
	<tr>
		<td>
			<b>Subgrant Amount<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			$<span runat='server' id='spnSubgrantAmount'/>
		</td>
	</tr>
	<tr style="padding-bottom:1px">
		<td>
			<b>Subgrant Purpose<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnSubgrantPurpose'/><br />
			<span class="FieldLabel">Response must not exceed 500 characters</span>
		</td>
	</tr>
	<tr style="padding-bottom:1px">
		<td>
			<b>Is Subrecipient also an LSC grantee?<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnIsGrantee'/><br />
		</td>
	</tr>
	<tr style="padding-bottom:1px">
		<td>
			<b>Type of LSC Grant<font color='red'>*</font></b>
		</td>
		<td colspan="3">
			<span runat='server' id='spnLscSubgrantGrantTypeID'/><br />
			<span class="FieldLabel">Recipients of multiple LSC grants should indicate the grant type from which the funds are being subgranted.</span>
		</td>
	</tr>
</table>
<br />
<table class="pagecontent" style="width:800px;">
	<tr>
		<td>
			<b>Will funds from this subgrant be used for the provision of case services?<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnFundCaseServices'/>
		</td>
	</tr>
	<tr>
		<td rowspan="2">
			<b>If so, indicate the total number of cases closed by this subrecipient for the most recent four quarters available (specify dates):</b>
		</td>
		<td>
			<span runat='server' id='spnMostRecent4QFrom'/>&nbsp;to&nbsp;<span runat='server' id='spnMostRecent4QTo'/>
		</td>
	</tr>
	<tr>
		<td>
			LSC Funded&nbsp;<span runat='server' id='spnMostRecentLsc'/>&nbsp;&nbsp;Non-LSC Funded<span runat='server' id='spnMostRecentNonLsc'/>
		</td>
	</tr>
	<tr>
		<td >
			<b>Is this a renewal request?<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnIsRenewal'/>
		</td>
	</tr>
	<tr>
		<td rowspan="2">
			<b>If this is a renewal of a subgrant currently in existence, indicate the total number of cases closed during the four quarters preceding those listed above (specify dates):</b>
		</td>
		<td>
			LSC Funded&nbsp;<span runat='server' id='spnPrecedingLsc'/>&nbsp;&nbsp;Non-LSC Funded<span runat='server' id='spnPrecedingNonLsc'/>
		</td>
	</tr>
	<tr>
	    <td>
			<span runat='server' id='spnRenewalMostRecent4QFrom'/>&nbsp;to&nbsp;<span runat='server' id='spnRenewalMostRecent4QTo'/>
		</td>
	</tr>
	<tr>
		<td style="padding-top:10px">
			<b>Check the items which best describe the procedure(s) used by the recipient to monitor and evaluate the work and activities of this subrecipient<font color='red'>*</font></b>
		</td>
		<td>
			<span runat='server' id='spnLscWfTASubgrantMonitoringProcedures'/><br />
			If Other, specify below.<br />
			<span runat='server' id='spnMonitoringProcedureOther' />
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" style="text-align:center">
			<span runat='server' id='spnSave'/>&nbsp;<span runat='server' id='spnSaveContinue'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscWfTASubgrant' DataObjectDefinitionKey='LscWfTASubgrant' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='SubgranteeName'>
					<Control ID='txtSubgranteeName'
						Type='cTextBox'
						Container='spnSubgranteeName'
						Size='40'
						MaxLength='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeAddr1'>
					<Control ID='txtSubgranteeAddr1'
						Type='cTextBox'
						Container='spnSubgranteeAddr1'
						Size='50'
						MaxLength='150' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeAddr2'>
					<Control ID='txtSubgranteeAddr2'
						Type='cTextBox'
						Container='spnSubgranteeAddr2'
						Size='50'
						MaxLength='150' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeCity'>
					<Control ID='txtSubgranteeCity'
						Type='cTextBox'
						Container='spnSubgranteeCity'
						Size='25'
						MaxLength='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeStateProvID'>
					<Control ID='ctlSubgranteeStateProvID'
						Type='cDropDown'
						Container='spnSubgranteeStateProvID'
						DataObjectDefinitionKey='State'
						StoredValue='StateID'
						DisplayValue='StateAbbr' >
						<Filters>
							<Argument PropertyKey='CountryID' Value='280' />
						</Filters>
						<Sort>
							<Argument PropertyKey='StateAbbr' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteeZip'>
					<Control ID='txtSubgranteeZip'
						Type='cTextBox'
						Container='spnSubgranteeZip'
						Size='12'
						MaxLength='30' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteePDFirst'>
					<Control ID='txtSubgranteePDFirst'
						Type='cTextBox'
						Container='spnSubgranteePDFirst'
						Size='25'
						MaxLength='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteePDMiddle'>
					<Control ID='txtSubgranteePDMiddle'
						Type='cTextBox'
						Container='spnSubgranteePDMiddle'
						Size='10'
						MaxLength='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteePDLast'>
					<Control ID='txtSubgranteePDLast'
						Type='cTextBox'
						Container='spnSubgranteePDLast'
						Size='25'
						MaxLength='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteePDEmail'>
					<Control ID='txtSubgranteePDEmail' 
						Type='cEmailTextBox' 
						Container='spnSubgranteePDEmail' 
						Size='50' 
						MaxLength='100'
						RexErrorMessage='The Program Director E-mail is incorrectly formatted. Use the following format to enter the e-mail address: test@test.edu or test@test.edu.au.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgranteePDPhone'>
					<Control ID='txtSubgranteePDPhone' 
						Type='cTextBox' 
						Container='spnSubgranteePDPhone' 
						Size='25' 
						MaxLength='20' >
						<Validation Type='RegularExpression' 
							ValidationExpression='^\s?[0-9]{10}\s?$' 
							ErrorMessage='Program Director Phone must contain exactly ten digits. Use only numbers, no hyphens, commas or parentheses.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Counties'>
					<Control ID='txtCounties' 
						Type='cTextArea' 
						Container='spnCounties' 
						Rows='5' 
						Cols='70' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgrantAmount'>
					<Control ID='txtSubgrantAmount' 
						Type='cMoneyTextBox' 
						Container='spnSubgrantAmount' 
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='The Subgrant Amount must be a whole number.'
						 RegExErrorMessage='The Subgrant Amount must be a whole number.'
						 CommaErrorMessage='Commas are incorrectly formatted in Subgrant Amount.'
					    Size='10'
					    MaxLength='10' 
					    Format='#,0'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SubgrantPurpose'>
					<Control ID='txtSubgrantPurpose' 
						Type='cTextArea' 
						Container='spnSubgrantPurpose' 
						Rows='5' 
						Cols='70'
						MaxLength='500' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsGrantee'>
					<Control ID='ctlIsGrantee'
						Type='cRadioButtonList'
						Container='spnIsGrantee'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscSubgrantGrantTypeID'>
					<Control ID='ctlLscSubgrantGrantTypeID'
						Type='cDropDown'
						Container='spnLscSubgrantGrantTypeID'
						DataObjectDefinitionKey='LscSubgrantGrantType'
						StoredValue='LscSubgrantGrantTypeID'
						DisplayValue='Description' >
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundCaseServices'>
					<Control ID='ctlFundCaseServices'
						Type='cRadioButtonList'
						Container='spnFundCaseServices'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MostRecent4QFrom'>
					<Control ID='ctlMostRecent4QFrom' 
						Type='cDateTextBox' 
						Container='spnMostRecent4QFrom'
						Calendar='True'
						DateFormat='M/d/yyyy'
						DateFormatErrorMessage='Specify dates for most recent four quarters in m/d/yyyy format.'
						NotSupportedDateErrorMessage='Specify dates for most recent four quarters in m/d/yyyy format.'
						Width='10'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MostRecent4QTo'>
					<Control ID='ctlMostRecent4QTo' 
						Type='cDateTextBox' 
						Container='spnMostRecent4QTo'
						Calendar='True'
						DateFormat='M/d/yyyy'
						DateFormatErrorMessage='Specify dates for most recent four quarters in m/d/yyyy format.'
						NotSupportedDateErrorMessage='Specify dates for most recent four quarters in m/d/yyyy format.'
						Width='10'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MostRecentLsc'>
					<Control ID='txtMostRecentLsc' 
						Type='cMoneyTextBox' 
						Container='spnMostRecentLsc' 
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='The total number of LSC-funded cases in the most recent four quarters must be a whole number.'
						 RegExErrorMessage='The total number of LSC-funded cases in the most recent four quarters must be a whole number.'
						 CommaErrorMessage='Commas are incorrectly formatted in the "LSC Funded" field for the most recent four quarters.'
					    Size='10'
					    MaxLength='10' 
					    Format='#,0'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MostRecentNonLsc'>
					<Control ID='txtMostRecentNonLsc' 
						Type='cMoneyTextBox' 
						Container='spnMostRecentNonLsc' 
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='The total number of Non-LSC-funded cases in the most recent four quarters must be a whole number.'
						 RegExErrorMessage='The total number of Non-LSC-funded cases in the most recent four quarters must be a whole number.'
						 CommaErrorMessage='Commas are incorrectly formatted in the "Non-LSC Funded" field for the most recent four quarters.'
					    Size='10'
					    MaxLength='10' 
					    Format='#,0'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsRenewal'>
					<Control ID='ctlIsRenewal'
						Type='cRadioButtonList'
						Container='spnIsRenewal'
						LoadParam='True'
						RepeatDirection='Horizontal'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrecedingLsc'>
					<Control ID='txtPrecedingLsc' 
						Type='cMoneyTextBox' 
						Container='spnPrecedingLsc' 
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='The total number of LSC-funded cases in the preceding four quarters must be a whole number.'
						 RegExErrorMessage='The total number of LSC-funded cases in the preceding four quarters must be a whole number.'
						 CommaErrorMessage='Commas are incorrectly formatted in the "LSC Funded" field for the preceding four quarters.'
					    Size='10'
					    MaxLength='10' 
					    Format='#,0'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrecedingNonLsc'>
					<Control ID='txtPrecedingNonLsc' 
						Type='cMoneyTextBox' 
						Container='spnPrecedingNonLsc' 
					    AllowInputCommas='True'
					    MaxInputDecimalPlaces='0'
					    DecimalErrorMessage='The total number of Non-LSC-funded cases in the preceding four quarters must be a whole number.'
						 RegExErrorMessage='The total number of Non-LSC-funded cases in the preceding four quarters must be a whole number.'
						 CommaErrorMessage='Commas are incorrectly formatted in the "Non-LSC Funded" field for the preceding four quarters.'
					    Size='10'
					    MaxLength='10' 
					    Format='#,0'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RenewalMostRecent4QFrom'>
					<Control ID='ctlRenewalMostRecent4QFrom' 
						Type='cDateTextBox' 
						Container='spnRenewalMostRecent4QFrom'
						Calendar='True'
						DateFormat='M/d/yyyy'
						DateFormatErrorMessage='If renewal, Specify dates for most recent four quarters in m/d/yyyy format.'
						NotSupportedDateErrorMessage='If renewal, Specify dates for most recent four quarters in m/d/yyyy format.'
						Width='10'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RenewalMostRecent4QTo'>
					<Control ID='ctlRenewalMostRecent4QTo' 
						Type='cDateTextBox' 
						Container='spnRenewalMostRecent4QTo'
						Calendar='True'
						DateFormat='M/d/yyyy'
						DateFormatErrorMessage='If renewal, Specify dates for most recent four quarters in m/d/yyyy format.'
						NotSupportedDateErrorMessage='If renewal, Specify dates for most recent four quarters in m/d/yyyy format.'
						Width='10'
						MaxLength='10'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscWfTASubgrantMonitoringProcedures'>
					<Control ID='ctlLscWfTASubgrantMonitoringProcedures'
						Container='spnLscWfTASubgrantMonitoringProcedures'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LscSubgrantMonitoringProcedure'
						DisplayValue='Description'
						StoredValue='LscSubgrantMonitoringProcedureID'
						RepeatColumns='2'
						CellSpacing='12'
						RepeatDirection='Vertical'>
						<DefaultValues>
							<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' CreateNew='True' Update='True'/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MonitoringProcedureOther'>
					<Control ID='txtMonitoringProcedureOther' 
						Type='cTextBox' 
						Container='spnMonitoringProcedureOther' 
						Size='50' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Container='spnSaveContinue'
						Save='True'
						GoToNextPage='True'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>