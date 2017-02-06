<%@ Control Language="vb" AutoEventWireup="True" CodeBehind="UploadTemplate_Editor.ascx.vb" Inherits="Easygrants_Web.Modules.Staff.Controls.Page.Administration.cUploadTemplate_Editor" %>

<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlValSumm' Type='cValidationSummary' runat='server' />
<br />
<br />
<table cellpadding='2' cellspacing='0' width='100%' >
<tr><td><span id='spnUploadTemplate' runat='server' /></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td align='center'><span id="spnClose" runat="server" ></span></td></tr>
</table>


<span id='spnConfigXML' visible='false' runat='server'>
<ModuleSection>

<DataObject Key='UploadTemplateList' DataObjectDefinitionKey='UploadTemplate'  Updatable='True' >
	<Filters>
	 
	</Filters>
	<DisplayProperties>
	<DisplayProperty PropertyKey=''>
					<Control ID='ctlUploadTemplate'
						Type='cUploadTemplate'
						Container='spnUploadTemplate'>
						<Parameters>
							<Argument PropertyKey='Description' Value='True'/>
						</Parameters>
					</Control>
				</DisplayProperty>
	<DisplayProperty PropertyKey=''>
					<Control ID='btnClose' Container='spnClose' Type='cButton' Image='Close'>
						<Action PostBack='True' Object='EventController' Method='EventController_NavigateToURL'>
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