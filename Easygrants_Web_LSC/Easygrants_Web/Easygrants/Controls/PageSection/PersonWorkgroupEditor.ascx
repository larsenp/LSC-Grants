<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
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
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>	
	</td>
</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='True' CreateNew='True'>

			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''>					
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WorkGroupMembers'>
					<Control ID='ctlDataList'
						Container='spnWorkGroupMember'
						Type='cDoubleListBox'					
						DataObjectDefinitionKey='WorkGroup'
						DisplayValue='WorkGroupDescription'
						StoredValue='WorkGroupID'
						StoredDisplayValue='WorkGroup.WorkGroupDescription'
						Height='9'
						DisplayNone='False'>						
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
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
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
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
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
							</Parameters>						
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
