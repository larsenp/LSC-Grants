<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Application.Controls.Page.cReferencesEditorContent" CodeBehind="ReferencesEditorContent.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr><td class="SeparatorHdg"><b>Instructions</b></td></tr>	
	<tr><td><span id='spnPageContent' runat='server' /></td></tr>	
</table>
<br>
<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlProjectHeader' 
	Src='Implementation/Modules/Application/Controls/PageSection/ProjectInfoHeader.ascx'
	runat='server'/>
<br>
<!-- Page Content - Controls -->
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Reference or Recommendation Contact Information</b></td>
	</tr>
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr>
		<td width='15%'><b>Reviewer Name</b>&nbsp;</td>
		<td  colspan='3'><span id='spnPrefix' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan='3'>Prefix</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width='15%'><span id='spnFirst' runat='server'/></td>
		<td width='9%'><span id='spnMiddle' runat='server'/></td>
		<td><span id='spnLast' runat='server'/></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>First&nbsp;<%=kDenoteRequiredField%></td>
		<td>Middle</td>
		<td>Last&nbsp;<%=kDenoteRequiredField%></td>	
	</tr>
	<tr>
		<td>&nbsp;</td>	
		<td  colspan='3'><span id='spnSuffix' runat='server'/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>	
		<td   colspan='3'>Suffix</td>	
	</tr>
	<tr>
		<td><b>Role&nbsp;<%=kDenoteRequiredField%></b></td>
		<td  colspan='3'><span id='spnRole' runat='server'/></td>
	</tr>
	<tr>
		<td><b>Phone&nbsp;<%=kDenoteRequiredField%></b></td>
		<td><span id='spnPhoneNumber' runat='server'/></td>
		<td colspan='2'><span id='spnPhoneExt' runat='server'/></td>
	</tr>
	<tr>
		<td	align='right'>&nbsp;</td>
		<td >Enter numbers only.</td>
		<td colspan='2'>Extension</td>	
	</tr>
	<tr>
		<td><b>E-mail&nbsp;<%=kDenoteRequiredField%></b></td>
		<td  colspan='3'><span id='spnTxtEmail' runat='server'/>
			<asp:CustomValidator id="CtlvalUniqueEmail" runat="server"
				OnServerValidate="valUniqueEmail"
				Display="None"
				ErrorMessage="A Reference Recommendation has already been added with this e-mail address.  You must enter a unique e-mail address."/>
		</td>
	</tr>
	<tr>
		<td><b>Confirm E-mail&nbsp;<%=kDenoteRequiredField%></b></td>
		<td  colspan='3'><span id='spnTxtConfirmEmail' runat='server'/></td>
	</tr>
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
				<br><br><br>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
<tr>
	<td>
		<span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnSaveClose'/>&nbsp;&nbsp;&nbsp;&nbsp;
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='PREditorWfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Value='' />		
			</Filters>
		</DataObject>	
		<DataObject Key='PersonRelationship' DataObjectDefinitionKey='PersonRelationship' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonRelationshipID' PropertyKey='PersonRelationshipID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' />				
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />	
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />	
				<Argument Type='ModuleUser' TypeKey='WfTaskID' PropertyKey='TaskID' Value='' />	
				<Argument Type='DataObjectCollection' TypeKey='PREditorWfTaskAssignment' DataObjectPropertyKey='WfProjectTask.ChildProjectTasks.WfTaskID' PropertyKey='ThirdPartyTaskID'/>				
				<Argument Type='' TypeKey='' PropertyKey='RelatedPersonID' Value='-1' />
				<Argument Type='DataObjectCollection' TypeKey='Person' DataObjectPropertyKey='PersonID' PropertyKey='RelatedPersonID'/>
			</DefaultValues>			
			<DisplayProperties>
				<DisplayProperty PropertyKey='RelatePersonDisplayPrefixID'>
					<Control ID='ctlPrefix'
						Container='spnPrefix'
						Type='cDropDown'
						DataObjectDefinitionKey='Prefix'
						StoredValue='PrefixID'
						DisplayValue='Prefix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayFirstName'>
					<Control ID='ctlFirst'
						Container='spnFirst'
						Type='cTextBox'
						Size='25'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='First name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayMiddleName'>
					<Control ID='ctlMiddle'
						Container='spnMiddle'
						Type='cTextBox'
						Size='10'
						MaxLength='75'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='RelatePersonDisplayLastName'>
					<Control ID='ctlLast'
						Container='spnLast'
						Type='cTextBox'
						Size='30'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='Last name is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplaySuffixID'>
					<Control ID='ctlSuffix'
						Container='spnSuffix'
						Type='cDropDown'
						DataObjectDefinitionKey='Suffix'
						StoredValue='SuffixID'
						DisplayValue='Suffix'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatedPersonRoleID'>
					<Control ID='ctlRole'
						Container='spnRole'
						Type='cDropDown'
						DataObjectDefinitionKey='WfTaskRole'
						StoredValue='WfTaskRoleID'
						DisplayValue='WfTaskRole'
						RequiredField='True' DisplayText='Select'
						ErrorMessage='Role is required.'>
			            <Filters>
                            <Argument Type='' TypeKey=''  PropertyKey='TaskTypeID' Value='6' />
			             </Filters>
			             <Sort>
							<Argument PropertyKey='WfTaskRole' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayPhone'>
					<Control ID='ctlPhone'
						Container='spnPhoneNumber'
						Type='cTextBox'
						Size='20'
						MaxLength='20'
						RequiredField='True'
						ErrorMessage='Phone is required. Extension is not required.'>						
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,20}\s?$' ErrorMessage='Phone Number is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayPhoneExt'>
					<Control ID='ctlPhoneExt'
						Container='spnPhoneExt'
						Type='cTextBox'
						Size='5'
						MaxLength='10'>
						<Validation Type='RegularExpression' ValidationExpression='^\s?[0-9]{0,10}\s?$' ErrorMessage='Extension is incorrectly formatted. Use only numbers, no hyphens, commas or parentheses.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='RelatePersonDisplayEmail'>
					<Control ID='ctlTxtEmail'
						Container='spnTxtEmail'
						Type='cEmailTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						RexErrorMessage='E-mail address is incorrectly formatted.  Use the following format to enter the e-mail address: test@test.org or test@test.org.uk.'
						ErrorMessage='E-mail Address is required.'>						
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='RelatePersonDisplayEmail'>
					<Control ID='ctlTxtConfirmEmail'
						Container='spnTxtConfirmEmail'
						Type='cEmailTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						RexErrorMessage='E-mail address is incorrectly formatted.  Use the following format to enter the e-mail address: test@test.org or test@test.org.uk.'
						ErrorMessage='Confirm E-mail Address is required.'>						
						<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='ctlTxtEmail' 
							Operator='Equal' 
							ErrorMessage='Text in the Confirm E-mail field does not match text in the E-mail field.' />						
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
							AutoSave='False'
							Object='EventController'
							Method='SaveUser_SelectThirdParty_PageReload'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlTxtEmail' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlFirst' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlLast' ControlPropertyKey='Value' Value='' />
								<Argument Type='' TypeKey = '' Value='' />	
								<Argument Type='' TypeKey = '' Value='1' />
								<Argument Type='' TypeKey = '' Value='ReferencesEditor' />
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='SaveUser_SelectThirdParty_NavigateToURL'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlTxtEmail' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlFirst' ControlPropertyKey='Value' Value='' />
								<Argument Type='Control' TypeKey = 'ctlLast' ControlPropertyKey='Value' Value='' />
								<Argument Type='' TypeKey = '' Value='' />	
								<Argument Type='' TypeKey = '' Value='1' />
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
<!-- End Embedded XML -->
</span>




