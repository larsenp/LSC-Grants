<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.PageSection.cHistory" CodeBehind="History.ascx.vb" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table id="Table2" border='0' width='100%' cellspacing='2' cellpadding='2' runat='server'>
<!-- Control Label (for History information) -->
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td colspan="4" class="SeparatorHdg"><b>History</b></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
</table>
<table id="Table3" border='0' cellspacing='0' cellpadding='2' runat='server'>
    <tr>
        <td><b>Created by</b></td>
        <td width='10'>&nbsp;</td>
        <td><span id='SpnCreatedBy' runat='server'/></td>
    </tr>
    <tr>
        <td><b>Created on</b></td>
        <td width='10'>&nbsp;</td>
        <td><span id='SpnCreatedDate' runat='server'/></td>
    </tr>
    <tr>
        <td><b>Last modified by</b></td>
        <td width='10'>&nbsp;</td>
        <td><span id='SpnModifiedBy' runat='server'/></td>
    </tr>
    <tr>
        <td><b>Last modified on</b></td>
        <td width='10'>&nbsp;</td>
        <td><span id='SpnModifyDate' runat='server'/></td>
    </tr>
</table>
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
