<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ExportWord.aspx.vb" Inherits="Easygrants_Web.Controls.Base.cExportWord" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Easygrants' tagname='ValSumm' src='../../../Core/Controls/Base/ValidationSummary.ascx' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Easygrants:ValSumm id='ctlValSumm' runat='server'/>
<span id='spnWinOpen' visible='false' runat='server'>
	<SCRIPT language="javascript">
		window.open("<%=URL%>")
	</SCRIPT>
</span>
<!-- USER MODIFIIABLE CONTENT AREA -->
<!-- Page Content - Top Of Page -->
<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server' id='tabEmailListSource' >
<tr>
	<td colspan="2" class="SeparatorHdg"><b>Word Merge Data Source</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
<tr>
	<td width='25%'>
		<b>First Column:</b>
	</td>	
	<td width='75%'>
		<span id='spnDisplayName' runat='server'/>
	</td>	
</tr>
<tr>
	<td width='25%'>
		<b>Total Count:</b>
	</td>	
	<td width='75%'>
		<span id='spnCount' runat='server'/>
	</td>	
</tr>
<tr>
	<td colspan='2' >
		<span id='spnReturn' runat='server'/>
	</td>	
</tr>
<tr><td>&nbsp;</td></tr>
</table>

<table border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
<!-- Control Label (for Send E-mail information) -->
<tr>
	<td colspan="4" class="SeparatorHdg"><b>Create Merge</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='2' runat='server'>
<tr>
	<td>Template</td>
	<td width='10'>&nbsp;</td>
	<td>
		<span id='spnTemplate' runat='server'/>	<span runat='server' id='spnLoadTemplate'/>	
	</td>
</tr>
</table>

<!-- END USER MODIFIIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>

	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>	
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTemplate'
						Container='spnTemplate'
						Type='cDropDown'
						DataObjectDefinitionKey='SubmittedFile'
						StoredValue='SubmittedFileID'
						DisplayValue='SourceFileName'>
						<Filters>
							<Argument PropertyKey='FileTypeID' Value='25'/>
						</Filters>
					</Control>
				</DisplayProperty>		
				<DisplayProperty PropertyKey=''>
					<Control ID='btnLoadTemplate'
						Container='spnLoadTemplate'
						Type='cButton'
						Image='Go'>
						<Action
							PostBack='True'
							Object='DataPresenter'
							Method='Export_Word'>
							<Parameters>
								<Argument Type='Control' TypeKey = 'ctlTemplate' ControlPropertyKey='SelectedValue' Value='' />
								<Argument Type='' TypeKey='' Value='8'/>
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>			
				<DisplayProperty PropertyKey=''>
					<Control ID='lnkReturn'
						Container='spnReturn'
						Type='cLink'
						Caption=''>
						<Action
							PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToURL'>
							<Parameters>
								<Argument Type='QueryString' TypeKey='ReturnURL' Value=''/>
							</Parameters>							
						</Action>
					</Control>	
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>