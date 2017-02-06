<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>

<br />
<p>
The Import Manager page allows you to import data in Excel file format to certain sections of the Easygrants system 
including the payment data, reviewer contacts, and code tables.  <font color='red'>IMPORTANT:</font> Importing this data into the system will 
impact the data quality in your Easygrants system.  To ensure data quality from the import, see <span runat='server' id='spnImportHelp'/> 
for layout requirements, best practices, etc. 
</p>

<p>
<b>Step 1:</b> To import new data into the Easygrants system, click on the <b>Import a New File</b> button in the New Import section.  
You will be redirected to the New Import page.  Before importing a new file, verify the import file type and formatting requirements for that file.
</p>

<p>
<b>Step 2:</b> To view the status and import data, to commit the import, or remove an import with an associated error, click on the 
<b>View Current Requests</b> button in the Current Import Requests section.
</p>

<p>
<b>Step 3:</b> To view a list of previously imported data, click on the <b>View Historical Requests</b> button in the Historical Import Requests section.  
</p>

<EasyGrants:cCrumbTrailDisplay id='ctlCrumbTrail' DisplayText='Set from ProgressRptHdr'
	AutoVDateType='Root' Key='Import' LinkTitle='Import Management' runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' runat='server' width='100%' ID="Table1">
	<tr>
		<td colspan='4' class="SeparatorHdg">
			<b>New Import</b>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<B><span runat='server' id='spnNewImport'></span></B>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4' class="SeparatorHdg">
			<b>Current Import Requests</b>
		</td>
	</tr>
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4'>
			<B><span runat='server' id='spnCurrentImports'></span></B>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan='4' class="SeparatorHdg">
			<b>Historical Import Requests</b>
		</td>
	</tr>
    <tr><td>&nbsp;</td></tr>

	<tr>
		<td colspan='4'>
			<B><span runat='server' id='spnHistoricalImports'></span></B>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkImportHelp'
						Container='spnImportHelp'
						Type='cLink'
						Caption='Import Help'>
						<Action PostBack='False'
							Target='_blank'
							URL='/Easygrants_Web/Easygrants/PDF/Appendix F Easygrants File Import.pdf'/>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkNewImport'
						Container='spnNewImport'
						Type='cButton'
						Image='Import a New File'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='ImportEditor'/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
								<Argument Type='QueryString' TypeKey='ImportTypeID' BaseValue='ImportTypeID=0'/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkCurrentImports'
						Container='spnCurrentImports'
						Type='cButton'
						Image='View Current Requests'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='CurrentImportRequests'/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkHistoricalImports'
						Container='spnHistoricalImports'
						Type='cButton'
						Image='View Historical Requests'>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument AttributeName='PageKey' Value='HistoricalImportRequests'/>
								<Argument Type='URL' TypeKey='PathAndQuery' PropertyKey='ReturnURL' BaseValue='ReturnURL='/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
