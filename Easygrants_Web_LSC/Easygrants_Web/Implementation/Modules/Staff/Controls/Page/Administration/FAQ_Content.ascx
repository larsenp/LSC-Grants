<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="FAQ_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cFAQ_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener id='ctlNewWindowOpener' runat='server' />

<!-- USER MODIFIIABLE CONTENT AREA -->
<br>

<!-- Page Content - Top Of Page -->
<table width='100%'>
	<tr>
		<td colspan='2' class="SeparatorHdg"><b>FAQ Manager</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>		
</table>
<table border='0' cellspacing='0' cellpadding='2' id='tbUploadList'  runat='server' width="100%">	
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnViewPublicFAQs'></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnViewStaffFAQs'></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>





<!-- Page Content - Controls -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='FAQList' DataObjectDefinitionKey='FAQ'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								AutoSave='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='FAQEditor'/>
									<Argument Type='DataObjectCollection' TypeKey='FAQID' DataObjectPropertyKey='FAQID' AttributeName='' BaseValue='FAQID=0'/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='FAQ'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Question' ColumnHeader='Question' Width='60%'>
							<Sortable>
							    <Argument PropertyKey='Question'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='FAQDisplayTo' ColumnHeader='Display To' List='True' ListSeparator='; '>
							<DisplayProperties>
								<DisplayProperty PropertyKey='DisplayTo'/>
							</DisplayProperties>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='2' HeaderAlign='Center' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
								    AutoSave='True'	
                                    Object='DataPresenter'
                                    Method='DataPresenter_Save_And_NavigateToModulePageKey'>							    								
									<Parameters>
										<Argument AttributeName='PageKey' Value='FAQEditor'/>
										<Argument Type='DataObject' TypeKey='FAQID' AttributeName='FAQID' BaseValue='FAQID='/>
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
											<Argument Type='DataObject' TypeKey='FAQID' AttributeName='FAQID'/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlFAQPublicView' 
						Type='cButton' 
						Image='View Public FAQs'
						Container='spnViewPublicFAQs'>
							<Action
								PostBack='True'
								Object='DataPresenter'
								Method='ViewFAQView'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='FAQPublicView'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlFAQStaffView' 
						Type='cButton' 
						Image='View Staff FAQs'
						Container='spnViewStaffFAQs'>
							<Action
								PostBack='True'
								Object='DataPresenter'
								Method='ViewFAQView'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='FAQStaffView'/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				
			</DisplayProperties>
		</DataObject>		
	</ModuleSection>
<!-- End Embedded XML -->
</span>