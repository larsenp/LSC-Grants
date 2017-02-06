<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantAdd.ascx.vb" Inherits="Implementation.Modules.Staff.Controls.Page.Grants.cGrantAdd" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' id="CUserCtlLoader6" />
<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table width='100%' runat='server' cellpadding='2' cellspacing='0'>
	<tr><td>&nbsp;</td></tr>
	<tr class='SeparatorHdg'>
		<td >
			Add Grant
		</td>
	</tr>
</table>
<table width='100%' runat='server' cellpadding='2' cellspacing='0' >
	<tr >
		<td colspan='3' >&nbsp;</td>
	</tr>
	<tr>
		<td width='15%'><b><%=GetLabel("ProgramName")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'>&nbsp;</td>
		<td><span runat='server' id='spnProgram' /></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'><%=GetLabel("FundingOpportunity")%></span>&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td>&nbsp;</td>
		<td ><Core:cUserCtlLoader ID="CUserCtlLoader4" CtlID='ctlCmpt' Type='cDropDown'  runat='server' Properties='ValidationText=~~FundingOpportunity~~ is required.'/></td>
	</tr>
	<tr id='trProject' visible='false'>
		<td><b><span id='spnCycle' runat='server'><%=GetLabel("FundingCycleName")%></span>&nbsp;</b><%=kDenoteRequiredField%>
		</td>
		<td >&nbsp;</td>
		<td ><Core:cUserCtlLoader ID="CUserCtlLoader5" CtlID='ctlProject' Type='cDropDown' runat='server' Properties='ValidationText=~~FundingCycleName~~ is required.'/></td>
	</tr>
</table>
<table id="tblGrantInfo" width='100%' runat='server' cellpadding='2' cellspacing='0' >
    <tr>
    	<td width='15%'><b>Primary Staff</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='2%'>&nbsp;</td>	
		<td><Core:cUserCtlLoader CtlID='ctlPStaff' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' Properties='Origin=Person'
				runat='server' id="CUserCtlLoader3"  /></td>
	</tr>
    <tr>
    	<td ><b>Grantee <%=GetLabel("Organization")%></b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>&nbsp;</td>	
		<td><Core:cUserCtlLoader CtlID='ctlOrg' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' 
				runat='server' id="CUserCtlLoader2" /></td>
	</tr>
    <tr>
    	<td ><b>Primary Contact/PI</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>&nbsp;</td>	
		<td><Core:cUserCtlLoader CtlID='ctlPI' Src='Core/Controls/Base/PopUpSelectorLauncher2.ascx' Properties='Origin=Person'
				runat='server' id="CUserCtlLoader1" /></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("ProjectTitle")%> </b></td>
		<td>&nbsp;</td>
		<td><span id='spnTitle' runat='server'/></td>
	</tr>
	<tr>
		<td valign="top"><b><%=GetLabel("ProjectDescription")%></b></td>
		<td >&nbsp;</td>
		<td><span id='spnDescription' runat='server'/></td>
	</tr>
   <tr>
		<td><b><%=GetLabel("GrantProjectTerm")%></b> </td>
		<td>&nbsp;</td>
		<td>
			<table width='45%' runat='server' visible='true'>
				<tr>
					<td>
						<span runat='server' id='spnStart'/>
					</td>
					<td >&nbsp;</td>
					<td align='left'>
						<span runat='server' id='spnEnd'/>
					</td>
				</tr>
				<tr>
					<td>
						Start Date - mm/dd/yyyy
					</td>
					<td >&nbsp;</td>
					<td>
						End Date - mm/dd/yyyy
					</td>
				</tr>
			</table>
		</td>
	</tr>
 	<tr>
		<td><b><%=GetLabel("GrantRequestedAmount")%> </b>
		</td>
		<td  align='right'>$&nbsp;</td>
		<td><span id='spnRequestedAmount' runat='server'/></td>
		
	</tr>
	<tr>
		<td><b>Award Amount </b>
		</td>
		<td align='right'>$&nbsp;</td>
		<td><span id='spnAwardAmount' runat='server'/></td>
		
	</tr>
    <tr>
		<td><b>Award Date</b> </td>
		<td >&nbsp;</td>
		<td><span runat='server' id='spnAwardDate'/></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>mm/dd/yyyy</td>
	</tr>	
	<tr >
		<td><b>Status</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td >&nbsp;</td>
		<td><span runat='server' id='spnGrantsStatus' /></td>
	</tr>
	<tr >
		<td><b>Outcome</b></td>
		<td >&nbsp;</td>
		<td><span runat='server' id='spnGrantsOutcome' /></td>
	</tr>
	<tr >
		<td colspan='3' >&nbsp;</td>
	</tr>
</table>
<table width='100%' runat='server' visible='true'>
	<tr >
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSaveAndClose' />
			<span runat='server' id='spnClose' />
		</td>
	</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' Bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram' Container='spnProgram' Type='cDropDown' DataObjectDefinitionKey='Program'
						StoredValue='ProgramID' PostBack='True' DisplayValue='ProgramDisplayName' DisplayText='Select' RequiredField='True' ErrorMessage='~~ProgramName~~ is required.'>
						<Action PostBack='True' AutoSave='False' Object='DataPresenter' Method='GoClick'>
							<Parameters>
								<Argument Type='' TypeKey='' Value='Program' />
								<Argument Type='Control' TypeKey='ctlProgram' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='GrantTitle'>
					<Control ID='ctlTitle' Container='spnTitle'
						Type='cTextBox' Size='50' MaxLength='300'
						RequiredField='False'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextArea'
						Rows='3'
						Cols='50'
						MaxLength='1000'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,1000}$' ErrorMessage='Limit your ~~ProjectDescription~~ to 1000 characters or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantAwardDate'>
					<Control ID='ctlAwardDate' Type='cDateTextBox' Container='spnAwardDate' Size='10' MaxLength='10'
						Calendar='True' DateFormat='MM/dd/yyyy' RequiredField='False' NotSupportedDateErrorMessage='Award Date must be in MM/DD/YYYY format.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantsStatus' Type='cDropDown' Container='spnGrantsStatus' DataObjectDefinitionKey='GrantStatus'
						StoredValue='GrantStatusID' DisplayValue='Abbr' DisplayNone='False' DisplayText='Select'
						FilterKey='GrantStatus.GrantStatusID'  RequiredField='True' ErrorMessage='Status is required.'>
						<FilterList List='GrantList' Property='GrantStatusID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantsOutcome' Type='cDropDown' Container='spnGrantsOutcome' DataObjectDefinitionKey='GrantOutcome'
						StoredValue='GrantOutcomeID' DisplayValue='Description' DisplayNone='True'
						FilterKey='GrantOutcome.GrantOutcomeID'>
						<FilterList List='GrantList' Property='WfProjectOutcomeID' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PrimaryStaffID' PropertyValue='PrimaryStaffPerson.LastNameFirstName' ReadOnly='QueryID'>
					<Control ID='ctlPStaff' Type='cPopUpSelectorLauncher2' RequiredField='True' LabelText='Primary Staff'
						ErrorMessage='Primary Staff is required.' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='RequestAmount'>
					<Control ID='ctlRequestedAmount'
						Container='spnRequestedAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0'
						Size='20'
						RequiredField='False'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='The ~~GrantRequestedAmount~~ requires a valid currency format (Example: $100,000.00).'
						DecimalErrorMessage='~~GrantRequestedAmount~~ must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'
						>
					</Control>
				</DisplayProperty>	
				
		    </DisplayProperties>
		</DataObject>
		<DataObject Key='Person' DataObjectDefinitionKey='Person'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID' 
					PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PersonID' PropertyValue='LastNameFirstName' ReadOnly='QueryID'>
					    <Control ID='ctlPI' Type='cPopUpSelectorLauncher2' RequiredField='True' LabelText='Selected Contact'
						    ErrorMessage='Primary Contact/PI is required.' />
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='PersonPrimaryAffiliation.OrganizationID' PropertyValue='PersonPrimaryAffiliation.Organization.CommonOrganizationName' >
					    <Control ID='ctlOrg' Type='cPopUpSelectorLauncher2' RequiredField='True' LabelText='Selected ~~Organization~~'
						    ErrorMessage='Grantee ~~Organization~~ is required.' />
				 </DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' >
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlStart' Type='cDateTextBox' Container='spnStart' Size='10' MaxLength='10'
						Calendar='True' DateFormat='MM/dd/yyyy' RequiredField='False' NotSupportedDateErrorMessage='Grantee Project Term Start Date must be in MM/DD/YYYY format.'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEnd' Type='cDateTextBox' Container='spnEnd' Size='10' MaxLength='10'
						Calendar='True' DateFormat='MM/dd/yyyy' RequiredField='False' NotSupportedDateErrorMessage='Grantee Project Term End Date must be in MM/DD/YYYY format.'>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlAwardAmount'
						Container='spnAwardAmount'
						Type='cMoneyTextBox'
						MaxLength='14'
						Format='#,0'
						Size='20'
						RequiredField='False'
						MaxInputDecimalPlaces='2'
						RegExErrorMessage='The Award Amount requires a valid currency format (Example: $100,000.00).'
						DecimalErrorMessage='Award amount must be a number with up to 2 decimals.'
						CommaErrorMessage='Commas are improperly formatted.'
						>
					</Control>
				</DisplayProperty>	
																				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose' 
						Container='spnSaveAndClose' 
						Type='cButton' 
						EnterKey='True'
						Caption='Save and Continue'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='DataPresenter'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
								<Argument Type='' TypeKey='' AttributeName='' Value='True'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' Container='spnClose' Type='cButton' Caption='Close'>
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
			<ctlPI>
				<DataObject Key='PersonID' DataObjectDefinitionKey='PersonOrganization' DisplayName='Person &amp;apos;s  last name '>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name' />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='Person.LastNameFirstNameMiddleName' />
					</DisplayProperties>
				</DataObject>
			</ctlPI>
			<ctlOrg>
				<DataObject Key='OrganizationID' DataObjectDefinitionKey='Organization' >
					<SearchProperties>
						<SearchProperty DisplayValue='CommonOrganizationName'  />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='CommonOrganizationName' />
					</DisplayProperties>
				</DataObject>
             </ctlOrg>   
			<ctlPStaff>
				<DataObject Key='PersonID' DataObjectDefinitionKey='StaffUserType' DisplayName='Person &amp;apos;s  last name '>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name' />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='Person.LastNameFirstNameMiddleName' />
					</DisplayProperties>
				</DataObject>
			</ctlPStaff>
		</UserCtlLoader>	
	
		
	</ModuleSection>
</span>
