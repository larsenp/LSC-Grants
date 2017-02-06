<%@ Control Language="vb" AutoEventWireup="true" Codebehind="WorkGroupTask_Editor.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cWorkGroupTask_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b><font color='red'>*</font></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnProject' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnSubmitProject' runat='server'/></td>
	</tr>
	<tr id='trTask' visible='false'>
		<td><b><span id='spnTask' runat='server'>Task</span></b><font color='red'>*</font></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlTask' Type='cDropDown' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='btnTask' Type='cButton' Properties='Caption=Go&CausesValidation=False' runat='server' /></td>
	</tr>
	<tr>
		<td><b>Description</b><font color='red'>*</font>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnDescription' runat='server'/></td>
	</tr>
	
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel' visible='true'/>	
		</td>
</tr>

</table>

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	<DataObject Key='WorkGroupTaskList' DataObjectDefinitionKey='WorkGroupTaskList' Updatable='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WorkGroupTaskListID'
					PropertyKey='WorkGroupTaskListID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WorkGroupID' PropertyKey='WorkGroupID' Value=''/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Type='cTextBox'
						Container='spnDescription'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Description is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProject'
						Container='spnProject'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProject'
						StoredValue='WfProjectID'
						DisplayValue='WfProjectName'
						RequiredField='True'
						ErrorMessage='~~FundingCycleName~~ is required.'>
					</Control>	
				</DisplayProperty>																		
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSubmitProject'
						Container='spnSubmitProject'
						Type='cButton'
						visible='false' 
						Image='Go'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='GoClick'>
							<Parameters>
								<Argument Type='' TypeKey = '' Value='Project' />
								<Argument Type='Control' TypeKey = 'ctlProject' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
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
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='WorkGroupsEditor'/>
								<Argument Type='QueryString' TypeKey='WorkGroupID' BaseValue='WorkGroupID='/>
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
								<Argument AttributeName='PageKey' Value='WorkGroupsEditor'/>
								<Argument Type='QueryString' TypeKey='WorkGroupID' BaseValue='WorkGroupID='/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
