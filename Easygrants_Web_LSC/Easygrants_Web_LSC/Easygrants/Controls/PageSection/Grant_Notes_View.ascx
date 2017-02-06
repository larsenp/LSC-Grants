<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cGrant_Notes_View_LSC" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Grant_Notes_View.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table id="Table1" runat='server' WIDTH='100%' border='0' cellspacing='0' cellpadding='1' >
	<tr valign='top'>
		<td width='7%'><b>Status</b>&nbsp;&nbsp;<span runat='server' id='spnStatus' /></td>
		<td width='20%'><b>Created By</b>&nbsp;&nbsp;<span runat='server' id='spnCreatedBy' />;&nbsp;&nbsp;<span runat='server' id='spnCreateDate' /></td>
		<td width='48%'><b>Subject</b>&nbsp;&nbsp;<span id="spnSubject" runat='server'/></td>
		<td width='25%'>
			<span runat='server' id='spnView' />&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="spnEdit" runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="spnDelete" runat='server'/>		
		</td>
	</tr>
    <tr valign='top'>
		<td ><b>Note</b></td>
		<td colspan=4><span id="spnNotes" runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
		<td colspan=7><HR></td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='Notes' Key='Notes'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='spnSubject' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Notes'>
					<Control ID='spnNotes' Type='HtmlGenericControl'/>
				</DisplayProperty>			
				<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName'>
					<Control ID='spnCreatedBy' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy'>
					<Control ID='spnCreateDate' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnDelete'
						Type='cButton'
						Image='Delete'
						Container='spnDelete'
						Confirmation='Are you sure you want to delete this item?'>
							<Action
							PostBack='True'
							Object='DataPresenter'
							Method='DelMethod'>
								<Parameters>
									<Argument Type='DataObjectCollection' TypeKey='Notes' DataObjectPropertyKey='NotesID'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='btnEdit'
						Type='cButton'
						Image='Edit'
						Container='spnEdit'>
						<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantNotesEditor'/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Type='DataObjectCollection' TypeKey='Notes' DataObjectPropertyKey='NotesID' BaseValue='NotesID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>

				<DisplayProperty PropertyKey=''>
					<Control ID='btnView'
						Type='cButton'
						Image='View'
						Container='spnView'>
						<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='GrantNoteViewer'/>
								<Argument Type='QueryString' TypeKey='GranteeProjectID' BaseValue='GranteeProjectID=' />
								<Argument Type='DataObjectCollection' TypeKey='Notes' DataObjectPropertyKey='NotesID' BaseValue='NotesID='/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscNotes' DataObjectDefinitionKey='LscNotes' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='Notes' DataObjectPropertyKey='NotesID' PropertyKey='NotesID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscNoteStatus.Description'>
					<Control ID='spnStatus'
						Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
