<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Budget_Editor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cBudgetPeriodReport_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<table id='tblText' runat='server' visible='false'>
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<table id='tblBudgetPeriod' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' visible='true'>
	<tr><td><span id='spnDownload' runat='server' visible='false'></span></td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Budget Period</b></td>
	</tr>	
	<tr>
		<td>
			<span runat='server' id='ctlBudgetPeriodID'/>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='25%'><b>Period Description&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnDescription'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
		<td><b>Start Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnStart'/></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
		<td>MM/DD/YYYY</td>
	</tr>	
	<tr>
		<td><b>End Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnEnd'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>MM/DD/YYYY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td>&nbsp;<b>Carryover From Previous
			<br>Budget Period&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnCarryoverCost'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>If none, please enter zero.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td colspan='2' align='center'>
			<span runat='server' id='spnSave1'/> 
			<span runat='server' id='spnCancel1'/> 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Budget/Expenditures Totals</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>

<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='6' runat='server' width='50%'>
</table>

<table>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='300'>&nbsp;</td>
		<td>
			<span runat='server' id='spnCalculate'/> 
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnCancel' visible='false'/> 
		</td>
	</tr>
</table>

<center>
	<table id='tblSaveClose' runat='server'>	
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<span runat='server' id='spnSave_and_Continue'/>
			</td>
		<td>
			<span runat='server' id='spnClose'/>
		</td>
		</tr>
	</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='BudgetID' 
					PropertyKey='BudgetID' Value='' Bool=''/>
				<!--
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' 
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				-->
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='DataPresenter' TypeKey='BudgetTypeID' PropertyKey='BudgetTypeID' Value=''/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
		</DataObject>

		<DataObject Key='BudgetPeriod' DataObjectDefinitionKey='BudgetPeriod' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='BudgetID'
					PropertyKey='BudgetID' Value='' bool=''/>	
				<Argument Type='DataPresenter' TypeKey='BudgetPeriodDescriptionID' PropertyKey='BudgetPeriodDescriptionID' Value='' bool='And'/>			
            </Filters>
            <DefaultValues>
				<Argument Type='DataPresenter' TypeKey='BudgetID' PropertyKey='BudgetID' Value=''/>
			</DefaultValues>
            <DisplayProperties>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStart'
						Type='cDateTextBox'
						Container='spnStart'
						Size='25'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='True'
						ErrorMessage='Start date for Budget Period is required.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEnd'
						Type='cDateTextBox'
						Container='spnEnd'
						Size='25'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='True'
						ErrorMessage='End date for Budget Period is required.'>
					</Control>
				</DisplayProperty>
				
				<DisplayProperty PropertyKey='BudgetPeriodDescription'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextArea'
						RequiredField='True'
						ErrorMessage='Period Description is required.'
						Rows='2'
						Cols='50'
						MaxLength='255'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,255}$' ErrorMessage='Limit your Description to 255 characters or less.' />
					</Control>
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey='CarryoverCost'>
					<Control ID='ctlCarryoverCost'
						Container='spnCarryoverCost'
						Type='cTextBox'
						Size='20'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='You must enter a Carryover Cost From Previous Budget Period.'>
						<Validation Type='RegularExpression' ValidationExpression='^\d{0,}$' ErrorMessage='Direct Costs Carryover must be a number.' />
					</Control>
				</DisplayProperty>	
				-->
											
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
						
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate'
						Container='spnCalculate'
						Type='cButton'
						Image='Calculate'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='RecalculateBudget'>
						</Action>
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
							Object='EventController'>							
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
																
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave1'
						Container='spnSave1'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='SavePeriod'>							
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel1'
						Container='spnCancel1'
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
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ResearchProgressText'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'
						Confirmation='Select OK to close the page without saving the data. Select Cancel to return.'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Main'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>						

			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
