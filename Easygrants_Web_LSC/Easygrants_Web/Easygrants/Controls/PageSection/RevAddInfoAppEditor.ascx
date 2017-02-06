<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="RevAddInfoAppEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<P>Use this page to review and edit this additional information.  To save your changes, 
click on the Save button.  All fields marked with an asterisk (<FONT color=red>*</FONT>)are required.</P>
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>

<!-- Control Label (for Education information) -->
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Additional Information Editor</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td>
		<b>Task:</b>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnTask' runat='server'/>
	</td>
	<td>
	</td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
	<td>
		<b>Request Comments:</b>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnRequestComment' runat='server'/>
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>&nbsp;
	</td>
</tr>	
<tr>
	<td>
		<b>Response Comments:</b>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnResponseComment' runat='server'/>
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>&nbsp;
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
<tr>
	<td>
		<Core:cUserCtlLoader CtlID='ctlRaiseEvent' Src='Core/Controls/Base/EventRaiser.ascx' runat='server'/>
	</td>
</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='ReviewAdditionalInformation' DataObjectDefinitionKey='ReviewAdditionalInformation' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='ReviewAdditionalInformationID'
					PropertyKey='ReviewAdditionalInformationID'
					Value='' 
					bool=''/>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='AppWfTaskAssignmentID' Value=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='AppWfTaskAssignmentID' Value=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='RequestComment'>
					<Control ID='spnRequestComment'
						Type='HtmlGenericControl'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ResponseComment'>
					<Control ID='ctlResponseComment'
						Container='spnResponseComment'
						Type='cTextArea'
						Rows='5'
						Cols='50'
						MaxLength='200'>
						<Validation Type='RegularExpression' ValidationExpression='^[\s-\S]{1,200}$' ErrorMessage='Limit your request to 200 characters or less.' />
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='RevWfTaskAssignment.WfTask.WfTask'>
					<Control ID='spnTask'
						Type='HtmlGenericControl'>
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
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewerInfo'/>
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
							Method='EventController_NavigateToModulePageKey'>	
							<Parameters>
								<Argument AttributeName='PageKey' Value='ReviewerInfo'/>
							</Parameters>								
						</Action>
					</Control>	
				</DisplayProperty>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlRaiseEvent'
						Type='cEventRaiser'>
						<Parameters>
							<Argument Type='' TypeKey='' DataObjectPropertyKey='' EventRaiserProperty='EventID' Value='8' />
							<Argument Type='' TypeKey='' DataObjectPropertyKey='' EventRaiserProperty='DODefinitionKey' Value='ReviewAdditionalInformation' />
							<Argument Type='DataObjectCollection' TypeKey='ReviewAdditionalInformation' DataObjectPropertyKey='ReviewAdditionalInformationID' EventRaiserProperty='PrimaryKey' />
							<Argument Type='ModuleUser' TypeKey='UserID' EventRaiserProperty='UserID' Value=''/>
						</Parameters>								
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
<!-- End Embedded XML -->
</span>
