<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.LOI.Controls.Page.cProjectDemographics" CodeBehind="ProjectDemographics.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<br>
<!-- USER MODIFIIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Instructions</b></td>
	</tr>	
</table>
<br>
      <span id='spnPageContent' runat='server' />
<br>
<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%' ID="Table2">
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Project Demographics</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table id="Table3" border='0' width='100%' cellspacing='2' cellpadding='2'  >
	<!--<tr>
		<td	valign="top" width='15%' ><b>Age Range of Study Participants</b> <font color="red">*</font></td>
		<td>
		    <table>
		        <tr>
		            <td width="100">
			            <span id='spnAgeBegin' runat='server'/>&nbsp;&nbsp;&nbsp;
				    </td>
				    <td width="100">
			            <span id='spnAgeEnd' runat='server'/>
				    </td>
			    </tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width='15%' >&nbsp;</td>
		<td>
		    <table>
		        <tr>
		            <td width="100">
            			Begin Age 
				    </td>
				    <td width="100">
			            End Age
				    </td>
			    </tr>
			</table>
		</td>
	</tr>-->
    <tr>
	    <td colspan="3" ><i>Check all that apply.</i></td>
    </tr>
    <tr><td colspan="3" >&nbsp;</td></tr>
	<tr >
	    <td width='15%' ><b>Gender</b> <font color="red">*</font></td>
	    <td><span id='spnGender' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valGender'
				Display='None'
				OnServerValidate='ValidateGender'
				ErrorMessage='At least one selection for Gender is required.'/>		    
		</td>
    </tr>
    <tr>
		<td width='15%' ><b>Race/Ethnicity</b> <font color="red">*</font></td>
	    <td><span id='spnRace' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valRace'
				Display='None'
				OnServerValidate='ValidateRace'
				ErrorMessage='At least one selection for Race/Ethnicity is required.'/>	
	    </td>
    </tr>
	<tr >
	    <td width='15%' ><b>Income</b> <font color="red">*</font></td>
	    <td colspan="2">  <span id='spnIncome' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valIncome'
				Display='None'
				OnServerValidate='ValidateIncome'
				ErrorMessage='At least one selection for Income is required.'/>	
	    </td>
    </tr>
	<tr >
	    <td width='15%' ><b>Locale</b> <font color="red">*</font></td>
	    <td><span id='spnLocale' runat='server'/>
			<asp:CustomValidator
				runat='server'
				id='valLocale'
				Display='None'
				OnServerValidate='ValidateLocale'
				ErrorMessage='At least one selection for Locale is required.'/>	
	    </td>
    </tr>
    <tr><td colspan="3" >&nbsp;</td></tr>
</table>
<center>
<table>	
	<tr>
		<td>
		<!--Save Button Control(additional configuration information is specified in the 
		DisplayProperty node below) -->
		<span runat='server' id='spnSave_and_Continue'/>
		</td>
	</tr>
</table>
</center>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
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
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Gender' Bool='' />
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
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Race' Bool='' />
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
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Income' Bool='' />
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
							<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
				            <Argument Type='' TypeKey='' PropertyKey='DemographicType' Value='Locale' Bool='' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectInfo' DataObjectDefinitionKey='GranteeProjectInfo' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<!--<DisplayProperty PropertyKey='AgeBegin'>
					<Control ID='ctlAgeBegin'
						Container='spnAgeBegin'
						Type='cTextBox'
						Size='3'
						MaxLength='3'>
						<Validation Type='RegularExpression' ValidationExpression='^\d{0,}$' ErrorMessage='Begin Age for Age Range of Study Participants must be a number.' />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='AgeEnd'>
					<Control ID='ctlAgeEnd'
						Container='spnAgeEnd'
						Type='cTextBox'
						Size='3'
						MaxLength='3'>
						<Validation Type='RegularExpression' ValidationExpression='^\d{0,}$' ErrorMessage='Begin Age for Age Range of Study Participants must be a number.' />
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='NotApplicableAge'>
					<Control ID='ctlNotApplicableAge'
						Container='spnNotApplicableAge'
						Type='cCheckBox'
						StoredValue='1'
						DisplayValue='NotApplicableAge'>
					</Control>	
				</DisplayProperty>	-->			
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Save and Continue'
						GoToNextPage='True'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
