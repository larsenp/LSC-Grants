<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Add or Edit Other Support</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server' width='100%'>
	<tr>
		<td width='200'><b>Grant Title</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnProjectTitle' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Grant Status</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnStatus' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Start Date</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnStartDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3' class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>End Date</b>&nbsp;<font color='red'>*</font></td>
		<td colspan='3'><span id='spnEndDate' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3' class='FieldLabel'>mm/dd/yyyy</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Funding Agency</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnSource' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Grant Number</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnProjectNumber' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Grant Role</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnGrantRole' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>% Effort</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnEffort' runat='server'/>%</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width='200'><b>Grant Aims</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnGrantAims' runat='server'/></td>
	</tr>
	<tr>
		<td width='200'>&nbsp;</td>
		<td colspan='3'>Limit 500 characters.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td nowrap><b>Overlap Issues and Resolution</b>&nbsp;<font color='red'>*</font>&nbsp;&nbsp;</td>
		<td colspan='3'><span id='spnOverlapIssues' runat='server'/></td>
	</tr>
	<tr>
		<td width='200'>&nbsp;</td>
		<td colspan='3'>Limit 500 characters.</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr>
	<td>
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnSaveClose'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='GranteeProjectOtherSupport' DataObjectDefinitionKey='GranteeProjectOtherSupport' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectOtherSupportID' 
					PropertyKey='GranteeProjectOtherSupportID' 
					Value='' Bool=''/>
				<Argument Type='ModuleUser' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Value='' />
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='ProjectTitle'>
					<Control ID='ctlProjectTitle'
						Container='spnProjectTitle'
						Type='cTextBox'
						Size='75'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='Grant Title is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='StatusID'>
					<Control ID='ctlStatus'
						Container='spnStatus'
						Type='cDropDown'
						DataObjectDefinitionKey='OtherSupportStatus'
						StoredValue='OtherSupportStatusID'
						DisplayValue='Description'	
						RequiredField='True'
						DisplayText='Select'
						ErrorMessage='Grant Status is required.'>
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
						DateFormatErrorMessage='Start Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='Start Date must be in mm/dd/yyyy format.'
						Size='30'
						MaxLength='50' 
						RequiredField='True'
						ErrorMessage='Start Date is required.'>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='EndDate'>
					<Control ID='ctlEndDate'
						Container='spnEndDate'
						Type='cDateTextBox'
						Calendar='True'
						DateFormat='MM/dd/yyyy'
						DateFormatErrorMessage='End Date must be in mm/dd/yyyy format.'
						NotSupportedDateErrorMessage='End Date must be in mm/dd/yyyy format.'
						Size='30'
						MaxLength='50' 
						RequiredField='True'
						ErrorMessage='End Date is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Source'>
					<Control ID='ctlSource'
						Container='spnSource'
						Type='cTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Funding Agency is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ProjectNumber'>
					<Control ID='ctlProjectNumber'
						Container='spnProjectNumber'
						Type='cTextBox'
						Size='25'
						MaxLength='50'
						RequiredField='True'
						ErrorMessage='Grant Number is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantRoleID'>
					<Control ID='ctlGrantRole'
						Container='spnGrantRole'
						Type='cDropDown'
						DataObjectDefinitionKey='GranteeOtherSupportRole'
						StoredValue='GranteeOtherSupportRoleID'
						DisplayValue='Description'	
						RequiredField='True'
						DisplayText='Select'
						ErrorMessage='Grant Role is required.'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PercentEffort'>
					<Control ID='ctlEffort'
						Container='spnEffort'
						Type='cTextBox'
						Size='3'
						MaxLength='3'
						RequiredField='True'
						AllowNumbersOnly='True'
						ErrorMessage='Percent Effort is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantAims'>
					<Control ID='ctlGrantAims'
						Container='spnGrantAims'
						Type='cTextArea'
						Rows='3'
						Cols='50'
						MaxLength='500'
						RequiredField='True'
						ErrorMessage='Grant Aims is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='OverlapIssues'>
					<Control ID='ctlOverlapIssues'
						Container='spnOverlapIssues'
						Type='cTextArea'
						Rows='3'
						Cols='50'
						MaxLength='500'
						RequiredField='True'
						ErrorMessage='Overlap Issues and Resolution is required.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<!-- Save and Cancel buttons -->
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
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectOtherSupport' DataObjectPropertyKey='GranteeProjectOtherSupportID' PropertyKey='GranteeProjectOtherSupportID' BaseValue='GranteeProjectOtherSupportID='/>
							</Parameters>						
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
						Type='cButton'
						Image='Save and Close'>
						<Action PostBack='True'  AutoSave='True' Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							    <Argument AttributeName='PageKey' Value='OtherSupport'/>
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
