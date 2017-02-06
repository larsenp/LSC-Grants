<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
<tr>
		<td  class="SeparatorHdg" ><b>Grant Assurances</b></td>
	</tr>	
</table>
<br/>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	
	
    <tr>
		 <td	valign="top" width='15%'><b>Animal Use</b></td>
		 <td  colspan='3' ><span id='spnAnimalUse' runat='server'/></td>	
	 </tr>
	
	 <tr>
		 <td valign="top" width='15%'><b>Assurance Number</b></td>
		 <td width='22%'><span id='spnAssuranceNumber' runat='server'/></td>
		 <td valign="top" width='15%'><b>IACUC Expiration Date</b></td>
		 <td width='48%'><span id='spnIACUCExpirationDate' runat='server'/></td>	
	 </tr>
	
	 <tr>
		 <td valign="top" width='15%'><b>Assurance Status</b></td>
		 <td colspan='3' ><span id='spnAssuranceStatus' runat='server'/></td>	
	 </tr>
	<tr>	    
	    <td colspan='4'><hr/></td>	   
	</tr>
	
<tr><td colspan='4'>&nbsp;</td></tr>
    <tr>
		 <td	valign="top"><b>Human Use</b></td>
		 <td><span id='spnHumanUse' runat='server'/></td>	
		 <td	valign="top"><b>IRB Expiration Date</b></td>
		 <td><span id='spnIRBExpirationDate' runat='server'/></td>	
	 </tr>
	
	 <tr>
		 <td	valign="top" ><b>Assurance Number</b></td>
		 <td><span id='spnHumanAssuranceNumber' runat='server'/></td>
		 <td	valign="top"></b></td>
		 <td></td>
	 </tr>
	
	 <tr>
		 <td	valign="top"><b>Assurance Status</b></td>
		 <td><span id='spnHumanAssuranceStatus' runat='server'/></td>	
		 <td	valign="top"></b></td>
		 <td></td>
	 </tr>
	
	 <tr>
		 <td	valign="top"><b>Exemption Number</b></td>
		 <td ><span id='spnHumanExemptionNumber' runat='server'/></td>	
		 <td	valign="top"><b></b></td>
		 <td></td>
	 </tr>
	<tr>	    
	    <td colspan='4'><hr/></td>	   
	</tr>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr>
		 <td	valign="top" ><b>Biohazard Use</b></td>
		 <td ><span id='spnBiohazardUse' runat='server'/></td>	
		 <td	valign="top" ><b>Biohazard Expiration Date</b></td>
		 <td><span id='spnBiohazardExpirationDate' runat='server'/></td>	
	 </tr>
	
	<tr>
		 <td	valign="top" ><b>Biohazard Status</b></td>
		 <td colspan='3'><span id='spnBiohazardAssuranceStatus' runat='server'/></td>	
	 </tr>
	<tr><td colspan='4'><hr/></td></tr>
<tr><td colspan='4'>&nbsp;</td></tr>
    <tr>
		 <td valign="top"><b>Modified On</b></td>
		 <td ><span id='spnModifiedOn' runat='server'/></td>	
		 <td	valign="top"><b>Modified By</b></td>
		 <td ><span id='spnModifiedBy' runat='server'/></td>	
	 </tr>
	<tr><td colspan='4'>&nbsp;</td></tr>
	<tr>
		<td colspan='4'><span runat='server' id='spnEdit' visible='true'></span></td>
	</tr>
	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProjectAssuranceList' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='GranteeProjectAnimalAssurances.IsUse' Format='YesNo'>
					        <Control ID='spnAnimalUse' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GranteeProjectAnimalAssurances.AssuranceNumber' >
					        <Control ID='spnAssuranceNumber' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				  <DisplayProperty PropertyKey='GranteeProjectAnimalAssurances.ExpirationDate' Format='MM/dd/yyyy'>
					        <Control ID='spnIACUCExpirationDate' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GranteeProjectAnimalAssurances.GranteeAssuranceStatus.Description' >
					        <Control ID='spnAssuranceStatus' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GranteeProjectHumanAssurances.IsUse' Format='YesNo'>
					        <Control ID='spnHumanUse' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GranteeProjectHumanAssurances.AssuranceNumber' >
					        <Control ID='spnHumanAssuranceNumber' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GranteeProjectHumanAssurances.ExemptionNumber' >
					        <Control ID='spnHumanExemptionNumber' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				  <DisplayProperty PropertyKey='GranteeProjectHumanAssurances.ExpirationDate' Format='MM/dd/yyyy'>
					        <Control ID='spnIRBExpirationDate' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GranteeProjectHumanAssurances.GranteeAssuranceStatus.Description' >
					        <Control ID='spnHumanAssuranceStatus' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GranteeProjectBiohazardAssurances.IsUse' Format='YesNo'>
					        <Control ID='spnBiohazardUse' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>				
				  <DisplayProperty PropertyKey='GranteeProjectBiohazardAssurances.ExpirationDate' Format='MM/dd/yyyy'>
					        <Control ID='spnBiohazardExpirationDate' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				 <DisplayProperty PropertyKey='GranteeProjectBiohazardAssurances.GranteeAssuranceStatus.Description' >
					        <Control ID='spnBiohazardAssuranceStatus' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				  <DisplayProperty PropertyKey='GranteeProjectBiohazardAssurances.ModifyDate'  Format='MM/dd/yyyy'>
					        <Control ID='spnModifiedOn' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				  <DisplayProperty PropertyKey='GranteeProjectBiohazardAssurances.ModifiedByUser.Person.LastNameFirstName' >
					        <Control ID='spnModifiedBy' 
						        Type='HtmlGenericControl'>
					        </Control>
				 </DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEdit'
						Container='spnEdit'
						Type='cButton'
						Image='Edit'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantAssurancesEditor'/>															
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>																	
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>	
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
