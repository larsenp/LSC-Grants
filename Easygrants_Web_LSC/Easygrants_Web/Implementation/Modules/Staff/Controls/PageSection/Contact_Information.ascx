<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Information</b></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<!-- Control Label (for Name information) -->
	<tr>
		<td	valign="top" width="120"><b>Name</b></td>
		<td width="200">
			<span id='spnName' runat='server'/>
		</td>
		<td>
			<span id='spnEdit' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>E-mail&nbsp;&nbsp;</b></td>
		<td colspan=3>
			<span id='spnPersonPrimaryEmail' runat='server'/>
		</td>
	</tr>
	<tr>
		<td><b>Phone&nbsp;&nbsp;</b></td>
		<td colspan=3>
			<span id='spnPhone' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Primary <%=GetLabel("Organization")%>&nbsp;&nbsp;</b></td>
		<td colspan=3>
			<span id='spnOrg' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<!--	Key: index into cDataPresenter.mDataObjHash
				DataObjectDefinitionKey: index into DataDefinition.xml
		-->
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='PersonID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstName'>
					<Control ID='spnName'
						Container='spnName'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>													
				<DisplayProperty PropertyKey='PersonPrimaryEMail.ContactValue1'>
					<Control ID='spnPersonPrimaryEmail'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Phone.ContactValue1'>
					<Control ID='spnPhone'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit'
						Container='spnEdit'
							Type='cButton'
							Image='Edit'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='PersonEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
						</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject><!-- Key='Person' -->
		<DataObject Key='PersonOrganizationAffiliation' DataObjectDefinitionKey='PersonOrganizationAffiliation' Updatable='True'>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='Person' 
					DataObjectPropertyKey='PersonID'
					PropertyKey='PersonID' 
					Value='' 
					Bool=''/>
				<Argument Type='' 
					TypeKey='' 
					PropertyKey='TypeID' 
					Value='1' 
					Bool='And'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'>
							<Control ID='ctlOrg'
								Container='spnOrg'
								Type='cLink'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='OrganizationContact'/>
										<Argument Type='DataObjectCollection' TypeKey='PersonOrganizationAffiliation' DataObjectPropertyKey='PersonOrganizationAffiliationID' BaseValue='PersonOrganizationAffiliationID='/>
										<Argument Type='DataObjectCollection' TypeKey='PersonOrganizationAffiliation' DataObjectPropertyKey='OrganizationID' BaseValue='OrganizationID='/>
									</Parameters>
								</Action>
							</Control>
					
				</DisplayProperty>
			</DisplayProperties>	
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
