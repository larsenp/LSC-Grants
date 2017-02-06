<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cNotesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="NotesEditor.ascx.vb" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Add or Edit Note</b></td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td><b><span id='spnLabelOrganization' visible='True' runat='server'><%=GetLabel("Organization")%></span><span id='spnLabelPerson' visible='True' runat='server'>Person</span></b></td>
	<td width='10'>&nbsp;</td>
	<td>
		<table>
			<tr>
				<td><span id='spnOrganization' visible='True' runat='server'/><span id='spnPerson' visible='True' runat='server'/></td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td><b>Subject&nbsp;</b><%=kDenoteRequiredField%>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<table>
			<tr>
				<td><span id='spnSubject' runat='server'/></td>
			</tr>
		</table>
	</td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
	<td valign='Top'><b>Note</b>
	</td>
	<td width='10'>&nbsp;</td>
	<td>
		<table>
			<tr>
				<td><span id='spnNotes' runat='server'/></td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td width='10'>&nbsp;</td>
	<td class='FieldLabel'>Limit the note to 5000 characters (including spaces).</td>
</tr>
</table>
<br><br>
<Core:cUserCtlLoader CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=Notes&QueryStringKey=NotesID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />

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
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Notes' DataObjectDefinitionKey='Notes' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='NotesID'
					PropertyKey='NotesID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataPresenter' TypeKey='EntityID' PropertyKey='EntityID' Update='True' Value=''/>
				<Argument Type='DataPresenter' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='ctlSubject'
						Container='spnSubject'
						Type='cTextBox'
						Size='80'
						MaxLength='250'
						RequiredField='True'
						ErrorMessage='Subject is required.'>
					</Control>
				</DisplayProperty>				
				<DisplayProperty PropertyKey='Notes'>
					<Control ID='ctlNotes'
						Container='spnNotes'
						Type='cTextArea'
						Cols='80'
						Rows='8'
						MaxLength='5000'
						TooLongMessage='The Note should not be more than 5000 characters.'
						RequiredField='False'
						ErrorMessage='Notes is required.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Organization' DataObjectDefinitionKey='Organization' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='OrganizationID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CommonOrganizationName'>
					<Control ID='spnOrganization' Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Person' DataObjectDefinitionKey='Person' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='EntityID' PropertyKey='PersonID'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LastNameFirstName'>
					<Control ID='spnPerson' Type='HtmlGenericControl'/>
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
						Image='Save' 
						EnterKey='True'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='Notes' DataObjectPropertyKey='NotesID' PropertyKey='NotesID' BaseValue='NotesID='/>
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
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>
<!-- End Embedded XML -->
