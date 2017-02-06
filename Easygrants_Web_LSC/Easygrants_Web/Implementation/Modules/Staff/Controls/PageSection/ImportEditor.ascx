<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Modules.Staff.Controls.PageSection.cImportEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<br /><br />
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table2">
	<tr>
		<td colspan='4' class="SeparatorHdg">
			<b>Import New Excel File</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<b>Step 1:</b> Select the import type from the drop-down list. For important information on the import 
			file types, see the <span runat='server' id='spnImportHelp2'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<b>Import File Type</b>&nbsp;<%=kDenoteRequiredField%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span runat='server' id='spnImportType'></span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spnErrorMessage' runat='server' visible='true'><b><font color='red'>Import File Type is required.</font></b></span>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<b>Step 2:</b> Select the file to be imported.&nbsp;&nbsp;File Type <b><u>must</u></b> have an extension of .XLS (MS Excel file extension).
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			Click on the <b>Browse…</b> button to find the file on your computer to upload.  Use the dialog box that pops up to find the file and click <b>Open</b>. 
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<b>Step 3:</b> Once the filename is in the field below, click the <b>Upload</b> button to begin the import process. <b><font color='red'>IMPORTANT:</font></b> 
			Once you click the <b>Upload</b> button, you will be redirected to the Current Import Requests page.  From there you can view the status of the import.  
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<span runat='server' id='spnImportFile'/>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr align='center'><td colspan='3'><span id='spnClose' runat='server' /></td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	

	
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlImportType'
						Container='spnImportType'
						Type='cDropDown'
						DataObjectDefinitionKey='ImportType'
						StoredValue='ImportTypeID'
						DisplayNone='False'
						DisplayText='Select'
						DisplayValue='Abbr'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='ChangeImportType'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlImportType' ControlPropertyKey='SelectedValue' Value='' />
							</Parameters>
						</Action>
						<Sort>
							<Argument PropertyKey='Abbr'/>
						</Sort>
					</Control>
				</DisplayProperty>
				 <DisplayProperty PropertyKey=''>
					<Control ID='ctlImportFile'
						Type='cImport'
						Container='spnImportFile'
						NoFileMessage='Select a file to upload.'
						PageKey='CurrentImportRequests'>
						<Parameters>
							<Argument Type='Control' TypeKey='ctlImportType' 
								ControlPropertyKey='SelectedValue' PropertyKey='ImportTypeID' Bool=''/>
							<Argument PropertyKey='FileExtensionList' 
								Value='xls,xlsx'
								ErrorMessage='Error: Only files with extension .xls or .xlsx are allowed.'
								Bool='and'/>
						</Parameters>
					</Control>
				</DisplayProperty>	
				
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action
							PostBack='True'
							AutoSave='False'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='Import'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>	
				
					
				<!-- <DisplayProperty PropertyKey=''>
					<Control ID='lnkImportHelp'
						Container='spnImportHelp'
						Type='cLink'
						Caption='Import Help'>
						<Action PostBack='False'
							Target='_blank'
							URL='/Easygrants_Web/Easygrants/PDF/Appendix F Easygrants File Import.pdf'/>
					</Control>	
				</DisplayProperty> -->
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkImportHelp2'
						Container='spnImportHelp2'
						Type='cLink'
						Caption='Import Help.'>
						<Action PostBack='False'
							Target='_blank'
							URL='/Easygrants_Web/Easygrants/PDF/Appendix F Easygrants File Import.pdf'/>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
