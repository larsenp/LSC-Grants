<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.LOI.Controls.PageSection.cUploads" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" CodeBehind="Uploads.ascx.vb" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>



<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlTaskUploads' Src='Easygrants/Controls/PageSection/TaskUploads.ascx'
				runat='server' />
<!-- USER MODIFIABLE CONTENT AREA -->
<!-- Control Label (for Publication upload) -->

<table border='0' cellspacing='0' cellpadding='0' width='100%' runat='server' ID="Table2">	
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr align='center' visible='true'>
		<td><span runat='server' id='spnSave_and_Continue'/></td>
	</tr>
</table>

<!-- END USER MODIFIABLE CONTENT AREA -->

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='Person' Updatable='True'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='PersonID'
					PropertyKey='PersonID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Type='cButton'
						Caption='Continue'
						GoToNextPage='True'
						Image='Save_and_Continue'>
					</Control>	
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>