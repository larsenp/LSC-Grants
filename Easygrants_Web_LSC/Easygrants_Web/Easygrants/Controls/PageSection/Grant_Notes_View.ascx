<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cGrant_Notes_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Grant_Notes_View.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table runat='server' WIDTH='100%' border='0' cellspacing='0' cellpadding='2'>
	<tr valign='top'>
	    <td colspan=6>&nbsp;</td>
		<td colspan=2><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Options</b></td>
	</tr>
	
	<tr valign='top'>
		<td><b>Subject</b></td>
		<td colspan=5><span id="spnSubject" runat='server'/></td>
		<td colspan=2>
			<span id="spnEdit" runat='server'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="spnDelete" runat='server'/>		
		</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr valign='top'>
		<td><b>Note</b></td>
		<td colspan=7>&nbsp;<span id="spnNotes" runat='server'/></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	
	<tr valign='top'>
		<td Width='12.5%'>
			<b>Created Date</b>&nbsp;&nbsp;
		</td>
		<td Width='12.5%'>
			<span id="spnCreateDate" runat='server'/>
		</td>
		
		<td Width='12.5%'>
			<b>Created By</b>&nbsp;&nbsp;
		</td>
		<td Width='12.5%'>
			<span id='spnCreatedBy' runat='server'/>
		</td>
		
		<td Width='12.5%'>
			<b>Modified Date</b>&nbsp;&nbsp;
		</td>
		<td Width='12.5%'>
			<span id="spnModifyDate" runat='server'/>
		</td>
		
		<td Width='12.5%'>
			<b>Modified By</b>&nbsp;&nbsp;
		</td>
		<td Width='12.5%'>
			<span id='spnModifiedBy' runat='server'/>
		</td>
	
	</tr>
	
	<tr>
		<td colspan=8><HR></td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject DataObjectSource='DataPresenterList' DataObjectSourceKey='Notes' Key='Notes'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='CreateDate' Format='M/d/yyyy'>
					<Control ID='spnCreateDate' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifyDate' Format='M/d/yyyy'>
					<Control ID='spnModifyDate' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='CreatedByUser.Person.LastNameFirstName'>
					<Control ID='spnCreatedBy' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='ModifiedByUser.Person.LastNameFirstName'>
					<Control ID='spnModifiedBy' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Subject'>
					<Control ID='spnSubject' Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Notes'>
					<Control ID='spnNotes' Type='HtmlGenericControl'/>
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
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
