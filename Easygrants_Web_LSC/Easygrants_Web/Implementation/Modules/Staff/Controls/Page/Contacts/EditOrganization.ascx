<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ register Tagprefix='EasyGrants' namespace='Core.Web.Navigation.CrumbTrail' assembly='Core' %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'/>



<table width='100%' runat='server'>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td  colspan="3" class="SeparatorHdg"><b>Edit <%=GetLabel("Organization")%></b></td>
	</tr>
</table>


<Core:cUserCtlLoader CtlID='ctlEditOrg' 
	Src='Implementation/Modules/Staff/Controls/PageSection/Organization_Editor.ascx'
	runat='server' />

<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlEditOrg'
						Type='cUserCtlLoader'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>
