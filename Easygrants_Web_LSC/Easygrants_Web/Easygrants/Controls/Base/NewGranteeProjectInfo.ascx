<%@ Control Language="vb" AutoEventWireup="true" Inherits="EasyGrants.Controls.Base.cNewGranteeProjectInfo" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="NewGranteeProjectInfo.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' ID="Cuserctlloader1"/>
<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<table width='100%'>
	<tr>
		<td>Enter the grant information in the fields below and click on the <b>Save</b> button.  
		All fields with an asterisk (<%#kDenoteRequiredField%>) are required. To close this page, click on the <b>Close</b> button.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Grant Information</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='0' runat='server'>	
	<tr>
		<td><b>Person<%#kDenoteRequiredField%></b></td>
		<td width='10'>&nbsp;</td>
		<td colspan="2">
		<Core:cUserCtlLoader CtlID='ctlPer'
				Src='Core/Controls/Base/PopUpSelectorLauncher.ascx'
				Properties='RefreshParentPage=True&TextQueryString=Text&ValueQueryString=Value'
				runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr id='trInst' visible='true'>
		<td><b><span id='spnInst' runat='server'><%=GetLabel("Organization")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td><Core:cUserCtlLoader CtlID='ctlInst' Type='cDropDown' runat='server'/></td>
		<td width='10'>&nbsp;</td>
		<td/>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b><%=GetLabel("ProjectTitle")%><%#kDenoteRequiredField%></b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnGrantTitle' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td><b>Grant Status</b></td>
		<td width='10'>&nbsp;</td>
		<td><span id='spnGrantStatus' runat='server'/></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnCancel'/>		
		</td>
	</tr>
</table>

<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' />
			</Filters>
			<DefaultValues>
				<!--<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/> -->
				<Argument Type='' TypeKey='' PropertyKey='WfProjectOutcomeID' Value='2'/>
				<Argument Type='QueryString' TypeKey = 'WfProjectID' PropertyKey='WfProjectID' Value='' />
				<Argument Type='QueryString' TypeKey = 'Value' PropertyKey='GranteeID' Value='' />
				<Argument Type='Control' TypeKey = 'ctlInst' ControlPropertyKey='SelectedField' PropertyKey='PrimaryOrganizationID' Value='' />
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PrimaryPersonID' PropertyValue='Person.LastNameFirstName' ReadOnly='QueryID'>
					<Control ID='ctlPer'
					Type='cPopUpSelectorLauncher'
					DataObjectDefinitionKey='Person'
					StoredValue='PersonID'
					RequiredField='True'
					ErrorMessage='Person is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantTitle'>
					<Control ID='ctlGrantTitle'
						Container='spnGrantTitle'
						Type='cTextArea'
						RequiredField='True'
						ErrorMessage='Grant Title is required.'
						Rows='3'
						Cols='50'
						MaxLength='200'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,200}$' ErrorMessage='Limit your Description to 200 characters or less.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GrantStatusID'>
					<Control ID='ctlGrantStatus'
						Container='spnGrantStatus'
						Type='cDropDown'
						DisplayNone='False'
						DataObjectDefinitionKey='GrantStatus'
						StoredValue='GrantStatusID'
						DisplayValue='Description'
						RequiredField='True'
						ErrorMessage='Grant Status is required.'>
						    <Sort>
	                            <Argument PropertyKey='Description'/>
                            </Sort>
					</Control>	
				</DisplayProperty>		
			</DisplayProperties>
		</DataObject>
		<DataObject Key='SaveCancel' DataObjectDefinitionKey='' Updatable='False'>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantsEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' PropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
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
		
		<UserCtlLoader>
			<ctlPer>
				<DataObject Key='PersonID' DataObjectDefinitionKey='Person' DisplayName='Person last'>
					<SearchProperties>
						<SearchProperty DisplayValue='LastName' DisplayLabel='Last Name'/>
					</SearchProperties>
					<DisplayProperties>
						<DisplayProperty DisplayValue='LastNameFirstNamePrimInst'/>
					</DisplayProperties>
				</DataObject>
			</ctlPer>
		</UserCtlLoader>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
