<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
      <span id='spnPageContent' runat='server' />

<table width='600' border="0" cellpadding="0" cellspacing="0">
	
	<tr>
	  <td><h1>Main</h1></td>
  </tr>
  <tr>
	<td>
		<Core:cUserCtlLoader CtlID='ctlAppInfo' 
			Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
			runat='server'/>
	</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" ><p>The <strong>Main</strong> page provides a summary of your application.</p>
              <p>The <strong><a href="#validation">Validation Summary</a></strong> below displays the status of your application, indicating whether each section is validated (complete). Click the section links in the Validation Summary below or use the links at the left to navigate through the sections of the application.</p>
              <p>To print a particular form, click the printer icon which appears at the right side of the blue title bar at the top of each page. You will get a pop-up window showing the contents of the form without the left-hand navigation.</p>
              <p>Other useful links that will appear in the navigation bar at left throughout the process include:</p>
              <ul>
                <li><strong>Home</strong>, which brings you back to your Home page and out of this application</li>
                <li><strong>Log Out</strong>, which logs you out of the system</li>
              </ul>
              <p>All fields throughout the application marked with an asterisk (*) are required.</p>
              <p>At the bottom of most pages, you may:</p>
              <ul>
                <li><strong>Save</strong>, to save your work</li>
                <li><strong>Save and Continue</strong>, to save your work and continue to the next section</li>
                <li><strong>Continue</strong>, to continue to the next section, or </li>
                <li><strong>Close</strong>, to return to the previous page without saving changes</li>
              </ul></td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
        <tr>
          <td valign="top" >&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td valign="top" >&nbsp;</td>
        </tr>
      </table></td>
  </tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b><a name="validation"></a>Validation Summary</b>
		</td>
	</tr>

	<tr>
		<td><Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
		</td>
		
	</tr>

</table>	
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
	<!-- DisplayFormat='Detail' -->
	
	</ModuleSection>
<!-- End Embedded XML -->
</span>
