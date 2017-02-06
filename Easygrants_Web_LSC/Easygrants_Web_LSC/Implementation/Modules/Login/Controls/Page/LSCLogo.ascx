<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>


<!-- USER MODIFIABLE CONTENT AREA -->


      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCRecipientInformation">LSC Recipient Information</a> | LSC Logo </td>
        </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><h1>LSC Logo</h1>
                <p>The LSC logo is available to download in the following formats:</p>
                <ul>
                  <li>.jpg (standard) should be used at current or reduced sizes </li>
                  <li>.eps (vector) can be enlarged and reduced in size</li>
                  <li> .png (for web-based work)</li>
                </ul>                
                <p>The .eps and .jpg files are 300 DPI high-resolution images. The .png files are 72 dpi, low-resolution images for web page layouts only. We also have versions of each with the words "America's Partner For Equal Justice" and versions with just the logo and letters LSC. To download click on the format of your choice.</p>                <table width="75%" border="1" cellpadding="4" cellspacing="0" id="table1">
                  <tbody>
                    <tr>
                      <td style="text-align: center;" width="154"><b>Color</b></td>
                      <td style="text-align: center;" width="143"><b>Grayscale</b></td>
                      <td style="text-align: center;"><b>Color with text</b></td>
                      <td style="text-align: center;"><b>Grayscale with Text</b></td>
                    </tr>
                    <tr>
                      <td><img src="Controls/PDFs/LSClogo_colorlink.jpg" border="0" height="57" width="132"></td>
                      <td><img src="Controls/PDFs/LSClogo_grayscalelink.jpg" border="0" height="57" width="132"></td>
                      <td><img src="Controls/PDFs/LSClogo_tagline_RGB_link.gif" border="0" height="57" width="177"></td>
                      <td><img src="Controls/PDFs/LSCLogos008.jpg" border="0" height="57" width="177"></td>
                    </tr>
                    <tr>
                      <td height="24" width="154"><a href="Controls/PDFs/LSCLogos005.jpg">Standard (.jpg)</a></td>
                      <td height="24" width="154"><a href="Controls/PDFs/LSCLogos004.jpg">Standard (.jpg)</a></td>
                      <td height="24" width="154"><a href="Controls/PDFs/LSCLogos010.jpg">Standard (.jpg)</a></td>
                      <td height="24" width="154"><a href="Controls/PDFs/LSCLogos009.jpg">Standard (.jpg)</a></td>
                    </tr>
                    <tr>
                      <td width="154"><a href="Controls/PDFs/LSCLogos001.eps">Vector (.eps)</a></td>
                      <td width="154"><a href="Controls/PDFs/LSCLogos004.eps">Vector (.eps)</a></td>
                      <td width="154"><a href="Controls/PDFs/LSC%20logo_tagline_RGB.eps"> Vector (.eps)</a></td>
                      <td width="154"><a href="Controls/PDFs/LSCLogos008.eps">Vector (.eps)</a></td>
                    </tr>
                    <tr>
                      <td width="154"><a href="Controls/PDFs/LSCLogos017.png">For the web (.png)</a></td>
                      <td width="154"><a href="Controls/PDFs/LSCLogos015.png">For the web (.png)</a></td>
                      <td width="154"><a href="Controls/PDFs/LSCLogos018.png">For the web (.png)</a></td>
                      <td width="154"><a href="Controls/PDFs/LSCLogos012.png">For the web (.png)</a></td>
                    </tr>
                  </tbody>
                </table></td>
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
