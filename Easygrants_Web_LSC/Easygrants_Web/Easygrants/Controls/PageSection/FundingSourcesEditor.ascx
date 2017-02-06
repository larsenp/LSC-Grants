<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Review.Controls.Page.cFundingSourcesEditor" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<script type="text/javascript">
	function UpdateFundingSourceDetails(result, context) {
		var currentFundName = document.getElementById("mPageFrameCtl_ctlPageContent_ctlFundingSourceName_txtAutoComplete").value;
		var selectedFundName = document.getElementById("mPageFrameCtl_ctlPageContent_ctlFundingSourceName_hdnObjText").value;
		if (currentFundName == selectedFundName)
		{
			var resultarray = result.split("~~");
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceID").innerHTML = resultarray[0];
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceCommonName").innerHTML = resultarray[1];
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceType").innerHTML = resultarray[2];
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceEndDate").innerHTML = resultarray[3];
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceBalance").innerHTML = resultarray[4];
		}
		else
		{
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceID").innerHTML = "";
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceCommonName").innerHTML = "";
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceType").innerHTML = "";
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceEndDate").innerHTML = "";
			document.getElementById("mPageFrameCtl_ctlPageContent_spnFundingSourceBalance").innerHTML = "";
		}
	}
	function OnError(message, context) {
        alert("An unhandled exception has occurred:\n" + message + " - " + context);
     }
</script>
<!-- Page Content - Top Of Page -->
<%-- <span id='spnPageContent' runat='server' /> --%>
<Core:cUserCtlLoader CtlID='ctlGrantSummary' 
	Src='Easygrants/Controls/PageSection/GrantInformation.ascx'
	runat='server'/>
<br>
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td class="SeparatorHdg" colspan='3' ><b>Add or Edit Allocation</b></td>
	</tr>
	<tr>
	    <td colspan='3'>&nbsp;</td>
	</tr>
	<tr>
		<td width='23%'><b>Original Award Amount</b></td>
		<td width='2%'></td>	
		<td><span runat='server' id='spnAwardAmount' /></td>
	</tr>
	<tr>
		<td width='23%'><b>Current Allocation to the Grant</b></td>
		<td width='2%'></td>	
		<td><span runat='server' id='spnGrantAllocation' /></td>
	</tr>
	<tr>
		<td width='23%'><b><%=GetLabel("FundName")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'></td>
		<td>
			<table>
				<tr>
					<td>
						<span runat='server' id='spnFundingSourceName' />&nbsp;
						<asp:CustomValidator id="valUniqueFund" runat="server"
							OnServerValidate="ValidateUniqueFund"
							Display="None"
							ErrorMessage="Fund is already allocated to the grant. Select a new ~~FundName~~."/>
					</td>
					<td valign="top">
						<input type='button' runat="server" id="btnSelect" value="Select" class="CSSButtonStyle" style="cursor:hand"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width='23%'>&nbsp;</td>
		<td width='2%'>&nbsp;</td>		
		<td class='FieldLabel'>Enter at least two characters of the Funding Source Name; a drop-down will appear with funds that match. Highlight the desired item and click <b>Select</b>.</td>
	</tr>
	<tr>
		<td width='23%'><b><%=GetLabel("FundNumber")%></b></td>
		<td width='2%'></td>	
		<td><span runat='server' id='spnFundingSourceID' /></td>
	</tr>
	<tr>
		<td width='23%'><b><%=GetLabel("FundDescription")%></b></td>
		<td width='2%'></td>	
		<td><span runat='server' id='spnFundingSourceCommonName' /></td>
	</tr>
	<tr>
		<td width='23%'><b><%=GetLabel("FundType")%></b></td>
		<td width='2%'></td>		
		<td><span runat='server' id='spnFundingSourceType' /></td>
	</tr>
	<tr>
		<td width='23%'><b><%=GetLabel("FundEndDate")%></b></td>
		<td width='2%' align="right"></td>
		<td><span runat='server' id='spnFundingSourceEndDate' /></td>
	</tr>
	
	<tr>
		<td width='23%'><b><%=GetLabel("GrantAllocation")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'></td>	
		<td>
			$<span runat='server' id='spnAmountAllocated' />
			<asp:CustomValidator id="valFundBalance" runat="server"
				OnServerValidate="ValidateFundBalance"
				Display="None"
				ErrorMessage="~~FundBalance~~ may not go below zero. Enter a different ~~GrantAllocation~~ amount."/>
			<asp:CustomValidator id="valTotalAllocatedAmount" runat="server"
				OnServerValidate="ValidateTotalAllocatedAmount"
				Display="None"
				ErrorMessage="~~GrantAllocation~~ amount must be less than or equal to the Original Award Amount."/>
			
		</td>
	</tr>
	<tr>
		<td width='23%'>&nbsp;</td>
		<td width='2%'>&nbsp;</td>		
		<td class='FieldLabel'>Enter numbers only; do not include dollar signs. US currency value only.</td>
	</tr>
	<tr id='trSourceStatus'>
		<td width='23%'><b><%=GetLabel("AllocationStatus")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'></td>
		<td><span runat='server' id='spnFundingSourceStatusLabel'>Proposed</span><span runat='server' id='spnFundingSourceStatus' /></td>
	</tr>
	<tr>
		<td width='23%'><b><%=GetLabel("FundBalance")%></b></td>
		<td width='2%' align="right"></td>		
		<td>
			<span runat='server' id='spnFundingSourceBalance' />&nbsp;&nbsp;&nbsp;
			<b>Balance Last Updated:</b>
		</td>
	</tr>
</table>
<br/>			
<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr>
		<td>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnSaveContinue'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProjectFundingSources&QueryStringKey=GranteeProjectFundingSourcesID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<%-- <PageContent/> --%>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectInfo.AwardAmount' Format='$#,0.00'>
					<Control ID='spnAwardAmount'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjectInfo.GranteeProjectTotalAllocatedAmount.TotalAllocatedAmount' Format='$#,0.00'>
					<Control ID='spnGrantAllocation'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectFundingSources' DataObjectDefinitionKey='GranteeProjectFundingSources' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectFundingSourcesID' PropertyKey='GranteeProjectFundingSourcesID' Value=''/>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<!-- Here the below argument we are storing 0 value as this column doesn;t all null values . but we will be updating the orginal valus in code behind -->
				<Argument Type='' TypeKey='' PropertyKey='FundingSourceStatusID' Value='0'/> 
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='FundID'>
					<Control ID='ctlFundingSourceName'
						Container='spnFundingSourceName'
						Type='cAutoCompleteTextBox'
						DataObjectDefinitionKey='Fund'
						StoredValue='Fund.FundID'
						DisplayValue='Fund.FundName'
						UniqueStoredValue='FundID'
						SearchValue='FundID'
						SearchText='FundName'
						Size='300'
						MaxLength='300'
						RequiredField='True'
						ErrorMessage='~~FundName~~ is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fund.FundAccountNumber'>
					<Control ID='spnFundingSourceID'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fund.FundDescription'>
					<Control ID='spnFundingSourceCommonName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fund.FundSourceType.Description'>
					<Control ID='spnFundingSourceType'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Fund.FundEndDate' Format='MM/dd/yyyy'>
					<Control ID='spnFundingSourceEndDate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='AmountAllocated'>
					<Control ID='ctlAmountAllocated'
						Container='spnAmountAllocated'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0.00'
						Size='20'
						MaxInputDecimalPlaces='2'
						RequiredField='True'
						ErrorMessage='~~GrantAllocation~~ is required.'
						RegExErrorMessage='~~GrantAllocation~~ must be a valid currency value.'
						DecimalErrorMessage='~~GrantAllocation~~ must be a valid currency value.'
						CommaErrorMessage='~~GrantAllocation~~ must be a valid currency value.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundingSourceStatus.Description' >
					<Control ID='spnFundingSourceStatusLabel'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='FundingSourceStatusID'>
					<Control ID='ctlFundingSourceStatus' 
						Container='spnFundingSourceStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='FundingSourceStatus'
						StoredValue='FundingSourceStatusID'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='Funding Source Status is required.'
						DisplayText='Select'>
					    <Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey='Fund.FundBalance.FundBalanceAmount' Format='$#,0.00'>
					<Control ID='spnFundingSourceBalance'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
		   </DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProjectFundingSourcesHistory' DataObjectDefinitionKey='GranteeProjectFundingSourcesHistory'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectFundingSourcesID' PropertyKey='GranteeProjectFundingSourcesID' Value=''/>
			</Filters>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='FundingSourcesEditor'/>
								<Argument Type='DataPresenter' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectFundingSources' DataObjectPropertyKey='GranteeProjectFundingSourcesID' PropertyKey='GranteeProjectFundingSourcesID' BaseValue='GranteeProjectFundingSourcesID='/>
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Container='spnSaveContinue'
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
							AutoSave='Flase'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlFundingSourceStatus' 
						Container='spnFundingSourceStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='FundingSourceStatus'
						StoredValue='FundingSourceStatusID'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='~~AllocationStatus~~ is required.'
						DisplayText='Select'>
					    <Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>			
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>