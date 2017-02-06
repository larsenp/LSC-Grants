<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<!-- Page Content - Controls -->

<table width="600"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><p>The <strong>Form G-3: Actual Case Services (Staff)</strong> page captures information on actual case closures during calendar year 2015 reported by service area. The 2008 Edition of the CSR Handbook, as amended in 2011, applies to the submission of CSR information contained in Form G-3. <a href="http://www.lsc.gov/sites/default/files/Grants/RIN/Grantee_Guidance/CSR/CSR%20Handbook%202008%20as%20amended%202011.pdf" target="_blank">Click here to view the 2008 CSR Handbook,<em>as amended 2011</em>.</a> For further information, you can check the <a href="http://www.lsc.gov/sites/default/files/attach/2015/09/CaseServiceReport-FAQ-2012.pdf" target="_blank">Frequently Asked Questions</a> for Case Service Reporting (CSR).</p>

    <p><i>All G-3 forms, except PAI, are denominated as <strong>Form G-3: Actual Case Services (Staff)</strong> on their top line. There is an indication on the second line whether they are G-3(a) for Basic Field, G-3(b) for Migrant or G-3(c) for Native American. Check the second line from the top before making entries to ensure that you are entering the data for the right service area. </i> </p>

        <p>Please report all closed cases that were LSC-eligible, regardless of whether they were supported with any LSC funds. Please report Basic Field PAI cases only on Form G-3(d) and <strong>do not include them in your Basic Field case closures in Form G-3</strong>. There are no G-3(d) forms for Migrant or Native American service areas. All cases closed with Migrant or Native American funds must be reported on the G-3(b) for Migrant or G-3(c) for Native American, even if a few are closed by private attorneys (see 2008 CSR Handbook §4.2).</p>

      <p><strong>For these forms to save properly, every cell must contain either (1) a zero; or (2) an integer number of cases; or (3) be left blank. </strong> Blank entries will count as zeroes. The system cannot save non-numeric characters (commas, decimal points, letters, etc.).  If these characters are entered an error message will appear at the top of the form and the error must be corrected before you can save the information. We recommend clicking  <strong>Save and Calculate</strong> frequently to ensure that your work is saved and so you can easily find any errors you may have made. After completing your entries of cases closed, it is essential to click  <strong>Save and Calculate or Save and Continue</strong> to save what you have entered. Please remember to respond to the questions at the top of the G-3 form before submitting the form.</p>
        <p><a href="../GAR/Definitions/CaseClosureandLegalProblemCategories.html" target="_blank">Click here to view Case Definitions &amp; Closure Categories</a>.</p>
    </td>
  </tr>
  <%--<tr>
    <td>
        <Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlFormG3F' 
	        Src='Implementation/Modules/GAR/Controls/PageSection/InstructionsFooter.ascx'
	        runat='server' />
    </td>
  </tr>--%>
</table>

<!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
     <ModuleSection>
     
    </ModuleSection>
  </span>