<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<Core:cUserCtlLoader CtlID='ctlVirtualFile' 
	Src='Core/Controls/Base/ValidationSummary.ascx'
	runat='server'/>
</br>
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><h1>Actual Staffing Information (Form E-1)</h1></td>
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
        <td valign="top" ><p>The <strong>Actual Staffing Information (Form E-1)</strong> page captures current year data on applicant full-time and part-time staffing and volunteers.</p>
            <ul>
              <li><strong><font color="#990000">New applicants are required to complete Actual Staffing Information (Form E-1).</font></strong></li>
              <li>Prepare Actual Staffing Information (Form E-1) based on positions that are filled at the time the form is completed.&nbsp; </li>
              <li> Use whole numbers without decimal points when entering data.</li>
              <li>Enter your information in the fields below.</li>
              <li>To save the data, click <b>Save</b>.</li>
              <li>To go to the next page, click <b>Continue</b>.</li>
            </ul>
            <p><strong> &nbsp;</strong><strong>Follow the steps below for assistance on this form: </strong></p>
            <ol>
              <li> Submit inquiries pertaining to technical issues, using the website application, and uploading files to <a href="mailto:techsupport@lsc.gov"> techsupport@lsc.gov</a>. </li>
              <li>Submit all other inquiries regarding this form or the grants process to the LSC Competition Service Desk at <a href="mailto:competition@lsc.gov"> competition@lsc.gov</a>.</li>
              <li>Contact Reginald Haley at <a href="mailto:haleyr@lsc.gov"> haleyr@lsc.gov</a> if you do not receive a response from either service desk within 48 hours. </li>
          </ol></td>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
        <td width="160" valign="top" ><Core:cUserCtlLoader CtlID='ctlQuickLinks' 
			Src='Implementation/Modules/Application/Controls/PageSection/QuickLinks.ascx'
			runat='server'/></td>
      </tr>
    </table></td>
  </tr>
  </table>
  
  <Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/Application/Controls/PageSection/ApplicantInfo.ascx'
	runat='server'/>
<br />

 <table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td  colspan="4" class="SeparatorHdg">Actual Staffing Information</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<br />
<Core:cUserCtlLoader CtlID='ctlActualStaffing' 
	Src='Implementation/Modules/Application/Controls/PageSection/ActualStaffingInformation.ascx'
	runat='server'/>		
<br />
<table width='100%'>
	<tr align='center'>
		<td><span runat='server' id='spnSave'/>
		    
			<span runat='server' id='spnSaveCalc' />
			
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span runat='server' id='spnContinue' />
		</td>
	</tr>
</table>
<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Container='spnSave'
						Type='cButton'
						Image='Save'>
						<Action
							PostBack='True'
							AutoSave='True'
							Object='EventController'
							EnterKey='True'>							
						</Action>
					</Control>	
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlActualStaffing'
						Type='cUserCtlLoader' />
				</DisplayProperty>
				<!--
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveCalc'
						Type='cButton'
						Container='spnSaveCalc'
						Image='Save_and_Calculate'>
						<Action PostBack='True'
							AutoSave='True' />	
					</Control>
				</DisplayProperty>
				-->
				<%--<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Container='spnContinue'
						Image='Continue'>
						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='CurrentYearClientServices' />
							</Parameters>
						</Action>	
					</Control>
				</DisplayProperty>--%>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Save='True'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>

			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>

<!--
<Argument AttributeName='PageKey' Value='CurrentYearClientServices' />

						<Action PostBack='True'
							AutoSave='True' 
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PolicyBoardStructure' />
							</Parameters>
						</Action>	
-->
