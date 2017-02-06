<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Easygrants:ValSumm id='ctlValSumm' runat='server'/>

<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Funding Source Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
	<tr>
		<td	width="25%" align="right"><b>Funding Source&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnInstitution' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>Project Title&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnProjectTitle' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>Start Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnStartDate' runat='server'/></td>
	</tr>
	<tr>
		<td	width="25%" align="right"></td>
		<td>MM/DD/YYYY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>End Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnEndDate' runat='server'/></td>
	</tr>
	<tr>
		<td	width="25%" align="right"></td>
		<td>MM/DD/YYYY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	width="25%" align="right"><b>Dollar Amount&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span id='spnAmount' runat='server'/></td>
	</tr>
	<tr>
		<td	width="25%" align="right"></td>
		<td>Numeric value, no decimals or commas</td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td></td>
		<td align="center">
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser'
					TypeKey='GranteeProjectID' 
					PropertyKey='AppGranteeProjectID'
					Value=''
					Bool=''/>
			</Filters>
			<DisplayProperties/>
		</DataObject>	
		
		<DataObject Key='GranteeProjectOtherSupport' DataObjectDefinitionKey='GranteeProjectOtherSupport' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectOtherSupportID'
					PropertyKey='GranteeProjectOtherSupportID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FundingInstitution'>
					<Control ID='ctlInstitution'
						Container='spnInstitution'
						Type='cTextBox'
						Size='75'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='~~Organization~~ is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectTitle'>
					<Control ID='ctlProjectTitle'
						Container='spnProjectTitle'
						Type='cTextBox'
						Size='75'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Project Title is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='35'
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
						Size='35'
						MaxLength='10'
						RequiredField='True'
						ErrorMessage='End Date is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Amount'>
					<Control ID='ctlAmount'
						Container='spnAmount'
						Type='cTextBox'
						Size='20'
						MaxLength='10'
						AllowNumbersOnly='True'
						RequiredField='True'
						ErrorMessage='Amount is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Amount is required. Numbers only. Do not use decimals or commas.' />
					</Control>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='OtherSupport'/>
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
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument AttributeName='PageKey' Value='OtherSupport'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
