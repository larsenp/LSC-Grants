<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cWorkGroupEditor_List" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->

<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	
	<tr>
		<td><b>Workgroup Name</b>&nbsp;<%=kDenoteRequiredField%>&nbsp;
		<span id='spnName' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<b>Default Workgroup</b>&nbsp;
			<span id='spnIsPrimary' runat='server'/>
			<asp:CustomValidator 
				id='valDefaultWGRequired'
				runat='server'
				OnServerValidate='ValidateDefaultWGRequired'
				ErrorMessage='Default Workgroup is required.'
				Display='None'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnWorkGroupMember'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='WorkGroup' DataObjectDefinitionKey='WorkGroup' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WorkGroupID' PropertyKey='WorkGroupID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WorkGroupDescription'>
					<Control ID='ctlName'
						Type='cTextBox'
						Container='spnName'
						Size='50'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Workgroup Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsPrimary'>
					<Control ID='ctlIsPrimary'
						Container='spnIsPrimary'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='Primary'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WorkGroupMembers' DataObjectDefinitionKey='WorkGroup' Updatable='True' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WorkGroup' DataObjectPropertyKey='WorkGroupID' PropertyKey='WorkGroupID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WorkGroupMembers'>
					<Control ID='ctlWorkGroupMember'
						Container='spnWorkGroupMember'
						Type='cDoubleListBox'
						DataObjectDefinitionKey='Person'
						DisplayValue='LastNameFirstName'
						StoredValue='PersonID'
						StoredDisplayValue='Person.LastNameFirstName' 
						Height='9'
						Sort='True'
						DisplayNone='False'>
						<Filters>
							<Argument PropertyKey='UserTypeID' Value='1' Operator='GreaterThan'>
								<RelatedProperty PropertyKey='User'/>
							</Argument>
						</Filters>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='WorkGroup' DataObjectPropertyKey='WorkGroupID' PropertyKey='WorkGroupID' />
						</DefaultValues>
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
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='WorkGroup' DataObjectPropertyKey='WorkGroupID' PropertyKey='WorkGroupID' BaseValue='WorkGroupID='/>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkGroups'/>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkGroups'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
