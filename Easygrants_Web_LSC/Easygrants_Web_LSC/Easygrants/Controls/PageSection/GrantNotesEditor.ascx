<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cGrantNotesEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="GrantNotesEditor.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<br />
<br />

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlGrantInfo'
Src='EasyGrants/Controls/PageSection/GrantInformation.ascx'
runat='server' />

<br />

<table id="Table1" border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
    <tr>
	    <td class="SeparatorHdg"><b>Add or Edit Note</b></td>
    </tr>
</table>

<br />

<table id="Table2" border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td width='15%'><b>Status</b></td>
		<td><span runat='server' id='spnStatus' /></td>
	</tr>
    <tr>
	    <td><b>Subject&nbsp;</b><%=kDenoteRequiredField%>
	    </td>
	    <td>
	        <span id='spnSubject' runat='server'/>
	    </td>
    </tr>
    <tr>
	    <td width='15%' valign='Top'><b>Notes</b>
	    </td>
	    <td>
	        <span id='spnNotes' runat='server'/>
	    </td>
    </tr>
</table>

<br />
<Core:cUserCtlLoader ID="CUserCtlLoader3" CtlID='ctlHistoryInfo' 
Src='EasyGrants/Controls/PageSection/History.ascx'
Properties='DataObjectDefinitionKey=Notes&QueryStringKey=NotesID&SecondQueryStringKey=None&IsPrimaryKey=True'
runat='server' />


<br />
<br />	
			
<table id="Table3" border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
    <tr>
	    <td>
		    <span runat='server' id='spnSave'/>
		    <span runat='server' id='spnSaveAndClose'/>
		    <span runat='server' id='spnCancel'/>		
	    </td>
    </tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Notes' DataObjectDefinitionKey='Notes' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='NotesID'
					PropertyKey='NotesID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='EntityID' Update='True' Value=''/>
				<Argument Type='QueryString' TypeKey='EntityTypeID' PropertyKey='EntityTypeID' Value=''/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='CreateUser' Update='False' Create='True'/>
				<Argument Type='ModuleUser' TypeKey='UserID' PropertyKey='ModifyUser' Update='True' Create='False'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='CreateDate' Update='False' Create='True'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' PropertyKey='ModifyDate' Update='True' Create='False'/>
			</DefaultValues>
			<DisplayProperties>																		
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='ctlSubject'
						Container='spnSubject'
						Type='cTextBox'
						Size='50'
						MaxLength='100'
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
						RequiredField='False'
						ErrorMessage='Notes is required.'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscNotes' DataObjectDefinitionKey='LscNotes' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='NotesID'
					PropertyKey='NotesID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='DataObjectCollection' TypeKey='Notes' DataObjectPropertyKey='NotesID' PropertyKey='NotesID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NoteStatusID'>
					<Control ID='ctlStatus'
						Type='cDropDown'
						Container='spnStatus'
						DataObjectDefinitionKey='LscNoteStatus'
						StoredValue='LscNoteStatusID'
						DisplayValue='Description' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
        <!-- Save and Cancel buttons -->
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='NoteStatusID'>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
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
