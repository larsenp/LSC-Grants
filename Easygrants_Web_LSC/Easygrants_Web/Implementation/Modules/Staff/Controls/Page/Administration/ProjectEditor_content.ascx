<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectEditor_content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cProjectEditor_content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<script language="javascript" >
<!--
	function DefaultButtonClicked(id)
	{
		if (id == "<%#CtlDefaultPaymentSetupCoreCtlClientID%>")
		{
			var defaultYesButton = document.getElementById("<%#CtlDefaultPaymentSetupClientID%>_rdoRadioButtonList_0")
			if (defaultYesButton.checked)
			{
				var dropDown = document.getElementById("<%#CtlPaymentProcessClientID%>_selDropDown")
				dropDown.selectedIndex = 0
				var tableRow = document.getElementById("<%#TrDescription1ClientID%>")
				if (tableRow)
				{
					tableRow.style.display = "none"
					tableRow = document.getElementById("<%#TrSpace1ClientID%>")
					tableRow.style.display = "none"
				}
			}
		}
		else
		{
			var defaultYesButton = document.getElementById("<%#CtlDefaultReportSetupClientID%>_rdoRadioButtonList_0")
			if (defaultYesButton.checked)
			{
				var dropDown = document.getElementById("<%#CtlReportProcessClientID%>_selDropDown")
				dropDown.selectedIndex = 0
				var tableRow = document.getElementById("<%#TrDescription2ClientID%>")
				if (tableRow)
				{
					tableRow.style.display = "none"
					tableRow = document.getElementById("<%#TrSpace2ClientID%>")
					tableRow.style.display = "none"
				}
			}
		}
	}

	function DropDownChanged(id)
	{
		if (id == "<%#CtlPaymentProcessCoreCtlClientID%>")
		{
			var dropDown = document.getElementById("<%#CtlPaymentProcessClientID%>_selDropDown")
			if (dropDown.selectedIndex == 0)
			{
				var tableRow = document.getElementById("<%#TrDescription1ClientID%>")
				if (tableRow)
				{
					//tableRow.style.display = "none"
					tableRow = document.getElementById("<%#TrSpace1ClientID%>")
					//tableRow.style.display = "none"
				}
			}
			else
			{
				var tableRow = document.getElementById("<%#TrDescription1ClientID%>")
				if (tableRow)
				{
					//tableRow.style.display = "inherit"
					tableRow = document.getElementById("<%#TrSpace1ClientID%>")
					//tableRow.style.display = "inherit"
				}
				var defaultNoButton = document.getElementById("<%#CtlDefaultPaymentSetupClientID%>_rdoRadioButtonList_1")
				defaultNoButton.checked = true
			}
		}
		else
		{
			var dropDown = document.getElementById("<%#CtlReportProcessClientID%>_selDropDown")
			if (dropDown.selectedIndex == 0)
			{
				var tableRow = document.getElementById("<%#TrDescription2ClientID%>")
				if (tableRow)
				{
					//tableRow.style.display = "none"
					tableRow = document.getElementById("<%#TrSpace2ClientID%>")
					//tableRow.style.display = "none"
				}
			}
			else
			{
				var tableRow = document.getElementById("<%#TrDescription2ClientID%>")
				if (tableRow)
				{
					//tableRow.style.display = "inherit"
					tableRow = document.getElementById("<%#TrSpace2ClientID%>")
					//tableRow.style.display = "inherit"
				}
				var defaultNoButton = document.getElementById("<%#CtlDefaultReportSetupClientID%>_rdoRadioButtonList_1")
				defaultNoButton.checked = true
			}
		}
	}
-->
</script>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			 <span id='spnProjectName' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td colspan='2'></td>	
		<td>Limit: 200 characters</td>	
	</tr>
	<tr>
		<td><b>Funding Cycle Abbreviation <%=kDenoteRequiredField%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProjectAbbr' runat='server'/>		
		</td>	
	</tr>
	<tr>
		<td colspan='2'></td>	
		<td>Limit: 10 characters</td>	
	</tr>
	<tr>
		<td><b>Technical Support E-mail Address</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnSupportEmail' runat='server'/></td>	


	</tr>
	<tr>
		<td><b>Program Support E-mail Address</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			 <span id='spnContentEmail' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Time Period/Award Cycle</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			 <span id='spnTimePeriod' runat='server'/>
		</td>	
	</tr>
		<tr>
		<td><b>Fund Name</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			 <span id='spnFundName' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Award Term (Years)</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			 <span id='spnTerm' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Start Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td> <span id='spnStartDate' runat='server'/></td>	
	</tr>
	<tr>
		<td><b>End Date</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td> <span id='spnEndDate' runat='server'/></td>	
	</tr>
	<tr>
		<td><b>Total Budget Limit</b></td>
		<td width='10'>$</td>
		<td><span id='spnTotBudgetLimit' runat='server'/></td>	
	</tr>
	<tr>
		<td><b>Indirect Cost Limit</b></td>
		<td width='10'>%</td>
		<td><span id='spnIndCostLimit' runat='server'/></td>	
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Automatic Payment Generation</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Generate Payments Automatically</b></td>
		<td width='53'>&nbsp;</td>
		<td>
			<span id='spnAutoGeneratePayment' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td nowrap='true'><b>Use the Default Payment Parameters</b></td>
		<td width='53'>&nbsp;</td>
		<td>
			<span id='spnDefaultPaymentSetup' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Use Custom Payment Process</b></td>
		<td width='53'>&nbsp;</td>
		<td>
			<span id='spnPaymentProcess' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trDescription1' runat='server'>
		<td><b>Description</b></td>
		<td width='53'>&nbsp;</td>
		<td>
			This process uses the total amount entered in the Application Budget to create 4 payments a year over the award term (20 total payments).  All of the payments will have the account equal to AP Research Current Yr New Awards and the Payment Method will be equal to Wire.

		</td>	
	</tr>
	<tr id='trSpace1' runat='server'><td>&nbsp;</td></tr>
</table>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Automatic Grantee Report Generation</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td><b>Generate Grantee Reports Automatically</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAutoGenerateReport' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td nowrap='true'><b>Use the Default Report Parameters</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnDefaultReportSetup' runat='server'/>
		</td>	
	</tr>	
	<tr>
		<td><b>Use Custom Grantee Report Process</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnReportProcess' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr id='trDescription2' runat='server'>
		<td><b>Description</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			Description of the FTF Custom Grantee Report Generation process.  This will 
			be a stored procedure
		</td>	
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr id='trSpace2' runat='server'><td>&nbsp;</td></tr>		
	<tr>
		<td colspan='4' align='center'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='WfProject' DataObjectDefinitionKey='WfProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectID'
					PropertyKey='WfProjectID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='CompetitionID' PropertyKey='CompetitionID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='ctlProjectName'
						Container='spnProjectName'
						Type='cTextBox'
						Size='65'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='~~FundingCycleName~~ is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='ShortName'>
					<Control ID='ctlProjectAbbr'
						Container='spnProjectAbbr'
						Type='cTextBox'
						Size='10'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Funding Cycle Abbreviation is required.'>
					</Control>					
				</DisplayProperty>	
				<DisplayProperty PropertyKey='SupportEmailAddress'>
					<Control ID='ctlSupportEmail'
						Container='spnSupportEmail'
						Type='cEmailTextBox'
						Size='65'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Technical Support E-mail Address is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='ContentEmailAddress'>
					<Control ID='ctlContentEmail'
						Container='spnContentEmail'
						Type='cEmailTextBox'
						Size='65'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Program Support E-mail Address is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='TimePeriodID'>
					<Control ID='ctlTimePeriod'
						Container='spnTimePeriod'
						Type='cDropDown'
						DataObjectDefinitionKey='TimePeriod'
						StoredValue='TimePeriodID'
						DisplayText='Select'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='Time Period/Award Cycle is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundID'>
					<Control ID='ctlFundName'
						Container='spnFundName'
						Type='cDropDown'
						DataObjectDefinitionKey='Fund'
						StoredValue='FundID'
						DisplayText='Select'
						DisplayValue='FundName'
						RequiredField='True'
						ErrorMessage='Fund Name is required.'>
						<Sort>
							<Argument PropertyKey='FundName' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AwardTerm'>
					<Control ID='ctlTerm'
						Container='spnTerm'
						Type='cTextBox'
						Size='2'
						MaxLength='2'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='15'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='Start Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='15'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='End Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutoGeneratePayment'>
					<Control ID='ctlAutoGeneratePayment'
						Container='spnAutoGeneratePayment'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DefaultValue='False'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DefaultPaymentSetup'>
					<Control ID='ctlDefaultPaymentSetup'
						Container='spnDefaultPaymentSetup'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DefaultValue='True'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
						<AddScript Name='DefaultButtonClicked' Event='onClick'>
							<Parameter Key='ControlID'/>
						</AddScript>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PaymentProcessID'>
					<Control ID='ctlPaymentProcess'
						Container='spnPaymentProcess'
						Type='cDropDown'
						DataObjectDefinitionKey='PaymentProcess'
						StoredValue='PaymentProcessID'
						DisplayValue='Description'>
						<AddScript Name='DropDownChanged' Event='onChange'>
							<Parameter Key='ControlID'/>
						</AddScript>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AutoGenerateReport'>
					<Control ID='ctlAutoGenerateReport'
						Container='spnAutoGenerateReport'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DefaultValue='True'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DefaultReportSetup'>
					<Control ID='ctlDefaultReportSetup'
						Container='spnDefaultReportSetup'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DefaultValue='False'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
						<AddScript Name='DefaultButtonClicked' Event='onClick'>
							<Parameter Key='ControlID'/>
						</AddScript>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReportProcessID'>
					<Control ID='ctlReportProcess'
						Container='spnReportProcess'
						Type='cDropDown'
						DataObjectDefinitionKey='ReportProcess'
						StoredValue='ReportProcessID'
						DisplayValue='Description'>
						<AddScript Name='DropDownChanged' Event='onChange'>
							<Parameter Key='ControlID'/>
						</AddScript>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TotalBudgetLimit'>					
					<Control ID='ctlTotBudgetLimit'
						Container='spnTotBudgetLimit'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,#.##'
						Size='15'
						MaxInputDecimalPlaces='2'						
						RegExErrorMessage='Total Budget Limit must contain only digits, commas, and hypens.'
						DecimalErrorMessage='Total Budget Limit must contain only digits, commas, and hypens.'
						CommaErrorMessage='Total Budget Limit must contain only digits, commas, and hypens.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IndirectCostLimit'>					
					<Control ID='ctlIndCostLimit'
						Container='spnIndCostLimit'
						Type='cMoneyTextBox'
						Size='15'
						Format='##.##'
						MaxLength='6'
						MaxInputDecimalPlaces='2'>
						<Validation Type='Range'
							MinimumValue='1' MaximumValue='100'	DataType='Double'						
							ErrorMessage='Indirect Cost Limit must be a number between 0 and 100.' />									   
					</Control>
				</DisplayProperty>							
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='WfProject' DataObjectPropertyKey='WfProjectID' PropertyKey='WfProjectID' BaseValue='WfProjectID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>
<!-- End Embedded XML -->
