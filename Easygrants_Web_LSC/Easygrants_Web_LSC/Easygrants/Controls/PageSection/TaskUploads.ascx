<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cTaskUploads" CodeBehind="TaskUploads.ascx.vb" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>

<script language="javascript" type="text/javascript">
	function OpenFormattingInstructions(URL) {
		var win
		win = window.open(URL,'File_Formatting_Requirements','height=350,width=750,top=100,left=100,scrollbars,resizable');
		win.focus();
		win.document.title = "File Formatting Requirements"; 
	}
</script>
<br>
<table border='0' cellspacing='0' cellpadding='0'  width='100%'  runat='server' ID="TblInstructions"></table>
      <span id='spnPageContent' runat='server' />

<table id="Table1" width="600" cellpadding="2" cellspacing="0" runat="server">
	<tr>
		<td class="SeparatorHdg" >Upload Checklist</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><span id="spnUploadsList" runat="server"></span></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<table id="Table2" width="600" cellpadding="1" cellspacing="0" runat="server">
	<tr><td colspan='2' class="SeparatorHdg">Uploads</td></tr>
	<tr><td colspan='2' ><span id = "spnNoUploadTypeMsg" runat="server" visible="false" style="font-weight:bold;color:Red;">
		Upload Type is required.</span></td></tr>
<!--
<tr><td colspan='2'>&nbsp;</td></tr>
-->
	<tr>
		<td width="20%">
			<b>Type</b><%=kDenoteRequiredField%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlType' Type='cDropDown' runat='server' />
		</td>
		<td><span id="spnUpload" runat="server"></span></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td colspan='2'><span id='spnTaskUploads' runat="server"></span></td></tr>
</table>
<hr style="width:600px; margin-left:0px; text-align:left; height:1px; color:#333333"/>
<br />
<div style='width:600px; text-align:center'>
	<span id='spnSave_and_Continue' runat="server"></span>
</div>
<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
			<PageContent/>	
			<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable=''>
				<Filters>
					<Argument Type='ModuleUser' 
						TypeKey='GranteeProjectID'
						PropertyKey='GranteeProjectID'
						Value='' 
						bool=''/>
				</Filters>
				<DisplayProperties>
				
				
				</DisplayProperties>
			</DataObject>
		
			<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable=''>
				<Filters>
					<Argument Type='DataObjectCollection' 
						TypeKey='GranteeProject'
						DataObjectPropertyKey='WfProjectID'
						PropertyKey='WfProjectID'
						Value='' 
						bool=''/>
					<Argument Type='ModuleUser' 
						TypeKey='WfTaskID'
						PropertyKey='WfTaskID'
						Value='' 
						bool=''/>
				</Filters>
			<DisplayProperties>
			
			
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable=''>
			<Filters>
				<Argument Type='DataObjectCollection' 
					TypeKey='WfProjectTask'
					DataObjectPropertyKey='WfProjectTaskID'
					PropertyKey='WfProjectTaskID'
					Value='' 
					bool=''/>
				<Argument PropertyKey='UploadId' Value='11' Operator='NotEqual'/>
				<Argument PropertyKey='IncludeInTask' Value='True'/>
			</Filters>
			
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlUploadsList'
						Container='spnUploadsList'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfProjectTaskUpload'>
						<DisplayProperty PropertyKey='Upload.UploadName' ColumnHeader='Type' Width='40%'/>
						<DisplayProperty PropertyKey='IsRequired' ColumnHeader='Required' Format='YesNo' Width='20%'/>
						<DisplayProperty PropertyKey='Upload.UploadTemplate.TemplateName'  Width='60%' ColumnHeader='Template' >
							<Parameters>
								<Argument Value='' ValueKey='Upload.UploadTemplate.TemplateName' Operator='Equal' 
										DisplayValue='N/A' />
								<Argument Value='' ValueKey='Upload.UploadTemplate.TemplateName' Operator='NotEqual' 
										DisplayValue='Control'  PropertyKey='Upload.UploadTemplate.TemplateName'>
									<Control ID='lnkTemplate'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='DataPresenter'
											Method='ViewTemplate'>
												<Parameters>
													<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID='/>
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
					<Control ID='btnUpload'
						Container='spnUpload'
						Type='cButton'
						Image='Select Upload Type'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='DataPresenter'
							Method='NavigateToUploadEditor'>
							<Parameters>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SubmittedFile' DataObjectDefinitionKey='SubmittedFile' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' Value='' />
				<Argument Type='Data' TypeKey='EntityDataObjectKey' PropertyKey='EntityDataObjectKey' Value='WfTaskAssignment' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlTaskUploads'
						Container='spnTaskUploads'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SubmittedFile'
						SeparatorWidth='2'>
						<DisplayProperty PropertyKey='TaskUploadType.Upload.UploadName' ColumnHeader='Type' Width='20%'/>
						<DisplayProperty PropertyKey='SourceFileName' ColumnHeader='File/Document Name' Width='20%'/>
						<DisplayProperty PropertyKey='UploadedBy.LastNameFirstName' ColumnHeader='Uploaded By'  Width='15%'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Uploaded Date' Format='M/d/yyyy'  Width='15%'>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ConvertedFileDisplayURL' ColumnHeader='Options' HeaderColspan='3' HeaderAlign='Center' Width='30%' DataAlign='Center'>
							<Control ID='btnView'
								Type='cButton'
								Caption='View'>
								<Action
									PostBack='False'
									Target='_blank'
									URL='WebRelative'>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False' DataAlign='Center'>
							<Control ID='btnEdit'
								Type='cButton'
								Image='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='UploadEditor'/>
										<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='GranteeProjectID' BaseValue='GranteeProjectID='/>
										<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' BaseValue='SubmittedFileID='/>
										<Argument Type='DataObject' TypeKey='UploadID' AttributeName='UploadID' BaseValue='WfProjectTaskUploadID='/>
										<Argument Type='' TypeKey='Description' AttributeName='Description' BaseValue='Description=True'/>
										<Argument Type='DataObject' TypeKey='EntityDataObjectKey' AttributeName='EntityDataObjectKey' BaseValue='EntityDataObjectKey='/>
										<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
						<DisplayProperty PropertyKey='' NewCell='False' DataAlign='Center'>
							<Control ID='btnDelete'
								Type='cButton'
								Image='Delete'
								Confirmation='Are you sure you want to delete this record?'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_Delete'>		
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID' Value=''/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty> 
						
						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
			   <%--<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Image='Continue'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Submission'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	--%>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>		
</ModuleSection>
</span>

   
