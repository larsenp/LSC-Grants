<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cEntityDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- USER MODIFIIABLE CONTENT AREA -->

<table width='100%' cellpadding='0' cellspacing='0'>
	<tr style="background-color:#DDDDDD">
		<td width='32%'>&nbsp;</td>
		<td width='1%'>&nbsp;</td>
		<td width='16%'><b>Supervising Attorneys</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='16%'><b>Other Attorneys</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='16%'><b>Paralegals</b></td>
		<td width='1%'>&nbsp;</td>
		<td width='16%'><b>Other Staff</b></td>
	</tr>
</table>
<span runat='server' id='spnCategoryList' />






<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscStaffCategory' DataObjectDefinitionKey='LscStaffCategory' Updatable='True' CreateNew='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategoryList'
						Container='spnCategoryList' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/Application/Controls/PageSection/ActualStaffingItem.ascx' />
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>
<!-- End Embedded XML -->