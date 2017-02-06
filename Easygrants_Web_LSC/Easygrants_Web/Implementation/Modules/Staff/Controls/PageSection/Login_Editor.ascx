<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageContent.cLogin_Editor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
	
	<span runat='server' visible='false' id='spnErrorMsg'>
	<br><font color='red'>Send Password failed. Create a Login ID and Password.</font><br>
</span>
<span runat='server' visible='false' id='spnNoPrimaryEmailMsg'>
	<br><font color='red'>Primary e-mail address is required.</font><br>
</span>

<!-- USER MODIFIABLE CONTENT AREA -->
<table id='tblStaffLbl' runat='server'>
	<tr><td>Enter the desired user, enter and confirm the password and click
	on the <b>Save</b> button.
	</td></tr>
</table>
<br>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server'>

<!-- Control Label (for Education information) -->
    <tr>
	    <td class="SeparatorHdg"><b>Add or Edit Login Information</b></td>
    </tr>	
    <tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
	    <td colspan='2'>
		    <b>Person:</b>&nbsp;<span runat='server' id='spnPerson'/>
	    </td>
    </tr>
    <tr>
        <td colspan='2'>Date Login Created:&nbsp;<span runat='server' id='spnLoginCreate'/></td>
    </tr>
    <tr><td  colspan='2'>&nbsp;</td></tr>
    <tr id='trType' runat='server'>
	    <td width='15%'><b>Type</b>&nbsp;<%=kDenoteRequiredField%></td>	
	    <td><span id='spnUserType' runat='server'/></td>	
    </tr>
    <tr id='trTypeLbl' runat='server'>
	    <td width='15%'><b>Type</b></td>	
	    <td><b>Public</b></td>	
    </tr>
    <tr>
	    <td><b>Login ID</b><font color='red'>*</font> </td>	
	    <td><span id='spnUserName' runat='server'/><span id='spnUserName1' runat='server'/></td>
	    
    </tr>
   
   </table>
    <asp:CustomValidator 
				id='valUser'
				runat='server'
				OnServerValidate='ValidateIfUserExist'
				ErrorMessage='Login and Password are required.'
				Display='None'/>
    <br/>
  <table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    <tr>
	    <td width='25%'><b>Require User to Change Password on Login?</b></td>
	    <td><span id='spnChangePassword' runat='server'/> </td>	  
    </tr>
    <tr>
	    <td><b>Locked?</b></td>
	     <td><span id='spnLocked' runat='server'/>(When checked the user cannot log into the system.)</td>	  
    </tr>
   </table>
   <br/>
    <table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
    
     <tr>
        <td width='20%'><span id='spnCreatePassword' runat='server'/>
			<span id='spnRecreatePassword' runat='server'/></td>
        <td>Date Last Modified:&nbsp;<span id='spnLastModified' runat='server'/> </td>
    </tr>
    <tr><td colspan='2'>&nbsp;</td></tr>
    <tr>
        <td width='20%'><span id='spnSendPassword' runat='server'/></td>
        <td>Date Last Sent:&nbsp;<span id='spnLastSent' runat='server'/></td>
    </tr>
</table>
<!-- Save Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
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
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='PersonID'
					PropertyKey='PersonID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstNameMiddleName'>
					<Control ID='spnPerson'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='User' DataObjectDefinitionKey='User' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='UserID'
					PropertyKey='UserID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>	
			    <DisplayProperty PropertyKey='CreateDate' >
					<Control ID='spnLoginCreate'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='UserTypeID'>
					<Control ID='ctlUserType'
						Container='spnUserType'
						Type='cDropDown'
						DataObjectDefinitionKey='UserType'
						StoredValue='UserTypeID'
						DisplayValue='UserType_Long'	
						RequiredField='True'
						DisplayNone='False'
						ErrorMessage='User Type is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='UserName'>
				    <Control ID='spnUserName'
						Type='HtmlGenericControl'/>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='UserName'>
					<Control ID='ctlUserName1'
						Container='spnUserName1'
						Type='cEmailTextBox'
						Size='50'
						MaxLength='100'
						RequiredField='True'
						ErrorMessage='E-mail Address is required.'>
						<Validation Type='Custom' Object='EventController' Method='ValidateDuplicateUserName' ErrorMessage='The e-mail address you entered already exists in the system. Please contact the Granting ~~Organization~~ for your login information.' />
					</Control>
				</DisplayProperty>
                <DisplayProperty PropertyKey='ChangePasswordNextLogin'>
					<Control ID='ctlChangePassword'
						Container='spnChangePassword'
						Type='cCheckBox'>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='IsLocked'>
					<Control ID='ctlLocked'
						Container='spnLocked'
						Type='cCheckBox'	>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey='ModifyDate'  >
					<Control ID='spnLastModified'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
				 <DisplayProperty PropertyKey='PasswordLastSentDate' >
					<Control ID='spnLastSent'
						Type='HtmlGenericControl'/>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
<!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton' EnterKey='True'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='User' DataObjectPropertyKey='UserID' PropertyKey='UserID' BaseValue='UserID='/>
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
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCreatePassword'
						Container='spnCreatePassword'
						Type='cButton'
						Image='Create Login and Password'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CreatePassword'>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnRecreatePassword'
						Container='spnRecreatePassword'
						Type='cButton'
						Image='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Recreate Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CreatePassword'>
						</Action>
					</Control>	
				</DisplayProperty>				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSendPassword'
						Container='spnSendPassword'
						Type='cButton'
						Image='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Send Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='SendPassword'>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
<!-- End Embedded XML -->
</span>
