<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<br/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table id="Table1" border='0' width='100%' cellspacing='2' cellpadding='2'  >
    <tr>
	    <td colspan="4" class="SeparatorHdg"><b>Grant Demographics</b></td>
    </tr>
</table>
<table border='0' cellspacing='3' cellpadding='3'  width='100%' id="Table6">
	<tr >
	    <td width='15%' ><b>Gender</b></td>
        <td><span id='spnGender' runat='server'/></td>
    </tr>
    <tr>
		<td	 width='15%' ><b>Race/Ethnicity</b></td>
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
    <tr><td colspan="2" >&nbsp;</td></tr>
    <tr><td colspan="2" ><span id='spnEdit' runat='server'/></td></tr>
    
</table>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
	Src='EasyGrants/Controls/PageSection/History.ascx'
	Properties='DataObjectDefinitionKey=GranteeProject&QueryStringKey=GranteeProjectID&SecondQueryStringKey=None&IsPrimaryKey=True'
	runat='server' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
                    <!--#####GENDER#####-->
                    <DataObject Key='GranteeDemographicsGender' DataObjectDefinitionKey='GranteeDemographics'>
                        <Filters>
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Gender' Bool='' />
				            <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool='AND'/>
                        </Filters>
                        <DisplayProperties>
                            <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
                                <Control ID='ctlDataListGender' Container='spnGender' Type='cDataListCtl'
                                    MaxPerPage='10' >
                                    <DisplayProperty PropertyKey='DemographicGender.Abbr' ColumnHeader=' ' Width='50%'></DisplayProperty>
                                </Control>
                            </DisplayProperty>
                           </DisplayProperties>
                    </DataObject>
 			       <!--#####RACE#####-->
                   <DataObject Key='GranteeDemographicsRace' DataObjectDefinitionKey='GranteeDemographics'>
                        <Filters>
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Race' Bool='' />
				            <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool='AND'/>
                        </Filters>
                        <DisplayProperties>
                            <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
                                <Control ID='ctlDataListRace' Container='spnRace' Type='cDataListCtl'
                                    MaxPerPage='10' >
                                    <DisplayProperty PropertyKey='DemographicRace.RaceAbbr' ColumnHeader=' ' Width='50%'></DisplayProperty>
                                </Control>
                            </DisplayProperty>
                           </DisplayProperties>
                    </DataObject>
			      <!--#####INCOME#####-->
                   <DataObject Key='GranteeDemographicsIncome' DataObjectDefinitionKey='GranteeDemographics'>
                        <Filters>
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Income' Bool='' />
				            <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool='AND'/>
                        </Filters>
                        <DisplayProperties>
                            <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
                                <Control ID='ctlDataListIncome' Container='spnIncome' Type='cDataListCtl'
                                    MaxPerPage='10' >
                                    <DisplayProperty PropertyKey='DemographicIncome.Abbr' ColumnHeader=' ' Width='50%'></DisplayProperty>
                                </Control>
                            </DisplayProperty>
                           </DisplayProperties>
                    </DataObject>
			      <!--#####LOCALE#####-->
                   <DataObject Key='GranteeDemographicsLocale' DataObjectDefinitionKey='GranteeDemographics'>
                        <Filters>
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Locale' Bool='' />
				            <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' Bool='AND'/>
                        </Filters>
                        <DisplayProperties>
                            <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
                                <Control ID='ctlDataListLocale' Container='spnLocale' Type='cDataListCtl'
                                    MaxPerPage='10' >
                                    <DisplayProperty PropertyKey='DemographicLocale.LocaleAbbr' ColumnHeader=' ' Width='50%'></DisplayProperty>
                                </Control>
                            </DisplayProperty>
                           </DisplayProperties>
                    </DataObject>
                    <!--#####HISOTRY#####-->
		            <DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo'>
			            <Filters>
				            <Argument Type='QueryString' TypeKey='GranteeProjectID' 
					            PropertyKey='GranteeProjectID' Value='' Bool=''/>
			            </Filters>
			            <DisplayProperties>
			            </DisplayProperties>
		            </DataObject>
		            <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			            <DisplayProperties>
				            <DisplayProperty PropertyKey=''>
					            <Control ID='btnEdit'  Type='cButton' Caption='Edit' Container='spnEdit'>
							            <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
								            <Parameters>
									            <Argument AttributeName='PageKey' Value='GrantDemographicsEditor'/>
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

