<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cProjectKeywordsRenewal" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="ProjectKeywordsRenewal.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' visible='false'/>

<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>General Research Area and Keywords</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4">Please select one term from the following list that best describes the general area of your proposed research:</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Area</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td><span id='spnArea' runat='server'/></td>
	</tr>
	<tr>
		<td>Other</td>
		<td><span id='spnAreaOther' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4">Please provide a minimum of 4 and a maximum of 10 keywords that describe your proposed research:</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='right'><%=kDenoteRequiredField%>&nbsp;</td>
		<td align='left'><span id='spnKeyword1' runat='server'/></td>
		<td align='right'><%=kDenoteRequiredField%>&nbsp;</td>
		<td align='left'><span id='spnKeyword2' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td align='right'><%=kDenoteRequiredField%>&nbsp;</td>
		<td align='left'><span id='spnKeyword3' runat='server'/></td>
		<td align='right'><%=kDenoteRequiredField%>&nbsp;</td>
		<td align='left'><span id='spnKeyword4' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td align='right'>&nbsp;</td>
		<td align='left'><span id='spnKeyword5' runat='server'/></td>
		<td align='right'>&nbsp;</td>
		<td align='left'><span id='spnKeyword6' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td align='right'>&nbsp;</td>
		<td align='left'><span id='spnKeyword7' runat='server'/></td>
		<td align='right'>&nbsp;</td>
		<td align='left'><span id='spnKeyword8' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td align='right'>&nbsp;</td>
		<td align='left'><span id='spnKeyword9' runat='server'/></td>
		<td align='right'>&nbsp;</td>
		<td align='left'><span id='spnKeyword10' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr id='trSaveAndCancel' visible='true'>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser'
					TypeKey='GranteeProjectID' 
					PropertyKey='AppGranteeProjectID'
					Value=''
					Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='GranteeProjectKeywordWHCF' DataObjectDefinitionKey='GranteeProjectKeywordWHCF' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection'
					TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID'
					PropertyKey='GranteeProjectID'
					Value='' />
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ResearchAreaID'>
					<Control ID='ctlArea'
						Container='spnArea'
						Type='cDropDown'
						DataObjectDefinitionKey='ResearchArea'
						StoredValue='ResearchAreaID'
						DisplayValue='Abbr'	
						RequiredField='True'
						ErrorMessage='Area is required.'>
						<Validation Type='Custom' Object='DataPresenter' Method='ValidateOther' 
							ErrorMessage= 'Other research area is required.' />
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ResearchAreaOther'>
					<Control ID='ctlAreaOther'
						Container='spnAreaOther'
						Type='cTextBox'
						Size='50'
						MaxLength='250'>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey='Keyword1'>
					<Control ID='ctlKeyword1'
						Container='spnKeyword1'
						Type='cTextBox'
						Size='25'
						MaxLength='250'	
						RequiredField='True'
						ErrorMessage='Keyword 1 is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword2'>
					<Control ID='ctlKeyword2'
						Container='spnKeyword2'
						Type='cTextBox'
						Size='25'
						MaxLength='250'	
						RequiredField='True'
						ErrorMessage='Keyword 2 is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword3'>
					<Control ID='ctlKeyword3'
						Container='spnKeyword3'
						Type='cTextBox'
						Size='25'
						MaxLength='250'	
						RequiredField='True'
						ErrorMessage='Keyword 3 is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword4'>
					<Control ID='ctlKeyword4'
						Container='spnKeyword4'
						Type='cTextBox'
						Size='25'
						MaxLength='250'	
						RequiredField='True'
						ErrorMessage='Keyword 4 is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword5'>
					<Control ID='ctlKeyword5'
						Container='spnKeyword5'
						Type='cTextBox'
						Size='25'
						MaxLength='250'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword6'>
					<Control ID='ctlKeyword6'
						Container='spnKeyword6'
						Type='cTextBox'
						Size='25'
						MaxLength='250'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword7'>
					<Control ID='ctlKeyword7'
						Container='spnKeyword7'
						Type='cTextBox'
						Size='25'
						MaxLength='250'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword8'>
					<Control ID='ctlKeyword8'
						Container='spnKeyword8'
						Type='cTextBox'
						Size='25'
						MaxLength='250'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword9'>
					<Control ID='ctlKeyword9'
						Container='spnKeyword9'
						Type='cTextBox'
						Size='25'
						MaxLength='250'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Keyword10'>
					<Control ID='ctlKeyword10'
						Container='spnKeyword10'
						Type='cTextBox'
						Size='25'
						MaxLength='250'>
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
						Image='Save'>
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
	</ModuleSection>
</span>
<!-- End Embedded XML -->
