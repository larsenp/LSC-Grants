<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td><b>Name</b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnName' runat='server'/></td>
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
		<span runat='server' id='spnCancel'/>	
		</td>
</tr>

</table>

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	<DataObject Key='WorkGroup' DataObjectDefinitionKey='WorkGroup' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='WorkGroupID'
					PropertyKey='WorkGroupID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='WorkGroupDescription'>
					<Control ID='ctlName'
						Type='cTextBox'
						Container='spnName'
						Size='25'
						MaxLength='255'
						RequiredField='True'
						ErrorMessage='Name is required.'>
					</Control>
				</DisplayProperty>																		
			</DisplayProperties>
		</DataObject>
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
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
<!-- End Embedded XML -->
</span>
