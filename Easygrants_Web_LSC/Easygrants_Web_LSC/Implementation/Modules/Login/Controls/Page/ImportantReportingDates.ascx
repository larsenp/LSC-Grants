<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>


<!-- USER MODIFIABLE CONTENT AREA --><style type="text/css">
<!--
.style1 {background-color: rgb(255, 204, 153)}
-->
</style>


      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCRecipientInformation">LSC Recipient Information</a> | Important Reporting Dates</td>
        </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><h1>Important Reporting Dates</h1>
                <ul>
                 <!-- <li><a href="Controls/PDFs/LSCReportingRequirement_updated.htm">LSC Reporting Requirements</a></li> -->
                  <li><a href="Controls/PDFs/lsc_reporting_requirements20aug11.htm">LSC Reporting Requirements</a></li>
                  <li><a href='Controls/PDFs/2012KeyCompetitionandRenewalDates_03152011.pdf'>Grant Applications and Renewals</a>(<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;115k)</li>
                 <!-- <li><a href="Controls/PDFs/reportin.html#a">Grant Activity Reports</a></li> -->
                  <!--<li><a href="Controls/PDFs/LSCReportingRequirement_updated.htm">Grant Activity Reports</a></li> -->
                  <li><a href="Controls/PDFs/lsc_reporting_requirements20aug11.htm">Grant Activity Reports</a></li>
                </ul></td>
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
