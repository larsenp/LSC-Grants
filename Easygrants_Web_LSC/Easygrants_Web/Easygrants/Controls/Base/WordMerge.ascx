<%@ Control Language="vb" AutoEventWireup="true" Codebehind="WordMerge.ascx.vb" Inherits="Easygrants_Web.Controls.Base.cWordMerge" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
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
<p>
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server' id='tabEmailListSource' >
<tr>
	<td colspan="2" class="SeparatorHdg"><b>Word Merge Data Source</b></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
	<td width='25%'>
		<b>Query Name:</b>
	</td>	
	<td width='75%'>
		<span id='spnDisplayName' runat='server'/>
	</td>	
</tr>
<tr>
	<td width='25%'>
		<b>Query Description:</b>
	</td>
	<td width='75%'>
		<span id='spnDescription' runat='server'/>
	</td>
</tr>
<tr>
	<td width='25%'>
		<b>Field Group:</b>
	</td>
	<td width='75%'>
		<span id='spnFieldGroup' runat='server'/>
	</td>
</tr>
<tr>
	<td width='25%'>
		<b>Record Count:</b>
	</td>	
	<td width='75%'>
		<span id='spnCount' runat='server'/>
	</td>	
</tr>
<tr>
	<td colspan='2'>
		<Core:cUserCtlLoader CtlID='lnkView' Type='cLink' Properties='Caption=View Query Results (HTML)&CausesValidation=False' runat='server'/>

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
	<td colspan="4" class="SeparatorHdg"><b>Word Merge Document</b></td>
</tr>	
<tr><td>&nbsp;</td></tr>
</table>

<table border='0' cellspacing='0' cellpadding='0' runat='server'>
<tr><td>&nbsp;</td></tr>
<tr>
	<td><b>Word Merge Template</b>&nbsp;
		<span id='spnTemplate' runat='server'/>	<span runat='server' id='spnLoadTemplate'/>
		<asp:CustomValidator
			runat='server'
			id='SubmittedFileID'
			Display='None'
			OnServerValidate='SubmittedFileIDCheck'
			ErrorMessage='Word Merge Template is required.'/>
	</td>
</tr>
</table>
<p>
<table border='0' cellspacing='0' cellpadding='2' runat='server' align='center'>		
	<tr>
		<td align='center'>
			<span runat='server' id='spnCancel'/>			
		</td>
	</tr>
</table>
<Core:cUserCtlLoader CtlID='ctlViewResults' Src='Core/Controls/Base/NewWindowOpener.ascx' runat='server'/>

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
						DisplayText='Select'
						DisplayValue='UploadTitle'>
						<Filters>
							<Argument PropertyKey='FileTypeID' Value='25'/>
							<Argument PropertyKey='SourceFileName' Value='' Operator='NotEqual' />
						</Filters>
						<Sort>
							<Argument PropertyKey='UploadTitle'/>
						</Sort>
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
							</Parameters>
						</Action>
					</Control>	
				</DisplayProperty>								
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
