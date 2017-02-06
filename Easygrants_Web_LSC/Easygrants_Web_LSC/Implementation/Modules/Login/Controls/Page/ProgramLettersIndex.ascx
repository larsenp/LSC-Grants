<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>


<!-- USER MODIFIABLE CONTENT AREA -->


      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="breadcrumb"><span runat='server' id='spnLogin' /> | <a href="../Login/LoginModuleContent.aspx?Config=LoginModuleConfig&Page=LSCRecipientInformation">LSC Recipient Information</a> | Program Letters Index</td>
        </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><h1>Program Letters Index</h1>
			      </td>
            </tr>
            <tr>
              <td>
			  <table id="content" border="1" cellpadding="6" cellspacing="0" width="100%" bgcolor="#FFFFFF">
                 <tr>
                    <td valign="top" width="24%" ><strong>Program<br>
                                                  Letter Index</strong></td>
                    <td  valign="top" width="10%"><strong>Date</strong></td>
                    <td valign="top" width="38%" ><strong>Word / PDF<br>
                                                     Version</strong></td>
                 </tr>
                 <tr>
                    <td valign="top" width="24%" >00</td>
                    <td  valign="top" width="10%">11/03/2011</td>
                    <td valign="top" width="38%" ><a href="Controls/PDFs/00INDEX_11032011.doc">Program Letter Index</a> (<img class="image-noformatting" alt="Word icon" src="Controls/images/word-icon.gif" align="top" height="14" width="14"> 100k)</td>
                 </tr>
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
								<Argument Value='LSCRecipientInformation' />
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
