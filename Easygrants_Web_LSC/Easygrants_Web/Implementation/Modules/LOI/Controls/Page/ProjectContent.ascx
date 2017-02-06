<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>

<!-- Page Content - Controls -->

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' >
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Title</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' ID="Table3">
	<tr>
		<td	valign="top" width='200'><b><%=GetLabel("ProjectTitle")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnFullTitle' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td>&nbsp;</td>
		<td><font size='1'>Limit: 300 characters</font></td>	
	</tr>
</table>
<br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table2">
<!-- Control Label (for Project information) -->
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" width='200'><b>Brief Description</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnDescription' runat='server'/>
			<br>
			<font size='1'>Limit: 1000 characters</font>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td	valign="top" ><b>Project Start Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnDurationStart' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>(MM/DD/YYYY)</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top" ><b>Project End Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnDurationEnd' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td>(MM/DD/YYYY)</td>	
	</tr>	
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td	valign="top" ><b>Grant Request Amount</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span id='spnDollarRequest' runat='server'/>
		</td>
	</tr>
	<tr>		
		<td></td>
		<td><font size='1'>(Enter whole numbers only. Do not enter commas, decimals, or dollar signs.)</font></td>	
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr>
		<td	valign="top" ><b>Additional Key Staff</b></td>
		<td>
			<span id='spnAdditionalStaff' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>		
</table>

<table  border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>	
	<tr>
		<td align='center'>
		<!--Save Button Control(additional configuration information is specified in the 
		DisplayProperty node below) -->
		<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GrantTitle'>					
					<Control ID='ctlFullTitle'
						Container='spnFullTitle'
						Type='cTextArea'
						Rows='4'
						Cols='50'
						MaxLength='300'
						TooLongMessage='Limit your Project Title to 300 characters.'
						RequiredField='True'
						ErrorMessage='Enter a ~~ProjectTitle~~.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='GrantDescription'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextArea'
						Rows='15'
						Cols='50'
						MaxLength='1000'
						TooLongMessage='Limit your Brief Description to 1000 characters.'
						RequiredField='True'
						ErrorMessage='Brief Description is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestAmount'>
					<Control ID='ctlDollarRequest'
						Container='spnDollarRequest'
						Type='cMoneyTextBox'
						Size='10'
						Format='#0'
						MaxLength='12'
						RequiredField='True'
						ErrorMessage='Grant Request Amount is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^[+]?\d*$' ErrorMessage='Valid Grant Request Amount is required. Do not use decimals or commas.' />
					</Control>
				</DisplayProperty>	
							
			</DisplayProperties>
		</DataObject>

		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='AdditionalStaff'>
					<Control ID='ctlAdditionalStaff'
						Container='spnAdditionalStaff'
						Type='cTextArea'
						MaxLength='300'
						Rows='4'
						Cols='50'
						RequiredField='False'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,300}$' ErrorMessage='Limit your Additional Staff to 300 characters or less.' />
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='DurationStart'>
					<Control ID='ctlDurationStart'
						Container='spnDurationStart'
						Type='cDateTextBox'
						DateFormat='MM/dd/yyyy'
						Calendar='True'
						Size='25'
						MaxLength='25'
						RequiredField='True'
						ErrorMessage='Project Start Date is required.'
						NotSupportedDateErrorMessage='Valid Project Start Date is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DurationEnd'>
					<Control ID='ctlDurationEnd'
						Container='spnDurationEnd'
						Type='cDateTextBox'
						DateFormat='MM/dd/yyyy'
						Calendar='True'
						Size='25'
						MaxLength='25'
						RequiredField='True'
						ErrorMessage='Project End Date is required.'
						NotSupportedDateErrorMessage='Valid Project End Date is required.'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
			<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Save='True'
						Type='cButton'
						Image='Save and Continue'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>


