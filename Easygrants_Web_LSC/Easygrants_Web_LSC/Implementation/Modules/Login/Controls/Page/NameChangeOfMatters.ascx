<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>


<!-- USER MODIFIABLE CONTENT AREA -->


      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCRecipientInformation">LSC Recipient Information</a> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=BulletinBoardAnnouncements">Announcements</a> | Name Change of Matters Service Report to Other Services Report</td>
        </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><h1>Name Change of Matters Service Report to Other Services Report</h1>
              <p> Dear Colleagues: </p>
              <p> As discussed in my October 4 memorandum to you, and after consideration of your comments, LSC has decided to change the name of the Matters Service Report (MSR) to the Other Services Report (OSR). This is a name change only, not a substantive change. The name change is being adopted to provide a more understandable description of these important activities. It is effective immediately and will be reflected in the Grant Activity Reports for 2007, due to LSC in March 2008. It will also be reflected on the RIN and technical corrections of the 2008 CSR Handbook to be issued in the near future. This name change does not require any action on your part at this time. However, during 2008 all programs should change their internal nomenclature from MSR to OSR. </p>
              <p> Thank you for the comments on the MSR/OSR in response to my memorandum. All other OSR changes, including those discussed in that memorandum, are still under consideration for 2009. However, the clarifications noted at the end of that memorandum are repeated below, and do apply to this year's OSR submission. </p>
              <p><strong>Clarification of current 2007 reporting instructions (for reports due in March 2008)</strong></p>
              <p>While it is critically important that these numbers be as accurate as possible, LSC does not want to burden programs by adding unnecessary requirements to the reporting process. However, there are two clarifications to be noted for 2007 reporting. The first clarification is to address a common error in reporting which leads to inaccurately high numbers of media contacts, such as TV spots, radio spots, and newspaper articled discussing legal issues related to poor people. The second clarification concerns HotDocs.</p>
              <p><strong>Media Contacts</strong></p>
              <p>These numbers are valuable and are reported under section I C, Number of Media Items Measured of the Report. Five years ago, LSC abandoned the practice of estimating audiences reached by these media because it is too inaccurate and subject to unsupported high numbers, which undermine the credibility of the rest of the report data. Since 2002, LSC programs have been required to report the number of articles published or programs aired, instead of estimated viewers, listeners, or readers. Even after all this time, some programs still submit audience estimates, usually under a Community Legal Education category, such as I A 6, Other. Therefore, please ensure that all such media items are reported under I C, Number of Media Items Measured, where each article where each article or broadcast is counted once, and not in any other category based on estimated viewers, listeners or readers.</p>
              <p><strong>HotDocs</strong></p>
              <p>When the Matters Services Reporting System was created in 2001, there was no National HotDocs Project for the creation of automated forms. Through the work of the TIG program, 25 states have forms posted on the National Server and almost 39,000 documents were assembled in the first half of 2007. It is important that there be uniformity in the reporting of the creation of these documents to LSC. Therefore, assembled documents should be reported under II A 3, Self-Help Printed Materials. The purpose of these documents is to be printed and used, so this category is the most appropriate for reporting them. </p>
              <p align="right"> Helaine Barnett </p></td>
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
