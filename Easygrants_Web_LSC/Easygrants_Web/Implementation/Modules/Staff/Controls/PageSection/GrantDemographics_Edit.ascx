<%@ Control Language="vb" AutoEventWireup="true"  Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->

<!-- Page Content - Controls -->
<br />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />
<br />

<table id="Table2" border='0' width='100%' cellspacing='2' cellpadding='2'  >
    <tr>
	    <td colspan="2" class="SeparatorHdg"><b>Grant Demographics</b></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
	<tr >
	    <td width='15%' ><b>Gender</b></td>
	    <td><span id='spnGender' runat='server'/></td>
    </tr>
    <tr>
		<td width='15%' ><b>Race/Ethnicity</b></td>
	    <td><span id='spnRace' runat='server'/></td>
    </tr>
	<tr >
	    <td width='15%' ><b>Income</b></td>
	    <td><span id='spnIncome' runat='server'/></td>
    </tr>
	<tr >
	    <td width='15%' ><b>Locale</b></td>
	    <td><span id='spnLocale' runat='server'/></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
	Src='EasyGrants/Controls/PageSection/History.ascx'
	Properties='DataObjectDefinitionKey=GranteeProject&QueryStringKey=GranteeProjectID&SecondQueryStringKey=None&IsPrimaryKey=True'
	runat='server' />

<table border='0' cellspacing='0' cellpadding='2' width='100%'  runat='server'>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align=center><span id='spnSave' runat='server'/><span id='spnSaveAndClose' runat='server'/><span id='spnClose' runat='server'/></td>
    </tr>
</table>


<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>				
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False' />				            
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjGenders'>
					<Control ID='ctlGender'
						Container='spnGender'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='Gender'
						DisplayValue='Abbr'
						StoredValue='GenderID'
						RepeatColumns='0'
						CellSpacing='7'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Gender' Bool='' />
				            <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
							<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
							<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True'/>
							<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False'/>
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjRace'>
					<Control ID='ctlRace'
						Container='spnRace'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='Race'
						DisplayValue='RaceAbbr'
						StoredValue='RaceID'
						RepeatColumns='0'
						CellSpacing='7'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Race' Bool='' />
				            <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
							<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
							<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True' />
							<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False' />				            
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjIncome'>
					<Control ID='ctlIncome'
						Container='spnIncome'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='IncomeType'
						DisplayValue='Abbr'
						StoredValue='IncomeTypeID'
						RepeatColumns='0'
						CellSpacing='7'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Income' Bool='' />
				            <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
							<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
							<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True' />
							<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False' />	            
						</DefaultValues>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GranteeProjLocale'>
					<Control ID='ctlLocale'
						Container='spnLocale'
						Type='cCheckBoxList'
						DataObjectDefinitionKey='LocaleType'
						DisplayValue='LocaleAbbr'
						StoredValue='LocaleTypeID'
						RepeatColumns='0'
						CellSpacing='7'>
						<DefaultValues>
							<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Locale' Bool='' />
				            <Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True' />
							<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False' />
							<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True' />
							<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False' />				            
						</DefaultValues>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action 
							PostBack='True' 
							AutoSave='True'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action PostBack='True' AutoSave='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantsDemographics'/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'  Type='cButton' Caption='Close' Container='spnClose'>
							<Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='GrantsDemographics'/>
									<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' AttributeName='' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
	</ModuleSection>
<!-- End Embedded XML -->
</span>

