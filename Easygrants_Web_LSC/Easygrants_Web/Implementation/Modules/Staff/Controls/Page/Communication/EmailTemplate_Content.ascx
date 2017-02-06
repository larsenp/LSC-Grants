<%@ Control Language="vb" AutoEventWireup="true"  CodeBehind="EmailTemplate_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Communication.cEmailTemplate_Content"%>
<!-- USER MODIFIIABLE CONTENT AREA -->
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr visible='false'>
		<td colspan='2'>This page allows you to manage e-mail message templates. For more information, see the <span runat='server' id='spnGuidelines'/>.</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>Add or Edit E-mail Templates</b></td>
	</tr>
	<tr>
		<td colspan='2'>&nbsp;</td>
	</tr>	
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnEmailTemplateList' visible='true'></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='CorrespondenceDefinition' DataObjectDefinitionKey='CorrespondenceDefinition' Updatable='False'>
			<Sort>
				<Argument PropertyKey='Title'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='DataPresenter'
									Method='DisplayPageContent'>
									<Parameters>
										<Argument AttributeName='Page' Value='Easygrants/Controls/PageSection/EmailTemplateEditor_Content.aspx'/>
										<Argument Type='' TypeKey='' AttributeName='' Value='CorrespondenceDefinitionID=0'/>
									</Parameters>
							</Action>
					</Control>
				</DisplayProperty>	
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlEmailTemplateList'
						Container='spnEmailTemplateList'
						Type='cDataListCtl'
						SeparatorWidth='2'
						DataObjectDefinitionKey='CorrespondenceDefinition'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='Title' ColumnHeader='Template Name'  Width='40%'>
							<Sortable>
								<Argument PropertyKey='Title' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='User.Person.LastNameFirstName' ColumnHeader='Modified By' Width='40%'>
							<Sortable>
								<Argument PropertyKey='LastName'>
									<RelatedProperty PropertyKey='User.Person'/>
							    </Argument> 
							    <Argument PropertyKey='FirstName'>
							        <RelatedProperty PropertyKey='User.Person'/>
							    </Argument> 
							</Sortable>
						</DisplayProperty>												
						<!--<DisplayProperty PropertyKey=''>
							<Control ID='btnView'
								Type='cButton'
								Image='Preview'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='EmailPreview'/>
										<Argument Type='DataObject' TypeKey='CorrespondenceDefinitionID' AttributeName='CorrespondenceDefinitionID' BaseValue='CorrespondenceDefinitionID='/>
									</Parameters>
								</Action>
							</Control>	
						</DisplayProperty>-->
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Right' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DisplayPageContent'>
									<Parameters>
										<Argument AttributeName='Page' Value='Easygrants/Controls/PageSection/EmailTemplateEditor_Content.aspx'/>
										<Argument Type='DataObject' TypeKey='CorrespondenceDefinitionID' AttributeName='CorrespondenceDefinitionID' BaseValue='CorrespondenceDefinitionID='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='20%'>
							<Parameters>
								<Argument Value='' Operator='NotEqual' ValueKey='EventCorrespondence.EventID' DisplayValue=''/>
								<Argument Value='' ValueKey='EventCorrespondence.EventID' DisplayValue='Control'>
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='CorrespondenceDefinitionID' AttributeName='CorrespondenceDefinitionID' Value=''/>
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGuidelines'
						Container='spnGuidelines'
						Type='cLink'
						Caption='E-mail Templates Guide'>
						<Action PostBack='False'
							Target='_blank'
							URL='/EasyGrants_v4_WHCF_r1/Easygrants/PDF/EmailTemplateGuide.pdf'/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
	<!-- End Embedded XML -->
</span>
