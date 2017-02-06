<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<Core:cUserCtlLoader CtlID='ctlGrantInfo'
	Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
	runat='server' />
<br /><br />
<table id="Table1" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Add or Edit Link</b></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td><b>Description </b><%=kDenoteRequiredField%></td>
		<td>&nbsp;</td>
		<td><span id='spnDescription' runat='server'/></td>
    </tr>
    <tr>
		<td>Link</td>
		<td>http://</td>
		<td><span id='spnLink' runat='server'/></td>
    </tr>
    <tr>
        <td>Campaign</td>
		<td>&nbsp;</td>
		<td><span id='spnCampaign' runat='server'/></td>
    </tr>
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProjectLink&QueryStringKey=GranteeProjectLinkID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table id="Table2" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr><td>&nbsp;</td></tr>		
<tr>
	<td>
		<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnSave'/>
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
		<DataObject Key='GranteeProjectLink' DataObjectDefinitionKey='GranteeProjectLink' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectLinkID' PropertyKey='GranteeProjectLinkID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Description'>
					<Control ID='ctlDescription'
						Container='spnDescription'
						Type='cTextBox'
						Size='100'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='Description is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Link'>
					<Control ID='ctlLink'
						Container='spnLink'
						Type='cTextBox'
						Size='50'
						MaxLength='150'
						RequiredField='False'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CampaignTypeID'>
					<Control ID='ctlCampaignType'
						Container='spnCampaign'
						Type='cDropDown'
						DataObjectDefinitionKey='CampaignType'
						StoredValue='CampaignTypeID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>	
			   </DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>		
			    <DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLink' DataObjectPropertyKey='GranteeProjectLinkID' PropertyKey='GranteeProjectLinkID' BaseValue='GranteeProjectLinkID='/>
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
								<Argument AttributeName='PageKey' Value='GrantsMedia'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectLink' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>		
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
<!-- End Embedded XML -->
</span>