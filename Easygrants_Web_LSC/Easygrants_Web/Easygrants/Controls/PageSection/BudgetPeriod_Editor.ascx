<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Budget_Editor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cBudgetPeriod_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
<br>
<span id='spnBudgetError' visible='false' runat='server'>
	<font color='red'><b>Indirect Costs cannot exceed <%=IndirectCostLimit%>% of the total Direct Costs.</b></font>
	<p>
</span>

<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
</table>
<span id='spanPeriod' runat='server'>
<p>
Enter the information below.  
</p>
<p>Click <b>Save and Continue</b> and a new budget form page will be displayed.</p>
<br>
</span>

<span id='spanItem' runat='server'>
<p>
Enter information for the budget year below.
</p>
</span>

<span id='spanItem1' runat='server'>
<p>	
<ul>
	<li>Indirect Costs cannot exceed <b><%=IndirectCostLimit%>%</b> of the total Direct Costs.</li>
	<li>When entering numbers, do not use commas, decimals, or dollar signs. Round to the nearest dollar.</li>
	<li><font color='red'>Pay particular attention to your calculation of Indirect Costs.  If rounding results in a percentage even slightly higher
	    than <b><%=IndirectCostLimit%>%</b>, the system will display an error message.</font></li>
</ul>
</p>
</span>

<p>

<table id='tblGrantInfo' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Grant Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='30'><b>ID:</b></td>
		<td><span id='spnGranteeProjectID' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='90'><b><%=GetLabel("ProjectTitle")%>:</b></td>
		<td><span id='spnGrantTitle' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='90'><b>Grantee:</b></td>
		<td><span id='spnGrantee' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Budget Year</b></td>
	</tr>	
</table>

<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan='2'>
			<span runat='server' id='ctlBudgetPeriodID'/>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr visible='false'>
		<td>Year:</td>
		<td><span runat='server' id='spnPeriodName'/></td>
	</tr>
    <tr visible='false'><td>&nbsp;</td>
		<td><b>Budget Period Name&nbsp;</b><%=kDenoteRequiredField%></td>
	</tr>
	<tr>
		<td width='150'><b>Year&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnPeriod'/></td>
	</tr>
    <tr><td>&nbsp;</td></tr>	
	<tr>
		<td width='150'><b>Start Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnStart'/></td>
	</tr>
	<tr>
		<td></td>
		<td>(MM/DD/YYYY)</td>
	</tr>	
	<tr>
		<td width='150'><b>End Date&nbsp;</b><%=kDenoteRequiredField%></td>
		<td><span runat='server' id='spnEnd'/></td>
	</tr>
	<tr>
		<td></td>
		<td>(MM/DD/YYYY)</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>	
	<tr visible='false'>
		<td colspan='2'>
			<a name='aUploadNarrative'></a>
			<span runat='server' id='spnUploadNarrative'/>
		</td>
	</tr>	
</table>

<table id='tblBudgetItemsHdg' visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Budget Categories</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
	<tr><td>&nbsp;</td></tr>	
</table>

<table id='tblBudgetItems' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
</table>
<span id='spanItem2' runat='server'>
<br>
<br>
<br>
<p>	
	Click <b>Save</b> to validate your budget and confirm that the Indirect Costs are within the allowable percentage of the total Direct Costs.
	<br>
	<br>
	Click <b>Save and Continue</b> to save your work and return to the <b>Budget</b> main page.
	<br>
	<br>
	Click <b>Cancel</b> to return to the <b>Budget </b>main page without saving changes.
</p>
</span>
<table id="Table4" visible='true' border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" align='center'>
			<span runat='server' id='spnSave'/> 
			<span runat='server' id='spnSave_and_Continue'/> 
			<span runat='server' id='spnCancel'/> 
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Budget' DataObjectDefinitionKey='Budget' CreateNew='True' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='BudgetID' 
					PropertyKey='BudgetID' 
					Value='' 
					Bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value=''/>
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
				<Argument Type='QueryString' 
					TypeKey='BudgetPeriodID'
					PropertyKey='BudgetPeriodID'
					Value='' 
					bool=''/>
				<Argument Type='DataObjectCollection' 
					TypeKey='Budget' 
					DataObjectPropertyKey='BudgetID' 
					PropertyKey='BudgetID' 
					Value=''/>
            </Filters>
            <DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Budget' DataObjectPropertyKey='BudgetID' PropertyKey='BudgetID' Value=''/>
				<Argument Type='Control' TypeKey = 'ctlPeriod' ControlPropertyKey='SelectedField' PropertyKey='BudgetPeriodDescriptionID' Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='BudgetPeriodNameID'>
					<Control ID='ctlPeriod'
						Container='spnPeriod'
						Type='cDropDown'
						DataObjectDefinitionKey='BudgetPeriodName'
						StoredValue='BudgetPeriodNameID'
						DisplayValue='Abbr'	
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Select a Year.'>
							<!-- <Sort>
	                            <Argument PropertyKey='SortOrder'/>
                            </Sort> -->
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateName' ErrorMessage='The Year you selected already exists for this budget.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStart'
						Type='cDateTextBox'
						Container='spnStart'
						Size='25'
						MaxLength='10'
						Calendar='False'
						DateFormat='MM/dd/yyyy'
						RequiredField='True'
						ErrorMessage='Enter a start date for Budget Period.'
						NotSupportedDateErrorMessage='Enter a valid Start Date for Budget.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEnd'
						Type='cDateTextBox'
						Container='spnEnd'
						Size='25'
						MaxLength='10'
						Calendar='False'
						DateFormat='MM/dd/yyyy'
						RequiredField='True'
						ErrorMessage='Enter an end date for Budget Period.'
						NotSupportedDateErrorMessage='Enter a valid End Date for Budget.'>
					</Control>
				</DisplayProperty>	
               <!--  <DisplayProperty PropertyKey='BudgetPeriodName'>
					<Control ID='ctlPeriodName'
						Type='cTextBox'
						Container='spnPeriodName'
						Size='100'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Enter a Name for Budget Period.'>
					</Control>
				</DisplayProperty> -->
                <!-- : Upload Budget Period Narrative -->
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlUpload'
						Type='cUpload'
						Container='spnUploadNarrative'>
                        <Visible>
                            <Argument PropertyKey='BudgetPeriodID' NullDataObject='False' Operator='NotEqual' Value='' />
                        </Visible>
						<InstructionHtml>
							<p>Click on the <b>Browse…</b> button to find the file on your 
							computer to upload.  Use the dialog box that pops up to find the 
							file and click <b>Open</b>.  Once the filename is in the field 
							below, click the <b>Upload</b> button.</p>
							<p><font color='red'>IMPORTANT:</font> After you have uploaded 
							the file, <u>you must</u> click the <b>View</b> button to view the 
							document as it has been converted.  If there were any conversion 
							errors, you will view a screen with those details.</p>
						</InstructionHtml>
						<Parameters>
							<Argument PropertyKey='FileTypeID' 
								Value='20'
								Bool=''/>
							<Argument Type='QueryString' 
								TypeKey='BudgetPeriodID'
                                PropertyKey='EntityAssocID'
                                Value=''
								Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='doc,rtf,pdf,docx'
								ErrorMessage='Error : Only files with extension .doc, .rtf, .pdf or .docx are allowed.'
								Bool=''/>
						</Parameters>
					</Control>
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCalculate'
						Container='spnCalculate'
						Type='cButton'
						Image='Calculate'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='RecalculateBudget'>
						</Action>
					</Control>
				</DisplayProperty>
				-->
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
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
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save_and_Continue'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='SaveContinue'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Budget'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Cancel'>
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
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' CreateNew='False' Updatable='False'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='Budget' 
					DataObjectPropertyKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID'/>
			</Filters>
			<DefaultValues>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectID'>
					<Control ID='spnGranteeProjectID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='GrantTitle'>
					<Control ID='spnGrantTitle'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstNameMiddleName'>
					<Control ID='spnGrantee'
						Type='HtmlGenericControl'/>
				</DisplayProperty>													
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
</span>
<!-- End Embedded XML -->
