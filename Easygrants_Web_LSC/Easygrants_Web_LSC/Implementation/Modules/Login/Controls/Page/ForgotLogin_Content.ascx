<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<!-- USER MODIFIABLE CONTENT AREA -->
<br>
<!-- Page Content - Top Of Page -->
<table width='600' border="0" cellpadding="0" cellspacing="0" runat='server' borders='0'>
	<tr>
	  <td><h1>LSC Grants Password Retrieval</h1></td>
  </tr>
	<tr>
      <td class="SeparatorHdg"><b>Instructions</b></td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td><ul>
		  <li>
	          To retrieve your password, enter your primary email address below and click <b>Submit</b>. Your password will be sent
	      to the primary email address. </li>
	      <li>To return to the Login page, click <b>Close</b>. </li>
		</ul></td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
      <td class="SeparatorHdg"><b>Password Retrieval </b></td>
  </tr>
</table>

<Core:cUserCtlLoader CtlID='ctlLoginRetrieveEmailer' 
	Src='EasyGrants/Controls/PageSection/LoginRetrieveEmailer.ascx'
	runat='server'/>
	
<!-- END USER MODIFIABLE CONTENT AREA -->

<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
