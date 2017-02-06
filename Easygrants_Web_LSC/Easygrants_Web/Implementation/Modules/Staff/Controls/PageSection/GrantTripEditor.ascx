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
		<td class="SeparatorHdg" colspan='2' ><b>Add or Edit Trip</b></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
		<td>Trip Reference&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnReference' runat='server'/></td>
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
		<td><span id='spnStartDate' runat='server'/>&nbsp;&nbsp;<span id='spnEndDate' runat='server'/></td>
    </tr>
    <tr>
        <td>Media Code</td>
		<td><span id='spnMediaCode' runat='server'/></td>
    </tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Itinerary (Site Visits)</b>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='80%'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>		
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnVisitsList'></span>	
		</td>
	</tr>
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=GranteeProjectTrip&QueryStringKey=GranteeProjectTripID&SecondQueryStringKey=None&IsPrimaryKey=True'
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
		<DataObject Key='GranteeProjectTrip' DataObjectDefinitionKey='GranteeProjectTrip' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectTripID' PropertyKey='GranteeProjectTripID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
			   <DisplayProperty PropertyKey='Reference'>
					<Control ID='ctlReference'
						Container='spnReference'
						Type='cTextBox'
						Size='100'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='Trip Reference is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TripTypeID'>
					<Control ID='ctlType'
						Container='spnType'
						Type='cDropDown'
						DataObjectDefinitionKey='TripType'
						StoredValue='TripTypeID'
						DisplayValue='Description'
						DisplayNone='False'
						DisplayText='Select'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='TripStatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='TripStatus'
						StoredValue='TripStatusID'
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
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						Size='30'
						MaxLength='10' 
						RequiredField='False'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='MediaCodeID'>
					<Control ID='ctlMediaCode'
						Container='spnMediaCode'
						Type='cDropDown'
						DataObjectDefinitionKey='MediaCode'
						StoredValue='MediaCodeID'
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
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectTrip' DataObjectPropertyKey='GranteeProjectTripID' PropertyKey='GranteeProjectTripID' BaseValue='GranteeProjectTripID='/>
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
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectTrip' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>		
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
								<Argument AttributeName='PageKey' Value='GrantsMedia'/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProjectSiteVisit' DataObjectDefinitionKey='GranteeProjectSiteVisit'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value=''/>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProjectTrip' 
					DataObjectPropertyKey='GranteeProjectTripID' PropertyKey='GranteeProjectTripID' Value=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='Location' />	
			</Sort>	
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='GrantTripSiteEditor'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='DataObjectCollection' TypeKey='GranteeProjectTrip' DataObjectPropertyKey='GranteeProjectTripID' BaseValue='GranteeProjectTripID='/>
									<Argument Type='' TypeKey='GranteeProjectSiteVisitID' AttributeName='GranteeProjectSiteVisitID' Value='GranteeProjectSiteVisitID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlVisitsList'
						Container='spnVisitsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='GranteeProjectSiteVisit'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Location' ColumnHeader='Location'/>
						<DisplayProperty PropertyKey='SiteVisitType.Description' ColumnHeader='Type'/>
						<DisplayProperty PropertyKey='SiteVisitStatus.Description' ColumnHeader='Status'/>
						<DisplayProperty PropertyKey='StartDate' ColumnHeader='Start Date' Format='MM/dd/yyyy'/>
						<DisplayProperty PropertyKey='Time' ColumnHeader='Time'/>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' Width='100'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='GrantTripSiteEditor'/>
										<Argument Type='DataObject' TypeKey='GranteeProjectSiteVisitID' AttributeName='GranteeProjectSiteVisitID' BaseValue='GranteeProjectSiteVisitID='/>
										<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataObjectCollection' TypeKey='GranteeProjectTrip' DataObjectPropertyKey='GranteeProjectTripID' BaseValue='GranteeProjectTripID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='false'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
									<Parameters>
										<Argument Type='DataObject' TypeKey='GranteeProjectSiteVisitID' AttributeName='GranteeProjectSiteVisitID'/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>			
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>