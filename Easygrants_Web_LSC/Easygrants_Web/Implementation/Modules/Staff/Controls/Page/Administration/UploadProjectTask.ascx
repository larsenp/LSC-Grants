<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="UploadProjectTask.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.cUploadProjectTask" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<br />
<br />
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Implementation/Modules/Staff/Controls/PageSection/UploadManagerPages.ascx'
	runat='server'/>
<br>
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server'>	
	<tr>
		<td><b><%=GetLabel("ProgramName")%></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><span id='spnProgram' runat='server'/></td>
	</tr>
	<tr id='trCmpt' visible='false'>
		<td><b><span id='spnCmpt' runat='server'><%=GetLabel("FundingOpportunity")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader CtlID='ctlCmpt' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr id='trProject' visible='false'>
		<td><b><span id='spnProject' runat='server'><%=GetLabel("FundingCycleName")%></span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader CtlID='ctlProject' Type='cDropDown' runat='server'/></td>
	</tr>
	<tr id='trTask' visible='false'>
		<td><b><span id='spnTask' runat='server'>Task</span></b>
		</td>
		<td width='10'>&nbsp;</td>
		<td colspan=2><Core:cUserCtlLoader CtlID='ctlTask' Type='cDropDown' runat='server'/></td>
		
	</tr>
</table>
<br><br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width="100%">	
	<tr>
		<td align="Center"><span runat='server' id='spnClear'/></td>
	</tr>
</table>
<br><br>
<table border='0' cellspacing='0' cellpadding='2' id='tbUploadList'  runat='server' width="100%">	
	<tr >
		<td colspan='2' class="SeparatorHdg"><b>Uploads</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnAdd'></span>
		</td>
		
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='2'>
			<span runat='server' id='spnDataList'></span>
		</td>
	</tr>
</table>




<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlProgram'
						Container='spnProgram'
						Type='cDropDown'
						DataObjectDefinitionKey='Program'
						StoredValue='ProgramID'
						DisplayValue='ProgramDisplayName'>
					</Control>	
				</DisplayProperty>		
								
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskUploadList' DataObjectDefinitionKey='WfProjectTaskUpload'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd' 
						Type='cButton' 
						Image='Add'
						Container='spnAdd'>
							<Action
								PostBack='True'
								Object='EventController'
								Method='EventController_NavigateToModulePageKey'>
								<Parameters>
									<Argument AttributeName='PageKey' Value='UploadProjectTaskEditor'/>
									<Argument Type='' TypeKey='' AttributeName='' Value='WfProjectTaskUploadID=0'/>
									<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='' BaseValue='WfProjectTaskID=' bool=''/>
									<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								</Parameters>
							</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDataList'
						Container='spnDataList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskUpload'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='Upload.UploadName' ColumnHeader='Uploads' Width='30%'/>
						<DisplayProperty PropertyKey='IsRequired' Format='YesNo' ColumnHeader='Required' Width='15%'/>
						<DisplayProperty PropertyKey='IncludeInTask' Format='YesNo' ColumnHeader='Display in Task' Width='15%'/>
						<DisplayProperty PropertyKey='GeneralUpload' Format='YesNo' ColumnHeader='General Upload' Width='15%'/>
						<DisplayProperty PropertyKey=''>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
								    AutoSave='True'	
                                    Object='DataPresenter'
                                    Method='DataPresenter_Save_And_NavigateToModulePageKey'>							    								
									<Parameters>
										<Argument AttributeName='PageKey' Value='UploadProjectTaskEditor'/>
										<Argument Type='DataObject' TypeKey='WfProjectTaskUploadID' AttributeName='WfProjectTaskUploadID' BaseValue='WfProjectTaskUploadID='/>
										<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='' BaseValue='WfProjectTaskID=' bool=''/>										
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
																											
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						 <DisplayProperty  PropertyKey=''  ColumnHeader='' HeaderColspan='1' HeaderAlign='Left' DataAlign='Left' Width='25%'>
							<Parameters>
								<Argument Value='' ValueKey='WfProjectTaskUploadSubmittedFile.UploadID' Operator='NotEqual' DisplayValue=''/>	
								<Argument Value='' ValueKey='WfProjectTaskUploadSubmittedFile.UploadID' DisplayValue='Control'>	
									<Control ID='btnDelete'
										Type='cButton'
										Image='Delete'
										Confirmation='Are you sure you want to delete this item?'>
										<Action
											PostBack='True'
											Object='EventController'
											Method='EventController_Delete'>
											<Parameters>
												<Argument Type='DataObject' TypeKey='WfProjectTaskUploadID' AttributeName='AddressID'/>
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
					<Control ID='btnClear' 
						Container='spnClear' 
						Type='cButton' 
						Image='Clear'>
						<Action PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
							   <Argument Value='UploadProjectTask'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>	
</ModuleSection>
</span>