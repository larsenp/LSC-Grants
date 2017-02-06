<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Grant_Notes_View.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br />
<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlGrantSummary' 
	Src='Implementation/Modules/Staff/Controls/PageSection/GrantSummary.ascx'
	runat='server'/>

<div class='SeparatorHdg'>
	Grant Note
</div>
<br />
<table cellpadding='1'>
	<tr>
		<td>
			<b>Status</b>
		</td>
		<td>
			<span runat='server' id='spnStatus' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Created&nbsp;By</b>
		</td>
		<td>
			<span runat='server' id='spnCreatedBy' />, <span runat='server' id='spnCreateDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Modified&nbsp;By</b>
		</td>
		<td>
			<span runat='server' id='spnModifiedBy' />, <span runat='server' id='spnModifyDate' />
		</td>
	</tr>
	<tr>
		<td>
			<b>Subject</b>
		</td>
		<td>
			<span id="spnSubject" runat='server'/>
		</td>
	</tr>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td style="vertical-align:top">
			<b>Note</b>
		</td>
		<td>
			<span id="spnNotes" runat='server'/>
		</td>
	</tr>
</table>
<br />
<div style="text-align:center">
	<span runat='server' id='spnEdit' />
	<span runat='server' id='spnClose' />
</div>
<HR>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject DataObjectDefinitionKey='Notes' Key='Notes' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='NotesID' PropertyKey='NotesID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='spnSubject' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Notes'>
					<Control ID='lblNotes' 
						Type='cLabel'
						Container='spnNotes'/>
				</DisplayProperty>			
				<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName'>
					<Control ID='spnCreatedBy' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy'>
					<Control ID='spnCreateDate' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName'>
					<Control ID='spnModifiedBy' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='M/d/yyyy'>
					<Control ID='spnModifyDate' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Image='Close'
						Container='spnClose'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL'/>
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
