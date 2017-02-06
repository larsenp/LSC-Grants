<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" %>

<!-- USER MODIFIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<p>&nbsp;
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td	valign="top">View information related to:</td>
		<td>		
		</td>
	</tr>
	<tr>
		<td><span id='spnContactAction' runat='server'/><span runat='server' id='spnGo'></span></td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='ContactAction' DataObjectDefinitionKey=''>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='Page'
					PropertyKey='PageKey'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlContactAction'
						Container='spnContactAction'
						Type='cDropDown'
						ParamList='PersonContact|Contact~EasygrantsActivity|Easygrants Activity~Admin|Administration~Attachments|Attachments'
						Separator='~'
						SubSeparator='|'
						DisplayValue='ActionName'
						DisplayNone='False'>
						<SelectedValue>
							<Argument Type='QueryString' TypeKey='Page' PropertyKey='PageKey'/>
						</SelectedValue>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnGo' 
						Type='cButton' 
						Image='Go'
						Container='spnGo'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument Type='Control' TypeKey = 'ctlContactAction' ControlPropertyKey='SelectedValue' Value='' />
									<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' BaseValue='PersonID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>											
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>