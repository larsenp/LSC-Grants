<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Implementation.Modules.Application.Controls.Page.cSurvey" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>

<table border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="SeparatorHdg"><b>Instructions</b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><span id='spnPageContent' runat='server' /></td>
	</tr>
</table>
<table id='tblSurveyQuestions' border='0' cellspacing='0' cellpadding='2' width='100%' runat='server'>
</table>
<table border='0' cellspacing='0' cellpadding='2' align='center' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span runat='server' id='spnSave' /><span runat='server' id='spnSaveAndClose'/>
		</td>
	</tr>
</table>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	 <PageContent />
	 <DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save And Continue'
						GoToNextPage='True'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>