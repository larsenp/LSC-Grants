<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<Core:cUserCtlLoader CtlID='ctlValidationSummary' Src='Core/Controls/Base/ValidationSummary.ascx' runat='server'
	ID="Cuserctlloader1" />
<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<table border='0' cellspacing='0' cellpadding='2' runat='server' width='600' ID="Table1">
	<tr>
	  <td colspan="2"><h1>Telephone/Fax Editor </h1></td>
  </tr>
	<tr>
	  <td colspan="2">
		<table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
			<tr>
				<td colspan="4" class="SeparatorHdg">Instructions</td>
			</tr>
			<tr>
				<td colspan="4" >&nbsp;</td>
			</tr>
			<tr>
				<td valign="top" >
					<ul>
						<li>Enter your telephone/fax information below. </li>
						<li>The system may have already filled in certain fields based on information previously entered. Update this information as needed. </li>
						<li>All fields marked with an asterisk (*) are required. </li>
						<li>To save the data, click <strong>Save</strong>. </li>
						<li>To return to the previous page, click <strong>Close</strong>.</li>
					</ul>         
				</td>
			  <td >&nbsp;</td>
			  <td >&nbsp;</td>
			  <td width="160" valign="top" ><Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlQuickLinks' 
				Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
				runat='server'/></td>
        </tr>
        <tr>
          <td valign="top" >&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td valign="top" >&nbsp;</td>
        </tr>
      </table>
     </td>
  </tr>
</table>
<Core:cUserCtlLoader CtlID='ctlPhoneEditor' Src='Easygrants/Controls/PageSection/PhoneEditor.ascx' runat='server'
	ID="Cuserctlloader3" />

<!-- END USER MODIFIABLE CONTENT AREA -->
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
<!-- End Embedded XML -->
