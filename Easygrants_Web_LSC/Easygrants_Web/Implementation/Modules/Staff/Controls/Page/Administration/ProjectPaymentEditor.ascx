<%@ Control Language="vb" AutoEventWireup="true" Codebehind="ProjectPaymentEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cProjectPaymentEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Payment Parameter Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'><b><%=GetLabel("ProgramName")%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProgram' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnCompetition' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnProjectName' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Request Date</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnRequestDate' runat='server'/></td>	
	</tr>	
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	
			
	<tr>
		<td><b>Request Amount</b></td>
		<td width='10'>&nbsp;</td>
		<td>$<span id='spnRequestAmount' runat='server'/></td>	
	</tr>
	<tr>
		<td><b>Payment Method</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnPaymentMethod' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>Account</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnAccount' runat='server'/>
		</td>	
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>		
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
				<DisplayProperty PropertyKey='WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfCompetition.CompetitionDisplayName'>
					<Control ID='spnCompetition'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='WfProjectName'>
					<Control ID='spnProjectName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='ProjectPayment' DataObjectDefinitionKey='ProjectPayment' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='ProjectPaymentID'
					PropertyKey='ProjectPaymentID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectID' PropertyKey='ProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RequestDate'>
					<Control ID='ctlRequestDate'
						Container='spnRequestDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Width='15'
						MaxLength='10'
						RequiredField='False'
						ErrorMessage='Start Date is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestAmount'>
					<Control ID='ctlRequestAmount'
						Container='spnRequestAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0'
						Size='20'
						RequiredField='False'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='Total amount must contain only digits, commas, and hyphens.'
						DecimalErrorMessage='Total amount must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'
						ErrorMessage='Total Annual Research Funding amount is required.'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PaymentMethodID'>
					<Control ID='ctlPaymentMethod'
						Container='spnPaymentMethod'
						Type='cDropDown'
						DataObjectDefinitionKey='PaymentMethod'
						StoredValue='PaymentMethodID'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AccountID'>
					<Control ID='ctlAccount'
						Container='spnAccount'
						Type='cDropDown'
						DataObjectDefinitionKey='Account'
						StoredValue='AccountID'
						DisplayValue='Description'>
						<Sort>
							<Argument PropertyKey='Description' />
						</Sort>
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
								<Argument Type='DataObjectCollection' TypeKey='ProjectPayment' DataObjectPropertyKey='ProjectPaymentID' PropertyKey='ProjectPaymentID' BaseValue='ProjectPaymentID='/>
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
