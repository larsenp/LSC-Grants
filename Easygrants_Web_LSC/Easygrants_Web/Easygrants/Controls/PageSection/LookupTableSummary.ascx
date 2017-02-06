<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table id="Table1" width='100%' runat='server'>
	<tr>
		<td width='10%'><b>Table:</b></td>
		<td><span runat='server' id='spnTableName'/></td>
	</tr>
	<tr>
		<td width='10%'><b>Description:</b></td>
		<td><span runat='server' id='spnDescription'/></td>
	</tr>
	<tr>
		<td width='10%'><b>Type:</b></td>
		<td><span runat='server' id='spnType'/></td>
	</tr>
</table>

<span id='spnConfigXML' runat='server' visible='false'>
	<ModuleSection>
		<DataObject Key='LookupTableList' DataObjectDefinitionKey='LookupTableList' Updatable='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='TableName' PropertyKey='TableName'/>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='TableName'>
					<Control ID='spnTableName'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='Description'>
					<Control ID='spnDescription'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
				<DisplayProperty PropertyKey='LookupTableType.Description'>
					<Control ID='spnType'
						Type='HtmlGenericControl'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>