<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>


<!-- USER MODIFIABLE CONTENT AREA -->
<style type="text/css">
<!--
#staff td {
	text-align: left;
	vertical-align: top;
	padding: 6px;
}
#staffmain td {
	text-align: left;
	vertical-align: top;
	padding: 6px;
}
-->
</style>



      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCRecipientInformation">LSC Recipient Information</a> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=StaffContacts">Staff Contacts</a> | Office of Program Performance (OPP) Staff Contacts </td>
        </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><h1>Office of Information Management (OIM) Staff Contacts</h1>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="staffmain">
                  <tbody>
                    <tr bgcolor="#A2B5CD">
                      <td><strong>Staff Member </strong></td>
                      <td><strong>Position</strong></td>
                      <td ><strong>Telephone # </strong></td>
                      <td><strong>Email Address </strong></td>
                    </tr>
                    <tr>
                      <td>John Meyer, </td>
                      <td>Director</td>
                      <td>(202) 295-1505</td>
                      <td><a href="mailto:meyerj@lsc.gov">meyerj@lsc.gov</a></td>
                    </tr>
                    <tr>
                      <td>Jean Edwards</td>
                      <td>Administrative Assistant</td>
                      <td>(202) 295-1511</td>
                      <td><a href="mailto:edwardsj@lsc.gov">edwardsj@lsc.gov</a>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>Lucille Polk</td>
                      <td>Research Assistant</td>
                      <td>(202) 295-1503</td>
                      <td><a href="mailto:polkl@lsc.gov">polkl@lsc.gov</a></td>
                    </tr>
                  </tbody>
                </table>                
                <p>&nbsp;</p>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="staff">
                  <tr bgcolor="#A2B5CD">
                    <td width="16%"><strong>Staff Member<o:p> </o:p> </strong></td>
                    <td width="18%" ><strong>Position</strong></td>
                    <td width="23%" ><strong>Area(s) of Concentration</strong></td>
                    <td width="22%"><strong>Telephone #</strong></td>
                    <td width="21%"><strong>Email Address<o:p> </o:p> </strong></td>
                  </tr>
                  <tbody>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td> Jordan, Ron </td>
                      <td> Grants Analyst </td>
                      <td> Grants Analysis and Database Administration </td>
                      <td>(202) 295-1508 </td>
                      <td><a href="mailto:jordanr@lsc.gov">jordanr@lsc.gov</a>&nbsp; </td>
                    </tr>
                    <tr>
                      <td>Rouse, Dianne&nbsp;</td>
                      <td>Research Coordinator</td>
                      <td>LSC Library<br>
        LSC Research</td>
                      <td>(202) 295-1502</td>
                      <td><a href="mailto:roused@lsc.gov">roused@lsc.gov</a></td>
                    </tr>
                    <tr>
                      <td>Wolde, Mulumebet</td>
                      <td>Information
        Specialist</td>
                      <td>Website Programming and Report Generation</td>
                      <td>(202) 295-1504</td>
                      <td><a href="mailto:woldem@smtp.lsc.gov">woldem@lsc.gov</a></td>
                    </tr>
                  </tbody>
                </table>
                </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
</table>         
            <div style="text-align:center" runat='server' id='spnClose' />
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey='' >
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Container='spnClose'
						Type='cButton'
						Image='Close'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Login' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				
			<DisplayProperty PropertyKey=''>
              <Control ID='ctlLogin' Container='spnLogin' Type='cLink' Caption='LSC Grants Login'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='Login' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty>
			
			<DisplayProperty PropertyKey=''>
              <Control ID='ctlLogin' Container='spnLogin' Type='cLink' Caption='LSC Grants Login'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='Login' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty>
							
			</DisplayProperties>
		</DataObject>
    </ModuleSection>
  </span>
