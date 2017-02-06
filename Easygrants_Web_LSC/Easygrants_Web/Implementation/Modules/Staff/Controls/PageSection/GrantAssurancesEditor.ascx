<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td  class="SeparatorHdg"><b>Edit Grant Assurances</b></td>
	</tr>		
</table>
<br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td><b>Animal Use</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnAnimalUse' runat='server'/></td>
	</tr>
	
	<tr>
		<td><b>Assurance Status</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnAssuranceStatus' runat='server'/></td>
	</tr>
	
	<tr>
		<td><b>IACUC Expiration Date</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnIACUCExpirationDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	
	<tr>
		<td><b>Assurance Number</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnAssuranceNumber' runat='server'/></td>
	</tr>
	<tr>	    
	    <td colspan='4'><hr/></td>	   
	</tr>
	
    <tr>
		<td width='15%'><b>Human Use</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnHumanUse' runat='server'/></td>
	</tr>
	
	<tr>
		<td><b>Status</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnHumanStatus' runat='server'/></td>
	</tr>

	<tr>
		<td><b>IRB Expiration Date</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnIRBExpirationDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	
	<tr>
		<td><b>Assurance Number</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnHumanAssuranceNumber' runat='server'/></td>
	</tr>
	
	<tr>
		<td><b>Exemption Number</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnExemptionNumber' runat='server'/></td>
	</tr>
	<tr>	    
	    <td colspan='4'><hr/></td>	   
	</tr>
	
    <tr>
		<td><b>Biohazard Use</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnBiohazardUse' runat='server'/></td>
	</tr>
	
	<tr>
		<td><b>Biohazard Status</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnBiohazardStatus' runat='server'/></td>
	</tr>
	
	<tr>
		<td><b>Biohazard Expiration Date</b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2"><span id='spnBiohazardExpirationDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='10'>&nbsp;</td>
		<td class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr>	    
	    <td colspan='4'><hr/></td>	   
	</tr>	
	
</table>
<br/>

<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProjectAssurance&QueryStringKey=GranteeProjectID&SecondQueryStringKey=AssuranceTypeID&IsPrimaryKey=False'
runat='server' />

<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
				
<br/><br/>				
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
			
	<tr>
		<td>
			<!-- Save Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
			<span runat='server' id='spnSave'/>
			<!-- Reset Button Control(additional configuration information is specified in the 
					DisplayProperty node below) -->
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
		<DataObject Key='GranteeProjectAnimalAssurance' DataObjectDefinitionKey='GranteeProjectAssurance' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='' TypeKey='AssuranceTypeID' PropertyKey='AssuranceTypeID' Value='1'/>
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='AssuranceTypeID' PropertyKey='AssuranceTypeID' Value='1'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/> 
			</DefaultValues>
			<DisplayProperties>		
			   <DisplayProperty PropertyKey='IsUse'>
					<Control ID='ctlAnimalUse'
						Container='spnAnimalUse'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Animal Use is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AssuranceStatusID'>
					<Control ID='ctlAssuranceStatus'
						Container='spnAssuranceStatus'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						DataObjectDefinitionKey='GranteeAssuranceStatus'
						StoredValue='AssuranceStatusID'
						DisplayValue='Description' 		>				
					</Control>
				</DisplayProperty>															
				<DisplayProperty PropertyKey='ExpirationDate'>
					<Control ID='ctlIACUCExpirationDate'
						Type='cDateTextBox'
						Container='spnIACUCExpirationDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage='IACUC Expiration Date must be in format MM/DD/YYYY.'>						
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey='AssuranceNumber'>
					<Control ID='ctlAssuranceNumber'
						Container='spnAssuranceNumber'
						Type='cTextBox'
						Size='20'
						MaxLength='10'
						>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProjectHumanAssurance3' DataObjectDefinitionKey='GranteeProjectAssurance' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='' TypeKey='AssuranceTypeID' PropertyKey='AssuranceTypeID' Value='2'/>
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='AssuranceTypeID' PropertyKey='AssuranceTypeID' Value='2'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>		
			   <DisplayProperty PropertyKey='IsUse'>
					<Control ID='ctlHumanUse'
						Container='spnHumanUse'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Human Use is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AssuranceStatusID'>
					<Control ID='ctlHumanStatus'
						Container='spnHumanStatus'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						DataObjectDefinitionKey='GranteeAssuranceStatus'
						StoredValue='AssuranceStatusID'
						DisplayValue='Description' 		>				
					</Control>
				</DisplayProperty>															
				<DisplayProperty PropertyKey='ExpirationDate'>
					<Control ID='ctlIRBExpirationDate'
						Type='cDateTextBox'
						Container='spnIRBExpirationDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage='IRB Expiration Date must be in format MM/DD/YYYY.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AssuranceNumber'>
					<Control ID='ctlHumanAssuranceNumber'
						Container='spnHumanAssuranceNumber'
						Type='cTextBox'
						Size='20'
						MaxLength='10'
						>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='ExemptionNumber'>
					<Control ID='ctlExemptionNumber'
						Container='spnExemptionNumber'
						Type='cTextBox'
						Size='20'
						MaxLength='10'
						>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectHumanAssurance' DataObjectDefinitionKey='GranteeProjectAssurance' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='' TypeKey='AssuranceTypeID' PropertyKey='AssuranceTypeID' Value='3'/>
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='' TypeKey='AssuranceTypeID' PropertyKey='AssuranceTypeID' Value='3'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/> 
			</DefaultValues>
			<DisplayProperties>		
			   <DisplayProperty PropertyKey='IsUse'>
					<Control ID='ctlBiohazardUse'
						Container='spnBiohazardUse'
						Type='cRadioButtonList'
						LoadParam='True'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						RequiredField='True'
						ErrorMessage='Biohazard Use is required.'>
						<Parameters>
							<Parameter StoredValue='True' DisplayValue='Yes'/>
							<Parameter StoredValue='False' DisplayValue='No'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AssuranceStatusID'>
					<Control ID='ctlBiohazardStatus'
						Container='spnBiohazardStatus'
						Type='cRadioButtonList'
						RepeatDirection='Horizontal'
						RepeatColumns='0'
						DisplayNone='True'
						DataObjectDefinitionKey='GranteeAssuranceStatus'
						StoredValue='AssuranceStatusID'
						DisplayValue='Description' 		>				
					</Control>
				</DisplayProperty>															
				<DisplayProperty PropertyKey='ExpirationDate'>
					<Control ID='ctlBiohazardExpirationDate'
						Type='cDateTextBox'
						Container='spnBiohazardExpirationDate'
						Size='10'
						MaxLength='10'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						NotSupportedDateErrorMessage='Biohazard Expiration Date must be in format MM/DD/YYYY.'>
					</Control>
				</DisplayProperty>		
				
						
			</DisplayProperties>
		</DataObject>
		
		<!-- Save Reset and Cancel buttons -->
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
							AutoSave='True'>
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
