<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>

<!-- Control Label (for Education information) -->
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Security Editor</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr id='trType' runat='server'>
	<td>
		<b>Question</b>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnQuestion' runat='server'/>
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>&nbsp;
	</td>
</tr>	
<tr>
	<td><b>Answer</b>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<table>
			<tr>
				<td><span id='spnAnswer' runat='server'/></td>
			</tr>
			
		</table>
	</td>
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
		<!-- Cancel Button Control(additional configuration information is specified in the 
				DisplayProperty node below) -->
		<span runat='server' id='spnCancel'/>		
	</td>
</tr>

</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='User' DataObjectDefinitionKey='User' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='UserID'
					PropertyKey='UserID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='PersonID' PropertyKey='PersonID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='PasswordQuestionID'>
					<Control ID='ctlQuestion'
						Container='spnQuestion'
						Type='cDropDown'
						DataObjectDefinitionKey='PasswordQuestion'
						StoredValue='PasswordQuestionID'
						DisplayValue='PasswordQuestion'	
						RequiredField='False'
						DisplayNone='False'>
						<Sort>
							<Argument PropertyKey='SortOrder' />
						</Sort>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PasswordAnswer'>
					<Control ID='ctlAnswer'
						Type='cTextBox'
						Container='spnAnswer'
						Size='30'
						MaxLength='100'
						RequiredField='False'>
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
<!-- End Embedded XML -->
</span>
