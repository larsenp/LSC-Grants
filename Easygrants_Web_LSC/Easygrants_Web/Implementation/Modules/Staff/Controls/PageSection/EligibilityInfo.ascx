<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Eligibility Information</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server' visible='true'>
<!-- Control Label (for Name information) -->
	<tr>
		<td	valign="top"><b>Are you a full-time tenure-track or equivalent faculty member?&nbsp;&nbsp;</b></td>
		<td width="440">
			<span id='spnIsTenure' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Is your primary appointment in a Biomedical Engineering Department (or other 
similarly-constituted, permanently-established biomedical/bio-engineering 
academic program)?&nbsp;&nbsp;</b></td>
		<td>
			<span id='spnIsBiomedical' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>In what year did you receive your doctoral degree?&nbsp;&nbsp;</b></td>
		<td>
			<span id='spnDegreeYear' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>What is your current academic rank?&nbsp;&nbsp;</b></td>
		<td>
			<span id='spnRankType' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Eligibility Request Date&nbsp;&nbsp;</b></td>
		<td>
			<span id='spnCreateDate' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Last Modified User</b></td>
		<td>
			<span id='spnModifyUser' runat='server'/>
		</td>	
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td	valign="top"><b>Last Modified Date</b></td>
		<td>
			<span id='spnModifyDate' runat='server'/>
		</td>
	</tr>
	
</table>
<table align='center'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<span id='spnEdit' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='PersonEligibility' DataObjectDefinitionKey='PersonEligibility'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID' 
					PropertyKey='PersonID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='IsTenure' Format='YesNo'>
					<Control ID='spnIsTenure'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsBiomedical' Format='YesNo'>
					<Control ID='spnIsBiomedical'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DegreeYear'>
					<Control ID='spnDegreeYear'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RankType.Description'>
					<Control ID='spnRankType'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='MM/dd/yyyy'>
					<Control ID='spnCreateDate'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName'>
					<Control ID='spnModifyUser'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='MM/dd/yyyy'>
					<Control ID='spnModifyDate'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													
				
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit' 
						Type='cButton' 
						Image='Edit'
						Container='spnEdit'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='EligibilityEditor'/>
									<Argument Type='QueryString' TypeKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
