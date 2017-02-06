<%@ Control Language="vb" AutoEventWireup="true" Codebehind="GrantAffilliatedStaffEditor.ascx.vb" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>
<!-- Page Content - Top Of Page -->


<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Add or Edit Grant Fund</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>    
    <tr>
	    <td width='15%'><b>Fund Name</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnName' /></td>
    </tr>
    <tr  id='trPersonEditable'>
	    <td ><b><%=GetLabel("FundNumber")%></b>&nbsp;<%=kDenoteRequiredField%></td>
	    <td><span runat='server' id='spnNumber' /></td>	
    </tr>
     <tr >
	    <td ><b>Fund Description</b>&nbsp;<%=kDenoteRequiredField%></td>
	    <td><span runat='server' id='spnDescription' /></td>	
    </tr>
   <tr>
        <td><b>Fund Amount</b>&nbsp;<%=kDenoteRequiredField%></td>
        <td>$<span runat='server' id='spnAmount' /></td>
    </tr>
    <tr>
        <td><b>Funding Type</b>&nbsp;<%=kDenoteRequiredField%></td>
        <td><span runat='server' id='spnFundSourceType' /></td>
    </tr>
    <tr>
        <td><b>Fund Start Date</b>&nbsp;<%=kDenoteRequiredField%></td>
        <td><span runat='server' id='spnStartDate' /></td>
    </tr>
    <tr>
		<td>&nbsp;</td>		
		<td class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
    <tr>
        <td><b>Fund End Date</b>&nbsp;<%=kDenoteRequiredField%></td>
        <td><span runat='server' id='spnEndDate' /></td>
    </tr>
    <tr>
		<td>&nbsp;</td>		
		<td class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
</table>

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<span runat='server' id='spnSaveAndClose'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Fund' DataObjectDefinitionKey='Fund' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='FundID' PropertyKey='FundID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>			    
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='FundName'>
					<Control ID='ctlName'
						Container='spnName'
						Type='cTextBox'
						Size='45'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Fund Name is required.'>
					</Control>
				</DisplayProperty> 
				<DisplayProperty PropertyKey='FundAccountNumber'>
					<Control ID='ctlNumber'
						Container='spnNumber'
						Type='cTextBox'
						Size='45'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='~~FundNumber~~ is required.'>
					</Control>
				</DisplayProperty>  
				<DisplayProperty PropertyKey='FundDescription'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='45'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Fund Description is required.'>
					</Control>
				</DisplayProperty>  
				<DisplayProperty PropertyKey='FundAmount'>
					<Control ID='ctlAmount'
						Container='spnAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0'
						Size='20'
						RequiredField='True'
						MaxInputDecimalPlaces='2'
						ErrorMessage='Fund Amount is required.'
						RegExErrorMessage='Fund Amount must contain only digits, commas, and hypens.'
						DecimalErrorMessage='Fund Amount must contain only digits, commas, and hypens.'
						CommaErrorMessage='Fund Amount must contain only digits, commas, and hypens.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundSourceTypeID'>
					<Control ID='ctlFundSourceType'
						Container='spnFundSourceType'
						Type='cDropDown'
						DataObjectDefinitionKey='FundSourceType'
						StoredValue='FundSourceTypeID'
						DisplayValue='Description'
						DisplayText='Select'
						RequiredField='True'
						ErrorMessage='Funding Type is required.'>
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='FundStartDate'>
					<Control ID='ctlStartDate'
						Type='cDateTextBox'
						Container='spnStartDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='True'
						ErrorMessage='Fund Start Date is required.'
						NotSupportedDateErrorMessage='Fund Start Date must be in MM/DD/YYYY format.'>
					</Control>
				</DisplayProperty>  
				<DisplayProperty PropertyKey='FundEndDate'>
					<Control ID='ctlEndDate'
						Type='cDateTextBox'
						Container='spnEndDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						RequiredField='True'
						ErrorMessage='Fund End Date is required.'
						NotSupportedDateErrorMessage='Fund End Date must be in MM/DD/YYYY format.'>
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
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Fund' DataObjectPropertyKey='FundID' PropertyKey='FundID' BaseValue='FundID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'
						EnterKey='True'>
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
		<UserCtlLoader>			
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='StaffUserType' DisplayName='Person &amp;apos;s  last name '>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name' />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='Person.LastNameFirstNamePrimInst' />
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

