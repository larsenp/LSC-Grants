<%@ Control Language="vb" AutoEventWireup="true" Codebehind="Contact_Email.ascx.vb" Inherits="Easygrants_Web.Controls.PageSection.cContact_Email" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<!-- Control Label (for  Address information) -->
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>E-mail Address</b></td>
	</tr>	
</table> <!--
Click <b>Add</b> to enter an e-mail address for this contact.  Click the <b>Edit</b> or <b>Delete</b> option buttons 
to edit/delete these records. -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td >
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td ><span runat='server' id='spnDataList'></span>	
		</td>
	</tr>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Email' DataObjectDefinitionKey='Email'>
			<Filters>
				<Argument Type='DataPresenter' 
					TypeKey='EntityID' 
					PropertyKey='EntityID' 
					Value='' 
					Bool=''/>
				<Argument Type='DataPresenter' 
					TypeKey='EntityTypeID' 
					PropertyKey='EntityTypeID' 
					Value='' 
					Bool='And'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='IsPrimary' Direction='Descending' />	
			</Sort>
			<DisplayProperties>	
				<DisplayProperty PropertyKey='' ID='Add'>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
					    AutoSave='True'	
						Container='spnAdd'>
							<Action
							    ID='Add'
								PostBack='True'
								Object='ModulePage'
								Method='Save'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='EmailEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='EmailID=0'/>
									<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='' BaseValue='EntityID='/>
									<Argument Type='DataPresenter' TypeKey='EntityTypeID' AttributeName='' BaseValue='EntityTypeID='/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='Email'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='IsPrimary' Format='YesNo' ColumnHeader='Primary' Width='20%'/>
						<DisplayProperty PropertyKey='EmailType.TypeName' ColumnHeader='Type'  Width='25%'/>
						<DisplayProperty PropertyKey='ContactValue1' ColumnHeader='E-mail Address'  Width='30%'>
							<Control ID='ctlLink'
								Type='cLink'>
								<Action
									PostBack='False'
									URL='Email'>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'  Width='25%' ID='Edit'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
								    ID='Edit'
									PostBack='True'
								    AutoSave='True'	
                                    Object='ModulePage'
                                    Method='Save'>							    								
									<Parameters>
										<Argument AttributeName='PageKey' Value='EmailEditor'/>
										<Argument Type='DataObject' TypeKey='EmailID' AttributeName='EmailID' BaseValue='EmailID='/>
										<Argument Type='DataPresenter' TypeKey='EntityID' AttributeName='EntityID' BaseValue='EntityID='/>
										<Argument Type='DataPresenter' TypeKey='EntityTypeID' AttributeName='EntityTypeID' BaseValue='EntityTypeID='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>							
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this item?'>
									<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_Delete'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='EmailID' AttributeName='EmailID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
