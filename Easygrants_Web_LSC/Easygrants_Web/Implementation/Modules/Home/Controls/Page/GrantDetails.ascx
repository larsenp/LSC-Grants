<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="GrantDetails.ascx.vb" Inherits="Implementation.Modules.Home.Controls.Page.cGrantDetailsImpl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server'/>
<br>
<b>History: </b><EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Relative' Key='MyGrantDetails' LinkTitle='Grant Details' runat='server'/>
<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr  class='SeparatorHdg'>
		<td ><b>Summary</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>
        <table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	        <tr>
	            <td width='15%'><b><%=GetLabel("GrantId")%></b></td>
                <td colspan='3'><span runat='server' id='spnEasyGrantsID'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'><b>Grantee <%=GetLabel("Organization")%></b></td>
                <td width='35%'><span runat='server' id='spnOrganization'/></td>	        
	            <td width='15%'><b>Primary Contact/PI</b></td>
                <td width='35%'><span runat='server' id='spnPI'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'><b>Status</b></td>
                <td width='35%'><span runat='server' id='spnStatus'/></td>	        
	            <td width='15%'><b>Program</b></td>
                <td width='35%'><span runat='server' id='spnProgram'/></td>	        
	        </tr>
	        <tr>
	            <td width='15%'><b>Award Amount</b></td>
                <td width='35%'><span runat='server' id='spnAwardAmount'/></td>	        
	            <td width='15%'><b>Award Date</b></td>
                <td width='35%'><span runat='server' id='spnAwardDate'/></td>	        
	        </tr>
        </table>
	</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="SeparatorHdg" colspan='4'><b>Grantee Requests/Actions</b></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td nowrap>
			<B>Select Request/Action</B>
		</td>
		<td align="left">
			<span id="spnGrantTasks" runat="server"></span>&nbsp;&nbsp;<span id="spnCreateGrantTask" runat="server"></span>
		</td>
		<td colspan='2' width='50%'>
			&nbsp;
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' width='100%'>
	<tr>
		<td class="SeparatorHdg"><b>To Do - Grants</b></td>
	</tr>
	<tr>
		<td >
			<span id='spnToDoListAwardees' runat='server'/>
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr>
		<td colspan="4" class="SeparatorHdg">
			<b>Summary Documents</b>
		</td>
	</tr>	
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='2' runat='server'>
	<tr><td height='6px' /></tr>
	<tr><td >To view a document in .pdf format, click the corresponding <b>View</b> button.</td></tr>
	<tr>
		<td><span runat='server' id='spnSummaryDocuments'/></td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%'>
	<tr>
		<td  class="SeparatorHdg">
			<b>Public Documents</b>
		</td>
	</tr>	
	<tr><td height='6px' /></tr>
	<tr>
		<td>To view a document in its original file format, click the corresponding <b>View</b> button.
        </td>
	</tr>
	<tr>
		<td>
			<span runat='server' id='spnDocumentList'></span>	
		</td>
	</tr>
</table>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td class="SeparatorHdg">
			<b>Submitted Documents</b>
		</td>
	</tr>	
</table>

<table width='100%'>
	<tr><td height='6px' /></tr>
	<tr><td >To view a document in its original file format, click the corresponding <b>View</b> button.</td></tr>
	<tr>
		<td><span runat='server' id='spnSubmittedFiles'/></td>
	</tr>
</table>

<table width='100%'>
	<tr><td height='6px' /></tr>
	<tr>
		<td align='center'><span runat='server' id='spnClose'/></td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>	
		<DataObject Key='GrantSummary' DataObjectDefinitionKey='MyGrantsView'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='GranteeProjectID'><Control ID='spnEasyGrantsID' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='Organization.CommonOrganizationName'><Control ID='spnOrganization' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='LastNameFirstName'><Control ID='spnPI' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='ProgramName'><Control ID='spnProgram' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='GrantStatus'><Control ID='spnStatus' Type='HtmlGenericControl' /> </DisplayProperty>	
    			<DisplayProperty PropertyKey='AwardAmount' Format='$#,##0.00'><Control ID='spnAwardAmount' Type='HtmlGenericControl' /> </DisplayProperty>	
				<DisplayProperty PropertyKey='AwardDate' Format='MM/dd/yyyy'><Control ID='spnAwardDate' Type='HtmlGenericControl' /> </DisplayProperty>	
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty>
					<Control ID='ctlClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Home'/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PrimaryPersonID' />
			</Filters>
		</DataObject>
		<DataObject Key='SubmittedFilesPDF' DataObjectDefinitionKey='SummaryDocuments'>
			<Filters>
				<Argument Type='QueryString' 
					TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' 
					Bool=''/>
			</Filters>
			<Sort>
				<Argument PropertyKey='ProjectTaskPdfDesc' />	
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlGrantTasks'
						Container='spnGrantTasks'
						Type='cDropDown'
						DataObjectDefinitionKey='WfProjectTask'
						StoredValue='WfProjectTaskID'
						DisplayValue='WfTask.WfTask'
						RequiredField='False'>
						<Filters>
							<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
								PropertyKey='WfProjectID' DataObjectPropertyKey='WfProjectID' Value=''/>
							<Argument Type='' TypeKey=''
								PropertyKey='GrantFileAvailabilityID' Value='2'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='WfTask'>
								<RelatedProperty PropertyKey='WfTask' />
							</Argument>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlCreateGrantTask'
						Container='spnCreateGrantTask'
						Type='cButton'
						Image='Request'
						Confirmation='Are you sure you want to create this task?'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='CreateGrantTask'/>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSubmittedFilesPDF'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SummaryDocuments'
						NoRecordMessage='No Summary Documents for this Grant.'
						Container='spnSummaryDocuments'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='ProjectTaskPdfDesc' ColumnHeader='Document Title' Width='34%'>
							<Sortable>
								<Argument PropertyKey='ProjectTaskPdfDesc'/>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedDate' ColumnHeader='Submitted Date' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='15%'>
							<Sortable>
								<Argument PropertyKey='SubmittedDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='Person.LastNameFirstName' ColumnHeader='Submitted By' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='38%'>
							<Sortable>
								<Argument PropertyKey='LastName'>	
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
								<Argument PropertyKey='FirstName'>	
									<RelatedProperty PropertyKey='Person'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' Width='13%' >
							<Control ID='btnViewPDF'
								Type='cButton'
								Image='View'>
								<Action
									PostBack='True'
									Object='DataPresenter'
									Method='ViewPDF'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='EntityID' AttributeName='EntityID='/>
											<Argument Type='DataObject' TypeKey='DefinitionID' AttributeName='DefinitionID='/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>	
			</DisplayProperties>			
		</DataObject>
	
		<DataObject Key='PublicDocList' DataObjectDefinitionKey='SubmittedFile'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject'
					DataObjectPropertyKey='GranteeProjectID' PropertyKey='EntityID'
					Value='' Bool=''/>
				<Argument Type='Data' PropertyKey='FileTypeID' Value='59' />
			</Filters>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDocumentList'
						Container='spnDocumentList'
						Type='cDocumentListCtl'
						DataObjectDefinitionKey='SubmittedFile'
						NoRecordMessage='No Public Documents for this Grant.'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='description' ColumnHeader='Description' Width='34%'>
						    <Sortable>
								<Argument PropertyKey='Description'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmitDate' ColumnHeader='Uploaded Date' Format='M/d/yyyy'  Width='55%'>
						    <Sortable>
								<Argument PropertyKey='SubmitDate'>	
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderColspan='1' HeaderAlign='Center' Width='10%' DataAlign='center'>
							<Control ID='btnView'
								Type='cButton'
								Image='View'>
									<Action
									PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
									</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>					
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfTaskAssignment' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' 
					PropertyKey='GranteeProjectID' Value='' Bool=''/>
			</Filters>
		</DataObject>
		<DataObject Key='SubmittedFiles' DataObjectDefinitionKey='SubmittedFiles'>
			<Filters>
			    <Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Bool=''/>
			    <Argument PropertyKey='EntityDataobjectKey' Operator='Equal' Value='WfTaskAssignment' Bool='And' />                
			</Filters>
			<Sort>
				<Argument PropertyKey='SubmitDate'>	
					<RelatedProperty PropertyKey='SubmittedFile'/>
				</Argument>
			</Sort>	
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSubmittedFiles'
						Type='cDataListCtl'
						DataObjectDefinitionKey='SubmittedFiles'
						NoRecordMessage='No Submitted Documents for this Grant.'
						Container='spnSubmittedFiles'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<DisplayProperty PropertyKey='SubmittedFile.Description' ColumnHeader='Description' NullDisplay='' Width='34%'>
							<Sortable>
								<Argument PropertyKey='Description'>	
									<RelatedProperty PropertyKey='SubmittedFile'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedFile.SubmitDate' ColumnHeader='Submitted Date' Format='M/d/yyyy' NullDisplay='Not Applicable' Width='18%'>
							<Sortable>
								<Argument PropertyKey='SubmitDate'>	
									<RelatedProperty PropertyKey='SubmittedFile'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedFile.UploadedBy.LastNameFirstName' ColumnHeader='Submitted By' NullDisplay='Not Applicable' Width='20%'>
							<Sortable>
								<Argument PropertyKey='LastName'>	
									<RelatedProperty PropertyKey='SubmittedFile.UploadedBy'/>
								</Argument>
								<Argument PropertyKey='FirstName'>	
									<RelatedProperty PropertyKey='SubmittedFile.UploadedBy'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
						<DisplayProperty PropertyKey='SubmittedFile.SourceFileName' ColumnHeader='File Name' NullDisplay='Not Applicable' Width='28%'>
							<Control ID='btnViewRawFile'
								Type='cLink'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
								</Action>	
							</Control>
							<Sortable>
								<Argument PropertyKey='SourceFileName'>
									<RelatedProperty PropertyKey='SubmittedFile'/>
								</Argument>
							</Sortable>	
						</DisplayProperty>
					<!--	<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center' Width='13    %'>
							<Control ID='btnViewRawFile'
								Type='cButton'
								Image='View'>
								<Action PostBack='True'
									Object='DataPresenter'
									Method='DocumentList_ViewConvertedUploadedFile'>
										<Parameters>
											<Argument Type='DataObject' TypeKey='SubmittedFileID' AttributeName='SubmittedFileID='/>
										</Parameters>
								</Action>	
							</Control>
						</DisplayProperty> -->
					</Control>
				</DisplayProperty>	 
			</DisplayProperties>			
		</DataObject>
		
		<DataObject Key='WfTaskAssignmentCalculatedDates' DataObjectDefinitionKey='WfTaskAssignmentCalculatedDates'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' Value='' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Type='QueryString' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' Value='' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskStatusID' Operator='NotEqual' Value='3' >
					<RelatedProperty PropertyKey='WfTaskAssignment'/>
				</Argument>
				<Argument Group='('/>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='3' Bool=''>
					<RelatedProperty PropertyKey='WfTaskAssignment.WfTask'/>
				</Argument>
				<Argument Type='' TypeKey='' PropertyKey='WfTaskTypeID' Value='8' Bool='Or'>
					<RelatedProperty PropertyKey='WfTaskAssignment.WfTask'/>
				</Argument>
				<Argument Group=')' Bool=''/>
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='LessThanEqual' PropertyKey='CalculatedOpenDate'/>					
				<Argument Type='CurrentDateTime' TypeKey='Date' Operator='GreaterThanEqual' PropertyKey='CalculatedEndDate' Value=''/>					
			</Filters>
			<Sort>
				<Argument PropertyKey='CalculatedDueDate' Direction='DESC'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlToDoListAwardees'
						Container='spnToDoListAwardees'
						Type='cDataListCtl'
						DataObjectDefinitionKey='WfTaskAssignment'
						SeparatorWidth='2'
						MaxPerPage='10'>
						<HeaderHtml></HeaderHtml>
						<InstructionHtml></InstructionHtml>
						<DisplayProperty PropertyKey='WfTaskAssignment.WfProjectTask.Description' ColumnHeader='Task' Width='25%'>
							<Sortable>
								<Argument PropertyKey='Description'>	
									<RelatedProperty PropertyKey='WfTaskAssignment.WfProjectTask'/>
								</Argument>
							</Sortable>
							<Parameters>
								<Argument Value='3' ValueKey='WfTaskAssignment.WfTaskStatusID' DisplayValue='' PropertyKey='WfTaskAssignment.WfProjectTask.Description' />								
								<Argument Value='CurrentDate' ValueKey='CalculatedCloseDate' Operator='LessThanEqual' 
									DisplayValue='' PropertyKey='WfTaskAssignment.WfProjectTask.Description'/>
								<Argument Value='CurrentDate' ValueKey='CalculatedCloseDate' Operator='GreaterThanEqual' 
									DisplayValue='Control' PropertyKey='WfTaskAssignment.WfProjectTask.Description'>
									<Control ID='ctlLink2' 
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfTaskModule.ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObjectRelated' TypeKey='WfTaskAssignment.WfTaskModule.ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProject.WfProject.WfProjectName' ColumnHeader='Funding Cycle' Width='25%'>
							<Sortable>
								<Argument PropertyKey='WfProjectName'>	
									<RelatedProperty PropertyKey='WfTaskAssignment.GranteeProject.WfProject'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.GranteeProjectID' ColumnHeader='Grant' Width='10%'>
							<Sortable>
								<Argument PropertyKey='GranteeProjectID'>	
									<RelatedProperty PropertyKey='WfTaskAssignment'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskAssignment.WfTaskStatus.WfTaskStatus' ColumnHeader='Status' Width='10%'>
							<Sortable>
								<Argument PropertyKey='WfTaskStatus'>	
									<RelatedProperty PropertyKey='WfTaskAssignment.WfTaskStatus'/>
								</Argument>
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='CalculatedDueDate' ColumnHeader='Due Date' Format='M/d/yyyy' Width='10%'>
							<Sortable>
								<Argument PropertyKey='CalculatedDueDate'>
								</Argument>
							</Sortable>
						</DisplayProperty>										
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>



