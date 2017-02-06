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
		<td class="SeparatorHdg" colspan='2' ><b>Add or Edit Site Visit</b></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td>Location&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnLocation' runat='server'/></td>
    </tr>
    <tr>
		<td>Type</td>
		<td><span id='spnType' runat='server'/></td>
    </tr>
    <tr>
        <td>Status</td>
		<td><span id='spnStatus' runat='server'/></td>
    </tr>
    <tr>
        <td>Dates</td>
		<td><span id='spnStartDate' runat='server'/></td>
    </tr>
    <tr>
        <td>Start Time</td>
		<td><span id='spnStartTimeHr' runat='server'/>&nbsp;&nbsp;<span id='spnStartTimeMin' runat='server'/></td>
    </tr>
    <tr>
        <td>End Time</td>
		<td><span id='spnEndTimeHr' runat='server'/>&nbsp;&nbsp;<span id='spnEndTimeMin' runat='server'/></td>
    </tr>
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProjectSiteVisit&QueryStringKey=GranteeProjectTripID&SecondQueryStringKey=None&IsPrimaryKey=True'
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
		<DataObject Key='GranteeProjectSiteVisit' DataObjectDefinitionKey='GranteeProjectSiteVisit' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectSiteVisitID' PropertyKey='GranteeProjectSiteVisitID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			    <Argument Type='QueryString' TypeKey='GranteeProjectTripID' PropertyKey='GranteeProjectTripID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Location'>
					<Control ID='ctlLocation'
						Container='spnLocation'
						Type='cTextBox'
						Size='100'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='Trip Reference is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SiteVisitTypeID'>
					<Control ID='ctlType'
						Container='spnType'
						Type='cDropDown'
						DataObjectDefinitionKey='SiteVisitType'
						StoredValue='SiteVisitTypeID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='SiteVisitStatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='SiteVisitStatus'
						StoredValue='SiteVisitStatusID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartDate'>
					<Control ID='ctlStartDate'
						Container='spnStartDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='False'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartTimeHr'>
					<Control ID='ctlStartTimeHr'
						Container='spnStartTimeHr'
						Type='cDropDown'
						ParamList='01|01,02|02,03|03,04|04,05|05,06|06,07|07,08|08,09|09,10|10,11|11,12|12,13|13,14|14,15|15,16|16,17|17,18|18,19|19,20|20,21|21,22|22,23|23,24|24'
						Separator=','
						SubSeparator='|'
						DisplayNone='False'
						DisplayText='Select'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StartTimeMin'>
					<Control ID='ctlStartTimeMin'
						Container='spnStartTimeMin'
						Type='cDropDown'
						ParamList='00|00,15|15,30|30,45|45'
						Separator=','
						SubSeparator='|'
						DisplayNone='False'
						DisplayText='Select'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndTimeHr'>
					<Control ID='ctlEndTimeHr'
						Container='spnEndTimeHr'
						Type='cDropDown'
						ParamList='01|01,02|02,03|03,04|04,05|05,06|06,07|07,08|08,09|09,10|10,11|11,12|12,13|13,14|14,15|15,16|16,17|17,18|18,19|19,20|20,21|21,22|22,23|23,24|24'
						Separator=','
						SubSeparator='|'
						DisplayNone='False'
						DisplayText='Select'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='EndTimeMin'>
					<Control ID='ctlEndTimeMin'
						Container='spnEndTimeMin'
						Type='cDropDown'
						ParamList='00|00,15|15,30|30,45|45'
						SubSeparator='|'
						Separator=','
						DisplayNone='False'
						DisplayText='Select'>
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
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectSiteVisit' DataObjectPropertyKey='GranteeProjectSiteVisitID' PropertyKey='GranteeProjectSiteVisitID' BaseValue='GranteeProjectSiteVisitID='/>
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
								<Argument AttributeName='PageKey' Value='GrantTripEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectSiteVisit' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>	
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectSiteVisit' DataObjectPropertyKey='GranteeProjectTripID' BaseValue='GranteeProjectTripID='/>	
								<Argument Type='QueryString' TypeKey='ReturnURL' BaseValue='ReturnURL='/>	
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
								<Argument AttributeName='PageKey' Value='GrantTripEditor'/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>	
								<Argument Type='QueryString' TypeKey='GranteeProjectTripID' DataObjectPropertyKey='GranteeProjectTripID' BaseValue='GranteeProjectTripID='/>	
								<Argument Type='QueryString' TypeKey='ReturnURL' BaseValue='ReturnURL='/>	
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>			
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>