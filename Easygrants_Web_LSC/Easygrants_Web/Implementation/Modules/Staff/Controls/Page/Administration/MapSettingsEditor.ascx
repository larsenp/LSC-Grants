<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br/>
<!-- Page Content - Top Of Page -->


<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    
    <tr>
		<td class="SeparatorHdg" colspan='2' ><b>Add or Edit Map Settings</b></td>
	</tr>
	<tr>
	    <td colspan='2'>&nbsp;</td>
	</tr>    
    <tr >
	    <td nowrap='true'><b>Easygrants Site Name</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnEasygrantsSiteName' /></td>
    </tr>
    <tr>
	    <td><b>Easygrants Site Url</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnEasygrantsSiteUrl' /></td>
    </tr>
    <tr>
	    <td><b>Map Site Url</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnMapSiteUrl' /></td>
    </tr>
    <tr>
	    <td><b>Map Key</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnMapKey' /></td>
    </tr>
    <tr>
	    <td><b>Map Width</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnMapWidth' /></td>
    </tr>
    <tr>
	    <td><b>Map Height</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnMapHeight' /></td>
    </tr>
    <tr>
	    <td><b>Map Zoom</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnMapZoom' /></td>
    </tr>
    <tr>
	    <td><b>Marker Color</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span runat='server' id='spnMarkerColor' /></td>
    </tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='MapSettings' DataObjectDefinitionKey='MapSettings' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='MapSettingsID' PropertyKey='MapSettingsID' Value=''/>
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='EasygrantsSiteName'>
					<Control ID='ctlEasygrantsSiteName'
						Container='spnEasygrantsSiteName'
						Type='cTextBox'
						Size='100'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Easygrants Site Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EasygrantsSiteUrl'>
					<Control ID='ctlEasygrantsSiteUrl'
						Container='spnEasygrantsSiteUrl'
						Type='cTextBox'
						Size='100'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Easygrants Site Url is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MapSiteUrl'>
					<Control ID='ctlMapSiteUrl'
						Container='spnMapSiteUrl'
						Type='cTextBox'
						Size='100'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Map Site Url is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MapKey'>
					<Control ID='ctlMapKey'
						Container='spnMapKey'
						Type='cTextBox'
						Size='100'
						MaxLength='200'
						RequiredField='True'
						ErrorMessage='Map Key is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MapWidth'>
					<Control ID='ctlMapWidth'
						Container='spnMapWidth'
						Type='cTextBox'
						Size='3'
						MaxLength='3'
						RequiredField='True'
						ErrorMessage='Map Width is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MapHeight'>
					<Control ID='ctlMapHeight'
						Container='spnMapHeight'
						Type='cTextBox'
						Size='3'
						MaxLength='3'
						RequiredField='True'
						ErrorMessage='Map Height is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MapZoom'>
					<Control ID='ctlMapZoom'
						Container='spnMapZoom'
						Type='cTextBox'
						Size='3'
						MaxLength='2'
						RequiredField='True'
						ErrorMessage='Map Zoom is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MarkerColor'>
					<Control ID='ctlMarkerColor'
						Container='spnMarkerColor'
						Type='cDropDown'
						ParamList='red|red,blue|blue,green|green'
						Separator=','
						SubSeparator='|'
						DisplayNone='False'
						RequiredField='True'
						ErrorMessage='Marker Color is required.'>
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
								<Argument Type='DataObjectCollection' TypeKey='MapSettings' DataObjectPropertyKey='MapSettingsID' PropertyKey='MapSettingsID' BaseValue='FundID='/>
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
		<UserCtlLoader>			
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='StaffUserType' DisplayName='Person &amp;apos;s  last name '>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name' />
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='Person.LastNameFirstNamePrimInst' />
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>
	</ModuleSection>
<!-- End Embedded XML -->
</span>

