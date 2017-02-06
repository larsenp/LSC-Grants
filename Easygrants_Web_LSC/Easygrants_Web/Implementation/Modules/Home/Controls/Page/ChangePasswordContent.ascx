<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false"%>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table runat='server' width='100%' borders='0'>
	<tr>
		<td colspan='2'>
			<p>To change your password, enter your new password into both the New Password and Confirm New Password fields. Click on the <b>Save</b> button to save your new password. 
			Click on the <b>Close</b> button to return to your Home Page. Please remember to use your new password next time you log in.</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			New Password&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td>
			<span id='spnNewPassword' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			Confirm New Password&nbsp;<%=kDenoteRequiredField%>
		</td>
		<td>
			<span id='spnNewPasswordConfirm' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' align='center'>
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
						ErrorMessage='New Password is required.'>
						<Validation Type='RegularExpression' ValidationExpression='^\w*(?=\w{8,16})(?=\w*\d)(?=\w*[a-z])(?=\w*[A-Z])\w*$' 
						ErrorMessage='Password must contain at least one upper-case letter, at least one lower-case letter, and at least one digit, no spaces, and must be from 8 to 16 characters in length.' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtNewPasswordConfirm' 
						Type='cPasswordTextBox' 
						Container='spnNewPasswordConfirm'
						Size='25'
						MaxLength='15'
						RequiredField='True'
						ErrorMessage='Confirm New Password is required.'>
						<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='txtNewPassword' 
							Operator='Equal'
							ErrorMessage='The Passwords must match.  Re-enter password in the Confirm New Password textbox.' />
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
								<Argument Value='Home'/>
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
							Object='WebSession'
							Method='RedirectToModule'>
							<Parameters>
								<Argument Value='Home'/>
								<Argument Value='HomeModuleConfig'/>
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
