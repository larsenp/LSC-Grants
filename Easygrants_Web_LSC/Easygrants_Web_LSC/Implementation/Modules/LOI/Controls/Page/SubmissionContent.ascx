<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../../Core/Controls/Base/ReportOutputLink.ascx' %>

<!-- USER MODIFIIABLE CONTENT AREA -->

<!-- Page Content - Top Of Page -->
<br>
      <span id='spnPageContent' runat='server' />
<br>

<br>
<table width='600' border="0" cellpadding='0' cellspacing='0'>
	<tr>
	  <td><h1>Review and Submit </h1></td>
  </tr>
	<tr>
	  <td><table id="Table_Instructions" border='0' cellspacing='0' cellpadding='0' runat='server' width='600'>
        <tr>
          <td colspan="4" class="SeparatorHdg">Instructions</td>
        </tr>
        <tr>
          <td colspan="4" >&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" ><ul>
            <li>The <strong>Review and Submit </strong> page provides a summary of Notice of Intent to Compete (NIC) application and allows the user to submit it.</li>
            <li>The <strong>Submission</strong> section below indicates whether you are able to submit your NIC application. If all pages in the application have been completed, please click <strong>Submit</strong>. </li>
            <li>In the <strong>View Full Submission</strong> section below click <strong>View PDF</strong> to view a PDF of your NIC application.</li>
            <li>The <strong>Validation Summary</strong> below displays the status of your NIC application, indicating whether each section is validated (complete). Click the section links below or use the links on the left to navigate through the sections of the application.</li>
          </ul>         
          </td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
        </tr>
      </table></td>
  </tr>
	<tr>
	  <td>&nbsp;</td>
  </tr>
	<tr>
		<td class='SeparatorHdg'>Submission</td>
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	<tr><td></td></tr>
	<span id='spnSubmitButton' runat='server'/>	
</table>



<table width='600'>
	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" class="SeparatorHdg">Validation Summary
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
		<DisplayProperties>
			<DisplayProperty PropertyKey=''>
				<Control ID='btnSubmit'
					Container='spnSubmitButton'
					Type='cButton'
					Image='Submit'>
					<Action
						PostBack='True'
						Object='DataPresenter'
						Method='SubmissionContent_Submit'/>
					<Visible>
						<Argument PropertyKey='WfTaskStatusID' Value='1' NullDataObject='' />
					</Visible>						
				</Control>	
			</DisplayProperty>
		</DisplayProperties>
		
	</ModuleSection>
<!-- End Embedded XML -->
</span>
