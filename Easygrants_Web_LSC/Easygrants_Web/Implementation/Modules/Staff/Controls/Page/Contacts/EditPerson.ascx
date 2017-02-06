<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"  %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlValidationSummary' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server' />
<br />
<br />

<!-- Page Content - Controls -->
<table border='0' width='100%' cellspacing='0' cellpadding='2' runat='server' ID="Table1">
	<tr>
		<td class="SeparatorHdg"><b>Edit Person Contact</b></td>
	</tr>
</table>


<Core:cUserCtlLoader CtlID='ctlPersonEditor' 
	Src='EasyGrants/Controls/PageSection/Person_Editor.ascx'
	runat='server'/>


<span runat='server' id='spnConfigXML' visible='false'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlPersonEditor'
						Type='cUserCtlLoader'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>								
	</ModuleSection>
</span>

