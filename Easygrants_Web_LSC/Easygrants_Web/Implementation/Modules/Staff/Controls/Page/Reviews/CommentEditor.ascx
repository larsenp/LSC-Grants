<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg"><b>Comment Editor</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Applicant Name:&nbsp;&nbsp;</b><span id='spnApplicantName' runat='server'/></td>
	</tr>		
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><span id='spnComments' runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center'>
			<span runat='server' id='spnSave' />&nbsp;&nbsp;
			<span runat='server' id='spnSaveClose' />&nbsp;&nbsp;
			<span runat='server' id='spnCancel' />&nbsp;&nbsp;
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' >
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
			</Filters>
			<DisplayProperties>		
				<DisplayProperty PropertyKey='PrimaryPerson.LastNameFirstNameMiddleName'>
					<Control ID='spnApplicantName' Type='HtmlGenericControl'/>
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProjectStaffComments' DataObjectDefinitionKey='GranteeProjectStaffComments' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectStaffCommentsID'
					PropertyKey='GranteeProjectStaffCommentsID'/>
			</Filters>
			<DefaultValues>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='StaffPersonID'/>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='Date' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>			
			<DisplayProperties>		
				<DisplayProperty PropertyKey='Comments'>
					<Control ID='txtComments'
						Container='spnComments'
						Type='cTextArea'
						Rows='10'
						Cols='75'
						MaxLength='200000'
						TooLongMessage='You can enter up to 200,000 characters.'>
					</Control>
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' >
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
								<Argument Value='CommentEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='GranteeProjectStaffComments' DataObjectPropertyKey='GranteeProjectStaffCommentsID' BaseValue='GranteeProjectStaffCommentsID='/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
								<Argument Type='QueryString' TypeKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Container='spnSaveClose'
						Type='cButton'
						Image='Save_And_Close'>
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
