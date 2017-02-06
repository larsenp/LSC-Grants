<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>


<!-- USER MODIFIABLE CONTENT AREA -->


      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCRecipientInformation">LSC Recipient Information</a> | Program Information </td>
        </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><h1>Program Information </h1>
                <p><strong>Staffing Information</strong></p>
                <ul>
                  <li><a href="Controls/PDFs/job%20ethnic%20and%20language%20codes.htm">Job, Ethnic and Language Codes</a></li>
                  <li><a href="Controls/PDFs/avg_slry_1999_xcl.htm">1998 Salary Information</a></li>
                  <li><a href="Controls/PDFs/avg_slry_99.htm">1999 Salary Information </a></li>
                  <li><a href="Controls/PDFs/avg_slry_2000.htm">2000 Salary Information</a></li>
                  <li><a href="Controls/PDFs/2001staff%20average%20salary%20subgreen.pdf">2001 Salary Information</a>&nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;15k)</li>
                  <li><a href="Controls/PDFs/2002%20average%20salary%20by%20job%20code%20and%20years%20of%20exp.pdf"> 2002 Salary Information</a>&nbsp;(<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;19k)</li>
                  <li><a href="Controls/PDFs/2003sub.pdf">2003 Salary Information</a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;19k)</li>
                  <li><a href="Controls/PDFs/2004sub%20from%20crystal9%20oct%202005.pdf">2004 Salary Information</a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;48k)</li>
                  <li><a href="Controls/PDFs/2005sub.pdf">2005 Salary Information</a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;24k)</li>
                  <li><a href="Controls/PDFs/2006subforweb.pdf">2006 Salary Information</a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;44k)</li>
                  <li><a href="Controls/PDFs/2007staffingforrin.pdf">2007 Salary Information</a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;19k)</li>
                  <li><a href="Controls/PDFs/2008SalaryInformation.pdf">2008 Salary Information</a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;22k)</li>
                  <li><a href="Controls/PDFs/2009SalaryInformation.pdf">2009 Salary Information</a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;22k)</li>
                  <li><a href="Controls/PDFs/2010salary.pdf">2010 Salary Information</a> (<img class="image-noformatting" alt="PDF icon" src="Controls/images/pdf-small.gif" align="top" height="12" width="12">&nbsp;19k)</li>
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
