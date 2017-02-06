<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Login.Controls.Page.cChangePasswordContent" CodeBehind="ChangePasswordContent.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table runat='server' width='100%' borders='0'>
	<tr>
		<td colspan='2'>
			<p>To change your password, enter your new password into both the New Password and Confirm New Password fields. 
			Click on the <b>Save</b> button to save your new password. Click on the <b>Close</b> button to return to your Home Page.
			Please remember to use your new password next time you log in.</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr>
		<td>
			New Password
		</td>
		<td>
			<span id='spnNewPassword' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			Confirm New Password
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
	    <DataObject Key='User' DataObjectDefinitionKey='User' Updatable='True' CreateNew='False'>
			<Filters>
				<!--The following filter argument is handled by the codebehind for this control -->
				<Argument Type='LoggedInUser' 
					TypeKey='UserID' 
					PropertyKey='UserID' 
					Value='' 
					Bool=''/>
			</Filters>
			<DisplayProperties>			    				
			    <DisplayProperty PropertyKey=''>
					<Control ID='txtNewPassword' 
						Type='cPasswordTextBox' 
						Container='spnNewPassword'
						Size='25'
						MaxLength='75'
						RequiredField='True'
						ErrorMessage='New Password is required.'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='txtNewPasswordConfirm' 
						Type='cPasswordTextBox' 
						Container='spnNewPasswordConfirm'
						Size='25'
						MaxLength='75'
						RequiredField='True'
						ErrorMessage='Confirm New Password is required.'>
						<Validation Type='Compare' 
							DataType='String' 
							ControlToCompare='txtNewPassword' 
							Operator='Equal'
							ErrorMessage='Text in the Confirm New Password text box does not match text in the New Password text box.' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>	
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' 
						Type='cButton' 
						Container='spnSave'
						Image='Save'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ChangePassword'
							>							
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
