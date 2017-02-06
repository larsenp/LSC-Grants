<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.Application.Controls.PageSection.cSoftwareTypeEditor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<!--This control was developed with the idea that the grids on the Software page could be built using DataPresenterList controls.
This idea was abandoned due to technical difficulties with the control.
Peter Larsen 1/30/2008-->

<table width='100%'>
	<tr>
		<td class='SeparatorHdg' colspan='4'>
			<span runat='server' id='spnCategoryHeader' />
		</td>
	</tr>
	<tr>
		<td width='27%'>
			&nbsp;
		</td>
		<td width='18%'>
			<b>Version</b>
		</td>
		<td width='5%' >
			&nbsp;
		</td>
		<td width='50%'>
			<b>Percentage Staff</b>
		</td>
	</tr>
</table>
<span id='spnSoftwareList' runat='server' />

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscSoftwareProduct' DataObjectDefinitionKey='LscSoftwareProduct' Updatable='True' CreateNew='False'>
			<Filters>
				<!--<Argument Type='DataPresenter' TypeKey='SoftwareTypeID' PropertyKey='LscSoftwareTypeID' />-->
				<Argument PropertyKey='LscSoftwareTypeID' Value='1'/>
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscSoftwareType.Description'>
					<Control ID='spnCategoryHeader' 
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlSoftwareList' 
						Container='spnSoftwareList' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/SoftwareEditorItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
