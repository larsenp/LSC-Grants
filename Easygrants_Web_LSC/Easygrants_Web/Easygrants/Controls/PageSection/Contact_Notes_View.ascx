<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cContact_Notes_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Contact_Notes_View.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<table runat='server' WIDTH='100%' border='0'>
	<tr>
		<td colspan='4'>&nbsp;</td>
	</tr>
	<tr>
	    <td colspan='3'>&nbsp;</td>
	    <td align='center'><b>Options</b></td>
	</tr>
	<tr valign='top'>
		<td><b>Subject</b></td>
		<td colspan=2><span id="spnSubject" runat='server'/></td>
		<td align='center' valign='middle'>			
			<span id="spnEdit" runat='server'/>&nbsp;&nbsp;
			<span id="spnDelete" runat='server'/>
		</td>
	</tr>
	
	<tr valign='top'>
		<td><b>Note</b></td>
		<td colspan='3'><span id="spnNotes" runat='server'/></td>
	</tr>	
	<tr valign='top'>
		<td width='25%'>
			<b>Created Date</b>&nbsp;&nbsp;
			<span id="spnCreateDate" runat='server'/>
		</td>
		<td width='25%'>
			<b>Created By</b>&nbsp;&nbsp;
			<span id='spnCreatedBy' runat='server'/>
		</td>
		<td width='25%'>
			<b>Modified Date</b>&nbsp;&nbsp;
			<span id="spnModifyDate" runat='server'/>
		</td>
		<td width='25%'>
			<b>Modified By</b>&nbsp;&nbsp;
			<span id='spnModifiedBy' runat='server'/>
		</td>
	</tr>
	<tr>
		<td colspan=4><HR></td>
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
								<Argument AttributeName='PageKey' Value='NotesEditor'/>
								<Argument Type='DataPresenter' TypeKey='EntityID' BaseValue='EntityID=' />
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
