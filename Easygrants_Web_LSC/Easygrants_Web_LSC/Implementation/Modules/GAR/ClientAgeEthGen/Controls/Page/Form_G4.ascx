<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr' visible='true'
	              AutoVDateType='Last' Key='Form_G4' runat='server'/></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-4: Client Age, Ethnicity, Gender and Veteran Status</h1></td>
  </tr>
  <tr>
    <td class="SeparatorHdg">Instructions</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlFormG4' 
	Src='Implementation/Modules/GAR/ClientAgeEthGen/Controls/Page/FormG4_Instruct.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormG4F' 
	Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	runat='server' />
<br />
<Core:cUserCtlLoader CtlID='ctlGranteeInfo' 
	Src='Implementation/Modules/GAR/Controls/PageSection/GranteeInfo.ascx'
	runat='server'/>
<br />
<div width='100%' class='SeparatorHdg'>
	Summary by Gender
</div>
<table width='100%'>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='100'><b>Men</b></td>
		<td><span runat='server' id='spnMen' /><Font color='Red'>*</Font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b>Women</b></td>
		<td><span runat='server' id='spnWomen' /><Font color='Red'>*</Font></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b>Other</b></td>
		<td><span runat='server' id='spnOther' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b>Groups</b></td>
		<td><span runat='server' id='spnGroups' /><Font color='Red'>*</Font></td>
	</tr>
</table>

<div width='100%' class='SeparatorHdg'>
	Summary by Age and Ethnicity
</div>
<br />
<table>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='200' class='MinorSeparatorHdg'>&nbsp;</td>
		<td width='80' class='MinorSeparatorHdg'>Under 18</td>
		<td width='80' class='MinorSeparatorHdg'>18 - 35</td>
		<td width='80' class='MinorSeparatorHdg'>36 - 59</td>
		<td width='80' class='MinorSeparatorHdg'>60 and Over</td>
		<td width='80' class='MinorSeparatorHdg'>Total</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			White - Not Hispanic Origin
		</td>
		<td>
			<span runat='server' id='spnWhite_0_17' />
		</td>
		<td>
			<span runat='server' id='spnWhite_18_35' />
		</td>
		<td>
			<span runat='server' id='spnWhite_36_59' />
		</td>
		<td>
			<span runat='server' id='spnWhite_60_ovr' />
		</td>
		<td>
			<span runat='server' id='spnWhiteTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Black - Not Hispanic Origin
		</td>
		<td>
			<span runat='server' id='spnBlack_0_17' />
		</td>
		<td>
			<span runat='server' id='spnBlack_18_35' />
		</td>
		<td>
			<span runat='server' id='spnBlack_36_59' />
		</td>
		<td>
			<span runat='server' id='spnBlack_60_ovr' />
		</td>
		<td>
			<span runat='server' id='spnBlackTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Hispanic Origin
		</td>
		<td>
			<span runat='server' id='spnHisp_0_17' />
		</td>
		<td>
			<span runat='server' id='spnHisp_18_35' />
		</td>
		<td>
			<span runat='server' id='spnHisp_36_59' />
		</td>
		<td>
			<span runat='server' id='spnHisp_60_ovr' />
		</td>
		<td>
			<span runat='server' id='spnHispTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Native American
		</td>
		<td>
			<span runat='server' id='spnNatAmr_0_17' />
		</td>
		<td>
			<span runat='server' id='spnNatAmr_18_35' />
		</td>
		<td>
			<span runat='server' id='spnNatAmr_36_59' />
		</td>
		<td>
			<span runat='server' id='spnNatAmr_60_ovr' />
		</td>
		<td>
			<span runat='server' id='spnNatAmrTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Asian
		</td>
		<td>
			<span runat='server' id='spnAsian_0_17' />
		</td>
		<td>
			<span runat='server' id='spnAsian_18_35' />
		</td>
		<td>
			<span runat='server' id='spnAsian_36_59' />
		</td>
		<td>
			<span runat='server' id='spnAsian_60_ovr' />
		</td>
		<td>
			<span runat='server' id='spnAsianTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Other Ethnic Group
		</td>
		<td>
			<span runat='server' id='spnOther_0_17' />
		</td>
		<td>
			<span runat='server' id='spnOther_18_35' />
		</td>
		<td>
			<span runat='server' id='spnOther_36_59' />
		</td>
		<td>
			<span runat='server' id='spnOther_60_ovr' />
		</td>
		<td>
			<span runat='server' id='spnOtherTotal' />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			Total
		</td>
		<td>
			<b><span runat='server' id='spnTotal_0_17' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnTotal_18_35' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnTotal_36_59' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnTotal_60_ovr' /></b>
		</td>
		<td>
			<b><span runat='server' id='spnTotalTotal' /></b>
		</td>
	</tr>
</table>
<br />
<div width='100%' class='SeparatorHdg'>
	Summary by Veteran Status
</div>
<br />
<table style="width:400px">
	<tr>
		<td width='30'>&nbsp;</td>
		<td>
			<b>Veteran</b> (Either Client or Household Member has served in the military, including the Reserves or National Guard)<Font color='Red'>*</Font>
		</td>
		<td>
			<span runat='server' id='spnVeteran'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<b>Non-Veteran</b> (Neither Client nor Household Member has served in the military, including the Reserves or National Guard)<Font color='Red'>*</Font>
		</td>
		<td>
			<span runat='server' id='spnNonVeteran'/>
		</td>
	</tr>
</table>	
<br />
<div width='100%' class='SeparatorHdg'>
	Summary by Client Language
</div>
<br />
<span runat='server' id='spnAdd'/>
<br /><br />
<div runat='server' id='spnClientLanguages' style="width:400px"/>
<br />
<table width='100%'>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave'/>&nbsp;&nbsp; 
			<span runat='server' id='spnContinue'/>
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscClientRaceGen' DataObjectDefinitionKey='LscClientRaceGen' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Men'>
					<Control ID='txtMen'
						Type='cTextBox'
						Container='spnMen'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of men must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Women'>
					<Control ID='txtWomen'
						Type='cTextBox'
						Container='spnWomen'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of women must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='txtOther'
						Type='cTextBox'
						Container='spnOther'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Other gender must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Groups'>
					<Control ID='txtGroups'
						Type='cTextBox'
						Container='spnGroups'
						MaxLength='3'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='250'
							ErrorMessage='The total number of groups must be a whole number zero or greater and less than 250.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='White_0_17'>
					<Control ID='txtWhite_0_17'
						Type='cTextBox'
						Container='spnWhite_0_17'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of White clients age 0-17 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='White_18_35'>
					<Control ID='txtWhite_18_35'
						Type='cTextBox'
						Container='spnWhite_18_35'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of White clients age 18-35 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='White_36_59'>
					<Control ID='txtWhite_36_59'
						Type='cTextBox'
						Container='spnWhite_36_59'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of White clients age 136-59 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='White_60_ovr'>
					<Control ID='txtWhite_60_ovr'
						Type='cTextBox'
						Container='spnWhite_60_ovr'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of White clients age 60 or over must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.WhiteTotal'>
					<Control ID='spnWhiteTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Black_0_17'>
					<Control ID='txtBlack_0_17'
						Type='cTextBox'
						Container='spnBlack_0_17'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Black clients age 0-17 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Black_18_35'>
					<Control ID='txtBlack_18_35'
						Type='cTextBox'
						Container='spnBlack_18_35'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Black clients age 18-35 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Black_36_59'>
					<Control ID='txtBlack_36_59'
						Type='cTextBox'
						Container='spnBlack_36_59'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Black clients age 36-59 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Black_60_ovr'>
					<Control ID='txtBlack_60_ovr'
						Type='cTextBox'
						Container='spnBlack_60_ovr'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Black clients age 60 or over must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.BlackTotal'>
					<Control ID='spnBlackTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Hisp_0_17'>
					<Control ID='txtHisp_0_17'
						Type='cTextBox'
						Container='spnHisp_0_17'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Hispanic clients age 0-17 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Hisp_18_35'>
					<Control ID='txtHisp_18_35'
						Type='cTextBox'
						Container='spnHisp_18_35'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Hispanic clients age 18-35 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Hisp_36_59'>
					<Control ID='txtHisp_36_59'
						Type='cTextBox'
						Container='spnHisp_36_59'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Hispanic clients age 36-59 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Hisp_60_ovr'>
					<Control ID='txtHisp_60_ovr'
						Type='cTextBox'
						Container='spnHisp_60_ovr'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Hispanic clients age 60 or over must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.HispTotal'>
					<Control ID='spnHispTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='NatAmr_0_17'>
					<Control ID='txtNatAmr_0_17'
						Type='cTextBox'
						Container='spnNatAmr_0_17'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Native American clients age 0-17 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NatAmr_18_35'>
					<Control ID='txtNatAmr_18_35'
						Type='cTextBox'
						Container='spnNatAmr_18_35'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Native American clients age 18-35 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NatAmr_36_59'>
					<Control ID='txtNatAmr_36_59'
						Type='cTextBox'
						Container='spnNatAmr_36_59'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Native American clients age 36-59 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NatAmr_60_ovr'>
					<Control ID='txtNatAmr_60_ovr'
						Type='cTextBox'
						Container='spnNatAmr_60_ovr'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Native American clients age 60 or over must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.NatAmrTotal'>
					<Control ID='spnNatAmrTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Asian_0_17'>
					<Control ID='txtAsian_0_17'
						Type='cTextBox'
						Container='spnAsian_0_17'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Asian clients age 0-17 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Asian_18_35'>
					<Control ID='txtAsian_18_35'
						Type='cTextBox'
						Container='spnAsian_18_35'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Asian clients age 18-35 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Asian_36_59'>
					<Control ID='txtAsian_36_59'
						Type='cTextBox'
						Container='spnAsian_36_59'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Asian clients age 36-59 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Asian_60_ovr'>
					<Control ID='txtAsian_60_ovr'
						Type='cTextBox'
						Container='spnAsian_60_ovr'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of Asian clients age 60 or over must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.AsianTotal'>
					<Control ID='spnAsianTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other_0_17'>
					<Control ID='txtOther_0_17'
						Type='cTextBox'
						Container='spnOther_0_17'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of clients of Other ethnicity age 0-17 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other_18_35'>
					<Control ID='txtOther_18_35'
						Type='cTextBox'
						Container='spnOther_18_35'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of clients of Other ethnicity age 18-35 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other_36_59'>
					<Control ID='txtOther_36_59'
						Type='cTextBox'
						Container='spnOther_36_59'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of clients of Other ethnicity age 36-59 must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other_60_ovr'>
					<Control ID='txtOther_60_ovr'
						Type='cTextBox'
						Container='spnOther_60_ovr'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of clients of Other ethnicity age 60 or over must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.OtherTotal'>
					<Control ID='spnOtherTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientAge.Total_0_17'>
					<Control ID='spnTotal_0_17'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientAge.Total_18_35'>
					<Control ID='spnTotal_18_35'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientAge.Total_36_59'>
					<Control ID='spnTotal_36_59'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientAge.Total_60_ovr'>
					<Control ID='spnTotal_60_ovr'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.GrandTotal'>
					<Control ID='spnTotalTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Veteran'>
					<Control ID='txtVeteran'
						Type='cTextBox'
						Container='spnVeteran'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of veterans must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NonVeteran'>
					<Control ID='txtNonVeteran'
						Type='cTextBox'
						Container='spnNonVeteran'
						MaxLength='5'
						Size='5'>
						<Validation Type='Range'
							DataType='Integer'
							MinimumValue='0'
							MaximumValue='99999'
							ErrorMessage='The total number of non-veterans must be a whole number zero or greater.'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
		<DataObject Key='LscClientLanguage' DataObjectDefinitionKey='LscClientLanguage' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataPresenter' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'>
					<RelatedProperty PropertyKey='LscLangCode'/>
				</Argument>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ClientLanguageEditor'/>
								<Argument Value='LscClientLanguageID=0'/>
                                <Argument Type='QueryString' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlClientLanguages'
						Type='cDataListCtl'
						Container='spnClientLanguages'>
						<DisplayProperty PropertyKey='LscLangCode.Description' ColumnHeader='Language'/>
						<DisplayProperty PropertyKey='Count' />
						<DisplayProperty PropertyKey=''>
							<Control Type='cButton'
								Caption='Edit'>
								<Action PostBack='True'
									AutoSave='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument Value='ClientLanguageEditor'/>
										<Argument Type='DataObject' TypeKey='LscClientLanguageID' AttributeName='LscClientLanguageID' BaseValue='LscClientLanguageID='/>
                                        <Argument Type='QueryString' TypeKey='WfTaskAssignmentID' BaseValue='WfTaskAssignmentID=' />
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='User' DataObjectDefinitionKey='User' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='UserID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save and Calculate'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Save='True'
						GoToNextPage='True'>
					    <Visible>
						      <Argument PropertyKey='UserTypeID' Value='1' />
					    </Visible>
                     </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
