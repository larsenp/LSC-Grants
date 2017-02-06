<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><h1>Form G-4: Client Age, Ethnicity and Gender</h1></td>
  </tr>
</table>
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
		<td><span runat='server' id='spnMen' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b>Women</b></td>
		<td><span runat='server' id='spnWomen' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b>Other</b></td>
		<td><span runat='server' id='spnOther' /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><b>Groups</b></td>
		<td><span runat='server' id='spnGroups' /></td>
	</tr>
</table>
<br />
<div width='100%' class='SeparatorHdg'>
	Summary by Age and Ethnicity
</div>
<br />
<table>
	<tr>
		<td width='30'>&nbsp;</td>
		<td width='200' class='MinorSeparatorHdg'>&nbsp;</td>
		<td width='80' class='MinorSeparatorHdg'>Under 18</td>
		<td width='80' class='MinorSeparatorHdg'>18 - 59</td>
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
			<span runat='server' id='spnWhite_18_59' />
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
			<span runat='server' id='spnBlack_18_59' />
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
			<span runat='server' id='spnHisp_18_59' />
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
			<span runat='server' id='spnNatAmr_18_59' />
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
			<span runat='server' id='spnAsian_18_59' />
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
			<span runat='server' id='spnOther_18_59' />
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
			<b><span runat='server' id='spnTotal_18_59' /></b>
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
					<Control ID='spnMen'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Women'>
					<Control ID='spnWomen'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other'>
					<Control ID='spnOther'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Groups'>
					<Control ID='spnGroups'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='White_0_17'>
					<Control ID='spnWhite_0_17'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='White_18_59'>
					<Control ID='spnWhite_18_59'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='White_60_ovr'>
					<Control ID='spnWhite_60_ovr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.WhiteTotal'>
					<Control ID='spnWhiteTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Black_0_17'>
					<Control ID='spnBlack_0_17'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Black_18_59'>
					<Control ID='spnBlack_18_59'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Black_60_ovr'>
					<Control ID='spnBlack_60_ovr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.BlackTotal'>
					<Control ID='spnBlackTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Hisp_0_17'>
					<Control ID='spnHisp_0_17'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Hisp_18_59'>
					<Control ID='spnHisp_18_59'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Hisp_60_ovr'>
					<Control ID='spnHisp_60_ovr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.HispTotal'>
					<Control ID='spnHispTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='NatAmr_0_17'>
					<Control ID='spnNatAmr_0_17'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NatAmr_18_59'>
					<Control ID='spnNatAmr_18_59'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='NatAmr_60_ovr'>
					<Control ID='spnNatAmr_60_ovr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.NatAmrTotal'>
					<Control ID='spnNatAmrTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Asian_0_17'>
					<Control ID='spnAsian_0_17'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Asian_18_59'>
					<Control ID='spnAsian_18_59'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Asian_60_ovr'>
					<Control ID='spnAsian_60_ovr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.AsianTotal'>
					<Control ID='spnAsianTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other_0_17'>
					<Control ID='spnOther_0_17'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other_18_59'>
					<Control ID='spnOther_18_59'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Other_60_ovr'>
					<Control ID='spnOther_60_ovr'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientRace.OtherTotal'>
					<Control ID='spnOtherTotal'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientAge.Total_0_17'>
					<Control ID='spnTotal_0_17'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscClientAge.Total_18_59'>
					<Control ID='spnTotal_18_59'
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
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>
</span>
