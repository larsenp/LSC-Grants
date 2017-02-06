<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table width='600' border="0" cellpadding="0" cellspacing="0" runat='server' borders='0'>
  <tr>
    <td colspan='3'><h1>Change Password</h1></td>
  </tr>
  <tr>
    <td colspan="2" class="SeparatorHdg">Instructions</td>
  </tr>
  <tr>
    <td colspan="2" >&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" ><ul>
        <li>To change your password, enter your new password into both the <strong>New Password</strong> and <strong>Confirm New Password</strong> fields. </li>
        <li>Click <b>Save</b> to save your new password. </li>
        <li>Click <b>Close</b> to return to your Home Page. </li>
        <li>Please remember to use your new password next time you log in.</li>
    </ul></td>
  </tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td width="159">
		<strong>New Password</strong>		</td>
		<td width="438"><span id='spnNewPassword' runat='server'/></td>
		<td width="3">
			
		</td>
	</tr>
	<tr>
		<td>
		<strong>Confirm New Password</strong>		</td>
		<td><span id='spnNewPasswordConfirm' runat='server'/></td>
		<td>
			
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td colspan='3' align='center'>
			<span id='spnSave' runat='server'/>
			&nbsp;&nbsp;
			<span id='spnCancel' runat='server'/>
		</td>
	</tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtNewPassword' 
						Type='cPasswordTextBox' 
						Container='spnNewPassword'
						Size='25'
						MaxLength='15'
						RequiredField='True'
						ErrorMessage='Please enter New Password.'>
						<Validation Type='RegularExpression' ValidationExpression='^\w*(?=\w{8,16})(?=\w*\d)(?=\w*[a-z])(?=\w*[A-Z])\w*$' 
						ErrorMessage='Password must contain at least one upper-case letter, at least one lower-case letter, and at least one digit, no spaces, 
						and must be from 8 to 16 characters in length.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtNewPasswordConfirm' 
						Type='cPasswordTextBox' 
						Container='spnNewPasswordConfirm'
						Size='25'
						MaxLength='15'
						RequiredField='True'
						ErrorMessage='Please enter your new password into the Confirm New Password textbox.'>
						<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='txtNewPassword' 
							Operator='Equal'
							ErrorMessage='Text in the Confirm New Password text box does not match text in the New Password text box.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' 
						Type='cButton' 
						Container='spnSave'
						Image='Save'>
						<Action
							PostBack='True'
							Object='ModuleUser'
							Method='ChangePassword'
							AutoSave='True'>
							<Parameters>
								<Argument Type='Control' TypeKey='txtNewPassword' ControlPropertyKey='Value'/>
								<Argument Type='' TypeKey='' Value='False'/>
								<Argument Type='' TypeKey='' Value='Home'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel' 
						Type='cButton' 
						Container='spnCancel'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Home'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	
	</ModuleSection>		
<!-- End Embedded XML -->
</span>
