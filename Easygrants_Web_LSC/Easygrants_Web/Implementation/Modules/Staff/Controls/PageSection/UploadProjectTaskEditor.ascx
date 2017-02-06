<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="UploadProjectTaskEditor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cUploadProjectTaskEditor" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>


<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	id="CUserCtlLoader1" />
<br>
<table cellpadding = '2' cellspacing='0' width='100%' border='0'>
	<tr>
		<td class='SeparatorHdg' colspan='2'>Add or Edit Task Page Content</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td width="20%"><b><%=GetLabel("FundingCycleName")%></b></td>
		<td><span runat='server' id='spnProgram'></span></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingOpportunity")%></b></td>
		<td><span runat='server' id='spnFundingOpportunity'></span></td>
	</tr>
	<tr>
		<td><b><%=GetLabel("FundingCycleName")%></b></td>
		<td><span runat='server' id='spnFundingCycle'></span></td>
	</tr>
	<tr>
		<td><b>Task</b></td>
		<td><span runat='server' id='spnTask'></span></td>
	</tr>
	<tr id='TrDDUploadName' runat='server'>
		<td><b>Upload Name</b>&nbsp;<%=kDenoteRequiredField%></td>
		<td>
			<span runat='server' id='spnUpload'/>
			<%-- <asp:CustomValidator 
				id='valUpload'
				runat='server'
				OnServerValidate='ValidateUpload'
				ErrorMessage='Upload has already been added to the Task for this Funding Cycle; Select a different upload.'
				Display='None'/> --%>
		</td>
	</tr>
	<tr id='TrLblUploadName' runat='server'>
		<td><b>Upload Name</b></td>
		<td><span runat='server' id='spnLblUploadName' />
		</td>
	</tr>
	<tr>
		<td><b>Include in Task</b></td>
		<td><span runat='server' id='spnIncludeinTask'></span></td>
	</tr>
	<tr>
		<td><b>Include in PDF</b></td>
		<td><span runat='server' id='spnIncludeinPDF'></span></td>
	</tr>
	<tr>
		<td><b>Require</b></td>
		<td><span runat='server' id='spnRequire'></span></td>
	</tr>
	<tr>
		<td><b>General Upload</b></td>
		<td><span id='spnGeneral' runat='server'></span></td>
	</tr>
	<tr>
		<td colspan='2'>
			<table cellpadding = '2' cellspacing='0' width='100%' runat='Server' id='TblGenUploads' border='0'>
				<tr>
					<td  width='20%'><b>General Upload Category Type</b></td>
					<td><span id='spnGeneralUploadCategoryType' runat='server'></span></td>
				</tr>
				<tr>
					<td><b>General Upload Category</b></td>
					<td><Core:cUserCtlLoader CtlID='ctlGeneralUploadCategory' Type='cDropDown' runat='server'  Properties='ValidationText=General Upload Category is required.'/></td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
</table>
<table cellpadding = '2' cellspacing='0' width='100%' >
	<tr>
		<td class='SeparatorHdg' colspan='3'>Advanced Requirements - <%=GetLabel("Organization")%> Eligibility</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td valign='top'><b>Do not require for following types</b></td>
		<td colspan='2'><span runat='server' id='spnWfProjectTaskUploadOrganizationEligibility'></span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td  align="Center" Colspan='3'><span runat='server' id='spnSave'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnSaveandClose'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnClose'/></td>
	</tr>
	
</table>

<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.WfProgram.ProgramDisplayName'>
					<Control ID='spnProgram' 
					Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfCompetition.CompetitionDisplayName'>
					<Control ID='spnFundingOpportunity' 
					Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfProject.WfProjectName'>
					<Control ID='spnFundingCycle' 
					Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='spnTask' 
					Type='HtmlGenericControl' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskUpload' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID' Value='' Bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID' Value='' Bool=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='UploadId'>
					<Control ID='ctlUpload'
						Container='spnUpload'
						Type='cDropDown'
						DataObjectDefinitionKey='Upload'
						StoredValue='UploadID'
						DisplayValue='UploadName'
						Required='True'
						ErrorMessage='Upload Name is required.'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IncludeInTask'>
					<Control ID='ctlIncludeinTask' 
						Container='spnIncludeinTask' 
						Type='cCheckBox' 
						StoredValue='1'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='PdfInclude'>
					<Control ID='ctlIncludeinPDF' 
						Container='spnIncludeinPDF' 
						Type='cCheckBox' 
						StoredValue='1'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='IsRequired'>
					<Control ID='ctlRequire' 
						Container='spnRequire' 
						Type='cCheckBox' 
						StoredValue='1'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GeneralUpload'>
					<Control ID='ctlGeneral' 
						Container='spnGeneral' 
						Type='cCheckBox' 
						StoredValue='1'>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='GeneralUploadCategoryTypeID'>
					<Control ID='ctlGeneralUploadCategoryType'
						Container='spnGeneralUploadCategoryType'
						Type='cDropDown'
						DataObjectDefinitionKey='GeneralUploadCategoryType'
						StoredValue='GeneralUploadCategoryTypeID'
						DisplayValue='Description' DisplayText='Select'
						Required='True'
						ErrorMessage='General Upload Category Type is required.'>
					</Control>
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskUpload1' DataObjectDefinitionKey='WfProjectTaskUpload' >
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID' Value='' Bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Upload.UploadName' >
					        <Control ID='spnLblUploadName'
						        Type='HtmlGenericControl'>
					        </Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskUploadOrganizationEligibility' DataObjectDefinitionKey='WfProjectTaskUpload' Updatable='True'>
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskUpload' DataObjectPropertyKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfProjectTaskUploadOrganizationEligibility'>
					<Control ID='ctlWfProjectTaskUploadOrganizationEligibility'
						Container='spnWfProjectTaskUploadOrganizationEligibility'
						Type='cDoubleListBox2'
						DataObjectDefinitionKey='OrganizationEligibility'
						DisplayValue='Description'
						StoredValue='OrganizationEligibilityID'
						StoredDisplayValue='OrganizationEligibility.Description' 
						Height='9'
						DisplaySort='False'
						DisplayNone='False'
						DisplayMoveAll='False'>
						<Sort>
	                        <Argument PropertyKey='Description' Direction='Ascending'/>
	                    </Sort>
						<DefaultValues>
							<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskUpload' DataObjectPropertyKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID' />
						</DefaultValues>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave' Container='spnSave' 
						Type='cButton' 
						Image='Save'>
						<Action PostBack='True' 
							AutoSave='True' 
							Object='EventController' 
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='UploadProjectTaskEditor'/>
								<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskUpload' DataObjectPropertyKey='WfProjectTaskUploadID' PropertyKey='WfProjectTaskUploadID' BaseValue='WfProjectTaskUploadID='/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' PropertyKey='WfProjectTaskID'  BaseValue='WfProjectTaskID='/>
								<Argument Type='QueryString' TypeKey='ReturnURL' PropertyKey='ReturnURL'  BaseValue='ReturnURL='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveandClose' Container='spnSaveandClose' 
						Type='cButton' 
						Image='Save and Close'>
						<Action PostBack='True' 
							AutoSave='True' 
							Object='EventController' 
							Method='EventController_NavigateToURL'>
							<Parameters>
					   			<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' 
						Container='spnClose' 
						Type='cButton' 
						Image='Close'>
						<Action PostBack='True' 
							Object='EventController' 
							Method='EventController_NavigateToURL'>
							<Parameters>
							   	<Argument Type='QueryString' TypeKey='ReturnURL' Value='' />
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>						
			</DisplayProperties>
		</DataObject>
</ModuleSection>
</span>