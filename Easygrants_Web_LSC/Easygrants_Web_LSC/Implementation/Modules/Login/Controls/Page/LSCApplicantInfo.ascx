<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl"  TargetSchema="http://schemas.microsoft.com/intellisense/ie5" EnableViewState="false" %>

  <!-- USER MODIFIABLE CONTENT AREA -->
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="breadcrumb"><span runat='server' id='spnLogin' /> | LSC Applicant Information</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h1>LSC Applicant Information</h1></td>
    </tr>
    <tr>
      <td><p>The LSC Applicant Information page has three sections:</p>
        <ul>
          <li> <strong> <span runat='server' id='spnNICSubmissionInstructions' /> </strong> </li>
          <li> <strong> <span runat='server' id='spnGrantApplicationInstructions' /> </strong> </li>
          <%--<li> <strong> <span runat='server' id='spnLSCApplicantBulletinBoard' /> </strong> </li>--%>
          <li> <strong><span runat='server' id='spnArchivedFiles' /></strong>  </li>
        </ul>
      <p> If you have any questions or comments, please email us at <a href="mailto:competition@lsc.gov">competition@lsc.gov</a>.&nbsp;We have built this site to serve you and welcome your comments and suggestions. </p></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center"><span runat="server" id='spnClose'/></div></td>
    </tr>
  </table>


  <strong> </strong>
    <p>&nbsp;  </p>
    <!-- Embedded XML Page Functionality - please do not edit -->
    <span id='spnConfigXML' visible='false' runat='server'>
      <ModuleSection>
        <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
          <Filters></Filters>
          <DisplayProperties>

            <DisplayProperty PropertyKey=''>
            <Control ID='ctlNICSubmissionInstructions' Container='spnNICSubmissionInstructions' Type='cLink' Caption='Notice of Intent to Compete (NIC) Instructions'>
              <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                <Parameters>
                  <Argument Value='NICSubmissionInstructions' />
                </Parameters>
              </Action>
            </Control>
          </DisplayProperty>

            <DisplayProperty PropertyKey=''>
              <Control ID='ctlGrantApplicationInstructions' Container='spnGrantApplicationInstructions' Type='cLink' Caption='Grant Application Instructions'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='GrantApplicationInstructions' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty>
			
			<%--<DisplayProperty PropertyKey=''>
              <Control ID='ctlLSCApplicantBulletinBoard' Container='spnLSCApplicantBulletinBoard' Type='cLink' Caption='LSC Applicant Information System Bulletin Board'>
                <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
                  <Parameters>
                    <Argument Value='LSCApplicantBulletinBoard' />
                  </Parameters>
                </Action>
              </Control>
            </DisplayProperty> --%>
           
            <DisplayProperty PropertyKey=''> 
                <Control ID='ctlArchivedFiles' Container='spnArchivedFiles' Type='cLink' Caption='LSC Grants Archived Files'> 
                    <Action PostBack='True' Object='EventController' Method='EventController_NavigateToModulePageKey'>
			            <Parameters>
                            <Argument Value='ArchivedFiles' />
                        </Parameters>
                    </Action>
                </Control>
            </DisplayProperty>
            
			<DisplayProperty PropertyKey=''>
				<Control ID='btnClose'
					Container='spnClose'
					Type='cButton'
					Image='Close'>
					<Action 
						PostBack='True' 
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


        </DisplayProperties>
      </DataObject>
    </ModuleSection>
  </span>