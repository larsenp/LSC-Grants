<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

 <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="breadcrumb"><span runat='server' id='spnLogin' /> | 2012 AIS </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h1>FY 2012 Applicant Informational Sessions</h1>
        <p><strong>Standard RFP - May 24, 2011</strong></p>
        <ul>
          <li>Chapter 1: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_AIS_Welcome_and_Introductions.mov">Welcome and Introductions (3:35)</a></li>
        </ul>
        <ul>
          <li>Chapter 2: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_AIS_Overview_of_the_Competitive_Grants_Process.mov">Overview of the Competitive Grants Process (1:37)</a></li>
        </ul>
        <ul>
          <li>Chapter 3: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_AIS_Application_Materials_and_Process.mov">Application Materials and Process (3:08)</a></li>
        </ul>
        <ul>
          <li>Chapter 4: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_LSC_Regulations_and_Grant_Assurances.mov">LSC Regulations and Grant Assurances (6:23)</a></li>
        </ul>
        <ul>
          <li>Chapter 5: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_AIS_Using_Online_Application_System.mov">Using the Online Application System (6:00)</a></li>
        </ul>
        <ul>
          <li>Chapter 6: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_AIS_Changes_to_Application_Process.mov">Changes to the Application Process (3:17)</a></li>
        </ul>
        <ul>
          <li>Chapter 7: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_AIS_Formatting_and_Writing_Proposal_Narrative.mov">Formatting and Writing the Proposal Narrative (2:55)</a></li>
        </ul>
        <ul>
          <li>Chapter 8: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_The_Hallmarks_of_an_Excellent_Grant_Application.mov">Discussion by the Panel: The Hallmarks of an Excellent Grant Application (6:04)</a></li>
        </ul>
        <ul>
          <li>Chapter 9: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_Performance_Area1.mov">Performance Area 1 (4:22)</a></li>
        </ul>
        <ul>
          <li>Chapter 10: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_Performance_Area2.mov">Performance Area 2 (4:35)</a></li>
        </ul>
        <ul>
          <li>Chapter 11: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_Performance_Area3.mov">Performance Area 3 (8:51)</a></li>
        </ul>
        <ul>
          <li>Chapter 12: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_Performance_Area4.mov">Performance Area 4 (3:40)</a></li>
        </ul>
        <p><strong>Post-PQV RFP - May 26, 2011</strong></p>
        <ul>
          <li>Chapter 1: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_PPQV_AIS_Welcome_and_Introductions.mov">Welcome and Introductions (3:04)</a></li>
        </ul>
         <ul>
          <li>Chapter 2: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_PPQV_AIS_Overview_Competitive_Grants_Process.mov">Overview of the Competitive Grants Process (1:37)</a></li>
        </ul>
         <ul>
          <li>Chapter 3: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_PPQV_AIS_Differences_and_Similarities.mov">About the Post-PQV Application (Differences and Similarities) (2:27)</a></li>
        </ul>
         <ul>
          <li>Chapter 4: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_PPQV_AIS_Materials_and_Process.mov">Application Materials and Process (4:05)</a></li>
        </ul>
         <ul>
          <li>Chapter 5: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_PPQV_AIS_LSC_Regulations_and_Grant_Assurances.mov">LSC Regulations and Grant Assurances (6:23)</a></li>
        </ul>
         <ul>
          <li>Chapter 6: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_PPQV_AIS_Using_Online_Application_System.mov">Using the Online Application System (4:35)</a></li>
        </ul>
         <ul>
          <li>Chapter 7: <a href="http://www.lsc.gov/LSCGrants/AIS2012/2012_PPQV_AIS_Changes_to_Grant_Application_Process.mov">Changes to the Application Process (5:15)</a></li>
        </ul>
         <ul>
          <!--<li>Chapter 8: <a href="Controls/PDFs/2012_PPQV_AIS_Changes_to_Grant_Application_Process.mov">Guidance on Responding to Post-PQV Application Inquiries</a></li> -->
        </ul>
        
      </td>
    </tr>
  </table>
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
      <ModuleSection>
      
       <DataObject Key='Base' DataObjectDefinitionKey='' Updatable='False'>
          <Filters></Filters>
          <DisplayProperties>
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