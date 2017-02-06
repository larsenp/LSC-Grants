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
	  <td ><h1>Main</h1></td>
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
          <td valign="top" ><p>The <strong>Main</strong> page provides a summary of your Notice of Intent to Compete (NIC) application.</p>
              <p>The <strong>Validation Summary</strong> below displays the status of your application, indicating whether each section is validated (complete). Click the section links below or use the links on the left to navigate through the sections of your application. All fields throughout your application marked with an asterisk (*) are required.</p>
              <p>Other useful links that will appear in the navigation bar at left throughout the process include:</p>
              <ul>
                <li><strong>Home</strong>, which brings you back to your Home page and out of your NIC application</li>
                <li><strong>Log Out</strong>, which logs you out of the system</li>
              </ul>
              <p>At the end of most pages, you may:</p>
              <ul>
                <li><strong>Save</strong>, to save your work.</li>
                <li><strong>Save and Continue</strong>, to save your work and continue to the next section.</li>
                <li><strong>Continue</strong>, to continue to the next section. <strong>Note:</strong> Continue saves your work and Continues to next section. </li>
                <li><strong>Close</strong>, to return to the previous page without saving changes.</li>
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
	<td><p>&nbsp;</p>
      </td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg"><b>Validation Summary</b>
		</td>
	</tr>
	<tr>
		<td><Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
			runat='server'/>
		</td>
	</tr>
</table>	
<center><br>
      <span id='spnSave_and_Continue' runat='server' />
<br>
	
<!-- Embedded XML Page Functionality - please do not edit -->
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<PageContent/>
		<DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave_and_Continue'
						Container='spnSave_and_Continue'
						Caption='Continue'
						Save='False'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
<!-- End Embedded XML -->
</span>
