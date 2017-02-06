<%@ Control Language="vb" AutoEventWireup="true" Codebehind="PdfReportEditor_Content.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.cPdfReportEditor_Content" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../../../../Core/Controls/Base/ValidationSummary.ascx' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<br />
<Core:cUserCtlLoader CtlID='ctlFundingOppCycleInfo' 
	Src='Implementation/Modules/Staff/Controls/Page/Administration/WorkflowBuilder/FundingOppCycleInfo.ascx'
	runat='server'/>
<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
	<tr>
		<td colspan="3" class="SeparatorHdg"><b>Task Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>Task</b></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnTask' runat='server'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="3" class="SeparatorHdg"><b>Add or Edit PDF Information</b></td>
	</tr>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>PDF Description&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnPDFDescription' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><b>PDF Key&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnPDFKey' runat='server'/>	
		</td>	
	</tr>
	<tr>
		<td><b>PDF Type&nbsp;</b><%=kDenoteRequiredField%></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnReportOutputDefinitionTypeID' runat='server'/>
		</td>	
	</tr>
	<tr>
		<td><B>Lock Generated PDFs</B></td>
		<td width='10'>&nbsp;</td>
		<td>
			<span id='spnPDFGeneration' runat='server'/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan='3'>
			<asp:Panel runat="server" ID="DMSysIntegrationPanel" visible='false'>
				<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server' id='TblDMSystemIntegration'>
					<tr>
						<td  class="SeparatorHdg" colspan='2'><b>Document Management System Integration</b></td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td width='28%'><b>File Name Prefix</b>&nbsp;<%=kDenoteRequiredField%></td>
						<td>
							<span id='spnFileNamePrefix' runat='server'></span>
							<asp:CustomValidator 
								id='valPDFFileNamePrefix'
								runat='server'
								ErrorMessage='File Name Prefix must be unique.'
								OnServerValidate='ValidatePDFFileNamePrefix'
								Display='none'/>
						</td>
					</tr>
					<tr>
						<td width='28%'>&nbsp</td>
						<td class='FieldLabel'>Limit: 50 Characters</td>
					</tr>
				</table>
			</asp:Panel>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align='center' colspan='3'>
			<span runat='server' id='spnSave'/>
			<span runat='server' id='spnSaveAndClose'/>
			<span runat='server' id='spnCancel'/>
		</td>
	</tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='50%'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		
	</tr>
</table>
<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='WfProjectTask' DataObjectDefinitionKey='WfProjectTask' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID'
					PropertyKey='WfProjectTaskID' Value='' bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='WfTask.WfTask'>
					<Control ID='ctlTask'
						Container='spnTask'
						Type='cLabel'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		<DataObject Key='WfProjectTaskPDF' DataObjectDefinitionKey='WfProjectTaskPDF' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='QueryString' TypeKey='WfProjectTaskPDFID'
					PropertyKey='WfProjectTaskPDFID' Value='' bool=''/>
			</Filters>
			<DefaultValues>
				<Argument Type='QueryString' TypeKey='WfProjectTaskID'
					PropertyKey='WfProjectTaskID' Value='' bool=''/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='ctlPDFDescription'
						Container='spnPDFDescription'
						Type='cTextBox'
						Size='50'
						MaxLength='150'
						RequiredField='True'
						ErrorMessage='PDF Description is required.'>
					</Control>					
				</DisplayProperty>
				<DisplayProperty PropertyKey='FinalPDFReportKey'>
					<Control ID='ctlPDFKey'
						Container='spnPDFKey'
						Type='cDropDown'
						DataObjectDefinitionKey='ReportOutputDefinition'
						StoredValue='Key'
						DisplayValue='Description'
						RequiredField='True'
						DisplayText='Select' 
						ErrorMessage='PDF Key is required.'>
						<Filters>
							<Argument Type='' TypeKey='' PropertyKey='EntityDataObjectKey' Value='WfTaskAssignment'/>
						</Filters>
						<Sort>
							<Argument PropertyKey='Description'/>
						</Sort>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='ReportOutputDefinitionTypeID'>
					<Control ID='ctlReportOutputDefinitionTypeID'
						Container='spnReportOutputDefinitionTypeID'
						Type='cDropDown'
						DataObjectDefinitionKey='ReportOutputDefinitionType'
						StoredValue='ReportOutputDefinitionTypeID'
						DisplayValue='Description'
						RequiredField='True'
						DisplayText='Select'
						ErrorMessage='PDF Type is required.'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='PDFGenerationID'>
					<Control ID='ctlPDFGeneration'
						Container='spnPDFGeneration'
						Type='cCheckBox'>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey='FileNamePrefix'>
					<Control ID='ctlFileNamePrefix' Type='cTextBox' Container='spnFileNamePrefix' Size='30' MaxLength='50'
						RequiredField='True' ErrorMessage='File Name Prefix is required.'></Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='DataPresenter_Reload_After_Save'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='WfProjectTaskPDF' DataObjectPropertyKey='WfProjectTaskPDFID' PropertyKey='WfProjectTaskPDFID' BaseValue='WfProjectTaskPDFID='/>
							</Parameters>
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveAndClose'
						Container='spnSaveAndClose'
						Type='cButton'
						Image='Save and Close'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>												
							    <Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							    <Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnCancel'
						Container='spnCancel'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
								<Argument Type='QueryString' TypeKey='WfProjectTaskID' BaseValue='WfProjectTaskID='/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>				
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
<!-- End Embedded XML -->
</span>
